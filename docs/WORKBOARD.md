---
title: repo-kit — Active Workboard
description: Single source of truth for open multi-phase kit work. Mission stays in kit docs; shipped law stays under kit/.
version: "1.0.0"
status: current
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - ../kit/rules/workboard.md
  - ../kit/CHANGELOG.md
  - ./README.md
  - ./plan/archive/density-fixups-2.8.1/README.md
  - ./plan/archive/md-density-2.7.0/README.md
last_updated: "2026-08-21"
---

# Workboard

**Updated:** 2026-08-21  
**Primary program:** `none`  
**Rules:** [kit/rules/workboard.md](../kit/rules/workboard.md) · kit README (mission) · [docs/plan/](./plan/) (detail)

| Status | Meaning |
|--------|---------|
| `open` | Not started |
| `active` | Current phase (prefer exactly one) |
| `blocked` | Waiting on user / decision |
| `done` | Shipped + verified + L4/CHANGELOG as required |
| `cancelled` | Explicitly dropped |
| `deferred` | Parked |

---

## Active program — none

| Field | Value |
|-------|--------|
| **Goal** | — |
| **L4 docs to update** | — |
| **Optional annex** | — |
| **Smoke / gates** | Author checklist; relative links; no `{{PLACEHOLDERS}}` in finished policy |

### Phases

| ID | Work | Status | Commit | Notes |
|----|------|--------|--------|-------|
| — | — | — | — | Register a program here before multi-phase kit work |

### Progress log (newest first, max ~15 lines)

- 2026-08-21 **density-fixups-2.8.1** complete: kit `2.8.1`. P1 `8695236` · P2 `aaf45f6` · P3 `0c60b1d` · P4 `97763cb`. Annex archived.
- 2026-08-21 **P1** RUNTIME citation cap: `8695236`. Next: P2 echoes.
- 2026-08-21 Registered **density-fixups-2.8.1**. Next: P1 RUNTIME citation cap.
- 2026-08-21 **md-density-2.7.0** complete: `2a01b2f` kit `2.7.0` + `2.8.0`. Annex archived. Next: adopter upgrades (not this tree).
- 2026-08-21 **P7** `28db706` UPGRADE chrome · **P6** `5a8eca7` Instruct docs.
- 2026-08-21 **P5** rules restyles: `d96110d` P5a · `27570f4` P5b · `9fbad5d` contracts last. Next: P6 Instruct docs.
- 2026-08-21 **GATE** + **P4** + kit **2.7.0** ship: `97ee1db`. Next: P5 restyle remaining rules (contracts last).
- 2026-08-19 **P3** pilots shipped: `b27ecff` hygiene 1.6.0 / architecture 1.1.0. **HARD GATE** — user accepts shape before wave 2.
- 2026-08-19 **P2** templates shipped: `84f56ae` min-core + docs-author verify. Next: P3 pilot.
- 2026-08-19 **P1** doctrine shipped: `9e8bd60` MARKDOWN-STANDARD 1.3.0, contracts 1.4.0, authoring 1.2.0, verification 1.7.0, RULES 2.7.0. Next: P2 templates.
- 2026-08-19 Registered **md-density-2.7.0**. Annex: docs/plan/md-density-2.7.0/. Next: P1 doctrine.
- 2026-08-14 **habitat-l0-2.6.0** shipped: `12e0b4b` HABITAT + L0 + SETUP/UPGRADE dual path. Next: adopter upgrades (not this tree).
- 2026-08-14 Registered **habitat-l0-2.6.0**.
- 2026-08-12 **plan-control-2.4.0** shipped (P0–P8): `5ca9ea7` board · `84a3bd0` rules · `975a379` templates · `4b40af8` SETUP/UPGRADE · `1d2af58` agents · `c5bed29` CHANGELOG `2.4.0`. Next: adopter upgrade in consuming repos (not this tree).
- 2026-08-12 Registered **plan-control-2.4.0**.

---

## Deferred

| ID | Note |
|----|------|
| — | Adopter upgrades in consuming repos (not this tree) |

---

## Recently completed (max 5 programs)

| Program | Ended | L4 pointer |
|---------|-------|------------|
| density-fixups-2.8.1 | 2026-08-21 | [density hub exception](../kit/MARKDOWN-STANDARD.md#citation-floor-and-ceiling) · [CHANGELOG](../kit/CHANGELOG.md) `### [2.8.1]` |
| md-density-2.7.0 | 2026-08-21 | [density](../kit/MARKDOWN-STANDARD.md#density-force-and-incorporation) · [incorporation](../kit/rules/contracts.md#incorporation) · [CHANGELOG](../kit/CHANGELOG.md) `### [2.7.0]` / `### [2.8.0]` |
| habitat-l0-2.6.0 | 2026-08-14 | [kit/agents/HABITAT.md](../kit/agents/HABITAT.md) · [kit/CHANGELOG.md](../kit/CHANGELOG.md) `### [2.6.0]` |
| plan-control-2.4.0 | 2026-08-12 | [kit/rules/workboard.md](../kit/rules/workboard.md) · [kit/CHANGELOG.md](../kit/CHANGELOG.md) `### [2.4.0]` |

---

## Not on this board

| Concern | Where |
|---------|--------|
| Kit mission / adopt prompts | Root [README.md](../README.md) |
| Shipped kit law | `kit/RULES.md` · `kit/rules/*` |
| Kit version history | `kit/CHANGELOG.md` under `## repo-kit` |
| Multi-phase policy | [kit/rules/workboard.md](../kit/rules/workboard.md) |

---

*Agents: register multi-phase kit work here before editing. This board is dogfood for adopters — copy the shape, not the kit-specific rows.*
