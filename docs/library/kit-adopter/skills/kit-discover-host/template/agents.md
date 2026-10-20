---
title: "AGENTS.md template"
description: "Paste block for a root AGENTS.md. Use it to create the file, or to replace an existing file with this order."
version: "1.2.5"
status: current
audience:
  - developers
  - ai-agents
doc_type: other
related:
  - ../../../../../../kit/RULES.md
  - ../../../../../../kit/rules/path-pattern.md
  - ../../../../../../kit/rules/directory-index.md
  - ../../../../../../kit/MARKDOWN-STANDARD.md
  - ../../../../../../AGENTS.md
last_updated: "2026-10-19"
---

# AGENTS.md template

Paste block for a root AGENTS.md. Use it to create the file, or to replace an existing file with this order.

**Related:** [RULES](../../../../../../kit/RULES.md) · [path pattern](../../../../../../kit/rules/path-pattern.md) · [directory index](../../../../../../kit/rules/directory-index.md) · [markdown](../../../../../../kit/MARKDOWN-STANDARD.md) · [this repository](../../../../../../AGENTS.md)

## How to use

- No root `AGENTS.md`: write the block below as that file. Remove the fence.
- A root `AGENTS.md` exists: replace the body with the block. Keep that repository's directory paths in `{{PROJECT_NOTE}}`. Do not keep the old sections.
- The block is already the whole file: do not add a second copy.
- Do not paste `kit/rules/*` into the file.

The block is the session order. [kit/RULES.md](../../../../../../kit/RULES.md) remains the authority map.

## Paste

```markdown
# AGENTS.md

Standards live in `kit/`. The project lives outside it: product code, the changelog, and `docs/`. A new path extends the file that already holds the role.

## Order

1. Confirm the request.
2. Check existing files before creating one. [kit/rules/path-pattern.md](kit/rules/path-pattern.md) owns the path pattern. [kit/rules/directory-index.md](kit/rules/directory-index.md) owns the directory README.
3. When installing this kit, open [ADOPTER.md](ADOPTER.md). That file deploys the adopt shelf. This session does not run the shelf.
4. When the work has more than one phase, and the work is not an adopt or an upgrade, open [WORKBOARD.md](WORKBOARD.md), write every step there, and check each off as it is finished.
5. When the task matches a procedure, and the task is not an adopt or an upgrade, open that pack under [kit/skills/](kit/skills/README.md).
6. A later upgrade opens [kit/UPGRADE.md](kit/UPGRADE.md). That file deploys the upgrade shelf. This session does not run the shelf.
7. Leave this file at that order.

When [WORKBOARD.md](WORKBOARD.md) names a primary program other than `—`, start each reply with that file's phase table: ID, Work, and Status.

An authorized commit updates [WORKBOARD.md](WORKBOARD.md) before that commit is created. [Contracts](kit/rules/contracts.md#boundaries) owns that step.

[MEMORY.md](MEMORY.md) is the agent's notepad. Update it freely. Keep it to the user's intent and the direction of this repository, and keep it short.

Kit text stays generic. An adopted repository writes descriptions of its own files. [kit/MARKDOWN-STANDARD.md](kit/MARKDOWN-STANDARD.md) owns that shape.

Do not claim the work done if a check this repository declares was skipped. The check is the one [kit/RULES.md](kit/RULES.md) records for this repository.

{{PROJECT_NOTE}}
```
