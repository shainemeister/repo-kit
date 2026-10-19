---
title: Kit adopter
description: "Adopt order for the packs on this shelf. Open the one pack the step names."
version: "1.1.0"
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
last_updated: "2026-10-18"
---

# Kit adopter

Adopt order for the packs on this shelf. Open the one pack the step names.

**Related:** [library](../README.md) · [kit-upgrade](../kit-upgrade/README.md) · [discover-host](skills/kit-discover-host/SKILL.md) · [adopter](skills/kit-adopter/SKILL.md) · [author-plan](skills/kit-author-plan/SKILL.md) · [emit-packs](skills/kit-emit-packs/SKILL.md) · [map-layers](skills/kit-map-layers/SKILL.md)

`generated/` is the emit target. It is not a pack. A normal task does not open this shelf.

## Adopt

| Order | Pack | Action |
|-------|------|--------|
| 1 | [skills/kit-discover-host/](skills/kit-discover-host/SKILL.md) | Place the session file. Holds the agents blank |
| 2 | [skills/kit-adopter/](skills/kit-adopter/SKILL.md) | First install |
| 3 | [skills/kit-author-plan/](skills/kit-author-plan/SKILL.md) | Write the plan when Agent Instruct is used |
| 4 | [skills/kit-emit-packs/](skills/kit-emit-packs/SKILL.md) | Emit, then stop |

The upgrade order is [kit-upgrade](../kit-upgrade/README.md). Map-layers, define-pack, and use-instruct stay in this directory. That order cites them.
