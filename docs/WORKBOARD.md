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
last_updated: "2026-08-14"
---

# Workboard

**Updated:** 2026-08-14  
**Primary program:** `habitat-l0-2.6.0`  
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

## Active program — habitat-l0-2.6.0

| Field | Value |
|-------|--------|
| **Goal** | Thin L0 habitat (`AGENTS.md`) + parent/child protocol; law stays in `kit/` |
| **L4 docs to update** | HABITAT, OPS, FRAMEWORK, RUNTIME, RULES, hygiene, contracts, workboard, ai-docs-workspace, SETUP, UPGRADE, templates, CHANGELOG |
| **Optional annex** | — |
| **Smoke / gates** | Author checklist; no host trees invented; templates keep placeholders; filled AGENTS.md has none |

### Phases

| ID | Work | Status | Commit | Notes |
|----|------|--------|--------|-------|
| P0 | Confirm dual path; no host trees | `done` | — | No `.claude/` / `.cursor/` / copilot-instructions shipped |
| P1 | Policy modules | `done` | — | HABITAT + hub + OPS/FRAMEWORK/RUNTIME |
| P2 | Templates | `done` | — | TEMPLATE-AGENTS + HOST-ALIAS |
| P3 | SETUP / UPGRADE / README / examples | `done` | — | HABITAT copyable without full Instruct |
| P4 | Dogfood root AGENTS.md | `done` | — | Pointer only; Instruct off |
| P5 | CHANGELOG 2.6.0 + ship commit | `active` | — | SHA on commit; then archive program |

### Progress log (newest first, max ~15 lines)

- 2026-08-14 P3: HABITAT copyable on bare+agent path (SETUP/UPGRADE/RULES). P5 remains `active` until ship SHA.
- 2026-08-14 **habitat-l0-2.6.0** implemented (P0–P4); ship SHA on commit.
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
