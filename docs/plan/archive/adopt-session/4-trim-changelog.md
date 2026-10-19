---
title: "Trim the kit changelog"
description: "Keep only the three newest repo-kit changelog sections in this repository."
version: "1.0.0"
status: current
doc_type: other
last_updated: "2026-10-19"
---

# Trim the kit changelog

Keep only the three newest repo-kit changelog sections in this repository.

Run this after phase 2. Keep `[3.9.0]`, `[3.8.1]`, and `[3.8.0]`. Remove `[3.0.0]` through `[1.0.0]`. The introduction says this kit retains three sections and that older detail stays in git history.

Do not trim `docs/library/platforms/CHANGELOG.md`. Do not edit a file inside `docs/plan/archive/`.

Retarget a link in a current file that points at a removed section. The current owners are the files those sections named, not the deleted heading.
