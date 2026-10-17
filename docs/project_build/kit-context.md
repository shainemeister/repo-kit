---
title: "repo-kit — maintainer build context"
description: "Where this kit tree stands. ADOPTER.md stays in this repository. An adopted repository keeps UPGRADE and the kit baseline."
version: "1.6.0"
status: current
audience:
  - maintainers
  - ai-agents
doc_type: other
related:
  - ../../README.md
  - ../../kit/RULES.md
  - ../../ADOPTER.md
  - ../../kit/UPGRADE.md
  - ../../WORKBOARD.md
  - ../../MEMORY.md
last_updated: "2026-10-17"
---

# repo-kit — maintainer build context

Where this kit tree stands. Open [RULES](../../kit/RULES.md) for the authority map. This note is not a second copy of it.

**Related:** [README](../../README.md) · [RULES](../../kit/RULES.md) · [ADOPTER](../../ADOPTER.md) · [UPGRADE](../../kit/UPGRADE.md) · [workboard](../../WORKBOARD.md) · [notepad](../../MEMORY.md)

This repository is the kit. It is docs-only. The kit version is the latest dated section under `## repo-kit` in [CHANGELOG](../../kit/CHANGELOG.md). The Kit source is recorded in the [kit baseline](../../kit/RULES.md#kit-baseline).

[ADOPTER.md](../../ADOPTER.md) stays in this repository. It is the one-time adopt. An adopted repository deletes it when the adopt is finished. The copy into a target is `kit/RULES.md`, `kit/rules/`, `kit/MARKDOWN-STANDARD.md`, `kit/UPGRADE.md`, and `kit/skills/`. Product code, the project changelog, and `docs/` stay outside `kit/`.

[UPGRADE](../../kit/UPGRADE.md) is the procedure after a baseline exists. It reads the Kit source in that baseline. It does not require `ADOPTER.md` in the target.

During an adopt, map the target on [WORKBOARD](../../WORKBOARD.md) without waiting to be asked. Later multi-phase work is written on that board, one step per row, and checked off there. A coding-agent adopt places [MEMORY.md](../../MEMORY.md) from the discover-host blank when that file is missing.

A finding that becomes a rule moves into `kit/` in the same change set.
