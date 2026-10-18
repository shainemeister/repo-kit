---
title: "AGENTS.md template"
description: "Paste block for a root AGENTS.md. Use it to create the file, or to add the kit session order to one that already exists."
version: "1.2.1"
status: current
audience:
  - developers
  - ai-agents
doc_type: other
related:
  - ../../../../../../kit/RULES.md
  - ../../../../../../kit/rules/files.md
  - ../../../../../../kit/MARKDOWN-STANDARD.md
  - ../../../../../../AGENTS.md
last_updated: "2026-10-17"
---

# AGENTS.md template

Paste block for a root AGENTS.md. Use it to create the file, or to add the kit session order to one that already exists.

**Related:** [RULES](../../../../../../kit/RULES.md) · [files](../../../../../../kit/rules/files.md) · [markdown](../../../../../../kit/MARKDOWN-STANDARD.md) · [this repository](../../../../../../AGENTS.md)

## How to use

- The root `AGENTS.md` is missing: write the block below as that file. Remove the fence.
- A root `AGENTS.md` already exists: paste the block once, at the top. Keep the project's own sections.
- The block is already present, or the file already has this order and a pointer to `kit/RULES.md`: do not add a second copy.
- Replace `{{PROJECT_NOTE}}` with one line about this repository, or delete that line.
- Do not paste `kit/rules/*` into the file.

The block is the session order. [kit/RULES.md](../../../../../../kit/RULES.md) remains the authority map.

## Paste

```markdown
# AGENTS.md

Standards live in `kit/`. The project lives outside it: product code, the changelog, and `docs/`. A new path extends the file that already holds the role.

## Order

1. Confirm the request.
2. Check existing files before creating one. [kit/rules/files.md](kit/rules/files.md) owns nouns, verbs, and the directory README.
3. When installing this kit, open [WORKBOARD.md](WORKBOARD.md) and map the repository without waiting to be asked.
4. When the work has more than one phase, open [WORKBOARD.md](WORKBOARD.md), write every step there, and check each off as it is finished.
5. Leave this file at that order.

When [WORKBOARD.md](WORKBOARD.md) names a primary program other than `—`, start each reply with that file's phase table: ID, Work, and Status.

Every commit updates [WORKBOARD.md](WORKBOARD.md) before the session closes. [Contracts](kit/rules/contracts.md#boundaries) owns that step.

[MEMORY.md](MEMORY.md) is the agent's notepad. Update it freely. Keep it to the user's intent and the direction of this repository, and keep it short.

Kit text stays generic. An adopted repository writes descriptions of its own files. [kit/MARKDOWN-STANDARD.md](kit/MARKDOWN-STANDARD.md) owns that shape.

Do not claim the work done if a check this repository declares was skipped. The check is the one [kit/RULES.md](kit/RULES.md) records for this repository.

{{PROJECT_NOTE}}
```
