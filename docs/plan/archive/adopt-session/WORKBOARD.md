---
title: Active workboard
description: Open multi-phase work. One program is active at a time.
version: "1.5.0"
status: current
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - ../../../../kit/RULES.md
  - ../../../../kit/CHANGELOG.md
  - ../../../../docs/README.md
last_updated: "2026-10-19"
---

# Workboard

Open multi-phase work. One program is active at a time.

**Updated:** 2026-10-19
**Primary program:** adopt-session
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

An authorized commit updates this file before that commit is created, and files it only for a named program with no phase `open`, `active`, or `blocked` ([contracts](../../../../kit/rules/contracts.md#boundaries)).

## Active program

| Field | Value |
|-------|--------|
| **Goal** | Deprecate this kit's old plan snapshots, keep three changelog sections here, and make the session file a short adopt and upgrade pointer. |
| **Base** | `9799b10` |
| **L4 docs to update** | [directory-index.md](../../../../kit/rules/directory-index.md), [versioning-and-git.md](../../../../kit/rules/versioning-and-git.md), [archive index](../../../../docs/plan/archive/README.md), [plan index](../../../../docs/plan/README.md), [CHANGELOG.md](../../../../kit/CHANGELOG.md), [agents paste](../../../../docs/library/kit-adopter/skills/kit-discover-host/template/agents.md), [AGENTS.md](../../../../AGENTS.md), [ADOPTER.md](../../../../ADOPTER.md), [UPGRADE.md](../../../../kit/UPGRADE.md) |
| **Optional annex** | [adopt-session](README.md) |
| **Smoke / gates** | Author checklist on every edited current file. Relative links from a current file resolve. A deprecated archive snapshot is not that check. |

### Decisions

| Rule | Owner |
|------|--------|
| `kit/` is indexed by `kit/RULES.md`. Do not add `kit/README.md`. | [directory-index.md](../../../../kit/rules/directory-index.md) |
| This kit does not keep prior program snapshots. A target still files its own. | [archive index](../../../../docs/plan/archive/README.md) |
| A target still files a finished program at `docs/plan/archive/<program>/`. That procedure does not change. | [kit-workboard-archive](../../../../kit/skills/kit-workboard-archive/SKILL.md) |
| This kit keeps the three newest `## repo-kit` sections. An adopter's changelog is not trimmed. | [versioning-and-git.md](../../../../kit/rules/versioning-and-git.md) |
| The session block is the agents paste. An existing `AGENTS.md` becomes that block plus the project's path note. | [agents.md](../../../../docs/library/kit-adopter/skills/kit-discover-host/template/agents.md) |
| This repository's root `AGENTS.md` is that block. | [AGENTS.md](../../../../AGENTS.md) |

### Phases

| ID | Work | File | Draft | Status | Notes |
|----|------|------|-------|--------|-------|
| 1 | Name `kit/` as indexed by the hub | [directory-index.md](../../../../kit/rules/directory-index.md) | [1-name-kit-hub.md](1-name-kit-hub.md) | `done` | One sentence. Do not add `kit/README.md`. |
| 2 | Record the three-section changelog cut | [versioning-and-git.md](../../../../kit/rules/versioning-and-git.md) | [2-record-retention.md](2-record-retention.md) | `done` | This kit only. An adopter's changelog stays whole. |
| 3 | Mark this kit's archive folders deprecated | [archive index](../../../../docs/plan/archive/README.md) | [3-deprecate-archive.md](3-deprecate-archive.md) | `done` | The folders were removed. The filing procedure is unchanged. |
| 4 | Keep the three newest kit sections | [CHANGELOG.md](../../../../kit/CHANGELOG.md) | [4-trim-changelog.md](4-trim-changelog.md) | `done` | Run after phase 2. Do not edit bodies inside a deprecated archive folder. |
| 5 | Write the session block | [agents.md](../../../../docs/library/kit-adopter/skills/kit-discover-host/template/agents.md) | [5-write-session-block.md](5-write-session-block.md) | `done` | This file is the one under review. |
| 6 | Match this repository's session file | [AGENTS.md](../../../../AGENTS.md) | [6-match-root-agents.md](6-match-root-agents.md) | `done` | Run after phase 5. The file is the block. |
| 7 | Point adopt and upgrade at that block | [ADOPTER.md](../../../../ADOPTER.md) | [7-point-adopt-upgrade.md](7-point-adopt-upgrade.md) | `done` | Also `kit/UPGRADE.md`. An existing file is condensed, not prepended. |
| 8 | Link each phase draft from the table | [workboard blank](../../../../kit/skills/kit-workboard-register/template/workboard.md) | [8-link-phase-drafts.md](8-link-phase-drafts.md) | `done` | The register procedure uses the same column. |

The File cell is the product file. The Draft cell is the phase document. Notes do not repeat either path.

### Progress log (newest first, max ~15 lines)

- 2026-10-19 — Filed `adopt-session`. The session block replaces an existing `AGENTS.md`. Prior plan snapshots stay out of this kit.
- 2026-10-19 — The plan-archive program folders were removed. The usage note stays. A target still files its own program.
- 2026-10-19 — Phases 1–8 done. QA found two link and wording misses. Both are fixed.
- 2026-10-19 — Phases 4, 6, and 7 are active. Phase 4 follows the retention rule. Phases 6 and 7 follow the session block.
- 2026-10-19 — Phases 1, 2, 3, and 5 are active. They edit different files.
- 2026-10-19 — Phase 8 done. Each phase row links its product file and its draft.
- 2026-10-19 — Registered `adopt-session`. Phases 1–7 are open. Archive folders stay and are deprecated here. A target still files its own program.

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

Check a phase off by setting its status. A registered program replaces the `—` rows.
