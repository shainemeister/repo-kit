---
title: File creation, placement, and naming
description: "Evidence, category, and path shape: a segment and a module are nouns, a verb is the function, and a nested directory is allowed when it names one procedure."
version: "1.3.0"
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
last_updated: "2026-10-13"
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
| Add a directory-index `README.md` in the **same change set** as a **new** navigable, versioned directory that holds other intentional files |
| When adding, moving, or splitting a path: open the [authority map](../RULES.md#authority-map) then this module (`AGENTS.md` → hub when a coding agent is used) |

| Must not |
|----------|
| Create empty trees for ceremony |
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

New durable markdown (not on the MARKDOWN-STANDARD omit list) gets YAML in the same change set ([MARKDOWN-STANDARD when to use](../MARKDOWN-STANDARD.md#when-to-use-this-standard)); this file still owns create/place/name.

## Categories

**This file owns placement.** Standards stay in `kit/`. The project stays outside it. Domain modules stay flat in `kit/rules/`.

| Category | Home | Notes |
|----------|------|-------|
| Law | `kit/` | Hub, `kit/rules/*.md`, SETUP (ephemeral), UPGRADE |
| Form | `kit/MARKDOWN-STANDARD.md`, `kit/templates/` | Authoring standard and skeletons |
| Landing | Root `README.md` | [Landing](../MARKDOWN-STANDARD.md#landing-readme) shape |
| History | Project root `CHANGELOG.md` | Kit history stays in `kit/CHANGELOG.md` |
| Product contract | Package dirs **outside** `kit/` | README, CLI, API. `SECURITY.md` only when the package executes, uses the network, elevates, or handles secrets |
| Working memory | Root `docs/` | Research, plans, and the workboard |
| Session order | Root `AGENTS.md` | Hygiene principle and the short order. Not a second rules tree |
| Regenerable | gitignored workspace | Never commit |
| Language / source | Repo-root `src/` | Programming source. Segment and module are nouns. A verb is a function inside the module. Nest a directory only to name one procedure |

**Not `src/`:** `kit/`, `data/`, packaging metadata, `docs/`, landing / CHANGELOG / `AGENTS.md`, regenerable.

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
| Same leaf names | Allowed when category and path scope them (`README.md`, `SECURITY.md`) |

A nested directory names one role. It does not narrate the steps. `src/git/history/walk/do_commit.rs` is a sentence-path: `do_commit` is a verb used as a module. The action belongs in a function, or in one procedure directory such as `src/git/commit/`.

## One role

A new file is allowed when its role is absent from the directory index. When the role is already listed, edit that file. A split removes the role from the old file in the same change set. The long edge record stays in [repo-kit-rules-enhancement.md](../../docs/research/repo-kit-rules-enhancement.md). This file does not restate it.

## Directory index

A **navigable, versioned** directory that contains other **intentional** files gets `README.md` in the **same change set** as adding that directory or an intentional file it contains ([contracts](./contracts.md#same-change-set-rule)). Shape: table **file → function**. The function cell is the role in this folder, one line, and it would be wrong on a sibling file. It is not a paste of YAML `description`. Not the [landing README](../MARKDOWN-STANDARD.md#landing-readme).

**Exclude:** regenerable outputs, vendor, `.git/`, secrets, host trees this repo did not create, language leaves already listed in the parent **package** README.

The index is **forward-only** (new dirs; existing-adopt from the adopt date). Missing historical READMEs are **not** a failed gate. Root `FILE-CATALOG.md` stays **optional**; the directory README is the distributed catalog. If a whole-repo catalog is maintained, update it when listed paths change ([authority map](../RULES.md#authority-map)).

## Adopt modes

| Mode | Ship | Must not demand |
|------|------|-----------------|
| Greenfield | This file in `kit/rules/`; directory index on **new** navigable dirs; programming source under `src/` | Empty trees for ceremony |
| Existing first adopt | Map **real** paths; this file with `rules/`; index **from adopt date forward**; new source after this kit date under `src/` | Rewrite historical trees as a **complete-fail** (UPGRADE may migrate); README in every historical folder; flatten kit to root |
| Upgrade 2.x | Merge this file; map row if missing; preserve product docs and `AGENTS.md`; new source under `src/` | Backfill directory READMEs; restyle package docs; overwrite filled `AGENTS.md`; complete-fail historical `crates/` / `packages/<name>/` / `build-aux/` / `scripts/` |
| Upgrade 1.x | Migrate into `kit/` **first** ([UPGRADE](../UPGRADE.md)), then same as 2.x | Leave law at root `./rules/` as compat |
| Folded hub | Port this file **or** keep `kit/rules/files.md` beside a thin hub; document in the map | Force un-fold |
| Bare adopt | This file. `AGENTS.md` only when a coding agent is used | Require a skill pack |

Layout migration of historical source trees is a program ([UPGRADE](../UPGRADE.md)), not a universe rewrite.

Install and upgrade of this kit stay in [SETUP.md](../SETUP.md) and [UPGRADE.md](../UPGRADE.md). The session order stays in `AGENTS.md`.

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
| 1.3.0 | Path shape is segment/module. A nested directory is one procedure. The verb stays a function. |
| 1.2.0 | One role, one file. Hygiene, habitat, and style-catalog rows leave this module. |
| 1.1.0 | Language/source home is repo-root `src/`; three layers (segment noun, module noun, verb as function); historical `crates/` not a complete-fail (kit 2.14.0) |
| 1.0.3 | Function cells cite uniqueness tests 2–3; current-content summary stays on YAML `description` (kit 2.12.0) |
| 1.0.2 | Function cells cite the description identity test (one line; not a reprint) (kit 2.11.0) |
| 1.0.1 | New durable markdown gets YAML except omit list (cite); this file owns create/place/name |
| 1.0.0 | Initial (kit 2.9.0) |
