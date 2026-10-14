---
title: "Install repo-kit"
description: "Short install of this kit into a target repository. The agent maps that repository on the workboard while the install is underway."
version: "3.0.2"
status: current
audience:
  - developers
  - ai-agents
doc_type: other
related:
  - RULES.md
  - UPGRADE.md
  - ../AGENTS.md
  - ../docs/WORKBOARD.md
last_updated: "2026-10-13"
---

# Install repo-kit

Short install of this kit into a target repository.

**Related:** [RULES](RULES.md) · [UPGRADE](UPGRADE.md) · [AGENTS](../AGENTS.md) · [workboard](../docs/WORKBOARD.md)

This file stays in the kit repository. An adopted project does not keep it as standing law.

## Steps

1. Open [docs/WORKBOARD.md](../docs/WORKBOARD.md) and map the target repository: what it is, where the code lives, and which documents already exist. Do this without waiting to be asked.
2. Copy `kit/RULES.md`, `kit/rules/`, `kit/MARKDOWN-STANDARD.md`, and `kit/UPGRADE.md` into the target `kit/`. Leave product code, the project changelog, and `docs/` outside `kit/`.
3. Fill the authority map with paths that exist in the target. Drop rows that do not apply.
4. Record the adopted version and the Kit source in the target's kit baseline. The version is the latest dated section under `## repo-kit` in [CHANGELOG.md](CHANGELOG.md). The Kit source is the URL in [RULES.md](RULES.md#kit-baseline).
5. Write the target's root `README.md` and directory indexes for its own files. Use [MARKDOWN-STANDARD.md](MARKDOWN-STANDARD.md) for the shape. Do not paste kit examples in as those descriptions.
6. If a coding agent is used, add a root `AGENTS.md` from [templates/TEMPLATE-AGENTS.md](templates/TEMPLATE-AGENTS.md). If one already exists, paste that block once. Do not replace project text.

Later upgrades use [UPGRADE.md](UPGRADE.md).
