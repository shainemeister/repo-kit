---
title: "workboard-packet-2.11.1 — program annex"
description: Annex index for the workboard sub-agent packet and execution-precision tighten. Open only while the workboard Optional annex field points here; not L4.
version: "1.0.0"
status: draft
audience:
  - ai-agents
  - maintainers
doc_type: plan
related:
  - ../../WORKBOARD.md
  - ../../../kit/rules/workboard.md
  - ./OOO.md
  - ../../../kit/templates/docs/plan/TEMPLATE-OOO.md
  - ../../../kit/agents/OPS.md
last_updated: "2026-09-01"
---

# Workboard packet 2.11.1

**Board:** [docs/WORKBOARD.md](../../WORKBOARD.md) — this pack is active **only** while that board’s **Optional annex** field points here.  
**Policy:** [kit/rules/workboard.md](../../../kit/rules/workboard.md)  
No root `PLAN.md` (Instruct off).

| Field | Value |
|-------|--------|
| **Program id** | `workboard-packet-2.11.1` |
| **Status** | `draft` |
| **Next phase** | P1 |
| **L4 owners to update on ship** | `kit/rules/workboard.md` · OOO / program-README / board templates · OPS cite · UPGRADE · `kit/CHANGELOG.md` `### [2.11.1]` |

## Contents of this annex

| File | Role |
|------|------|
| This README | Status, next phase, link **back** to the board |
| [OOO.md](./OOO.md) | Goals, freeze, phased OOO, verify, risks |

## Rules

1. This pack is execution memory, not shipped law.  
2. Durable promises ship on L4 (`kit/rules/workboard.md`).  
3. **Next phase** matches the board `active` or `blocked` row in the same change set.  
4. On program complete: `git mv` this folder to `docs/plan/archive/workboard-packet-2.11.1/`.
