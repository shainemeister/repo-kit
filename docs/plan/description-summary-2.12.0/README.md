---
title: "description-summary-2.12.0 — program annex"
description: Status, next phase, and file list for the description current-content floor. Live only while the workboard Optional annex field points here.
version: "1.0.0"
status: active
audience:
  - ai-agents
  - maintainers
doc_type: plan
related:
  - ../../WORKBOARD.md
  - ../../../kit/rules/workboard.md
  - ./OOO.md
  - ../../../kit/MARKDOWN-STANDARD.md
  - ../../../kit/rules/files.md
last_updated: "2026-09-04"
---

# Description summary 2.12.0

**Board:** [docs/WORKBOARD.md](../../WORKBOARD.md) — this pack is active **only** while that board’s **Optional annex** field points here.  
**Policy:** [kit/rules/workboard.md](../../../kit/rules/workboard.md)  
No root `PLAN.md` (Instruct off).

| Field | Value |
|-------|--------|
| **Program id** | `description-summary-2.12.0` |
| **Status** | `active` |
| **Next phase** | P5 |
| **L4 owners to update on ship** | [MARKDOWN-STANDARD](../../../kit/MARKDOWN-STANDARD.md) · [files.md](../../../kit/rules/files.md) · [CHANGELOG](../../../kit/CHANGELOG.md) `### [2.12.0]` |

## Contents of this annex

| File | Role |
|------|------|
| This README | Status, next phase, link **back** to the board |
| [OOO.md](./OOO.md) | Goals, frozen identity test, phased OOO, verification, risks |

## Rules

1. Do not duplicate the live phase table into a PLAN.md (none here).  
2. Do not write implementation OOOs for later phases until that phase is `active` on the board.  
3. Keep **Next phase** matched to the board `active` or `blocked` row.  
4. On program complete: `git mv` this folder to `docs/plan/archive/description-summary-2.12.0/` and promote promises to L4.
