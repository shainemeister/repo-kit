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
  - kit/RULES.md
  - kit/CHANGELOG.md
  - docs/README.md
last_updated: "2026-10-18"
---

# Workboard

Open multi-phase work. One program is active at a time.

**Updated:** 2026-10-18  
**Primary program:** audit-repairs  
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

An authorized commit updates this file before that commit is created ([contracts](kit/rules/contracts.md#boundaries)). When no phase is `open`, `active`, or `blocked`, that update files a copy at `docs/plan/archive/<program>/WORKBOARD.md` and replaces this file with the blank.

## Active program

| Field | Value |
|-------|--------|
| **Goal** | Repair the six tracked audit bugs, then tighten the seven drift cites so each rule has one owner. |
| **Base** | `b37b5ee` |
| **L4 docs to update** | [contracts.md](kit/rules/contracts.md), this file, [kit-workboard-register/template/workboard.md](kit/skills/kit-workboard-register/template/workboard.md), [kit-workboard-archive](kit/skills/kit-workboard-archive/SKILL.md), [kit/skills/README.md](kit/skills/README.md), [kit-emit-packs](docs/library/kit-adopter/skills/kit-emit-packs/SKILL.md), [kit-author-docs](kit/skills/kit-author-docs/SKILL.md), [kit-apply-change](kit/skills/kit-apply-change/SKILL.md), [landing.md](kit/skills/kit-author-docs/template/landing.md), [style-gates.md](docs/library/platforms/style-gates.md), [check_sources.py](docs/library/platforms/scripts/check_sources.py) and the `sources.yaml` files whose detectors match only the stored pin, [path-pattern.md](kit/rules/path-pattern.md), [directory-index.md](kit/rules/directory-index.md), [kit-commit](kit/skills/kit-commit/SKILL.md), [versioning-and-git.md](kit/rules/versioning-and-git.md), [docs/project_build/README.md](docs/project_build/README.md), [MEMORY.md](MEMORY.md) |
| **Optional annex** | — |
| **Smoke / gates** | Author checklist on every edited markdown file. After phase 6, `python3 docs/library/platforms/scripts/check_sources.py --offline` from `docs/library/platforms`. |

### Decisions

| Rule | Owner |
|------|--------|
| A primary program of `—` does not file the board. File and restore the blank only when a named program has no phase `open`, `active`, or `blocked`. | [contracts.md](kit/rules/contracts.md#boundaries) |
| Every match-index id that has a seed gets a seed-table row. `match` versus `on` does not drop the row. An unknown id still fails. | [kit-emit-packs](docs/library/kit-adopter/skills/kit-emit-packs/SKILL.md) |
| The style-gate file stays at `docs/library/platforms/style-gates.md`. The kit cites it. It does not move into `kit/`. | [kit-author-docs](kit/skills/kit-author-docs/SKILL.md) |
| The agents paste is the discover-host blank on the shelf. Links inside that paste stay destination-relative. | [agents.md](docs/library/kit-adopter/skills/kit-discover-host/template/agents.md) |
| A live cite names a heading that exists. Committed changelog sections stay as published. Archive bodies stay historical. | [MARKDOWN-STANDARD.md](kit/MARKDOWN-STANDARD.md#author-checklist) |
| A moving pin uses a detector that can capture a value other than the stored token. A fixed event may use a literal. `watch_path` is not fetched until this program defines that fetch. | [check_sources.py](docs/library/platforms/scripts/check_sources.py) |
| One sentence has one owner. The other file keeps one local sentence and a deep link. | [kit/RULES.md](kit/RULES.md) |
| The three research notes deleted in the worktree stay in `HEAD`. This program does not delete them and does not retarget law at their absence. | `docs/research/` |

### Phases

| ID | Work | Status | Notes |
|----|------|--------|-------|
| 1 | State one filing order for a blank board and a named program | `open` | `contracts.md` Boundaries, the paragraph above, the fenced blank, and `kit-workboard-archive`. Phase 9 waits on this sentence. |
| 2 | Add `name-path` and `index-directory` to the emit seed table | `open` | Seeds exist. The table at `kit-emit-packs` omits them, so priority 4 fails those ids. |
| 3 | Point the two skills at `docs/library/platforms/style-gates.md` | `open` | `kit-author-docs` authority path and `kit-apply-change` reference. Both say `library/platforms/style-gates.md`. |
| 4 | Point the landing blank at the discover-host agents template | `open` | `landing.md` says `kit/skills/kit-discover-host/template/agents.md`. That path is not in the tree. |
| 5 | Retarget the style-gates documentation cites | `open` | `contracts.md#incorporation` has no heading. Required-core and Platform-aware examples are not current markdown headings. |
| 6 | Let a moving source pin capture a new value | `open` | Self-matching detectors only, starting with Node `\b24\b`. Leave capturing regexes. No-match already reports `DRIFT`. |
| 7 | Give "one task, one skill" one owner | `open` | Drift. `path-pattern.md` and `kit/skills/README.md` each state it and cite the other. Bare adopt copies the rule file only. A handoff to the next task stays legal. |
| 8 | Give "no README beside SKILL.md" one owner | `open` | Drift. `directory-index.md` states the ban and cites `path-pattern.md`, which does not say it. The parent `kit/skills/README.md` stays the tree index. |
| 9 | Make the commit expertise map match the procedure | `open` | Drift. Procedure updates `WORKBOARD.md` before the commit. The map says read it after. Depends on phase 1. |
| 10 | Stop `versioning-and-git.md` restating the changelog rule | `open` | Drift. Keep the pointer to `RULES.md#changelog`. Align the lead with the description's first sentence. |
| 11 | Replace the SETUP sentence on the project-build index | `open` | Drift. The index still says SETUP stays here. `kit-context.md` already names `ADOPTER.md`. Do not recreate `kit/SETUP.md`. |
| 12 | Leave changelog `[3.0.0]` as published history | `open` | Drift. The current layout is the `[3.8.0]` sentence. The intro already says the latest dated section is the kit version. Do not backfill 3.1–3.7. |
| 13 | Keep "current program" on this board | `open` | Drift. `MEMORY.md` uses that phrase for intent. The notepad holds intent and direction. It does not copy this table. |

### Progress log (newest first, max ~15 lines)

- 2026-10-18 — Registered `audit-repairs` on `b37b5ee`. Phases 1–6 are the tracked bugs. Phases 7–13 are the drift cites. None are active.

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
| Worktree deletion of `repo-kit-rework.md`, `repo-kit-rules-enhancement.md`, and `skill-pack-sequence.md` | Still in `b37b5ee`. Restore the worktree copies before editing cites to those notes. |
| `.git-mgr/` cache | Untracked `github/`, `library.json`, and `worklist/` stay unstaged. `origin/main` already tracks `.git-mgr/data/README.md`. |

Check a phase off by setting its status. A registered program replaces the `—` rows.
