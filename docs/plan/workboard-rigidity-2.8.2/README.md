---
title: "workboard-rigidity-2.8.2 — program annex"
description: Thin annex for restoring workboard Must-not digest and tightening OOO templates.
version: "1.0.0"
status: active
audience:
  - ai-agents
  - maintainers
doc_type: plan
related:
  - ../../WORKBOARD.md
  - ../../../kit/rules/workboard.md
  - ../../../kit/MARKDOWN-STANDARD.md
  - ../archive/density-fixups-2.8.1/README.md
last_updated: "2026-08-22"
---

# Workboard rigidity 2.8.2

**Board:** [docs/WORKBOARD.md](../../WORKBOARD.md) — this pack is active **only** while that board’s **Optional annex** field points here.  
**Policy:** [kit/rules/workboard.md](../../../kit/rules/workboard.md)  
**Prior program:** [density-fixups-2.8.1 archive](../archive/density-fixups-2.8.1/)  
**Density invert:** [MARKDOWN-STANDARD](../../../kit/MARKDOWN-STANDARD.md#density-force-and-incorporation)

| Field | Value |
|-------|--------|
| **Program id** | `workboard-rigidity-2.8.2` |
| **Status** | `active` |
| **Next phase** | `P2` |
| **Kit target** | `2.8.2` |
| **L4 owners on ship** | [workboard.md](../../../kit/rules/workboard.md) · [ai-docs-workspace.md](../../../kit/rules/ai-docs-workspace.md) · [PLAN-HOOK.md](../../../kit/agents/PLAN-HOOK.md) · [TEMPLATE-OOO.md](../../../kit/templates/docs/plan/TEMPLATE-OOO.md) · [TEMPLATE-PROGRAM-README.md](../../../kit/templates/docs/plan/TEMPLATE-PROGRAM-README.md) · [CHANGELOG](../../../kit/CHANGELOG.md) |

Restore unique Must nots that density invert dropped from Summaries (`d96110d`, `5a8eca7`; source `12e0b4b`). Tighten OOO templates. Do not restyle catalogs, trim the hub Must map, or touch `AGENTS.md` / root README.

```text
P0 register → P1 workboard Must-not + OPS related: + SHA/dup/archive
     → P2 ai-docs + PLAN-HOOK unique Must nots
     → P3 TEMPLATE-OOO allow/deny + exit criterion
     → P4 trim board log → P5 ship 2.8.2
```

Master OOO: [OOO.md](./OOO.md). Depth is `docs/plan/<id>/`; after archive, apply the substitution table in the workboard archive checklist.
