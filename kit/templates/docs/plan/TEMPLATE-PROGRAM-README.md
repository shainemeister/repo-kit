---
title: "{{PROGRAM_ID}} — program annex"
description: Owns the program annex index. Open only while the workboard Optional annex field points here.
version: "1.2.0"
status: draft
audience:
  - ai-agents
  - developers
doc_type: plan
related:
  - ../../WORKBOARD.md
  - ../../../PLAN.md
  - ../../../kit/rules/workboard.md
last_updated: "{{ISO_DATE}}"
# keywords:          # omit-if
#   - {{KEYWORD}}
---

# {{PROGRAM_NAME}}

**Board:** [docs/WORKBOARD.md](../../WORKBOARD.md) — this pack is active **only** while that board’s **Optional annex** field points here.  
Depth is `docs/plan/<id>/`; after archive, apply the substitution table in the [workboard archive checklist](../../../kit/rules/workboard.md#archive-annex-checklist).  
**Policy:** [kit/rules/workboard.md](../../../kit/rules/workboard.md)  
**Mission (not todos):** [PLAN.md](../../../PLAN.md) *(omit-if no root PLAN.md)*

| Field | Value |
|-------|--------|
| **Program id** | {{PROGRAM_ID}} |
| **Status** | `draft` / `active` / `done` / `archived` |
| **Next phase** | {{PHASE_ID}} — must match the board `active` or `blocked` row (same change set) |
| **L4 owners to update on ship** | {{AUTHORITY_MAP_PATHS}} |

## Contents of this annex

| File | Role |
|------|------|
| This README | Status, next phase, link **back** to the board |
| [OOO.md](./OOO.md) *(copy-rename from TEMPLATE-OOO.md)* | Goals, non-goals, master OOO, verify, risks |

## Rules

1. Do not duplicate the live phase table into `PLAN.md`.  
2. Do not write implementation OOOs for later phases until that phase is `active` on the board.  
3. Keep **Next phase** matched to the board `active` or `blocked` row.  
4. On program complete: `git mv` this folder to `docs/plan/archive/{{PROGRAM_ID}}/` and promote promises to L4.

Replace every `{{PLACEHOLDER}}`. Delete commented `keywords` if unused.
