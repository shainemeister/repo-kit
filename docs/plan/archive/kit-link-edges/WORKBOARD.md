---
title: Active workboard
description: Open multi-phase work. One program is active at a time.
version: "1.2.0"
status: current
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - ../../../../kit/RULES.md
  - ../../../../kit/CHANGELOG.md
  - ../../../README.md
last_updated: "2026-10-17"
---

# Workboard

Open multi-phase work. One program is active at a time.

**Updated:** 2026-10-17  
**Primary program:** `kit-link-edges`  
**Rules:** [kit/RULES.md](../../../../kit/RULES.md)

| Status | Meaning |
|--------|---------|
| `open` | Not started |
| `active` | Current phase (prefer exactly one) |
| `blocked` | Waiting on a decision |
| `done` | Finished |
| `cancelled` | Dropped |
| `deferred` | Parked |

Primary program `—` means no program is registered.

Every commit updates this file before the session closes ([contracts](../../../../kit/rules/contracts.md#boundaries)). When no phase is `open`, `active`, or `blocked`, that update files a copy at `docs/plan/archive/<program>/WORKBOARD.md` and replaces this file with the blank.

## Active program — kit-link-edges

| Field | Value |
|-------|--------|
| **Goal** | The workboard procedure covers a finished program, a copied snapshot keeps working links, and the live platform docs point at current homes |
| **Base** | `48fe3b8`. The live board was the blank. Do not redo `kit-board-notepad`. Do not commit unless asked |
| **L4 docs to update** | [contracts.md](../../../../kit/rules/contracts.md) owns the file rule. [kit-workboard-archive](../../../../kit/skills/kit-workboard-archive/SKILL.md), [kit-workboard-register](../../../../kit/skills/kit-workboard-register/SKILL.md), [kit-workboard-close](../../../../kit/skills/kit-workboard-close/SKILL.md), and [template/workboard.md](../../../../kit/skills/kit-workboard-register/template/workboard.md). Live platform files in phase 5. The hub stays a map |
| **Optional annex** | — |
| **Smoke / gates** | Author checklist on edited durable markdown. Link check skips fenced destination blanks. `[3.0.0]` through `[3.3.0]` stay. A new changelog sentence stays unstaged |

### Decisions

| Rule | Owner |
|------|--------|
| File rule | [contracts](../../../../kit/rules/contracts.md#boundaries). File and restore the blank when no phase is `open`, `active`, or `blocked`. `done`, `cancelled`, and `deferred` can all sit on a finished program |
| Log cap | Archive trims the progress log the same way advance and close do. The cap stays the one this board states |
| Snapshot links | Archive rewrites relative links so they resolve from `docs/plan/archive/<program>/`. The copy stays the record of the program |
| Second file | A program directory that already exists is replaced. [docs/plan/README.md](../../README.md) gains a row only when that program is new |
| Register | If the primary program is not `—`, stop. Do not replace the open program |
| Blank weight | The template drops **Recently completed** and the **Commit** column. This live table keeps its columns until a later archive restores the blank. `blocked` stays a status advance can set. No fifth workboard pack |
| This snapshot | Retarget links in [kit-board-notepad/WORKBOARD.md](../kit-board-notepad/WORKBOARD.md) only. Leave every older archive body |
| Platform links | Retarget `style-gates.md`, the four examples, and `TEMPLATE-CERTIFICATION-README.md`. Destination fences stay destination-relative |
| Out of scope | Platform `archive/` twins stay. `skill-pack-sequence` sections 11–16 stay deferred. The grammar draft and `.git-mgr/` stay out |

### Phases

| ID | Work | Status | Commit | Notes |
|----|------|--------|--------|-------|
| 1 | Register this map | done | — | This board |
| 2 | Workboard procedures | done | — | Archive trims the log, files a program with no `open`, `active`, or `blocked` phase, rewrites links on the copy, and adds a plan-index row only for a new program. Register stops when a program is already primary. Close names `kit-commit` on that same finished state. Contracts owns the file sentence |
| 3 | Blank weight | done | — | Edit the workboard template only. Drop **Recently completed** and the **Commit** column. Leave this live table in place |
| 4 | Snapshot links | done | — | Retarget links in `docs/plan/archive/kit-board-notepad/WORKBOARD.md`. Do not reshape that snapshot to the new blank |
| 5 | Live platform links | done | — | `docs/library/platforms/style-gates.md`, `examples/c-cpp-library.md`, `examples/rust-library.md`, `examples/cli-tool.md`, `examples/python-library.md`, and `TEMPLATE-CERTIFICATION-README.md` |
| 6 | Verify | done | — | Link check on the edited set. Author checklist. Changelog sentence on disk and unstaged only if the change is notable |

### Progress log (newest first, max ~15 lines)

- 2026-10-17 **kit-link-edges** phase 6 verified the edited set. Links in that set resolve. `### [3.5.0]` is on disk and unstaged. Not committed. This board stays.
- 2026-10-17 **kit-link-edges** phase 5 retargeted `style-gates.md`, the four examples, and the certification template.
- 2026-10-17 **kit-link-edges** phase 4 retargeted links in the `kit-board-notepad` snapshot. The old columns and the old file sentence stay.
- 2026-10-17 **kit-link-edges** phase 3 dropped **Recently completed** and the **Commit** column from the workboard blank. The live table is unchanged. The blank's file sentence cites the current rule.
- 2026-10-17 **kit-link-edges** phase 2 updated the file rule. Contracts is **1.10.0**. Archive trims the log, rewrites snapshot links, and adds a plan-index row only for a new program. Register stops when a program is already primary.
- 2026-10-17 **kit-link-edges** phase 2 is active. Workboard procedures are the work about to start.
- 2026-10-17 **kit-link-edges** phase 1 registered this map. Phases 2–6 are open.

## Deferred

| ID | Note |
|----|------|
| platform-archive-twins | Debian, GNOME, and Rust policies also exist under `archive/`. Keep them until a later program says to drop or fold them |
| skill-pack-sequence 11–16 | Descriptions, platform changelog schema, docs-workspace gaps, older archive-link policy, and accepted exceptions. This program does not edit that file |
| grammar-draft | `docs/research/english-grammar-principles.md` stays untracked |

## Recently completed (max 5 programs)

| Program | Ended | L4 pointer |
|---------|-------|------------|
| — | — | — |

## Not on this board

| Concern | Where |
|---------|--------|
| Session order | `AGENTS.md` |
| Agent notepad | `MEMORY.md` |
| Kit law | `kit/RULES.md` |

Check a phase off by setting its status. A registered program replaces the `—` rows.
