---
title: "Versioning and git"
description: "Three version surfaces, what git tracks, and a pointer to the commit-message rules."
version: "2.0.2"
status: current
audience:
  - developers
doc_type: other
related:
  - ../RULES.md
  - ./git-commit.md
  - ./contracts.md
  - ../CHANGELOG.md
last_updated: "2026-10-19"
---

# Versioning and git

Three version surfaces, what git tracks, and a pointer to the commit-message rules.

**Related:** [RULES](../RULES.md) · [commits](./git-commit.md) · [contracts](./contracts.md) · [CHANGELOG](../CHANGELOG.md)

## Versions

| Surface | What it is | Where it lives |
|---------|------------|----------------|
| Kit version | The standards kit | Dated sections under `## repo-kit` in [CHANGELOG.md](../CHANGELOG.md) |
| Project version | The adopting repository's product | That repository's packaging metadata and its own changelog |
| Document version | One file | That file's `version` and `last_updated` |

A kit upgrade does not by itself bump the project version. Bump the project version when public behavior or a contract changes.

## Changelog

The summary rule is in [RULES.md](../RULES.md#changelog). This file does not restate it. This kit's history stays in [CHANGELOG.md](../CHANGELOG.md) under `## repo-kit`.

This kit keeps the three newest sections under `## repo-kit`. An adopter's changelog is not trimmed. Filing a finished program at `docs/plan/archive/<program>/` stays the procedure for a target.

## What git tracks

Track source, schema, fixtures, and docs. Do not track secrets, environment files, or regenerable build output. Respect `.gitignore`.

Do not rewrite published history on a shared branch without an explicit decision to do so.

Commit messages, including the AI trailers, are owned by [git-commit.md](./git-commit.md).
