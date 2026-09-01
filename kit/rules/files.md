---
title: File creation, placement, and naming
description: When to create a path, which category it belongs in, how to name it, and when a directory needs an index README.
version: "1.0.1"
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
last_updated: "2026-08-31"
---

# File creation, placement, and naming

Rules for **creating**, **placing**, and **naming** versioned paths. Kit-vs-product layout remains [hygiene](./hygiene.md).

**Related:** [RULES.md](../RULES.md) · [hygiene.md](./hygiene.md) · [contracts.md](./contracts.md) · [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md) · [HABITAT](../agents/HABITAT.md) · [ai-docs-workspace.md](./ai-docs-workspace.md)

---

## Summary

| Must |
|------|
| Create or keep a path only with **evidence** (surface exists, inventory row, user asked, or a module is needed) |
| Place each path in a [category](#categories) this module names; language/source trees nest under a product category |
| Shape paths as `<category>/` then a noun or procedure directory; **code leaves are nouns**; procedure docs may be verbs |
| Add a directory-index `README.md` in the **same change set** as a **new** navigable, versioned directory that holds other intentional files |
| When adding, moving, or splitting a path: open the [authority map](../RULES.md#authority-map) then this module (`AGENTS.md` → hub when a coding agent is used) |

| Must not |
|----------|
| Create empty trees for ceremony |
| Use sentence-paths that add taxonomy at every layer |
| Treat missing historical directory READMEs as a failed complete or upgrade gate |
| Place or leave maintenance law at root `./rules/` (compat or otherwise) |
| Name source modules with verbs |

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
| Language / source | Under a product category (`src/`, `packages/`, crates) | Nest as the language requires; kit does not add extra taxonomy |

## Path shape and naming

```text
<category>/<noun-or-procedure>/…
```

| Kind | Rule |
|------|------|
| After category | Noun directory (`parser/`, `plan/`) or a procedure directory |
| Code leaves | **Nouns** (a module is a thing). Functions **may** be verbs |
| Procedure docs | Verb titles allowed (`UPGRADE.md`) |
| Same leaf names | Allowed when **category + path** scopes them (`README.md`, `SECURITY.md`) |

## Directory index

A **navigable, versioned** directory that contains other **intentional** files gets `README.md` in the **same change set** as adding that directory or an intentional file it contains ([contracts](./contracts.md#same-change-set-rule)). Shape: table **file → function**. Not [landing](../MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) (no Overview / Operator prompts).

**Exclude:** regenerable outputs, vendor, `.git/`, secrets, host trees this repo did not create, language leaves already listed in the parent **package** README.

The index is **forward-only** (new dirs; existing-adopt from the adopt date). Missing historical READMEs are **not** a failed gate. Root `FILE-CATALOG.md` stays **optional**; the directory README is the distributed catalog. If a whole-repo catalog is maintained, update it when listed paths change ([authority map](../RULES.md#authority-map)).

## Adopt modes

| Mode | Ship | Must not demand |
|------|------|-----------------|
| Greenfield | This file in `kit/rules/`; directory index on **new** navigable dirs | Empty trees for ceremony |
| Existing first adopt | Map **real** paths; this file with `rules/`; index **from adopt date forward** | Rewrite `src/` / packages; README in every historical folder; flatten kit to root |
| Upgrade 2.x | Merge this file; map row if missing; preserve product docs and `AGENTS.md` | Backfill directory READMEs; restyle package docs; overwrite filled `AGENTS.md` |
| Upgrade 1.x | Migrate into `kit/` **first** ([UPGRADE](../UPGRADE.md)), then same as 2.x | Leave law at root `./rules/` as compat |
| Folded hub | Port this file **or** keep `kit/rules/files.md` beside a thin hub; document in the map | Force un-fold |
| Bare adopt | This file recommended; skip HABITAT / `AGENTS.md` | Require `AGENTS.md` |
| Instruct | Seeds later; packs **BUILD** locally | Force Instruct on bare adopt |

Hygiene keeps kit-vs-product and SETUP/UPGRADE lifecycle ([hygiene](./hygiene.md)). HABITAT keeps L0 pointer rules ([HABITAT](../agents/HABITAT.md)). Security keeps the `SECURITY.md` **trigger** and SAST table ([security modularity](./security.md#security-documentation-modularity)). `docs/` module list stays in [ai-docs-workspace](./ai-docs-workspace.md#default-modular-layout).

## Anti-patterns

| Avoid | Prefer |
|-------|--------|
| Empty `docs/` or `packages/` on day one | Create when evidence exists |
| Nested `kit/rules/files/placement.md` | Flat `kit/rules/files.md` |
| `src/do_parse_the_config.py` as the module | Noun module; verb function |
| Upgrade fails complete for old folders without README | Forward-only index |
| Root `./rules/` beside `kit/rules/` | Law under `kit/` only ([hygiene](./hygiene.md)) |
| This table pasted into `AGENTS.md` | Thin pointer to `kit/RULES.md` ([HABITAT](../agents/HABITAT.md)) |
| Hygiene reprint of this category table | Cite this file for category; hygiene for kit-vs-product |
| `FILE-CATALOG.md` required to adopt | Optional; directory README when the index rule applies |

---

## Document history

| Version | Notes |
|---------|--------|
| 1.0.1 | New durable markdown gets YAML except omit list (cite); this file owns create/place/name |
| 1.0.0 | Initial (kit 2.9.0) |
