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
  - ./plan/files-law-2.9.0/README.md
  - ./plan/archive/workboard-rigidity-2.8.2/README.md
  - ./plan/archive/density-fixups-2.8.1/README.md
last_updated: "2026-08-31"
---

# Workboard

**Updated:** 2026-08-31  
**Primary program:** `files-law-2.9.0`  
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

## Active program — File law 2.9.0

| Field | Value |
|-------|--------|
| **Goal** | Add `kit/rules/files.md` (create / place / name) without breaking greenfield, existing-adopt, or prior-kit upgrade |
| **L4 docs to update** | `kit/rules/files.md` (new) · `kit/RULES.md` · hygiene · SETUP · UPGRADE · CHANGELOG `2.9.0` · citation peers in annex OOO |
| **Optional annex** | [docs/plan/files-law-2.9.0/](./plan/files-law-2.9.0/) |
| **Smoke / gates** | Author checklist; relative links; no `{{PLACEHOLDERS}}` in finished policy; **not** Domain A/B; no directory-README backfill gate |

### Phases

| ID | Work | Status | Commit | Notes |
|----|------|--------|--------|-------|
| P0 | Register annex; freeze adoptability invariants | `done` | `752c8a5` | Annex + OOO; no kit/ edits |
| P1 | Draft `kit/rules/files.md` (unique owner only) | `done` | `66b7687` | Unique owner; parent tightened L0 Must for bare adopt |
| P2 | Wire `kit/RULES.md` (map + domain index + cite) | `done` | `9fc97a1` | Map + domain index; Must index unchanged |
| P3 | Incorporate peers (hygiene, security, ai-docs, HABITAT, contracts) | `done` | `5ea9c49` | Cite; last citations remain |
| P4 | SETUP / UPGRADE / templates / examples | `done` | — | Forward-only directory index |
| P5 | Instruct seeds (`CATALOG` + templates) | `active` | — | No BUILD in this repo |
| P6 | Ship kit 2.9.0; archive annex | `open` | — | |

### Progress log (newest first, max ~15 lines)

- 2026-08-31 **P4** SETUP/UPGRADE/templates/examples. Next: P5 Instruct seeds.
- 2026-08-31 **P3** peer cites to files.md: `5ea9c49`. Next: P4 SETUP/UPGRADE/templates/examples.
- 2026-08-31 **P2** hub map + domain index: `9fc97a1`. Next: P3 peer cites.
- 2026-08-31 **P1** `kit/rules/files.md` unique owner: `66b7687`. Next: P2 hub map + cite.
- 2026-08-31 **P0** registered **files-law-2.9.0**: `752c8a5`. Next: user confirms OOO, then P1 `kit/rules/files.md`.
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
| workboard-rigidity-2.8.2 | 2026-08-22 | [workboard](../kit/rules/workboard.md) · [CHANGELOG](../kit/CHANGELOG.md) `### [2.8.2]` |
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
