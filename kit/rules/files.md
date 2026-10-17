---
title: File creation, placement, and naming
description: "Evidence, category, and path shape: a segment and a module are nouns, a verb is the function, and a nested directory is allowed when it names one procedure."
version: "1.11.0"
status: current
audience:
  - developers
  - maintainers
  - ai-agents
doc_type: other
related:
  - ../RULES.md
  - ./contracts.md
  - ../MARKDOWN-STANDARD.md
  - ./git-commit.md
last_updated: "2026-10-17"
---

# File creation, placement, and naming

Evidence, category, and path shape: a segment and a module are nouns, a verb is the function, and a nested directory is allowed when it names one procedure.

**Related:** [RULES.md](../RULES.md) · [contracts.md](./contracts.md) · [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md) · [git-commit.md](./git-commit.md)

---

## Summary

| Must |
|------|
| Create or keep a path only with **evidence** (surface exists, inventory row, user asked, or a module is needed) |
| Place source under `src/<segment>/<module>`. Both names are nouns. A verb is a function inside the module. A nested directory is allowed when it names one procedure |
| Shape paths as `<category>/` then a noun or procedure directory; **code leaves are nouns**; procedure docs may be verbs; procedure **scripts** may use a verb filename only under a procedure segment |
| Add a directory-index `README.md` in the **same change set** as a **new** navigable, versioned directory that holds other intentional files. A procedure pack uses `SKILL.md` for that index |
| When adding, moving, or splitting a path: open the [authority map](../RULES.md#authority-map) then this module (`AGENTS.md` → hub when a coding agent is used) |

| Must not |
|----------|
| Create empty trees for ceremony |
| Add `README.md` beside `SKILL.md` in a procedure pack |
| Use sentence-paths (`src/git/history/walk/do_commit.rs`) or verb-named modules |
| Treat missing historical directory READMEs, or historical `crates/` / `packages/<name>/` / `build-aux/` / `scripts/` as source root, as a failed complete or upgrade gate |
| Place or leave maintenance law at root `./rules/` (compat or otherwise) |
| Place product `.rs` / `.py` at repo root, or compiled/helper source under `crates/`, `extensions/`, `build-aux/`, `scripts/`, `tooling/`, or `docs/` |

**Enforcement:** Policy + [author checklist](../MARKDOWN-STANDARD.md#author-checklist). **Not** a Domain A/B gate.

---

## Contents

1. [When this module applies](#when-this-module-applies)
2. [Categories](#categories)
3. [Path shape and naming](#path-shape-and-naming)
4. [One role](#one-role)
5. [Directory index](#directory-index)
6. [Adopt modes](#adopt-modes)
7. [Anti-patterns](#anti-patterns)
8. [Document history](#document-history)

---

## When this module applies

Open this file when adding, moving, splitting, or naming a versioned path. Do not paste it into `AGENTS.md`. `AGENTS.md` points here.

Create a file or directory only when at least one row holds:

| Evidence | Example |
|----------|---------|
| Surface exists | Public CLI, package, or schema already shipping |
| Inventory row | Language or path listed on the map or inventory |
| User asked | Explicit request for the path |
| Module needed | A domain or contract the work requires |

New durable markdown (not on the MARKDOWN-STANDARD omit list) gets YAML in the same change set ([MARKDOWN-STANDARD when this applies](../MARKDOWN-STANDARD.md#when-this-applies)); this file still owns create/place/name.

## Categories

**This file owns placement.** Standards stay in `kit/`. The project stays outside it. Domain modules stay flat in `kit/rules/`.

| Category | Home | Notes |
|----------|------|-------|
| Law | `kit/` | Hub, `kit/rules/*.md`, UPGRADE |
| Form | `kit/MARKDOWN-STANDARD.md` | Authoring standard. A blank lives in the skill that fills it |
| Landing | Root `README.md` | [Landing](../MARKDOWN-STANDARD.md#landing-readme) shape |
| History | Project root `CHANGELOG.md` | Kit history stays in `kit/CHANGELOG.md` |
| Product contract | Package dirs **outside** `kit/` | README, CLI, API. `SECURITY.md` only when the package executes, uses the network, elevates, or handles secrets |
| Adopt, once | Root `ADOPTER.md` | One-time order. An adopted repository deletes it. This repository keeps it |
| Multi-phase record | Root `WORKBOARD.md` | Open programs. Blank: `kit/skills/kit-workboard-register/template/workboard.md`. A filed program is `docs/plan/archive/<program>/WORKBOARD.md`. Not a skill |
| Agent notepad | Root `MEMORY.md` | Short notes the agent rewrites. Blank: `docs/library/kit-adopter/skills/kit-discover-host/template/memory.md`. Not a skill |
| Working memory | Root `docs/` | Research, plans, and `docs/library/` |
| Procedure packs | `kit/skills/kit-<action>/SKILL.md` | A repeated verb is `kit-` plus the action. The whole name is one to three words joined by `-`, so the action stem is one or two words. `SKILL.md` is the pack and the index of any other file there. A blank is `template/<noun>.md` in that pack, and only when the blank exists. `kit/skills/README.md` indexes those packs. Adopt and upgrade packs live under `docs/library/kit-adopter/skills/`. That directory's index is `docs/library/kit-adopter/README.md`. `docs/library/kit-adopter/generated/` is the emit target and is not a pack. A repository skill stays at root `skills/<action>/`, unprefixed, and only when that repository has one. One task loads one skill. A retired crew is [archive](../../docs/library/archive/dispatch-crew/SKILL.md). It is not a live pack. This kit does not delegate to another agent. The hub does not restate them |
| Session order | Root `AGENTS.md` | Hygiene principle and the short order. Skeleton: `docs/library/kit-adopter/skills/kit-discover-host/template/agents.md`. Not a second rules tree |
| Regenerable | gitignored workspace | Never commit |
| Language / source | Repo-root `src/` | Programming source. Segment and module are nouns. A verb is a function inside the module. Nest a directory only to name one procedure |

**Not `src/`:** `kit/`, `data/`, packaging metadata, `docs/`, landing / CHANGELOG / `AGENTS.md` / `MEMORY.md` / `WORKBOARD.md` / `ADOPTER.md`, regenerable.

## Path shape and naming

A **segment** is the product concern, the first directory under `src/`. A **module** is the noun unit inside that segment. That is the usual industry layout: segment, then module. A **verb** is a function inside the module.

```text
src/billing/invoice.py
    charge()                  # verb inside the noun module
    refund()

src/billing/invoice/export/pdf.py
    render()                  # export is one procedure directory; pdf is the noun module

src/build/certify.py          # procedure segment; a verb filename is allowed here
```

| Kind | Rule |
|------|------|
| Segment | Noun. First directory under `src/` (`billing`, `git`, `build`) |
| Module | Noun. The code leaf (`invoice.py`, `pdf.py`, `mod.rs`) |
| Verb | A function inside the module |
| Nested directory | Allowed when its name is one procedure, action, or function (`export/`). Each directory is one name |
| Procedure script | A verb filename is allowed under a procedure segment (`src/build/certify.py`) |
| Procedure doc | A verb title is allowed (`UPGRADE.md`) |
| Same leaf names | Allowed when category and path scope them (`README.md`, `SECURITY.md`, `SKILL.md`) |

A nested directory names one role. It does not narrate the steps. `src/git/history/walk/do_commit.rs` is a sentence-path: `do_commit` is a verb used as a module. The action belongs in a function, or in one procedure directory such as `src/git/commit/`.

## One role

A new file is allowed when its role is absent from the directory index. When the role is already listed, edit that file. A split removes the role from the old file in the same change set. The long edge record stays in [repo-kit-rules-enhancement.md](../../docs/research/repo-kit-rules-enhancement.md). This file does not restate it.

## Directory index

A **navigable, versioned** directory that contains other **intentional** files gets `README.md` in the **same change set** as adding that directory or an intentional file it contains ([contracts](./contracts.md#same-change-set-rule)). Shape: table **file → function**. The function cell is the role in this folder, one line, and it would be wrong on a sibling file. It is not a paste of YAML `description`. Not the [landing README](../MARKDOWN-STANDARD.md#landing-readme).

A directory under `kit/skills/` or `docs/library/kit-adopter/skills/` is the exception. A pack this kit ships is named `kit-` plus the action. The whole name is one to three words joined by `-`, so the action stem is one or two words. The pack file is `SKILL.md`. That file indexes any other file in the directory, including `template/<noun>.md` when a blank exists. Do not add `README.md` beside it. `kit/skills/README.md` indexes the repeated verbs. `docs/library/kit-adopter/README.md` indexes the adopt and upgrade packs. `docs/library/kit-adopter/generated/` is the emit target and is not a pack. A skill the repository already has stays at root `skills/<action>/`, unprefixed. One task loads one skill. A retired crew is [archive](../../docs/library/archive/dispatch-crew/SKILL.md). It is not a live pack. This kit does not delegate to another agent.

**Exclude:** regenerable outputs, vendor, `.git/`, secrets, host trees this repo did not create, language leaves already listed in the parent **package** README.

The index is **forward-only** (new dirs; existing-adopt from the adopt date). Missing historical READMEs are **not** a failed gate. Root `FILE-CATALOG.md` stays **optional**; the directory README is the distributed catalog. If a whole-repo catalog is maintained, update it when listed paths change ([authority map](../RULES.md#authority-map)).

## Adopt modes

| Mode | Ship | Must not demand |
|------|------|-----------------|
| Greenfield | This file in `kit/rules/`; directory index on **new** navigable dirs; programming source under `src/` | Empty trees for ceremony |
| Existing first adopt | Map **real** paths; this file with `rules/`; index **from adopt date forward**; new source after this kit date under `src/` | Rewrite historical trees as a **complete-fail** (UPGRADE may migrate); README in every historical folder; flatten kit to root |
| Upgrade 2.x | Merge this file; map row if missing; preserve product docs, `AGENTS.md`, `MEMORY.md`, and `WORKBOARD.md`; new source under `src/` | Backfill directory READMEs; restyle package docs; overwrite filled `AGENTS.md`, `MEMORY.md`, or `WORKBOARD.md`; complete-fail historical `crates/` / `packages/<name>/` / `build-aux/` / `scripts/` |
| Upgrade 1.x | Take the current kit files from the Kit source ([UPGRADE](../UPGRADE.md)) | Leave law at root `./rules/` as compat |
| Folded hub | Port this file **or** keep `kit/rules/files.md` beside a thin hub; document in the map | Force un-fold |
| Bare adopt | This file. `AGENTS.md` and `MEMORY.md` only when a coding agent is used. Those blanks live in `docs/library/kit-adopter/skills/kit-discover-host/template/`. The repeated verbs in `kit/skills/` | Require the rest of `docs/library/kit-adopter/` |

Layout migration of historical source trees is a program ([UPGRADE](../UPGRADE.md)), not a universe rewrite.

Install of this kit stays in root [ADOPTER.md](../../ADOPTER.md). An adopted repository deletes that file when the adopt is finished and keeps [UPGRADE.md](../UPGRADE.md). The session order stays in `AGENTS.md`. The notepad stays in `MEMORY.md`.

## Anti-patterns

| Avoid | Prefer |
|-------|--------|
| Empty `docs/` or `src/` on day one (docs-only needs no `src/`) | Create when evidence exists |
| Nested `kit/rules/files/placement.md` | Flat `kit/rules/files.md` |
| Verb-named module or sentence-path (`src/do_parse_the_config.py`, `src/git/history/walk/do_commit.rs`) | `src/<segment>/<module>` with the verb inside the module, or one procedure directory |
| Product `.rs` / `.py` at repo root; helpers under `scripts/`, `tooling/`, `crates/`, or `build-aux/` as the source home | `src/<segment>/`; helpers in `src/build/` |
| Upgrade fails complete for old folders without README, or for historical `crates/` | Forward-only index; map real paths; new source under `src/` |
| Root `./rules/` beside `kit/rules/` | Law under `kit/` only |
| This table pasted into `AGENTS.md` | `AGENTS.md` points at `kit/RULES.md` and at this file |
| A second file for a role the index already lists | Edit the file that holds the role |
| `FILE-CATALOG.md` required to adopt | Optional; directory README when the index rule applies |

---

## Document history

| Version | Notes |
|---------|--------|
| 1.11.0 | The workboard blank and the filed copy have paths. Root `MEMORY.md` is the agent notepad |
| 1.10.0 | Repeated verbs stay in `kit/skills/`. Adopt and upgrade packs are `docs/library/kit-adopter/`. The workboard is root `WORKBOARD.md`. Install is root `ADOPTER.md` |
| 1.9.0 | A kit pack is `kit/skills/kit-<action>/SKILL.md`. A blank is `template/<noun>.md`. `kit/skills/generated/` is the emit target. A repository skill stays unprefixed at root `skills/` |
| 1.8.0 | A kit pack is `skills/kit-<action>/SKILL.md`. The whole name stays one to three words. Ids stay. `generated/` and a repository skill stay unprefixed |
| 1.7.0 | The retired crew is `library/archive/dispatch-crew/`. It is not a live pack |
| 1.6.0 | One task loads one skill. `skills/dispatch-crew/` is deprecated. This kit does not delegate to another agent |
| 1.5.0 | A procedure pack is `skills/<action>/SKILL.md`. That file is the directory index. The action is one to three words joined by `-` |
| 1.4.1 | Markdown-standard cite uses `#when-this-applies` |
| 1.4.0 | Procedure packs live at root `skills/`. The hub stays silent about them |
| 1.3.2 | Adopt path: SETUP stays in this repository; an adopted repository keeps UPGRADE. The session-order row names the AGENTS skeleton. There was no separate 1.3.1 change |
| 1.3.0 | Path shape is segment/module. A nested directory is one procedure. The verb stays a function. |
| 1.2.0 | One role, one file. Hygiene, habitat, and style-catalog rows leave this module. |
| 1.1.0 | Language/source home is repo-root `src/`; three layers (segment noun, module noun, verb as function); historical `crates/` not a complete-fail (kit 2.14.0) |
| 1.0.3 | Function cells cite uniqueness tests 2–3; current-content summary stays on YAML `description` (kit 2.12.0) |
| 1.0.2 | Function cells cite the description identity test (one line; not a reprint) (kit 2.11.0) |
| 1.0.1 | New durable markdown gets YAML except omit list (cite); this file owns create/place/name |
| 1.0.0 | Initial (kit 2.9.0) |
