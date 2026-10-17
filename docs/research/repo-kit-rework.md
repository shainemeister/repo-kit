---
title: "Repo kit rework"
description: "Records the rework decisions that are already in the kit, and the owner that holds each one."
version: "1.11.0"
status: current
audience:
  - ai-agents
  - developers
doc_type: other
related:
  - ../../kit/RULES.md
  - ../../kit/rules/files.md
  - ../../kit/rules/git-commit.md
  - ../../kit/rules/contracts.md
  - ./repo-kit-rules-enhancement.md
  - ./skill-pack-sequence.md
  - ../../docs/library/README.md
last_updated: "2026-10-17"
---

# Repo kit rework

Records the rework decisions that are already in the kit, and the owner that holds each one.

**Related:** [RULES](../../kit/RULES.md) · [files](../../kit/rules/files.md) · [commits](../../kit/rules/git-commit.md) · [contracts](../../kit/rules/contracts.md) · [forked-path proposal](./repo-kit-rules-enhancement.md) · [open queue](./skill-pack-sequence.md) · [library](../../docs/library/README.md)

Reference only. The owner holds the rule. This note does not restate it. Checked against the tree on 2026-10-15. The kit version is 3.0.0 (2026-10-13).

## Shipped

| Decision | Owner now |
|----------|-----------|
| The hub is a short authority map | [kit/RULES.md](../../kit/RULES.md) |
| A notable change gets one changelog line. The commit holds the detail | [Changelog](../../kit/RULES.md#changelog) and [kit/CHANGELOG.md](../../kit/CHANGELOG.md). [versioning-and-git.md](../../kit/rules/versioning-and-git.md) cites that sentence |
| The commit principle stays in git-commit.md. The type table, body shape, identity checks, and trailer placement are the commit verb | [git-commit.md](../../kit/rules/git-commit.md) and [kit/skills/kit-commit](../../kit/skills/kit-commit/SKILL.md). Version numbers and what git tracks stay in [versioning-and-git.md](../../kit/rules/versioning-and-git.md) |
| Paths, nouns, verbs, and the directory README stay one short module | [files.md](../../kit/rules/files.md). The long edge record stays in the [forked-path proposal](./repo-kit-rules-enhancement.md) |
| Three homes: core, workspace, and library. Procedure packs live in the core | `kit/` (including [kit/skills/](../../kit/skills/README.md)), `docs/`, [library/](../../docs/library/README.md) |
| Platform packs are a library set | [library/platforms/](../../docs/library/platforms/README.md). The old `kit/configs/` set and `docs/dev-policy/` are gone |
| Skill packs live at `kit/skills/kit-<action>/`. A blank is `template/<noun>.md`. The hub does not cite that tree | [kit/skills/](../../kit/skills/README.md) and the procedure-pack row in [files.md](../../kit/rules/files.md#categories). A bare adopt copies the agents blank only |
| Language and OS checks stay in the platform packs. The fundamental baseline is one workspace note | [docs/security.md](../security.md). A package `SECURITY.md` exists only when that package executes, uses the network, elevates, or handles secrets |
| The continuity overlay is removed | No successor file. The hub's map is the maintenance path |
| The workboard is the multi-phase record. An install maps the target there without being asked | [WORKBOARD.md](../../WORKBOARD.md). The hub states that in one row. There is no `kit/rules/workboard.md` |
| The session order is short and front-loads the hygiene principle | [AGENTS.md](../../AGENTS.md). The paste block is [agents.md](../../docs/library/kit-adopter/skills/kit-discover-host/template/agents.md) |
| The hygiene module is removed. Nouns, verbs, and the directory README stay in the path module | [AGENTS.md](../../AGENTS.md) and [files.md](../../kit/rules/files.md) |
| Architecture is a few lines on boundaries. The architecture module is removed | [contracts.md](../../kit/rules/contracts.md) Boundaries. Source layout stays in [files.md](../../kit/rules/files.md) |
| Completion is one hub sentence. The verification module is removed. Language gates left with the platform packs | [kit/RULES.md#completion](../../kit/RULES.md#completion). This docs-only kit uses the [author checklist](../../kit/MARKDOWN-STANDARD.md#author-checklist) |
| README shape is the landing page, the directory index, and the minimum front matter | [MARKDOWN-STANDARD.md](../../kit/MARKDOWN-STANDARD.md) |
| Install stays in this repository. An adopted repository keeps the upgrade procedure and the kit baseline | [ADOPTER.md](../../ADOPTER.md) and [UPGRADE.md](../../kit/UPGRADE.md). Upgrade reads the Kit source in the baseline |
| Kit descriptions stay generic. An adopted repository writes what its own files do | [kit/RULES.md](../../kit/RULES.md) and [MARKDOWN-STANDARD.md](../../kit/MARKDOWN-STANDARD.md) |
| The AI-docs module is removed. Workspace notes stay under `docs/` | [docs/README.md](../README.md) |

## Removed

These paths have no file in the tree. Successors are in the table above.

`kit/rules/continuity.md`, `kit/rules/hygiene.md`, `kit/rules/architecture.md`, `kit/rules/verification-and-ops.md`, `kit/rules/ai-docs-workspace.md`, `kit/rules/workboard.md`, `kit/configs/`, `docs/dev-policy/`, `library/skills/`.

## Not this note

| Role | File |
|------|------|
| Unpromoted forked-path proposal | [repo-kit-rules-enhancement.md](./repo-kit-rules-enhancement.md) |
| Open repair after this rework | [skill-pack-sequence.md](./skill-pack-sequence.md) |

## Remainders

The decision in each row shipped. The drift is repair, owned by the queue. Do not treat it as an open rework decision.

| Shipped decision | Drift | Queue |
|------------------|-------|-------|
| A skill cites the kit and does not restate it | Packs still restate owners and still name retired hub sections | [Sections 4–9](./skill-pack-sequence.md#4-repair-skill-links-and-anchors) |
| Completion is the hub sentence. The verification module is gone | [contracts.md](../../kit/rules/contracts.md) still says "language inventory + verification" | [Section 3](./skill-pack-sequence.md#3-correct-the-law-the-packs-will-cite) |
| The workboard is the multi-phase owner | [WORKBOARD.md](../../WORKBOARD.md) still links `kit/rules/workboard.md` and `kit/agents/orchestrator/` | [Section 10](./skill-pack-sequence.md#10-repair-workboard-pointers) |
| Platform packs live under `library/platforms/` | Examples, style gates, and the certification skeleton still use kit-era paths | [Sections 11–13](./skill-pack-sequence.md#11-repair-platform-links) |

A library set for the security baseline was conditional on that note becoming its own dataset. It is still [docs/security.md](../security.md). That growth is not queued.
