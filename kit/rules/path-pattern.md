---
title: Path pattern
description: "A path is a category, then a noun. Under src/, the segment and the module are nouns, and a verb is a function."
version: "1.0.0"
status: current
audience:
  - developers
  - maintainers
  - ai-agents
doc_type: other
related:
  - ../RULES.md
  - ./directory-index.md
  - ./contracts.md
  - ../MARKDOWN-STANDARD.md
  - ../skills/README.md
last_updated: "2026-10-17"
---

# Path pattern

A path is a category, then a noun. Under `src/`, the segment and the module are nouns, and a verb is a function.

**Related:** [RULES](../RULES.md) · [directory index](./directory-index.md) · [contracts](./contracts.md) · [markdown](../MARKDOWN-STANDARD.md) · [skills](../skills/README.md)

Open this file when adding, moving, splitting, or naming a versioned path. Do not paste it into `AGENTS.md`.

**Enforcement:** Policy plus the [author checklist](../MARKDOWN-STANDARD.md#author-checklist). Not a Domain A/B gate.

## Evidence

Create a file or directory only when at least one row holds:

| Evidence | Example |
|----------|---------|
| Surface exists | Public CLI, package, or schema already shipping |
| Inventory row | Language or path listed on the map or inventory |
| User asked | Explicit request for the path |
| Module needed | A domain or contract the work requires |

New durable markdown gets YAML in the same change set ([when this applies](../MARKDOWN-STANDARD.md#when-this-applies)).

## Pattern

A **segment** is the product concern, the first directory under `src/`. A **module** is the noun unit inside that segment. A **verb** is a function inside the module.

```text
src/billing/invoice.py
    charge()
    refund()
```

| Kind | Rule |
|------|------|
| Segment | Noun. First directory under `src/` |
| Module | Noun. The code leaf |
| Verb | A function inside the module |
| Nested directory | One procedure. It names one role and does not narrate the steps |
| Procedure script | A verb filename is allowed under a procedure segment (`src/build/certify.py`) |
| Procedure doc | A verb title is allowed (`UPGRADE.md`) |
| Any other path | `<category>/`, then a noun or one procedure directory. A code leaf is a noun |
| Same leaf name | Allowed when the category and the path scope it (`README.md`, `SECURITY.md`, `SKILL.md`) |

`src/git/history/walk/do_commit.rs` is a sentence-path. `do_commit` is a verb used as a module.

Programming source lives at repo-root `src/`. A rule module is a flat file in `kit/rules/`.

A procedure pack is `kit/skills/kit-<action>/SKILL.md`. The action stem is one or two words. A blank is `template/<noun>.md` in that pack. One task loads one skill ([skills](../skills/README.md)).

## One role

A new file is allowed when its role is absent from the directory index. When the role is already listed, edit that file. A split removes the role from the old file in the same change set. The long edge record stays in [repo-kit-rules-enhancement.md](../../docs/research/repo-kit-rules-enhancement.md). This file does not restate it.

## Must not

- Create an empty tree for ceremony.
- Use a sentence-path or a verb-named module.
- Use a directory other than `src/` as the source home.

## Document history

| Version | Notes |
|---------|--------|
| 1.0.0 | Split from `files.md`. This file owns the path pattern |
