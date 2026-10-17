---
title: repo-kit — Active Workboard
description: Open multi-phase kit work. One program is active at a time.
version: "1.3.0"
status: current
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - kit/RULES.md
  - kit/CHANGELOG.md
  - docs/README.md
  - docs/plan/archive/orchestrator-portability-2.15.0/README.md
  - docs/plan/archive/commit-notes-2.13.0/README.md
  - docs/plan/archive/description-summary-2.12.0/README.md
  - docs/plan/archive/workboard-packet-2.11.1/README.md
last_updated: "2026-10-17"
---

# Workboard

Open multi-phase kit work. One program is active at a time.

**Updated:** 2026-10-17  
**Primary program:** `kit-board-notepad`  
**Rules:** [kit/RULES.md](kit/RULES.md) · kit README (mission) · [docs/plan/](docs/plan/) (detail)

| Status | Meaning |
|--------|---------|
| `open` | Not started |
| `active` | Current phase (prefer exactly one) |
| `blocked` | Waiting on a decision |
| `done` | Finished |
| `cancelled` | Dropped |
| `deferred` | Parked |

Primary program `—` means no program is registered.

When every phase is `done`, the commit that shipped the work leaves this file in place. The next task files a copy at `docs/plan/archive/<program>/WORKBOARD.md` and replaces this file with the blank. [Contracts](kit/rules/contracts.md#boundaries) owns that split.

---

## Active program — kit-board-notepad

| Field | Value |
|-------|--------|
| **Goal** | Multi-phase work is written on this board and checked off here. The blank can start a board. After the commit that leaves every phase `done`, the next task files the board and restores the blank. `MEMORY.md` is the agent's notepad |
| **Base** | Uncommitted `kit-homes`. Do not redo it. Do not archive this board: no commit has run. Sections 11–16 stay deferred |
| **L4 docs to update** | [files.md](kit/rules/files.md), [contracts.md](kit/rules/contracts.md), [RULES.md](kit/RULES.md), [UPGRADE.md](kit/UPGRADE.md), root [AGENTS.md](AGENTS.md), the agents paste, [kit/skills/README.md](kit/skills/README.md). The hub stays a map |
| **Optional annex** | — |
| **Smoke / gates** | Author checklist on edited durable markdown. `MEMORY.md` has no front matter. No `README.md` beside `SKILL.md`. Hub has no skills row. `[3.0.0]`, `[3.1.0]`, `[3.2.0]`, and `[3.3.0]` stay. Commit only when the user asks |

### Decisions

| Rule | Owner |
|------|--------|
| Checklist | Root `AGENTS.md` step 4. Write every step on this board and check it off here |
| Reply grid | The same session file. When a primary program is set, the reply opens with ID, Work, and Status |
| Blank | [template/workboard.md](kit/skills/kit-workboard-register/template/workboard.md). Copy the fenced body |
| Close | `kit-workboard-close` sets a phase status and leaves the program here |
| Commit pointer | `kit-commit` names `kit-workboard-archive` only after the commit exists and every phase is `done` |
| Archive | `kit-workboard-archive` files `docs/plan/archive/<program>/WORKBOARD.md` and restores the blank. It does not commit |
| Notepad | Root `MEMORY.md`. The agent rewrites it freely and keeps it short. Archive does not clear it |
| History | Do not rewrite `[3.0.0]`, `[3.1.0]`, `[3.2.0]`, or `[3.3.0]`. Do not edit `docs/plan/archive/` in this program |

### Phases

| ID | Work | Status | Commit | Notes |
|----|------|--------|--------|-------|
| 1 | Register this map | done | — | This board |
| 2 | Session order | done | — | Root `AGENTS.md` and the agents paste. Checklist, reply grid, notepad |
| 3 | Blanks | done | — | Workboard blank, memory blank, root `MEMORY.md`, markdown omit row |
| 4 | Packs | done | — | Register copies the blank. Close leaves the program. `kit-workboard-archive` is new. `kit-commit` names it after the commit |
| 5 | Law and indexes | done | — | `files.md` **1.11.0**, `contracts.md` **1.8.0**, `RULES.md` **3.4.0**, `UPGRADE.md` **3.2.0**. Skills index **1.14.0** |
| 6 | Verify | done | — | [kit/CHANGELOG.md](kit/CHANGELOG.md) `### [3.4.0]` is on disk and unstaged. Not committed. This board stays |

### Progress log (newest first, max ~15 lines)

- 2026-10-17 **kit-board-notepad** phase 6 verified. Changelog `### [3.4.0]` is on disk and unstaged. Not committed. This board stays.
- 2026-10-17 **kit-board-notepad** phase 5 updated the law rows and the indexes.
- 2026-10-17 **kit-board-notepad** phase 4 added `kit-workboard-archive` and the commit pointer.
- 2026-10-17 **kit-board-notepad** phase 3 added the blanks and root `MEMORY.md`.
- 2026-10-17 **kit-board-notepad** phase 2 pointed the session order at the checklist, the reply grid, and the notepad.
- 2026-10-17 **kit-board-notepad** phase 1 registered this map.
- 2026-10-17 **kit-homes** is on recently completed. It is not archived: no commit of that program has run.

---

## Deferred

| ID | Note |
|----|------|
| — | Adopter upgrades in consuming repos (not this tree) |
| skill-pack-sequence 11–16 | Platform descriptions, platform changelog schema, docs-workspace gaps, archive-link policy, and accepted exceptions. `kit-homes` retargets only the links this move breaks |

---

## Recently completed (max 5 programs)

| Program | Ended | L4 pointer |
|---------|-------|------------|
| kit-homes | 2026-10-17 | [files.md](kit/rules/files.md) **1.10.0** · [CHANGELOG](kit/CHANGELOG.md) `### [3.3.0]` unstaged |
| kit-skill-fold | 2026-10-17 | [kit-map-layers](docs/library/kit-adopter/skills/kit-map-layers/SKILL.md) **1.9.0** · [CHANGELOG](kit/CHANGELOG.md) `### [3.2.0]` unstaged |
| kit-skill-path | 2026-10-17 | [files.md](kit/rules/files.md) **1.9.0** · [CHANGELOG](kit/CHANGELOG.md) `### [3.1.0]` unstaged |
| orchestrator-portability-2.15.0 | 2026-09-22 | [orchestrator README](docs/library/archive/dispatch-crew/SKILL.md) **1.2.1** · [CHANGELOG](kit/CHANGELOG.md) `### [2.15.0]` |
| commit-notes-2.13.0 | 2026-09-04 | [versioning-and-git](kit/rules/versioning-and-git.md) **1.1.0** · [CHANGELOG](kit/CHANGELOG.md) `### [2.13.0]` |

---

## Not on this board

| Concern | Where |
|---------|--------|
| Kit mission / adopt prompts | Root [README.md](README.md) |
| Shipped kit law | `kit/RULES.md` · `kit/rules/*` |
| Kit version history | `kit/CHANGELOG.md` under `## repo-kit` |
| Multi-phase record | This file. The hub names it in one row |
| Agent notepad | Root [MEMORY.md](MEMORY.md) |

---

*Write every step here and check it off. The blank is [template/workboard.md](kit/skills/kit-workboard-register/template/workboard.md).*
