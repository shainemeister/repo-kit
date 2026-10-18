---
title: Repository maintenance rules
description: Authority map for a repository. Detail lives in the linked file.
version: "3.5.0"
status: current
audience:
  - developers
  - ai-agents
doc_type: other
related:
  - ../AGENTS.md
  - MARKDOWN-STANDARD.md
  - rules/path-pattern.md
  - rules/directory-index.md
  - rules/contracts.md
  - rules/git-commit.md
  - rules/versioning-and-git.md
last_updated: "2026-10-17"
---

# Repository maintenance rules

Authority map for a repository. Detail lives in the linked file.

**Related:** [AGENTS](../AGENTS.md) · [markdown](MARKDOWN-STANDARD.md) · [path pattern](rules/path-pattern.md) · [directory index](rules/directory-index.md) · [contracts](rules/contracts.md) · [commits](rules/git-commit.md) · [versioning](rules/versioning-and-git.md)

## Summary

| Must |
|------|
| Give each concern one owner. Cite that file. Do not restate it. |
| Keep standards in `kit/`. Keep the project outside it. |
| Extend the file that already holds a role. Do not add a second file for the same role. |
| Give a notable change one changelog line. The commit holds the detail. Messages follow [git-commit.md](rules/git-commit.md). |
| Do not claim the work done if a check this repository declares was skipped. |

## Authority map

| Concern | Owner |
|---------|--------|
| Path pattern | [path-pattern.md](rules/path-pattern.md) |
| Directory index | [directory-index.md](rules/directory-index.md) |
| Contracts and boundaries | [contracts.md](rules/contracts.md) |
| Commit messages | [git-commit.md](rules/git-commit.md) |
| Versions and what git tracks | [versioning-and-git.md](rules/versioning-and-git.md) |
| README shape and frontmatter | [MARKDOWN-STANDARD.md](MARKDOWN-STANDARD.md) |
| Adopt, once | [ADOPTER.md](../ADOPTER.md) |
| Upgrade, and where the shelf index lives | [UPGRADE.md](UPGRADE.md) |
| Session order | [AGENTS.md](../AGENTS.md) |
| Agent notepad | [MEMORY.md](../MEMORY.md) |
| Multi-phase work | [WORKBOARD.md](../WORKBOARD.md) |
| Notable-change summary | The sentence below. The history file is [CHANGELOG.md](CHANGELOG.md). |

Kit descriptions stay generic. An adopted repository writes descriptions of its own files.

## Changelog

A changelog entry summarizes a notable change. The git history holds the detail. Several commits in one day do not each earn a line.

## Completion

Do not claim the work done if a check this repository declares was skipped. A docs-only repository uses the [author checklist](MARKDOWN-STANDARD.md#author-checklist).

## Kit baseline

Record the kit version this repository adopted. Update the row when the kit is upgraded. This repository is the kit. Its version is the latest dated section under `## repo-kit` in [CHANGELOG.md](CHANGELOG.md).

| Field | Value |
|-------|--------|
| Adopted kit version | This repository is the kit |
| Kit source | https://github.com/shainemeister/repo-kit |
