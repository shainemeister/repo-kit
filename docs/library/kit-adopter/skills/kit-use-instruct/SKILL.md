---
title: Agent Instruct Order of Operations
description: "Utilization when Agent Instruct is in use. Detect it, report the task, and create a persona when that is the task."
version: "1.11.0"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - ../../../../../kit/skills/README.md
  - ../kit-map-layers/SKILL.md
  - ../kit-define-pack/SKILL.md
  - ../kit-emit-packs/SKILL.md
  - ../kit-author-plan/SKILL.md
  - ../kit-discover-host/SKILL.md
  - ../../../../../kit/rules/contracts.md
last_updated: "2026-10-17"
---

# Agent Instruct Order of Operations

Utilization when Agent Instruct is in use. Detect it, report the task, and create a persona when that is the task.

The match rows live in [the skills index](../../../../../kit/skills/README.md#match-index). The layer rule lives in [kit-map-layers](../kit-map-layers/SKILL.md). The gates live in their own skills.

**Related:** [README.md](../../../../../kit/skills/README.md) · [kit-map-layers](../kit-map-layers/SKILL.md) · [kit-define-pack](../kit-define-pack/SKILL.md) · [kit-emit-packs](../kit-emit-packs/SKILL.md) · [kit-author-plan](../kit-author-plan/SKILL.md) · [kit-discover-host](../kit-discover-host/SKILL.md) · [contracts](../../../../../kit/rules/contracts.md)

Related lists maintainer peers. Do not load them for this task.

---

## Summary

| Must |
|------|
| Detect Instruct before running this procedure. A bare adopt uses the authority map only |
| Follow the matched skill. Cite the owners below. Do not copy their rules into this file |
| When the change touches privilege, network, or secrets, name kit-apply-security as the next task |
| Report the primary id, the owners opened, whether BUILD ran, and the checks |
| Create a persona only when that is the task |

**Bare adopt:** no Agent models section and no Instruct packs. Skip this procedure. Use the authority map ([PLAN dual path](../kit-author-plan/SKILL.md#plan-dual-path)).

**“Automatic” maintenance** means this procedure runs when Instruct is adopted. It is not a background daemon or a host job.

---

## Contents

1. [When O3 applies](#when-o3-applies)
2. [Order of operations (O3)](#order-of-operations-o3)
3. [Co-maintain documents and rules](#co-maintain-documents-and-rules)
4. [Lifecycle: features and core tasks](#lifecycle-features-and-core-tasks)
5. [Creating a new expert persona](#creating-a-new-expert-persona)
6. [Report shape](#report-shape)
7. [Anti-patterns](#anti-patterns)
8. [Document history](#document-history)

---

## When O3 applies

| Condition | Action |
|-----------|--------|
| Root `PLAN.md` has **Agent models** | Run this procedure |
| Tracked packs under `docs/library/kit-adopter/generated/` and the project uses agents | Run this procedure |
| Bare kit adopt: no Agent models, no agent packs | Skip this procedure. Open the authority map ([PLAN dual path](../kit-author-plan/SKILL.md#plan-dual-path)) |
| First adopt with agents intended but no packs yet | The next task is kit-emit-packs. Stop |

Detect Instruct first. A bare adopt does not run this procedure.

---

## Order of operations (O3)

```text
0  DETECT Instruct (PLAN Agent models and/or generated packs)
   → bare adopt → stop. Use the authority map
1  READ PLAN Agent models
2  OPEN the authority map
3  MATCH one skill from its description and triggers
   → match rows and suggested defaults: kit/skills/README.md
   → activation, disabled, negative_triggers, stage gates: kit-map-layers
4  LOAD that one skill
   → missing, and Instruct is intended → next task is kit-emit-packs. Stop
5  FOLLOW that procedure. On conflict, the layer rule in kit-map-layers wins
6  CO-MAINTAIN by the owners in the next section
7  VERIFY the pack verify list and the checks this repository declares
   → one fails or is skipped → stop
8  REPORT
   → the change touched privilege, network, or secrets, and this skill was not kit-apply-security
     → name kit-apply-security as the next task. Do not open it here
   → any other second concern → name that task and stop
```

| Step | Owner |
|------|--------|
| 0 | [kit-author-plan](../kit-author-plan/SKILL.md#plan-dual-path) |
| 1 | [kit-author-plan](../kit-author-plan/SKILL.md) |
| 2 | [RULES](../../../../../kit/RULES.md#authority-map) |
| 3 | [skills index](../../../../../kit/skills/README.md#match-index), [kit-map-layers](../kit-map-layers/SKILL.md#activation-modes) |
| 4 | [kit-emit-packs](../kit-emit-packs/SKILL.md) when the pack is missing |
| 5 | The matched skill, and [kit-map-layers](../kit-map-layers/SKILL.md#layers-l0l4) |
| 6 | The table below |
| 7 | [completion](../../../../../kit/RULES.md#completion) |
| 8 | [Report shape](#report-shape). The security gate is [kit-apply-security](../../../../../kit/skills/kit-apply-security/SKILL.md) |

Open another skill only when that skill is the task.

Citation rules live in [kit-define-pack](../kit-define-pack/SKILL.md#expertise-and-references).

---

## Co-maintain documents and rules

When Instruct is in use, maintenance is part of the task. The rule stays in the owner.

| Concern | Owner |
|---------|--------|
| Behavior or public surface | [contracts](../../../../../kit/rules/contracts.md#same-change-set-rule) |
| Research, plan, or build notes | [docs workspace](../../../../README.md) |
| Multi-phase work | [workboard](../../../../../WORKBOARD.md) |
| A finding becomes a product promise | The owner the authority map names |
| A new, removed, or renamed path | [files.md](../../../../../kit/rules/files.md) |
| A notable change | [changelog](../../../../../kit/RULES.md#changelog) |
| Agent enablement or expertise | [kit-author-plan](../kit-author-plan/SKILL.md), then [kit-emit-packs](../kit-emit-packs/SKILL.md) as the next task |
| A declared check changes | The owner of that check, then [kit-emit-packs](../kit-emit-packs/SKILL.md) so `verify` follows |

---

## Lifecycle: features and core tasks

When durable work changes shape, name the next task and stop. A plan edit is the [kit-author-plan](../kit-author-plan/SKILL.md#mid-project-adjustment-procedure) task. An emit is the [kit-emit-packs](../kit-emit-packs/SKILL.md#regen-triggers) task.

---

## Creating a new expert persona

When PLAN or the user asks for a new durable project agent, the next task is [kit-emit-packs](../kit-emit-packs/SKILL.md#source-load-order). Stop. Do not invent a kit catalog default for a product-only role.

---

## Report shape

Before claiming a task complete under Instruct, state the primary pack, the owners opened, whether BUILD ran, and the result of the checks this repository declares.

When the change touched privilege, network, or secrets and this task was not kit-apply-security, name kit-apply-security as the next task.

If a declared check or a required verify item failed or was skipped, stop ([completion](../../../../../kit/RULES.md#completion)).

---

## Anti-patterns

The failure list lives in [example.md](template/failures.md).

---

## Document history

| Version | Notes |
|---------|--------|
| 1.11.0 | This pack lives under `docs/library/kit-adopter/skills/` |
| 1.10.0 | Activation cites `kit-map-layers`. A new persona is the `kit-emit-packs` task |
| 1.9.0 | Home is `kit/skills/kit-<action>/`. A blank is `template/<noun>.md` |
| 1.8.0 | Kit packs are `skills/kit-<action>/`. Ids stay. `kit-adopter` and `generated/` stay |
| 1.7.0 | Keeps detect, the report, and persona creation. Match, layers, co-maintain, and the security gate cite their owners |
| 1.6.0 | Handoffs name `author-plan` and `emit-packs`. Ids stay |
| 1.5.0 | One skill per task. No second pack and no sub-agent. The owner column is a citation |
| 1.4.1 | Pack path is `skills/<action>/SKILL.md` |
| 1.4.0 | Retired hub requirements removed. Lifecycle and anti-patterns cite their owners |
| 1.3.4 | Related path follows the `skills/` home |
| 1.3.3 | Parent gives the workboard phase brief when an annex exists (kit 2.11.1) |
| 1.3.2 | Drop in-body document-version echo (kit 2.8.1) |
| 1.3.1 | Density restyle (kit 2.8.0); unique O3, parent/child duties, and Instruct procedure unchanged |
| 1.3.0 | Parent/child duties when work is isolated; workboard as DAG (kit 2.6.0) |
| 1.2.0 | Co-maintain workboard on multi-phase ship (kit 2.4.0) |
| 1.1.0 | Co-maintain root docs/ AI workspace when research/plan/build applies (kit 2.3.0) |
| 1.0.1 | Report shape added (kit 2.2.1). Later versions dropped the hub checklist it cited |
| 1.0.0 | Initial O3 utilization authority (kit 2.2.0): match, expertise, co-maintain, lifecycle |
