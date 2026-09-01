# AGENTS.md

Instructions for **coding agents** working in this repository. Humans use the root README.

This project uses **repo-kit**. Portable law is under `kit/`. This file is a **pointer** (L0). Do not treat it as a second RULES tree.

## Open first

1. `kit/RULES.md` — authority map, Must / Must not, operator checklist, kit baseline.  
2. Language surface inventory in that hub / `kit/rules/security.md` — **declared** style and SAST gates only. Empty inventory ⇒ no pylint / rustfmt / clang / Bandit / cargo-audit / cppcheck.  
3. `kit/rules/contracts.md` — one canonical owner; update that owner in the **same change set** as behavior.

## Working memory

- Multi-phase work: `docs/WORKBOARD.md` **if that file exists**. Do not keep the only plan in chat.  
- Research / build notes: root `docs/` when needed (`kit/rules/ai-docs-workspace.md`). Promote durable promises to L4 owners.  
- When adding, moving, or splitting a path, follow `kit/rules/files.md` (do not paste that module here).

## Agent Instruct (only if present)

If root `PLAN.md` has an **Agent models** section **or** `kit/agents/generated/` has packs:

- Follow `kit/agents/OPS.md` (one primary pack; L4 wins).  
- If work is isolated to a helper: parent owns complete, CHANGELOG, Progress Tracker, and the workboard; child returns files and gates only.  
- `compose_with` means at most one extra concern — never the full catalog.

If neither PLAN Agent models nor generated packs exist: **skip Instruct**. Use `kit/RULES.md` only.

## Do not

- Invent tools, folders, or gates that are not in the inventory / verification table.  
- Paste `kit/rules/*` or pack bodies into this file.  
- Create host trees (`.claude/`, `.cursor/`, Copilot instruction matrices, …) without evidence that host is in use.  
- Claim complete if a **declared** Domain A/B gate was skipped or failed.

## Project

- **Name:** `{{PROJECT_NAME}}`  
- **Verify (if declared):** `{{VERIFY_HINT}}`

Replace placeholders. Delete this Project section if nothing project-specific belongs here.
