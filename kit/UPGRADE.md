---
title: "Upgrade repo-kit"
description: "How a project that already adopted this kit takes a newer copy from the Kit source recorded in its baseline."
version: "3.0.1"
status: current
audience:
  - developers
  - ai-agents
doc_type: other
related:
  - RULES.md
  - CHANGELOG.md
  - rules/versioning-and-git.md
last_updated: "2026-10-13"
---

# Upgrade repo-kit

How a project that already adopted this kit takes a newer copy from the Kit source recorded in its baseline.

**Related:** [RULES](RULES.md) · [CHANGELOG](CHANGELOG.md) · [versioning](rules/versioning-and-git.md)

## Steps

1. Read the Kit source and the adopted version in the project's [kit baseline](RULES.md#kit-baseline).
2. In that source, read the notable changes since the adopted version under `## repo-kit` in `kit/CHANGELOG.md`. The git history holds the detail.
3. Merge the kit files the project uses from that source. Keep the project's authority-map paths, its `AGENTS.md`, and its `docs/WORKBOARD.md`.
4. Update the adopted version in the project's kit baseline.
5. Add one line to the project's own changelog for the upgrade. Do not paste this kit's history into that file.
