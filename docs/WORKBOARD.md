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
  - ./plan/archive/description-summary-2.12.0/README.md
  - ./plan/archive/workboard-packet-2.11.1/README.md
  - ./plan/archive/definitional-identity-2.11.0/README.md
last_updated: "2026-09-04"
---

# Workboard

**Updated:** 2026-09-04  
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

- 2026-09-04 **description-summary-2.12.0** complete: `234d808` kit `2.12.0`. P0 `d7bdd4c` · P1 `39302a8` · P2 `01ab89a` · P3 `aee00fd` · P4 `797748a` · P5 `cdd4c8e`. Annex archived.
- 2026-09-01 **workboard-packet-2.11.1** complete: `9adf471` kit `2.11.1`. P0 `09fdb3e` · P1 `9240842` · P2 `705742f` · P3 `8b4fcae` · P4 `804e508` · P5 `ce44edb`. Annex archived.
- 2026-09-01 **definitional-identity-2.11.0** complete: `580ffd9` kit `2.11.0`. P0 `de1aa08` · P1 `d10b8a6` · P2 `6096529` · P3 `580749b` · P4 `3b46f8f` · P5 `3a597ed`. Annex archived.
- 2026-08-31 **frontmatter-2.10.0** complete: `5a7a486` kit `2.10.0`. P0 `1fee91e` · P1 `1854ae6` · P2 `4f2c5cc` · P3 `52393a8` · P4 `1e374ea` · P5 `e602c1c`. Annex archived.
- 2026-08-31 **files-law-2.9.0** complete: `7823f20` kit `2.9.0`. P0 `752c8a5` · P1 `66b7687` · P2 `9fc97a1` · P3 `5ea9c49` · P4 `c90efc5` · P5 `3d8212c`. Annex archived.
- 2026-08-22 **workboard-rigidity-2.8.2** complete: `22311d4` kit `2.8.2`. P0 `1e6a003` · P1 `ba79d28` · P2 `6b8d01e` · P3 `ee8114e` · P4 `ff54cef`. Annex archived.
- 2026-08-21 **density-fixups-2.8.1** complete: `a48324b` kit `2.8.1`. Annex archived.
- 2026-08-21 **md-density-2.7.0** complete: `2a01b2f` kit `2.7.0` + `2.8.0`. Annex archived.
- 2026-08-14 **habitat-l0-2.6.0** shipped: `12e0b4b` HABITAT + L0 + SETUP/UPGRADE dual path.
- 2026-08-12 **plan-control-2.4.0** shipped (P0–P8): `c5bed29` CHANGELOG `2.4.0`.

---

## Deferred

| ID | Note |
|----|------|
| — | Adopter upgrades in consuming repos (not this tree) |

---

## Recently completed (max 5 programs)

| Program | Ended | L4 pointer |
|---------|-------|------------|
| description-summary-2.12.0 | 2026-09-04 | [MARKDOWN-STANDARD](../kit/MARKDOWN-STANDARD.md) **1.6.0** · [CHANGELOG](../kit/CHANGELOG.md) `### [2.12.0]` |
| workboard-packet-2.11.1 | 2026-09-01 | [workboard](../kit/rules/workboard.md) **1.2.0** · [CHANGELOG](../kit/CHANGELOG.md) `### [2.11.1]` |
| definitional-identity-2.11.0 | 2026-09-01 | [MARKDOWN-STANDARD](../kit/MARKDOWN-STANDARD.md) **1.5.0** · [CHANGELOG](../kit/CHANGELOG.md) `### [2.11.0]` |
| frontmatter-2.10.0 | 2026-08-31 | [MARKDOWN-STANDARD](../kit/MARKDOWN-STANDARD.md) **1.4.0** · [CHANGELOG](../kit/CHANGELOG.md) `### [2.10.0]` |
| files-law-2.9.0 | 2026-08-31 | [files.md](../kit/rules/files.md) · [CHANGELOG](../kit/CHANGELOG.md) `### [2.9.0]` |

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
