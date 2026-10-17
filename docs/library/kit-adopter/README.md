---
title: Kit adopter
description: "Adopt order and upgrade order for the packs on this shelf. Open the one pack the step names."
version: "1.0.0"
status: current
doc_type: other
related:
  - ../README.md
  - ../../../kit/UPGRADE.md
  - skills/kit-discover-host/SKILL.md
  - skills/kit-adopter/SKILL.md
  - skills/kit-author-plan/SKILL.md
  - skills/kit-emit-packs/SKILL.md
  - skills/kit-map-layers/SKILL.md
last_updated: "2026-10-17"
---

# Kit adopter

Adopt order and upgrade order for the packs on this shelf. Open the one pack the step names.

**Related:** [library](../README.md) · [upgrade](../../../kit/UPGRADE.md) · [discover-host](skills/kit-discover-host/SKILL.md) · [adopter](skills/kit-adopter/SKILL.md) · [author-plan](skills/kit-author-plan/SKILL.md) · [emit-packs](skills/kit-emit-packs/SKILL.md) · [map-layers](skills/kit-map-layers/SKILL.md)

`generated/` is the emit target. It is not a pack. A normal task does not open this shelf.

## Adopt

| Order | Pack | Action |
|-------|------|--------|
| 1 | [skills/kit-discover-host/](skills/kit-discover-host/SKILL.md) | Place the session file. Holds the agents blank |
| 2 | [skills/kit-adopter/](skills/kit-adopter/SKILL.md) | First install |
| 3 | [skills/kit-author-plan/](skills/kit-author-plan/SKILL.md) | Write the plan when Agent Instruct is used |
| 4 | [skills/kit-emit-packs/](skills/kit-emit-packs/SKILL.md) | Emit, then stop |

## Upgrade

| Order | Pack | Action |
|-------|------|--------|
| 1 | [skills/kit-map-layers/](skills/kit-map-layers/SKILL.md) | Layers, activation, size, default paths |
| 2 | [skills/kit-define-pack/](skills/kit-define-pack/SKILL.md) | AgentPack fields and validation |
| 3 | [skills/kit-author-plan/](skills/kit-author-plan/SKILL.md) | Recalibrate the plan |
| 4 | [skills/kit-emit-packs/](skills/kit-emit-packs/SKILL.md) | Regen |
| 5 | [skills/kit-use-instruct/](skills/kit-use-instruct/SKILL.md) | Utilization after the set exists |
