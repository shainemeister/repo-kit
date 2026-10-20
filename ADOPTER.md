---
title: Adopt repo-kit
description: "One-time adopt of this kit into a target repository. An adopted repository deletes this file when the adopt is finished."
version: "1.2.6"
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
last_updated: "2026-10-19"
---

# Adopt repo-kit

One-time adopt of this kit into a target repository. An adopted repository deletes this file when the adopt is finished.

**Related:** [RULES](kit/RULES.md) · [UPGRADE](kit/UPGRADE.md) · [AGENTS](AGENTS.md) · [notepad](MEMORY.md) · [workboard](WORKBOARD.md) · [shelf](docs/library/kit-adopter/README.md)

This repository keeps this file. An adopted repository deletes it when the adopt is finished.

## Deploy

You are the orchestrator. The order is [the adopt shelf](docs/library/kit-adopter/README.md). Deploy each row to its own sub-agent. Pass that row's `SKILL.md`, its draft, its File, the target directory, and the read-only kit tree.

Wait until the earlier row returns before the next row starts. A second sub-agent runs beside an open row only when their files differ and it does not need the open row's result.

Do not open the row's `SKILL.md` as this session's procedure. Do not copy the kit files in this session. When the target directory and the kit tree are the same path, stop.

| Route | Direction | Ends when |
|-------|-----------|-----------|
| Register | Deploy [kit-workboard-register](kit/skills/kit-workboard-register/SKILL.md) to record one adopt program. File is the product file. Draft is the phase document. | A primary program is already set |
| Next row | Deploy the next shelf row after the previous row returns done. | That row returns done |
| Pair | Two rows may run together when their files differ and the later row does not need the earlier row's result. | A second sub-agent would use the same file |
| Session file | Row 1 uses [agents.md](docs/library/kit-adopter/skills/kit-discover-host/template/agents.md). That file owns the replace and `{{PROJECT_NOTE}}`. | Row 1 returns done |
| Fix | Send the list to the phase skill it names. Deploy that skill again, then [kit-adopt-qa](docs/library/kit-adopter/skills/kit-adopt-qa/SKILL.md) on that phase. | QA returns fits for that phase |
| Bare | When Agent Instruct is not in use, stop at [kit-adopt-qa](docs/library/kit-adopter/skills/kit-adopt-qa/SKILL.md). It reads every phase. | QA returns fits for every phase. Delete this file in the target. This repository keeps it |
| Instruct | When Agent Instruct is in use, continue after that QA fits through [kit-author-plan](docs/library/kit-adopter/skills/kit-author-plan/SKILL.md), then [kit-emit-packs](docs/library/kit-adopter/skills/kit-emit-packs/SKILL.md). | Emit returns fits. Delete this file in the target. This repository keeps it |
| Upgrade | Open [kit/UPGRADE.md](kit/UPGRADE.md). | The adopt has stopped |
