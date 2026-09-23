---
title: "orchestrator-portability-2.15.0 — program annex"
description: Annex index for the host-agnostic orchestrator crew. Open while the workboard points here; next phase is P4 (archive the annex and refresh kit-context).
version: "1.0.0"
status: active
audience:
  - ai-agents
  - developers
doc_type: plan
related:
  - ../../WORKBOARD.md
  - ./OOO.md
  - ../../../kit/rules/workboard.md
  - ../../../kit/agents/orchestrator/README.md
  - ../../../kit/CHANGELOG.md
last_updated: "2026-09-22"
---

# Orchestrator portability 2.15.0

**Board:** [docs/WORKBOARD.md](../../WORKBOARD.md) — this pack is active only while that board’s **Optional annex** field points here.  
**Policy:** [kit/rules/workboard.md](../../../kit/rules/workboard.md)  
No root `PLAN.md` (Instruct off).

| Field | Value |
|-------|--------|
| **Program id** | `orchestrator-portability-2.15.0` |
| **Status** | `active` |
| **Next phase** | P4 — archive the annex and refresh kit-context |
| **L4 owners to update on ship** | [orchestrator README](../../../kit/agents/orchestrator/README.md) · [CATALOG](../../../kit/agents/CATALOG.md) · [agents README](../../../kit/agents/README.md) · [RULES](../../../kit/RULES.md) · [UPGRADE](../../../kit/UPGRADE.md) · [CHANGELOG](../../../kit/CHANGELOG.md) `### [2.15.0]` |

## Contents of this annex

| File | Role |
|------|------|
| This README | Status, next phase, link back to the board |
| [OOO.md](./OOO.md) | Goals, phased order, verification, risks |

## Rules

1. Do not paste the live phase table into a root `PLAN.md` (none exists).
2. **Next phase** matches the board `active` row.
3. On program complete: `git mv` this folder to `docs/plan/archive/orchestrator-portability-2.15.0/` and leave the kit promise on L4.
