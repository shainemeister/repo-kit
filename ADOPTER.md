---
title: Adopt repo-kit
description: "One-time adopt of this kit into a target repository. An adopted repository deletes this file when the adopt is finished."
version: "1.1.0"
status: current
audience:
  - developers
  - ai-agents
doc_type: other
related:
  - kit/RULES.md
  - kit/UPGRADE.md
  - AGENTS.md
  - MEMORY.md
  - WORKBOARD.md
  - docs/library/kit-adopter/README.md
last_updated: "2026-10-17"
---

# Adopt repo-kit

One-time adopt of this kit into a target repository. An adopted repository deletes this file when the adopt is finished.

**Related:** [RULES](kit/RULES.md) · [UPGRADE](kit/UPGRADE.md) · [AGENTS](AGENTS.md) · [notepad](MEMORY.md) · [workboard](WORKBOARD.md) · [shelf](docs/library/kit-adopter/README.md)

This repository keeps this file. It is the source of the adopt order.

## Steps

1. Open [WORKBOARD.md](WORKBOARD.md) and map the target: what it is, where the code lives, and which documents already exist. Do this without waiting to be asked.
2. Copy `kit/RULES.md`, `kit/rules/`, `kit/MARKDOWN-STANDARD.md`, `kit/UPGRADE.md`, and `kit/skills/` into the target. Leave product code, the project changelog, and `docs/` outside `kit/`.
3. Fill the authority map with paths that exist in the target. Drop rows that do not apply.
4. Record the adopted version and the Kit source in the target's kit baseline. The version is the latest dated section under `## repo-kit` in [CHANGELOG.md](kit/CHANGELOG.md). The Kit source is the URL in [RULES.md](kit/RULES.md#kit-baseline).
5. Write the target's root `README.md` and directory indexes for its own files. Use [MARKDOWN-STANDARD.md](kit/MARKDOWN-STANDARD.md) for the shape. Do not paste kit examples in as those descriptions.
6. If a coding agent is used, add a root `AGENTS.md` from the paste block in [agents.md](docs/library/kit-adopter/skills/kit-discover-host/template/agents.md). If one already exists, paste that block once. Do not replace project text. If `MEMORY.md` is missing, copy the fenced body of [memory.md](docs/library/kit-adopter/skills/kit-discover-host/template/memory.md) to the repository root and remove the fence. If it exists, leave it.
7. When Agent Instruct is used, open [kit-adopter](docs/library/kit-adopter/README.md) and follow the adopt order. Copy that directory. Stop after emit.
8. Later upgrades use [UPGRADE.md](kit/UPGRADE.md).
