---
title: "Adopt links"
description: "Make the skills copied by ADOPTER.md followable in a target that does not have the shelf."
version: "1.0.0"
status: current
doc_type: other
last_updated: "2026-10-19"
---

# Adopt links

Make the skills copied by `ADOPTER.md` followable in a target that does not have the shelf.

`ADOPTER.md` copies `kit/skills/` and does not copy `docs/library/`. These copied files link into that library today:

- `kit/skills/README.md` links the adopt shelf
- `kit/skills/kit-author-docs/SKILL.md` links `docs/library/platforms/style-gates.md`
- `kit/skills/kit-apply-change/SKILL.md` links the same style-gates file

Shelf links stay in `ADOPTER.md` and `kit/UPGRADE.md`, which are read from the kit source. A copied skill cites a file the copy includes, or it names the shelf as a kit-source read and does not require that path in the target. Do not move `style-gates.md` into `kit/`.
