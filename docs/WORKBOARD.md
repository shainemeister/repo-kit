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
  - ./plan/definitional-identity-2.11.0/README.md
  - ./plan/archive/frontmatter-2.10.0/README.md
  - ./plan/archive/files-law-2.9.0/README.md
last_updated: "2026-09-01"
---

# Workboard

**Updated:** 2026-09-01  
**Primary program:** `definitional-identity-2.11.0`  
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

## Active program — definitional-identity-2.11.0

| Field | Value |
|-------|--------|
| **Goal** | Definitional identity floor for YAML `description` and directory-index Function cells (no sentence quota) |
| **L4 docs to update** | MARKDOWN-STANDARD **1.5.0**; files.md + authoring cites; SETUP/UPGRADE forward-only; optional hub map-row label; CHANGELOG `### [2.11.0]` |
| **Optional annex** | [docs/plan/definitional-identity-2.11.0/](./plan/definitional-identity-2.11.0/) |
| **Smoke / gates** | Author checklist; relative links; no `{{PLACEHOLDERS}}` in finished policy |

### Phases

| ID | Work | Status | Commit | Notes |
|----|------|--------|--------|-------|
| P0 | Register annex; freeze identity test | `done` | — | SHA on next board edit |
| P1 | MARKDOWN-STANDARD identity test | `blocked` | — | Confirm OOO before any `kit/` edits |
| P2 | Cite files.md + authoring | `open` | — | One sentence each; adopt matrix untouched |
| P3 | Templates (DIR-README + `{{DESCRIPTION}}` hint) | `open` | — | No landing/alias/AGENTS YAML |
| P4 | SETUP/UPGRADE forward-only; optional hub label | `open` | — | No historical complete-fail |
| P5 | CATALOG docs-author verify | `open` | — | No BUILD |
| P6 | CHANGELOG 2.11.0 + archive | `open` | — | |

### Progress log (newest first, max ~15 lines)

- 2026-09-01 Registered **definitional-identity-2.11.0**. P0 annex + freeze. P1 `blocked` on OOO confirm.
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
| frontmatter-2.10.0 | 2026-08-31 | [MARKDOWN-STANDARD](../kit/MARKDOWN-STANDARD.md) **1.4.0** · [CHANGELOG](../kit/CHANGELOG.md) `### [2.10.0]` |
| files-law-2.9.0 | 2026-08-31 | [files.md](../kit/rules/files.md) · [CHANGELOG](../kit/CHANGELOG.md) `### [2.9.0]` |
| workboard-rigidity-2.8.2 | 2026-08-22 | [workboard](../kit/rules/workboard.md) · [CHANGELOG](../kit/CHANGELOG.md) `### [2.8.2]` |
| density-fixups-2.8.1 | 2026-08-21 | [density hub exception](../kit/MARKDOWN-STANDARD.md#citation-floor-and-ceiling) · [CHANGELOG](../kit/CHANGELOG.md) `### [2.8.1]` |
| md-density-2.7.0 | 2026-08-21 | [density](../kit/MARKDOWN-STANDARD.md#density-force-and-incorporation) · [incorporation](../kit/rules/contracts.md#incorporation) · [CHANGELOG](../kit/CHANGELOG.md) `### [2.7.0]` / `### [2.8.0]` |

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
