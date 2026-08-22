---
title: "md-density-2.7.0 — program annex"
description: Optional deep order-of-operations pack for Markdown density. Active while linked from the workboard.
version: "1.0.0"
status: active
audience:
  - ai-agents
  - maintainers
doc_type: plan
related:
  - ./OOO.md
  - ../../WORKBOARD.md
  - ../../../kit/rules/workboard.md
  - ../../../README.md
last_updated: "2026-08-21"
---

# Markdown density

**Board:** [docs/WORKBOARD.md](../../WORKBOARD.md) — this pack is active **only** while that board’s **Optional annex** field points here.  
**Policy:** [kit/rules/workboard.md](../../../kit/rules/workboard.md)  
**Mission (not todos):** root [README.md](../../../README.md) (kit landing). This repo has no root `PLAN.md`; Instruct is off.

| Field | Value |
|-------|--------|
| **Program id** | `md-density-2.7.0` |
| **Status** | `active` |
| **Next phase** | P4 |
| **Waves** | Wave 1 = kit **2.7.0** (doctrine, templates, two pilots). Wave 2 = kit **2.8.0** (remaining restyles) after the P3 hard gate. |
| **L4 owners to update on ship** | Wave 1: [MARKDOWN-STANDARD.md](../../../kit/MARKDOWN-STANDARD.md), [contracts.md](../../../kit/rules/contracts.md), [authoring-and-style.md](../../../kit/rules/authoring-and-style.md), [verification-and-ops.md](../../../kit/rules/verification-and-ops.md), [RULES.md](../../../kit/RULES.md) (one Must), `kit/templates/TEMPLATE-*.md`, [docs-author.md](../../../kit/agents/templates/docs-author.md), [CATALOG.md](../../../kit/agents/CATALOG.md), [hygiene.md](../../../kit/rules/hygiene.md), [architecture.md](../../../kit/rules/architecture.md), [CHANGELOG.md](../../../kit/CHANGELOG.md). Wave 2 owners are listed in [OOO.md](./OOO.md); they are not next. |

## Contents of this annex

| File | Role |
|------|------|
| This README | Status, next phase, link **back** to the board |
| [OOO.md](./OOO.md) | Durable execution contract: goals, invariants, DAG, conflicts, verify |

## Rules

1. Do not duplicate the live phase table into the landing README. Live status lives on [docs/WORKBOARD.md](../../WORKBOARD.md).  
2. The durable DAG lives in [OOO.md](./OOO.md). Writers edit L4 only when that phase is `active` on the board. Do not add later-phase implementation novels as extra annex files until that phase is `active`.  
3. On program complete: `git mv` this folder to `docs/plan/archive/md-density-2.7.0/` and promote promises to L4.
