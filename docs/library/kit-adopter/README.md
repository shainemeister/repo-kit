---
title: Kit adopter
description: "Adopt order for the packs on this shelf. Each row is a sub-agent instruct file."
version: "1.1.4"
status: current
doc_type: other
related:
  - ../README.md
  - ../kit-upgrade/README.md
  - skills/kit-discover-host/SKILL.md
  - skills/kit-adopter/SKILL.md
  - skills/kit-author-plan/SKILL.md
  - skills/kit-emit-packs/SKILL.md
  - skills/kit-map-layers/SKILL.md
last_updated: "2026-10-19"
---

# Kit adopter

Adopt order for the packs on this shelf. Each row is a sub-agent instruct file. The orchestrator deploys it.

**Related:** [library](../README.md) · [kit-upgrade](../kit-upgrade/README.md) · [discover-host](skills/kit-discover-host/SKILL.md) · [adopter](skills/kit-adopter/SKILL.md) · [author-plan](skills/kit-author-plan/SKILL.md) · [emit-packs](skills/kit-emit-packs/SKILL.md) · [map-layers](skills/kit-map-layers/SKILL.md)

`generated/` is the emit target. It is not a pack. A normal task does not open this shelf.

## Adopt

| Order | Pack | Action |
|-------|------|--------|
| 1 | [skills/kit-discover-host/](skills/kit-discover-host/SKILL.md) | Place the session file. [agents.md](skills/kit-discover-host/template/agents.md) owns the replace |
| 2 | [skills/kit-catalog-scout/](skills/kit-catalog-scout/SKILL.md) | List tracked paths the index rule keeps |
| 3 | [skills/kit-context-register/](skills/kit-context-register/SKILL.md) | One path, one phase, then the phase draft |
| 4 | [skills/kit-adopter/](skills/kit-adopter/SKILL.md) | Copy the kit, fill the baseline, and write the target's own indexes |
| 5 | [skills/kit-adopt-qa/](skills/kit-adopt-qa/SKILL.md) | Read every phase draft, its File, and that phase's skill. Report fits, or a short fix list |
| 6 | [skills/kit-author-plan/](skills/kit-author-plan/SKILL.md) | Write the plan when Agent Instruct is used |
| 7 | [skills/kit-emit-packs/](skills/kit-emit-packs/SKILL.md) | Emit, then stop |

The upgrade order is [kit-upgrade](../kit-upgrade/README.md). Map-layers, define-pack, and use-instruct stay in this directory. That order cites them.
