---
title: "AGENTS.md template"
description: "Paste block for a root AGENTS.md. Use it to create the file, or to add the kit session order to one that already exists."
version: "1.0.0"
status: current
audience:
  - developers
  - ai-agents
doc_type: other
related:
  - ../RULES.md
  - ../rules/files.md
  - ../MARKDOWN-STANDARD.md
  - ../../AGENTS.md
last_updated: "2026-10-13"
---

# AGENTS.md template

Paste block for a root AGENTS.md. Use it to create the file, or to add the kit session order to one that already exists.

**Related:** [RULES](../RULES.md) · [files](../rules/files.md) · [markdown](../MARKDOWN-STANDARD.md) · [this repository](../../AGENTS.md)

## How to use

- The root `AGENTS.md` is missing: write the block below as that file. Remove the fence.
- A root `AGENTS.md` already exists: paste the block once, at the top. Keep the project's own sections.
- The block is already present, or the file already has this order and a pointer to `kit/RULES.md`: do not add a second copy.
- Replace `{{PROJECT_NOTE}}` with one line about this repository, or delete that line.
- Do not paste `kit/rules/*` into the file.

The block is the session order. [kit/RULES.md](../RULES.md) remains the authority map.

## Paste

```markdown
# AGENTS.md

Standards live in `kit/`. The project lives outside it: product code, the changelog, and `docs/`. A new path extends the file that already holds the role.

## Order

1. Confirm the request.
2. Check existing files before creating one. [kit/rules/files.md](kit/rules/files.md) owns nouns, verbs, and the directory README.
3. When installing this kit, open [docs/WORKBOARD.md](docs/WORKBOARD.md) and map the repository without waiting to be asked.
4. Update the workboard when the work has phases.
5. Leave this file at that order.

Kit text stays generic. An adopted repository writes descriptions of its own files. [kit/MARKDOWN-STANDARD.md](kit/MARKDOWN-STANDARD.md) owns that shape.

Do not claim the work done if a check this repository declares was skipped. The check is the one [kit/RULES.md](kit/RULES.md) records for this repository.

{{PROJECT_NOTE}}
```
