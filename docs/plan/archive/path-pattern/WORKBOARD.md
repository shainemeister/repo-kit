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
**Primary program:** path-pattern  
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

An authorized commit updates this file before that commit is created ([contracts](../../../../kit/rules/contracts.md#boundaries)). When no phase is `open`, `active`, or `blocked`, that update files a copy at `docs/plan/archive/<program>/WORKBOARD.md` and replaces this file with the blank.

## Active program

| Field | Value |
|-------|--------|
| **Goal** | Replace `kit/rules/files.md` with two principles, `path-pattern.md` and `directory-index.md`, add one instruct skill for each, and retarget every live pointer in one concise sentence. |
| **Base** | `93130d5`. The working tree already holds the uncommitted `kit-link-edges` restore. Do not revert it. Do not redo that program. |
| **L4 docs to update** | `kit/rules/path-pattern.md`, `kit/rules/directory-index.md`, `kit/rules/README.md`, `kit/RULES.md`, `kit/rules/contracts.md`, `kit/MARKDOWN-STANDARD.md`, root `AGENTS.md`, the agents paste, root `README.md`, the two new packs, and the live cites named in the phases. |
| **Optional annex** | — |
| **Smoke / gates** | Author checklist on every edited durable file. After phase 11, a search for `files.md` outside `docs/plan/archive/`, changelog history, and the past-tense research sentences named in phase 10 finds nothing. Each remaining cite is one sentence plus a deep link, and the link resolves. |

### Decisions

| Rule | Owner |
|------|--------|
| Path pattern is evidence, one role, segment and module as nouns, the verb as a function, one procedure directory, and the source home `src/`. One short example. One sentence for a procedure pack, linking `kit/skills/README.md`. The forked-path note stays a single pointer to `docs/research/repo-kit-rules-enhancement.md`. Anchors include `#one-role`. | `kit/rules/path-pattern.md` |
| Directory index is when a new navigable directory gets `README.md`, the same change set, and the forward-only rule. A pack uses `SKILL.md`. The cell shape stays a link to `kit/MARKDOWN-STANDARD.md`. Anchor `#directory-index`. | `kit/rules/directory-index.md` |
| Naming a path is the instruct. Id `name-path`. Cite the principle. Do not restate it. | `kit/skills/kit-name-path/SKILL.md` |
| Writing an index is the instruct. Id `index-directory`. Blank `template/index.md`. Cite the principle. Do not restate it. | `kit/skills/kit-index-directory/SKILL.md` |
| The hub map has two rows and does not list the packs. `related:` stays at 3–7 peers: replace `rules/files.md` with the two new files and drop the README peer from both the YAML list and the Related line. | `kit/RULES.md` |
| Contracts, adopt, upgrade, and the pack list stay put. Add a sentence only where a live cite would dangle or a demand is missing. Do not paste the adopt matrix. | `kit/rules/contracts.md`, `ADOPTER.md`, `kit/UPGRADE.md`, `kit/skills/README.md` |
| Language examples stay in the platform tree. This program retargets their cites. It does not add kit text that points at the library, and it does not move `crates/`, `packages/`, or script trees into the principle. | `docs/library/platforms/` |
| Archive bodies stay historical. The live plan index may retarget its current-law link. | `docs/plan/archive/` |
| A cite is one local sentence plus a deep link. Do not reprint either principle. | `kit/rules/contracts.md` |
| Do not commit until the user asks. Changelog tally stays unstaged. Do not rewrite `kit/CHANGELOG.md` sections `### [3.0.0]` through the committed sections. | This board |

### Phases

| ID | Work | Status | Notes |
|----|------|--------|-------|
| 1 | Write the path principle | `done` | Create `kit/rules/path-pattern.md` at `1.0.0`. Hold only the decisions row for that file. Keep `#one-role`. Leave `files.md` in place. Run the author checklist. |
| 2 | Write the index principle | `done` | Create `kit/rules/directory-index.md` at `1.0.0`. Hold only the decisions row for that file. Keep `#directory-index`. Do not reprint the identity test. Run the author checklist. |
| 3 | Index `kit/rules/` | `done` | Add `kit/rules/README.md` in the same change set, one file-to-function row for each module that exists, including `files.md` until phase 11. |
| 4 | Point the hub | `done` | `kit/RULES.md` only. Two map rows: path pattern, directory index. Apply the `related:` decision. One line per row. Do not name the skills. |
| 5 | Point the session order | `done` | Same sentence in `AGENTS.md` and `docs/library/kit-adopter/skills/kit-discover-host/template/agents.md`: `path-pattern.md` owns the pattern; `directory-index.md` owns the directory README. Keep the five-step order. Root `README.md`: the "name a file" row and operator step 3 cite `path-pattern.md`. |
| 6 | Point the peer law | `done` | `kit/rules/contracts.md`: source layout and a new path cite `path-pattern.md`. `kit/MARKDOWN-STANDARD.md`: when the index is required cites `directory-index.md`; swap that peer in `related:`. `kit/skills/kit-workboard-register/template/workboard.md`: swap the files peer. Read `ADOPTER.md` and `kit/UPGRADE.md`. Add one line only if a historical source root or a missing historical index is not already excluded. No adopt matrix. |
| 7 | Add the two instructs and retarget kit skills | `done` | Create `kit-name-path` and `kit-index-directory` per the decisions. Move `kit-author-docs/template/dir.md` to `kit-index-directory/template/index.md` and fix its links. Grep `dir.md` and move any cite with it. Retarget, as handoffs, `kit/skills/README.md`, `kit-apply-change`, `kit-author-docs`, `kit-commit`, `kit-workboard-archive`. A path task names `kit-name-path` and stops. An index task names `kit-index-directory` and stops. `kit-commit` only confirms a path already follows the pattern. The skills index match rows use ids `name-path` and `index-directory`, default `match`. |
| 8 | Point the shelf packs | `done` | Retarget `docs/library/kit-adopter/skills/kit-adopter/SKILL.md`, `kit-adopter/template/docs-only.md`, `kit-use-instruct/SKILL.md`, `kit-map-layers/SKILL.md`, `kit-discover-host/SKILL.md`, `kit-discover-host/template/memory.md`. Pattern cites go to `path-pattern.md`. Index cites go to `directory-index.md`. The notepad sentence cites `MEMORY.md`. The kit-versus-project sentence cites `kit/RULES.md`. Do not copy a procedure into a shelf pack. |
| 9 | Point the platform cites | `done` | Retarget `docs/library/platforms/style-gates.md` and `examples/cli-tool.md`, `examples/c-cpp-library.md`, `examples/rust-library.md`, `examples/python-library.md`. Split each files cite the same way as phase 8. Leave the example trees in place. |
| 10 | Point the live research notes | `done` | Retarget links that would dangle in `docs/research/repo-kit-rules-enhancement.md` (`#one-role` moves to `path-pattern.md`), `docs/research/repo-kit-rework.md`, `docs/research/kit-skills.md`, `docs/research/README.md`, and `docs/research/skill-pack-sequence.md`. Leave past-tense sentences that record the old file. Do not edit bodies under `docs/plan/archive/`. In `docs/plan/README.md` and `docs/plan/archive/README.md`, the files-law current-law link becomes `path-pattern.md`. |
| 11 | Remove `files.md` | `done` | Delete `kit/rules/files.md` only after phases 4–10 leave no live link to it. Drop its row from `kit/rules/README.md`. History of the old file stays in git. Each new module's first history row records the split. |
| 12 | Tally the changelog | `done` | One unstaged sentence under a new `## repo-kit` section in `kit/CHANGELOG.md`. Do not rewrite `### [3.0.0]` through the committed sections. Do not stage the file. |
| 13 | Verify the pointers | `done` | Author checklist on every file this program edited. Confirm each former `files.md` role has one owner. Confirm the smoke search. Fix a broken or wordy cite before marking this phase done. |

### Progress log (newest first, max ~15 lines)

- 2026-10-17 — Phase 13 done. Live cites resolve. Remaining `files.md` strings are history.
- 2026-10-17 — Phase 12 done. Changelog `3.7.0` is unstaged.
- 2026-10-17 — Phase 11 done. The prior path module is removed.
- 2026-10-17 — Phase 10 done. Live research pointers retargeted. Archive bodies left as history.
- 2026-10-17 — Phase 9 done. Platform cites retargeted.
- 2026-10-17 — Phase 8 done. Shelf packs cite the two principles.
- 2026-10-17 — Phase 7 done. `kit-name-path` and `kit-index-directory` added. Kit skills hand off.
- 2026-10-17 — Phase 6 done. Peer law cites the two principles. Upgrade excludes a historical source root.
- 2026-10-17 — Phase 5 done. Session order cites the two principles.
- 2026-10-17 — Phase 4 done. The hub map has two rows.
- 2026-10-17 — Phase 3 done. `kit/rules/README.md` indexes the modules.
- 2026-10-17 — Phase 2 done. `directory-index.md` is `1.0.0`.
- 2026-10-17 — Phase 1 done. `path-pattern.md` is `1.0.0`.
- 2026-10-17 — Registered `path-pattern`.

## Deferred

| ID | Note |
|----|------|
| skill-pack-sequence 11–16 | Stays the open research queue. This program does not absorb it. |
| Forked-path promotion | Stays the research note. `path-pattern.md` keeps one pointer. |

## Not on this board

| Concern | Where |
|---------|--------|
| Session order | `AGENTS.md` |
| Agent notepad | `MEMORY.md` |
| Kit law | `kit/RULES.md` |

Check a phase off by setting its status. A registered program replaces the `—` rows.
