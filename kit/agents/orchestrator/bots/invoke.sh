#!/usr/bin/env bash
# Invoke an orchestrator crew bot via Grok Build CLI (headless streaming-json).
# Usage: invoke.sh <router|scout|builder|reviewer> <target-repo-cwd> [prompt...]
# Prints parsed JSON objects from the stream to stdout (one JSON value or NDJSON).
# Env: INVOKE_RAW=1  → dump raw streaming-json without parsing
#      INVOKE_TUI=1  → interactive TUI (legacy; no JSON parse)
set -euo pipefail
ROLE="${1:?role: router|scout|builder|reviewer}"
CWD="${2:?target repo cwd}"
shift 2
PROMPT="${*:-Provide your Reporting contract for an idle ping.}"
ROOT="$(cd "$(dirname "$0")" && pwd)"
DEF="$ROOT/${ROLE}.agent.md"
test -f "$DEF" || { echo "missing $DEF" >&2; exit 1; }
test -d "$CWD" || { echo "cwd not a directory: $CWD" >&2; exit 1; }

if [[ "${INVOKE_TUI:-0}" == "1" ]]; then
  exec grok --agent="$DEF" --cwd="$CWD" --no-alt-screen "$PROMPT"
fi

RAW="$(mktemp)"
trap 'rm -f "$RAW"' EXIT
# Headless single-turn with streaming JSON (no TUI scrape)
grok --agent="$DEF" --cwd="$CWD" -p "$PROMPT" --output-format streaming-json >"$RAW" 2>"$RAW.err" || {
  status=$?
  echo "{\"ok\":false,\"role\":\"$ROLE\",\"exit\":$status,\"stderr\":$(python3 -c 'import json,sys; print(json.dumps(open(sys.argv[1]).read()[-4000:]))' "$RAW.err")}" >&2
  exit "$status"
}

if [[ "${INVOKE_RAW:-0}" == "1" ]]; then
  cat "$RAW"
  exit 0
fi

python3 - "$RAW" "$ROLE" <<'PY'
import json, sys
path, role = sys.argv[1], sys.argv[2]
lines = open(path, "r", encoding="utf-8", errors="replace").read().splitlines()
objs = []
for line in lines:
    line = line.strip()
    if not line:
        continue
    try:
        objs.append(json.loads(line))
    except json.JSONDecodeError:
        continue
# Prefer last object that looks like a result; else emit all parsed lines as NDJSON
def is_result(o):
    if not isinstance(o, dict):
        return False
    keys = set(o.keys())
    if keys & {"result", "message", "content", "text", "type"}:
        return True
    return False
results = [o for o in objs if is_result(o)]
out = {
    "ok": True,
    "role": role,
    "parsed_count": len(objs),
    "events": objs,
    "last_result": results[-1] if results else (objs[-1] if objs else None),
}
json.dump(out, sys.stdout, indent=2, ensure_ascii=False)
sys.stdout.write("\n")
PY
