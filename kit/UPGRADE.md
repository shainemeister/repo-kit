---
title: "Upgrade repo-kit"
description: "How a project that already adopted this kit takes a newer copy from the Kit source recorded in its baseline."
version: "3.4.4"
status: current
audience:
  - developers
  - ai-agents
doc_type: other
related:
  - RULES.md
  - CHANGELOG.md
  - rules/versioning-and-git.md
  - ../WORKBOARD.md
  - ../MEMORY.md
  - ../docs/library/kit-upgrade/README.md
last_updated: "2026-10-19"
---

# Upgrade repo-kit

How a project that already adopted this kit takes a newer copy from the Kit source recorded in its baseline.

**Related:** [RULES](RULES.md) · [CHANGELOG](CHANGELOG.md) · [versioning](rules/versioning-and-git.md) · [workboard](../WORKBOARD.md) · [notepad](../MEMORY.md) · [upgrade shelf](../docs/library/kit-upgrade/README.md)

## Deploy

You are the orchestrator. Pass the row its `SKILL.md`, its draft, and its File. Keep this file.

Deploy sub-agents in shelf order. Wait until the earlier row returns before the next row starts. A second sub-agent runs beside an open row only when their files differ and it does not need the open row's result.

| Route | Direction | Ends when |
|-------|-----------|-----------|
| Shelf | When [the upgrade shelf](../docs/library/kit-upgrade/README.md) is in this checkout, that file is the order. Open the pack each link points to. | The shelf is missing |
| Kit source | When that shelf is missing, open the Kit source in the [baseline](RULES.md#kit-baseline) and use its upgrade shelf for the routes below. | The baseline has no Kit source |
| Register | Open [kit-workboard-register](skills/kit-workboard-register/SKILL.md). Record one upgrade program. File is the product file. Draft is the phase document. | A primary program is already set |
| Next row | Deploy the next shelf row after the previous row returns done. | That row returns done |
| Pair | Two rows may run together when their files differ and the later row does not need the earlier row's result. | A second sub-agent would use the same file |
| Fix | Send the list to the phase skill it names. Deploy that skill again, then [kit-upgrade-qa](../docs/library/kit-upgrade/skills/kit-upgrade-qa/SKILL.md) on that phase. | QA returns fits for that phase |
| Done | [kit-upgrade-qa](../docs/library/kit-upgrade/skills/kit-upgrade-qa/SKILL.md) reads every phase. Leave [ADOPTER.md](../ADOPTER.md) as the adopt left it. | QA returns fits for every phase |
