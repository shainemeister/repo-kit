---
title: "Upgrade repo-kit"
description: "How this repository's kit is upgraded in a project that already adopted it. Not a copy of kit history."
version: "3.0.0"
status: current
audience:
  - developers
  - ai-agents
doc_type: other
related:
  - RULES.md
  - SETUP.md
  - CHANGELOG.md
last_updated: "2026-10-13"
---

# Upgrade repo-kit

How a project that already has this kit takes a newer copy.

**Related:** [RULES](RULES.md) · [SETUP](SETUP.md) · [CHANGELOG](CHANGELOG.md)

## Steps

1. Read the notable changes since the adopted version in [CHANGELOG.md](CHANGELOG.md), under `## repo-kit`. The git history holds the detail.
2. Merge the kit files the project uses. Keep the project's authority-map paths, its `AGENTS.md`, and its `docs/WORKBOARD.md`.
3. Update the kit baseline version in the project's `kit/RULES.md`.
4. Add one changelog line in the project's own changelog for the upgrade. Do not paste this kit's history into that file.

A first install uses [SETUP.md](SETUP.md).
