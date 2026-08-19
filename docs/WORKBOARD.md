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
last_updated: "2026-08-19"
---

# Workboard

**Updated:** 2026-08-19  
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
| P0 | Register board + annex | `done` | `97a5d58` | Annex on disk; P1 active |
| P1 | Doctrine (standard, contracts, authoring, verify, hub Must, CHANGELOG open) | `active` | — | Surgical; no template/pilot yet |
| P2 | Min-core templates + docs-author + SETUP/UPGRADE notes | `open` | — | |
| P3 | Pilot restyle hygiene.md + architecture.md + ledger audit | `open` | — | Then HARD GATE |
| GATE | User accepts P3 pilot shape | `blocked` | — | User decision; no wave 2 until accepted |
| P4 | Hub Must digest trim (optional) | `open` | — | Wave 2 / after gate |
| P5 | Restyle remaining kit/rules/* (contracts last) | `open` | — | Wave 2 |
| P6 | Restyle kit/agents/*.md Instruct docs | `open` | — | Wave 2 |
| P7 | SETUP / UPGRADE / examples polish | `open` | — | |
| P8 | CHANGELOG 2.8.0 + archive annex | `open` | — | Program complete |

### Progress log (newest first, max ~15 lines)

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
