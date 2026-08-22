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
  - ./plan/md-density-2.7.0/README.md
last_updated: "2026-08-21"
---

# Workboard

**Updated:** 2026-08-21  
**Primary program:** `md-density-2.7.0`  
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

## Active program — Markdown density

| Field | Value |
|-------|--------|
| **Goal** | Binding density + incorporation doctrine; keep types; keep citations; slim templates; pilot hygiene+architecture; restyles only after human gate |
| **L4 docs to update** | MARKDOWN-STANDARD, contracts, authoring-and-style, verification-and-ops, RULES (one Must), templates, docs-author seed, hygiene, architecture, kit CHANGELOG |
| **Optional annex** | [docs/plan/md-density-2.7.0/](./plan/md-density-2.7.0/) |
| **Smoke / gates** | Author checklist; relative links; no `{{PLACEHOLDERS}}` in finished policy; unique-rule ledger on restyles; last citation remains |

### Phases

| ID | Work | Status | Commit | Notes |
|----|------|--------|--------|-------|
| P0 | Register board + annex | `done` | `6329c20` | Annex on disk; P1 active |
| P1 | Doctrine (standard, contracts, authoring, verify, hub Must, CHANGELOG open) | `done` | `9e8bd60` | Citations kept; 2.7.0 shipped |
| P2 | Min-core templates + docs-author + SETUP/UPGRADE notes | `done` | `84f56ae` | omit-if templates; docs-author verify |
| P3 | Pilot restyle hygiene.md + architecture.md + ledger audit | `done` | `b27ecff` | Ledger passed; HARD GATE |
| GATE | User accepts P3 pilot shape | `done` | `97ee1db` | Accepted 2026-08-21; 2.7.0 shipped |
| P4 | Hub Must digest trim (optional) | `done` | `97ee1db` | Chrome only; Must map stays complete |
| P5 | Restyle remaining kit/rules/* (contracts last) | `done` | `9fbad5d` | P5a `d96110d` · P5b `27570f4` · P5c `9fbad5d` |
| P6 | Restyle kit/agents/*.md Instruct docs | `done` | `5a8eca7` | O3, parent/child, L0–L4 kept |
| P7 | SETUP / UPGRADE / examples polish | `active` | — | |
| P7 | SETUP / UPGRADE / examples polish | `open` | — | |
| P8 | CHANGELOG 2.8.0 + archive annex | `open` | — | Program complete |

### Progress log (newest first, max ~15 lines)

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
