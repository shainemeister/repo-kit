---
title: Directory index
description: "A new navigable directory of intentional files gets an index README in the same change set. A missing historical index is not a failed gate."
version: "1.0.0"
status: current
audience:
  - developers
  - maintainers
  - ai-agents
doc_type: other
related:
  - ../RULES.md
  - ./path-pattern.md
  - ./contracts.md
  - ../MARKDOWN-STANDARD.md
last_updated: "2026-10-17"
---

# Directory index

A new navigable directory of intentional files gets an index README in the same change set. A missing historical index is not a failed gate.

**Related:** [RULES](../RULES.md) · [path pattern](./path-pattern.md) · [contracts](./contracts.md) · [markdown](../MARKDOWN-STANDARD.md)

## Directory index

A navigable, versioned directory that contains other intentional files gets `README.md` in the same change set as that directory or an intentional file it contains ([same change set](./contracts.md#same-change-set-rule)).

The table is file to function. The cell shape is the [directory index](../MARKDOWN-STANDARD.md#directory-index) in the markdown standard.

Exclude regenerable output, vendor, `.git/`, secrets, host trees this repository did not create, and language leaves already listed in the parent package README.

The index is forward-only. Root `FILE-CATALOG.md` stays optional. When a whole-repo catalog exists, update it with the listed paths ([authority map](../RULES.md#authority-map)).

A procedure pack uses `SKILL.md` as its index. Do not add `README.md` beside it ([path pattern](./path-pattern.md)).

## Must not

- Backfill a historical directory.
- Require `FILE-CATALOG.md` in order to adopt.

## Document history

| Version | Notes |
|---------|--------|
| 1.0.0 | Split from `files.md`. This file owns when an index is required |
