---
title: Active workboard
description: Open multi-phase work. One program is active at a time.
version: "1.4.0"
status: current
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - kit/RULES.md
  - kit/CHANGELOG.md
  - docs/README.md
last_updated: "2026-10-18"
---

# Workboard

Open multi-phase work. One program is active at a time.

**Updated:** 2026-10-18  
**Primary program:** shelf-crews  
**Rules:** [kit/RULES.md](kit/RULES.md)

| Status | Meaning |
|--------|---------|
| `open` | Not started |
| `active` | Current phase (prefer exactly one) |
| `blocked` | Waiting on a decision |
| `done` | Finished |
| `cancelled` | Dropped |
| `deferred` | Parked |

Primary program `—` means no program is registered.

An authorized commit updates this file before that commit is created, and files it only for a named program with no phase `open`, `active`, or `blocked` ([contracts](kit/rules/contracts.md#boundaries)).

## Active program

| Field | Value |
|-------|--------|
| **Goal** | Give adopt and upgrade their own shelves, draft the one-time packs, and require a phase draft for each registered phase. |
| **Base** | `aae6e1c`, plus the uncommitted `skill-shape` edits in this worktree |
| **L4 docs to update** | [enhancement-notes.md](docs/research/enhancement-notes.md), [kit-adopter/README.md](docs/library/kit-adopter/README.md), [library README](docs/library/README.md), [ADOPTER.md](ADOPTER.md), [UPGRADE.md](kit/UPGRADE.md), [workboard blank](kit/skills/kit-workboard-register/template/workboard.md), [kit-workboard-register](kit/skills/kit-workboard-register/SKILL.md), [kit-workboard-archive](kit/skills/kit-workboard-archive/SKILL.md) |
| **Optional annex** | [enhancement-notes.md](docs/research/enhancement-notes.md) |
| **Smoke / gates** | Each shelf README is the only order for that shelf. Shared packs are cited, not copied. A bare adopt stops before `kit-author-plan`. A registered phase has its draft only after phase 1 lands. |

### Decisions

| Rule | Owner |
|------|--------|
| Adopt packs stay on `docs/library/kit-adopter/`. Upgrade packs stay on `docs/library/kit-upgrade/`. Neither tree is copied into `kit/skills/`. | [enhancement-notes.md](docs/research/enhancement-notes.md) |
| `kit-author-plan`, `kit-emit-packs`, `kit-map-layers`, `kit-define-pack`, and `kit-use-instruct` stay one copy and are cited. | [kit-adopter](docs/library/kit-adopter/README.md) |
| `kit-workboard-register` and `kit-review-change` stay in `kit/skills/`. The shelf packs cite them. | [kit/skills/README.md](kit/skills/README.md) |
| `kit-adopt` is the existing `adopter` id. `kit-upgrade` is the one new directory. | [enhancement-notes.md](docs/research/enhancement-notes.md) |
| A pack names the next row and stops. A sub-agent per phase waits until path-pattern and the skills index allow it. | [path-pattern.md](kit/rules/path-pattern.md#pattern) |
| The kit procedure wins for kit files. It does not replace product text, a project's own `AGENTS.md` sections, or a filled `MEMORY.md`. | [UPGRADE.md](kit/UPGRADE.md) |
| A phase draft is `docs/plan/<program>/<id>-<verb>.md`. The File cell stays the product file. The blank owns that rule. | [workboard blank](kit/skills/kit-workboard-register/template/workboard.md) |
| This program does not backfill drafts for `skill-shape`. | [skill-shape archive](docs/plan/archive/skill-shape/WORKBOARD.md) |

### Phases

| ID | Work | File | Status | Notes |
|----|------|------|--------|-------|
| 1 | Require a phase draft when a phase is registered | [workboard blank](kit/skills/kit-workboard-register/template/workboard.md) | `done` | The blank names `docs/plan/<program>/<id>-<verb>.md`. The File cell stays the product file. Archive moves that directory with the board and does not create it when it is absent. |
| 2 | Leave only the adopt order on the adopter shelf | [kit-adopter README](docs/library/kit-adopter/README.md) | `open` | Remove the upgrade table. One sentence cites `docs/library/kit-upgrade/README.md`. Discover-host, author-plan, emit-packs, map-layers, define-pack, and use-instruct stay here. |
| 3 | Add the upgrade shelf index | [kit-upgrade README](docs/library/kit-upgrade/README.md) | `open` | New directory. The order is `kit-upgrade`, `kit-context-register`, `kit-map-layers`, `kit-define-pack`, `kit-author-plan`, `kit-emit-packs`, `kit-use-instruct`, `kit-upgrade-qa`. Cite the shared packs. Do not copy them. |
| 4 | Point the library index at both shelves | [library README](docs/library/README.md) | `open` | The kit-adopter row no longer says it holds the upgrade order. Add the kit-upgrade row. |
| 5 | Draft `kit-catalog-scout` | [kit-catalog-scout](docs/library/kit-adopter/skills/kit-catalog-scout/SKILL.md) | `open` | Seed shape, no `## Must`. List tracked paths the index rule keeps, one line each. Do not place the session file. Do not add a catalog the workboard or an index already holds. |
| 6 | Draft `kit-context-register` | [kit-context-register](docs/library/kit-adopter/skills/kit-context-register/SKILL.md) | `open` | One catalogued path becomes one phase, a File link, the edge case in Notes, and the phase draft from phase 1. Cite `kit-workboard-register`. Do not open a second program. |
| 7 | Rewrite the adopt execution pack | [kit-adopter](docs/library/kit-adopter/skills/kit-adopter/SKILL.md) | `open` | Same id. Follow the current adopt-README row, name the next row, and stop. A bare adopt stops before `kit-author-plan`. Do not restate `ADOPTER.md`. Do not open the next pack in this session. |
| 8 | Draft `kit-adopt-qa` | [kit-adopt-qa](docs/library/kit-adopter/skills/kit-adopt-qa/SKILL.md) | `open` | Read the phase draft and the File target. Report fits, or a short fix list. Do not edit the phase. Do not carry the reviewer's commit checks. |
| 9 | Draft `kit-upgrade` | [kit-upgrade](docs/library/kit-upgrade/skills/kit-upgrade/SKILL.md) | `open` | Read the Kit source and the notable changes since the baseline. Keep project `AGENTS.md`, `MEMORY.md`, and `WORKBOARD.md`. Name the next upgrade row and stop. Do not paste this kit's changelog into the project. |
| 10 | Draft `kit-upgrade-qa` | [kit-upgrade-qa](docs/library/kit-upgrade/skills/kit-upgrade-qa/SKILL.md) | `open` | Read the changelog span and the rows this upgrade registered. Report fits, or a short fix list. Do not edit the phase. Do not treat a product file as a kit file. |
| 11 | Point `ADOPTER.md` at the adopt order | [ADOPTER.md](ADOPTER.md) | `open` | One sentence names `docs/library/kit-adopter/README.md`. Do not paste the pack table. The target still deletes this file when the adopt is finished. |
| 12 | Point `UPGRADE.md` at the upgrade order | [UPGRADE.md](kit/UPGRADE.md) | `open` | One sentence names `docs/library/kit-upgrade/README.md`. The five steps stay. The target can follow this file from the Kit source when the shelf is not copied in. |

Each registered phase has a draft at `docs/plan/<program>/<id>-<verb>.md` with that phase's working text. The File cell stays the product file.

### Progress log (newest first, max ~15 lines)

- 2026-10-18 — Phase 1 done. A registered phase has a draft. This program's rows were registered before that rule and were not backfilled.
- 2026-10-18 — Registered `shelf-crews`. Phases 1–12 are open. None are active. `skill-shape` is filed at `docs/plan/archive/skill-shape/`.

## Deferred

| ID | Note |
|----|------|
| — | — |

## Not on this board

| Concern | Where |
|---------|--------|
| Session order | `AGENTS.md` |
| Agent notepad | `MEMORY.md` |
| Kit law | `kit/RULES.md` |
| A sub-agent per phase | [path-pattern.md](kit/rules/path-pattern.md#pattern). Not allowed until that file and the skills index say so. |
| Shorter AgentPack bodies | [skill-shape](docs/plan/archive/skill-shape/WORKBOARD.md). Filed. Its edits are still uncommitted in this worktree. |

Check a phase off by setting its status. A registered program replaces the `—` rows.
