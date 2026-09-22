# Orchestrator bots (callable instances)

Grok Build CLI agent definitions derived from the sibling AgentPacks
(`../router.md`, `../scout.md`, `../builder.md`, `../reviewer.md`).

## Files

| File | Role | Grok permission_mode |
|------|------|----------------------|
| `router.agent.md` | Decompose + dispatch | default |
| `scout.agent.md` | Read-only explore | plan |
| `builder.agent.md` | Execute changes | default |
| `reviewer.agent.md` | Validate vs kit | plan |
| `invoke.sh` | Headless streaming-json launcher | — |
| `registry.json` | Grok Bot teammate ids | — |

Each definition embeds the pack text, requires loading the **target** `kit/RULES.md` at runtime, and follows **digest → act → report / handoff**.

## Invoke (default: headless streaming-json)

```bash
~/code/repo-kit/kit/agents/orchestrator/bots/invoke.sh router /path/to/target-repo "Decompose: …"
~/code/repo-kit/kit/agents/orchestrator/bots/invoke.sh scout  /path/to/target-repo "Map kit + src layout"
~/code/repo-kit/kit/agents/orchestrator/bots/invoke.sh builder /path/to/target-repo "Implement unit: …"
~/code/repo-kit/kit/agents/orchestrator/bots/invoke.sh reviewer /path/to/target-repo "Validate Builder report: …"
```

`invoke.sh` runs:

```bash
grok --agent=<role>.agent.md --cwd=<target> -p "<prompt>" --output-format streaming-json
```

then prints a **parsed JSON** object (`ok`, `role`, `events`, `last_result`) to stdout. No TUI scrape.

```bash
# Raw NDJSON stream:
INVOKE_RAW=1 ./invoke.sh scout /path/to/repo "…"
# Interactive TUI (legacy):
INVOKE_TUI=1 ./invoke.sh scout /path/to/repo
```

Equivalent manual form:

```bash
grok -p "…" --output-format streaming-json
grok --agent="$HOME/code/repo-kit/kit/agents/orchestrator/bots/scout.agent.md" \
     --cwd=/path/to/target-repo -p "…" --output-format streaming-json
```

## Handoff

On receiving a result: **digest**, **act** in role, **report** — hand synthesized output to the next chain agent or Master Orchestrator. Receivers repeat the same loop.

## Invoke (Grok Bot teammates)

Message by **id** from `registry.json`. Include `target_repo`, `goal`, `constraints`; ask for the Reporting contract.

## Chain reminder

Router first → Scout ∥ Builder → Reviewer last → Master Orchestrator (handoff/report at each hop).
