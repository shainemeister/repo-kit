---
title: Kit upgrade
description: "Upgrade order for a repository that already has a kit baseline. Each row is a sub-agent instruct file."
version: "1.0.4"
status: current
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - ../../../kit/UPGRADE.md
  - ../kit-adopter/README.md
  - ../kit-adopter/skills/kit-map-layers/SKILL.md
  - ../kit-adopter/skills/kit-define-pack/SKILL.md
  - ../kit-adopter/skills/kit-author-plan/SKILL.md
  - ../kit-adopter/skills/kit-emit-packs/SKILL.md
  - ../kit-adopter/skills/kit-use-instruct/SKILL.md
last_updated: "2026-10-19"
---

# Kit upgrade

Upgrade order for a repository that already has a kit baseline. Each row is a sub-agent instruct file. The orchestrator deploys it.

**Related:** [UPGRADE](../../../kit/UPGRADE.md) · [kit-adopter](../kit-adopter/README.md) · [map-layers](../kit-adopter/skills/kit-map-layers/SKILL.md) · [define-pack](../kit-adopter/skills/kit-define-pack/SKILL.md) · [author-plan](../kit-adopter/skills/kit-author-plan/SKILL.md) · [emit-packs](../kit-adopter/skills/kit-emit-packs/SKILL.md) · [use-instruct](../kit-adopter/skills/kit-use-instruct/SKILL.md)

[UPGRADE.md](../../../kit/UPGRADE.md) is the procedure. This page is the order.

## Upgrade

| Order | Pack | Action |
|-------|------|--------|
| 1 | [skills/kit-upgrade/](skills/kit-upgrade/SKILL.md) | Copy the current kit files and record the adopted version |
| 2 | [../kit-adopter/skills/kit-context-register/](../kit-adopter/skills/kit-context-register/SKILL.md) | Register the edge cases, one path at a time |
| 3 | [../kit-adopter/skills/kit-map-layers/](../kit-adopter/skills/kit-map-layers/SKILL.md) | Layers, activation, size, default paths |
| 4 | [../kit-adopter/skills/kit-define-pack/](../kit-adopter/skills/kit-define-pack/SKILL.md) | AgentPack fields and validation |
| 5 | [../kit-adopter/skills/kit-author-plan/](../kit-adopter/skills/kit-author-plan/SKILL.md) | Recalibrate the plan |
| 6 | [../kit-adopter/skills/kit-emit-packs/](../kit-adopter/skills/kit-emit-packs/SKILL.md) | Regen |
| 7 | [../kit-adopter/skills/kit-use-instruct/](../kit-adopter/skills/kit-use-instruct/SKILL.md) | Utilization after the set exists |
| 8 | [skills/kit-upgrade-qa/](skills/kit-upgrade-qa/SKILL.md) | Read every phase draft, its File, and that phase's skill. Report fits, or a short fix list |
