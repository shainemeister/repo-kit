---
title: "repo-kit — maintainer build context"
description: "Where this kit tree stands. SETUP stays in this repository. An adopted repository keeps UPGRADE and the kit baseline."
version: "1.4.0"
status: current
audience:
  - maintainers
  - ai-agents
doc_type: other
related:
  - ../../README.md
  - ../../kit/RULES.md
  - ../../kit/SETUP.md
  - ../../kit/UPGRADE.md
  - ../WORKBOARD.md
last_updated: "2026-10-13"
---

# repo-kit — maintainer build context

Where this kit tree stands. Open [RULES](../../kit/RULES.md) for the authority map. This note is not a second copy of it.

**Related:** [README](../../README.md) · [RULES](../../kit/RULES.md) · [SETUP](../../kit/SETUP.md) · [UPGRADE](../../kit/UPGRADE.md) · [workboard](../WORKBOARD.md)

This repository is the kit. It is docs-only. The kit version is the latest dated section under `## repo-kit` in [CHANGELOG](../../kit/CHANGELOG.md). The Kit source is recorded in the [kit baseline](../../kit/RULES.md#kit-baseline).

[SETUP](../../kit/SETUP.md) stays in this repository. It is the install procedure. An adopted repository does not keep it. The copy into a target is `kit/RULES.md`, `kit/rules/`, `kit/MARKDOWN-STANDARD.md`, and `kit/UPGRADE.md`. Product code, the project changelog, and `docs/` stay outside `kit/`.

[UPGRADE](../../kit/UPGRADE.md) is the procedure after a baseline exists. It reads the Kit source in that baseline. It does not require `SETUP.md` in the target.

During an install, map the target on [WORKBOARD](../WORKBOARD.md) without waiting to be asked. Later multi-phase work stays on that board.

A finding that becomes a rule moves into `kit/` in the same change set.
