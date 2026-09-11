---
title: File creation, placement, and naming
description: Evidence, category, path shape (repo-root src/ home; segment and module are nouns; verb is a function), and forward-only directory indexes for versioned paths. Open when adding, moving, splitting, or naming a path; kit-vs-product packaging stays in hygiene.
version: "1.1.0"
status: current
audience:
  - developers
  - maintainers
  - ai-agents
doc_type: other
related:
  - ../RULES.md
  - ./hygiene.md
  - ./contracts.md
  - ../MARKDOWN-STANDARD.md
  - ../agents/HABITAT.md
  - ./ai-docs-workspace.md
last_updated: "2026-09-10"
---

# File creation, placement, and naming

Evidence, category, path shape (repo-root `src/` home; segment and module are nouns; verb is a function), and forward-only directory indexes for versioned paths.

**Related:** [RULES.md](../RULES.md) · [hygiene.md](./hygiene.md) · [contracts.md](./contracts.md) · [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md) · [HABITAT](../agents/HABITAT.md) · [ai-docs-workspace.md](./ai-docs-workspace.md)

---

## Summary

| Must |
|------|
| Create or keep a path only with **evidence** (surface exists, inventory row, user asked, or a module is needed) |
| Place each path in a [category](#categories) this module names; programming source home is repo-root `src/` (three layers: segment noun, module noun, verb as function) |
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
4. [Directory index](#directory-index)
5. [Adopt modes](#adopt-modes)
6. [Anti-patterns](#anti-patterns)
7. [Document history](#document-history)

---

## When this module applies

Open this file when **adding, moving, splitting, or naming** a versioned path, or when creating a navigable directory. Skip trivial edits that do not add paths. Do not paste this module into `AGENTS.md` or Operator prompts ([HABITAT](../agents/HABITAT.md#what-l0-may-say)). Adopters **may** fold this module into `kit/RULES.md`; record the choice in the [authority map](../RULES.md#authority-map). Do not require un-folding.

Create a file or directory only when at least one row holds:

| Evidence | Example |
|----------|---------|
| Surface exists | Public CLI, package, or schema already shipping |
| Inventory row | Language or path listed on the map or inventory |
| User asked | Explicit request for the path |
| Module needed | Domain, contract, or `docs/` module the work requires ([ai-docs-workspace](./ai-docs-workspace.md)) |

New durable markdown (not on the MARKDOWN-STANDARD omit list) gets YAML in the same change set ([MARKDOWN-STANDARD when to use](../MARKDOWN-STANDARD.md#when-to-use-this-standard)); this file still owns create/place/name.

## Categories

**This file owns placement.** Kit vs product remains [hygiene](./hygiene.md#unified-packaging). Domain modules stay **flat** in `kit/rules/` — not `kit/rules/<category>/`.

| Category | Home | Notes |
|----------|------|-------|
| Law | `kit/` | Hub, `kit/rules/*.md`, SETUP (ephemeral), UPGRADE |
| Form | `kit/MARKDOWN-STANDARD.md`, `kit/templates/` | Authoring standard and skeletons |
| Landing | Root `README.md` | [Landing](../MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) shape |
| History | Project root `CHANGELOG.md` | Kit notes stay in kit CHANGELOG ([hygiene](./hygiene.md)) |
| Product contract | Package dirs **outside** `kit/` | README, CLI, API, METHODOLOGY; `SECURITY.md` only when [security modularity](./security.md#security-documentation-modularity) requires it |
| Working memory | Root `docs/` | Modules in [ai-docs-workspace](./ai-docs-workspace.md#default-modular-layout) |
| Habitat | Root `AGENTS.md` | Thin L0 pointer ([HABITAT](../agents/HABITAT.md)); skip if no coding agent |
| Instruct views | `kit/agents/` | Views over L4; not a second RULES tree |
| Style catalog | `kit/configs/` | Copy only for [inventory](./security.md#language-surface-inventory) languages; leftover files are dormant |
| Regenerable | gitignored workspace | Never commit |
| Language / source | Repo-root `src/` | All programming source: compiled product, extension source, developer/build helper scripts. Three layers: segment (noun) = first directory under `src/`; module (noun) = code leaf (`window.rs`, `mod.rs`); verb = **function** inside the noun module |

**Not `src/`:** `kit/`, `data/`, packaging metadata, `docs/`, landing / CHANGELOG / `AGENTS.md`, regenerable.

## Path shape and naming

```text
<category>/<noun-or-procedure>/…
```

Language / source (do not add a fourth path layer):

```text
src/<segment>/<module>
```

| Kind | Rule |
|------|------|
| After category | Noun directory (`parser/`, `plan/`) or a procedure directory |
| Segment | Noun; first directory under `src/` (product concern: `git`, `app`, `build`, …) |
| Code leaves | **Nouns** (a module is a thing). Functions **may** be verbs |
| Procedure docs | Verb titles allowed (`UPGRADE.md`) |
| Procedure scripts | Verb filename allowed **only** under a procedure segment (`src/build/certify.py`) |
| Same leaf names | Allowed when **category + path** scopes them (`README.md`, `SECURITY.md`) |

## Directory index

A **navigable, versioned** directory that contains other **intentional** files gets `README.md` in the **same change set** as adding that directory or an intentional file it contains ([contracts](./contracts.md#same-change-set-rule)). Shape: table **file → function**. Function cells use the [identity test](../MARKDOWN-STANDARD.md#description-identity) uniqueness checks (tests 2–3) at one-line resolution (unique role in this folder; not a paste of YAML `description`). YAML `description` still needs test 1 (current-content summary). Not [landing](../MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) (no Overview / Operator prompts).

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
| Bare adopt | This file recommended; skip HABITAT / `AGENTS.md` | Require `AGENTS.md` |
| Instruct | Seeds later; packs **BUILD** locally | Force Instruct on bare adopt |

Layout migration of historical source trees is a program ([UPGRADE](../UPGRADE.md)), not a universe rewrite.

Hygiene keeps kit-vs-product and SETUP/UPGRADE lifecycle ([hygiene](./hygiene.md)). HABITAT keeps L0 pointer rules ([HABITAT](../agents/HABITAT.md)). Security keeps the `SECURITY.md` **trigger** and SAST table ([security modularity](./security.md#security-documentation-modularity)). `docs/` module list stays in [ai-docs-workspace](./ai-docs-workspace.md#default-modular-layout).

## Anti-patterns

| Avoid | Prefer |
|-------|--------|
| Empty `docs/` or `src/` on day one (docs-only needs no `src/`) | Create when evidence exists |
| Nested `kit/rules/files/placement.md` | Flat `kit/rules/files.md` |
| Verb-named module or sentence-path (`src/do_parse_the_config.py`, `src/git/history/walk/do_commit.rs`) | Noun module; verb function; procedure-script verb only under a procedure segment |
| Product `.rs` / `.py` at repo root; helpers under `scripts/`, `tooling/`, `crates/`, or `build-aux/` as the source home | `src/<segment>/`; helpers in `src/build/` |
| Upgrade fails complete for old folders without README, or for historical `crates/` | Forward-only index; map real paths; new source under `src/` |
| Root `./rules/` beside `kit/rules/` | Law under `kit/` only ([hygiene](./hygiene.md)) |
| This table pasted into `AGENTS.md` | Thin pointer to `kit/RULES.md` ([HABITAT](../agents/HABITAT.md)) |
| Hygiene reprint of this category table | Cite this file for category; hygiene for kit-vs-product |
| `FILE-CATALOG.md` required to adopt | Optional; directory README when the index rule applies |

---

## Document history

| Version | Notes |
|---------|--------|
| 1.1.0 | Language/source home is repo-root `src/`; three layers (segment noun, module noun, verb as function); historical `crates/` not a complete-fail (kit 2.14.0) |
| 1.0.3 | Function cells cite uniqueness tests 2–3; current-content summary stays on YAML `description` (kit 2.12.0) |
| 1.0.2 | Function cells cite the description identity test (one line; not a reprint) (kit 2.11.0) |
| 1.0.1 | New durable markdown gets YAML except omit list (cite); this file owns create/place/name |
| 1.0.0 | Initial (kit 2.9.0) |
