---
title: Kit upgrade
description: "Upgrade order for a repository that already has a kit baseline. Open the one pack the step names."
version: "1.0.0"
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
last_updated: "2026-10-18"
---

# Kit upgrade

Upgrade order for a repository that already has a kit baseline. Open the one pack the step names.

**Related:** [UPGRADE](../../../kit/UPGRADE.md) · [kit-adopter](../kit-adopter/README.md) · [map-layers](../kit-adopter/skills/kit-map-layers/SKILL.md) · [define-pack](../kit-adopter/skills/kit-define-pack/SKILL.md) · [author-plan](../kit-adopter/skills/kit-author-plan/SKILL.md) · [emit-packs](../kit-adopter/skills/kit-emit-packs/SKILL.md) · [use-instruct](../kit-adopter/skills/kit-use-instruct/SKILL.md)

[UPGRADE.md](../../../kit/UPGRADE.md) is the procedure. This page is the order. Packs that are not drafted yet are named in code. The phase that drafts the pack adds the link.

## Upgrade

| Order | Pack | Action |
|-------|------|--------|
| 1 | `skills/kit-upgrade/` | Read the Kit source and the notable changes since the baseline. Name the next row and stop |
| 2 | `../kit-adopter/skills/kit-context-register/` | Register the edge cases, one path at a time |
| 3 | [skills/kit-map-layers/](../kit-adopter/skills/kit-map-layers/SKILL.md) | Layers, activation, size, default paths |
| 4 | [skills/kit-define-pack/](../kit-adopter/skills/kit-define-pack/SKILL.md) | AgentPack fields and validation |
| 5 | [skills/kit-author-plan/](../kit-adopter/skills/kit-author-plan/SKILL.md) | Recalibrate the plan |
| 6 | [skills/kit-emit-packs/](../kit-adopter/skills/kit-emit-packs/SKILL.md) | Regen |
| 7 | [skills/kit-use-instruct/](../kit-adopter/skills/kit-use-instruct/SKILL.md) | Utilization after the set exists |
| 8 | `skills/kit-upgrade-qa/` | Check the upgrade diff. Report fits, or a short fix list. Stop |
