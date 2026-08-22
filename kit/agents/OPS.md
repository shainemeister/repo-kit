---
title: Agent Instruct Order of Operations
description: Required utilization procedure when Agent Instruct is adopted—match, expertise, co-maintain docs/rules, lifecycle BUILD.
version: "1.3.2"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - README.md
  - FRAMEWORK.md
  - PARAMS.md
  - BUILD.md
  - PLAN-HOOK.md
  - HABITAT.md
  - ../rules/contracts.md
last_updated: "2026-08-21"
---

# Agent Instruct Order of Operations

Canonical **order of operations (O3)** for AI and humans when **Agent Instruct is in use**. This document is the utilization authority: task → primary expert pack → L4 law → co-maintain docs/rules → verify → evolve agents with features and core tasks.

Standing hub checklist (all maintenance turns): [RULES — Operator enforcement](../RULES.md#operator-enforcement).

**Related:** [README.md](./README.md) · [FRAMEWORK.md](./FRAMEWORK.md) · [PARAMS.md](./PARAMS.md) · [BUILD.md](./BUILD.md) · [PLAN-HOOK.md](./PLAN-HOOK.md) · [HABITAT.md](./HABITAT.md) · [contracts](../rules/contracts.md)

---

## Summary

| Must |
|------|
| Run O3 **when Instruct is adopted** (PLAN Agent models and/or tracked packs under `kit/agents/generated/`); load **one primary** expert pack and open the expertise map before inventing paths/tools |
| Co-update **canonical L4** docs/rules; maintain root **`docs/`** when research/plan/build applies; update `docs/WORKBOARD.md` when multi-phase work advances |
| Evolve agents (PLAN + BUILD) when features, packages, surfaces, languages, or durable task classes appear |
| Prefer in-repo law; external URLs are **citations** (guidance) only — never overlays or substitute law |
| When isolating work: parent owns complete / board / tracker; one primary child; children do not invent law in prose |

**Bare adopt:** no Agent models section and no Instruct packs → **skip O3**; use L4 only ([PLAN dual path](./PLAN-HOOK.md#plan-dual-path)).

**Enforcement:** Policy + AI convention (required procedure when Instruct is in use). **Not** a Domain A/B style or SAST gate. Real completion gates: [verification-and-ops](../rules/verification-and-ops.md#completion-rule).

**“Automatic” maintenance** in this kit means: **mandatory O3 procedure** on each task when Instruct is adopted—not a background daemon or host job.

---

## Contents

1. [When O3 applies](#when-o3-applies)
2. [Order of operations (O3)](#order-of-operations-o3)
3. [Expertise and trust](#expertise-and-trust)
4. [Co-maintain documents and rules](#co-maintain-documents-and-rules)
5. [Lifecycle: features and core tasks](#lifecycle-features-and-core-tasks)
6. [Creating a new expert persona](#creating-a-new-expert-persona)
7. [Parent / child (when work is isolated)](#parent--child-when-work-is-isolated)
8. [Report shape](#report-shape)
9. [Anti-patterns](#anti-patterns)
10. [Document history](#document-history)

---

## When O3 applies

| Condition | Action |
|-----------|--------|
| Root `PLAN.md` has **Agent models** (Instruct in use) | **Run O3** |
| Tracked packs under `kit/agents/generated/` and project uses agents | **Run O3** |
| Bare kit adopt: no Agent models, no agent packs | **Skip O3**; open L4 (`kit/RULES.md`) only ([PLAN dual path](./PLAN-HOOK.md#plan-dual-path)) |
| First adopt with agents intended but no packs yet | Run [BUILD](./BUILD.md) first, then O3 |

Detect Instruct early (step 0). Do not force O3 on bare adopters.

---

## Order of operations (O3)

```text
0  DETECT Instruct (PLAN Agent models and/or generated packs)
   → bare adopt → STOP O3; use L4 only
1  READ PLAN Agent models (active / disabled / overlays / tuning / emphasize)
2  OPEN L4 early: kit/RULES.md authority map + language inventory + verification table
3  MATCH task → catalog/generated descriptions + triggers
   → respect disabled, negative_triggers, stage gates; apply tuning.emphasize
4  LOAD one primary pack (kit/agents/generated/<id>.md)
   → if missing and Instruct intended → BUILD first
5  COMPOSE: load compose_with only if task clearly needs a second concern
6  LOAD Expertise map: authority_paths + references (repo + external citations)
7  EXECUTE pack Procedure under L4; on conflict L4 wins
8  CO-MAINTAIN: update canonical L4 owner docs/rules; maintain root docs/ when research/plan/build applies; update docs/WORKBOARD.md when multi-phase work advances
9  LIFECYCLE: if feature/surface/language/task-class growth → PLAN delta + BUILD
10 VERIFY: pack verify[] + declared Domain A/B; STOP if fail/skip
11 REPORT: primary id, compose, docs touched, BUILD y/n, gates
```

| Step | Detail | Owner docs |
|------|--------|------------|
| **0** | Detect Instruct; bare path skips O3 | [PLAN-HOOK](./PLAN-HOOK.md), [RULES](../RULES.md) |
| **1** | Control surface: enablement and tuning | [PLAN-HOOK](./PLAN-HOOK.md) |
| **2** | Authority map, inventory, verify table before inventing paths/tools | [RULES](../RULES.md), [security](../rules/security.md), [verification-and-ops](../rules/verification-and-ops.md) |
| **3** | Score triggers/descriptions; one best primary | [RUNTIME](./RUNTIME.md), [CATALOG](./CATALOG.md) |
| **4** | Thin pack body under `generated/` | [RUNTIME](./RUNTIME.md), [BUILD](./BUILD.md) |
| **5** | Never auto-load full compose matrix | [FRAMEWORK](./FRAMEWORK.md#compose-default-required) |
| **6** | Expert references; external = citation only | [PARAMS](./PARAMS.md), [Expertise and trust](#expertise-and-trust) |
| **7** | Role procedure; L4 wins | Pack, [FRAMEWORK](./FRAMEWORK.md) |
| **8** | Same-change-set contracts | [contracts](../rules/contracts.md) |
| **9** | Evolve agents with product growth | [Lifecycle](#lifecycle-features-and-core-tasks), [BUILD](./BUILD.md) |
| **10** | Declared gates + pack verify | [verification-and-ops](../rules/verification-and-ops.md#completion-rule) |
| **11** | Session summary | [Report shape](#report-shape) |

Matching detail (activation modes, budgets, negative triggers): [RUNTIME.md](./RUNTIME.md).

---

## Expertise and trust

Every pack is an **expert view** for a tailored job—not a freeform chat persona. Expertise is documented, not improvised. Schema: [PARAMS.md](./PARAMS.md).

| Surface | Role | Trust |
|---------|------|--------|
| `authority_paths` | Primary **in-repo law** (required) | **Law** — must follow |
| In-repo `references` / Expertise map | Deeper markdown, guides, schemas | Law if listed as authority; else supporting |
| External `https://` citations | Standards and vendor docs | **Guidance only** — never override L4 |
| PLAN overlays | Repo-relative pack sources only | Privileged project instruction |

| Rule | Detail |
|------|--------|
| Law wins | If pack prose or external citation conflicts with L4, **L4 wins**; fix the pack via BUILD |
| No remote overlays | BUILD must not fetch overlay paths over `http(s)` ([PLAN-HOOK trust](./PLAN-HOOK.md#trust-boundary)) |
| Citations allowed | External URLs only under `references` / Expertise map, each with a **purpose** note |
| No remote fetch into tree | BUILD does not download external pages into the repository |
| Prefer stable URLs | Versioned or long-lived standards docs when possible |
| Curated, not exhaustive | Few high-signal links beat large link dumps |

---

## Co-maintain documents and rules

When Instruct is in use, document and rule maintenance is **part of every task**, not a later phase.

| Trigger | Required maintenance |
|---------|----------------------|
| Behavior or public surface change | Update **canonical** owner in authority map ([contracts](../rules/contracts.md)) same change set |
| Research / multi-step plan / build notes | Scaffold/update root `docs/` modules ([ai-docs-workspace](../rules/ai-docs-workspace.md)); keep index honest |
| Multi-phase program / phase ship | Register or update `docs/WORKBOARD.md` same change set ([workboard](../rules/workboard.md)); annex only if linked from the board |
| Finding becomes product promise | Promote from `docs/` to L4 owner; leave pointer if useful |
| Path add/remove/rename | Update inventory/catalog if maintained; authority map if owner paths change |
| Language added/removed | Update language surface inventory + verification rows |
| Release-worthy change | Project root `CHANGELOG.md` entry |
| Agent enablement / expertise / templates change | PLAN Agent models as needed + [BUILD](./BUILD.md) |
| Declared gate change | Update verification table; align pack `verify[]` on BUILD |

Packs **do not own** contracts. They **point** at owners via `authority_paths` and require the operator to update those owners.

---

## Lifecycle: features and core tasks

Agent/Persona development **tracks product growth**. When durable work changes shape, update the agent system in the same initiative (PLAN + BUILD), not only in chat.

| Trigger | Required agent action |
|---------|----------------------|
| New package / product area | Ensure implementer/docs/security (as applicable) `authority_paths` and expertise cover it; BUILD regen |
| New public CLI/API/behavior | Co-update product contract; align pack `verify[]` |
| New language in inventory | Update security/style verify; often enable or emphasize `security` |
| New **durable task class** (e.g. release train, data migration, design review) | Create adopter pack or overlay; PLAN `active_models` += id; BUILD; track `generated/<id>.md` |
| Feature complete / stage advance | Review `stage_gates`; disable `adopter` post-adopt; adjust `tuning.emphasize` |
| Kit upgrade | Merge `kit/agents/`; preserve PLAN Agent models; BUILD with [source load order](./BUILD.md#source-load-order) |
| Authority map or inventory change | BUILD regen for affected kit seeds; review adopter packs |

| Durable vs session | Action |
|--------------------|--------|
| Should matter next month | PLAN Agent models → BUILD |
| This task only | Temporary compose; do not edit PLAN unless asked |

Detail: [PLAN-HOOK mid-project](./PLAN-HOOK.md#mid-project-adjustment-procedure) · [BUILD regen triggers](./BUILD.md#regen-triggers).

---

## Creating a new expert persona

For a **new durable** project agent (explicit PLAN/user intent only):

```text
1. Define job: id, description, triggers, negative_triggers
2. Write expertise map: authority_paths (repo law) + references (repo + external citations with purpose)
3. Set verify[] from inventory/verification table only (never invent gates)
4. Emit kit/agents/generated/<id>.md (portability: adopter or platform)
5. Add id to PLAN active_models (and overlays path if source lives outside generated/)
6. Optional: authority map row if the persona is a durable discoverable surface
7. Run BUILD validation rules (PARAMS)
8. Track thin pack in git
```

Do **not** invent kit CATALOG defaults for product-only roles. Do **not** create skeleton packs for unknown ids during routine UPGRADE regen ([BUILD source load order](./BUILD.md#source-load-order)).

---

## Parent / child (when work is isolated)

Optional. Applies only when Instruct is in use **and** the operator isolates a concern (host adapter, second session, or equivalent). Kit names **duties**, not spawn APIs. Habitat discovery: [HABITAT.md](./HABITAT.md).

Bare adopt: skip this section; use L4 + [Operator enforcement](../RULES.md#operator-enforcement) ([PLAN dual path](./PLAN-HOOK.md#plan-dual-path)).

| Parent | Child |
|--------|--------|
| Detect Instruct; match **one** primary pack ([O3](#order-of-operations-o3)) | Receive that pack + listed `authority_paths` only |
| Open L4 (map, inventory, verify table) **before** isolating work | Do not invent law, tools, or folders; **L4 wins** |
| Multi-phase: update **`docs/WORKBOARD.md`**; give the child a **phase id** | Execute that phase only; do not mark the program `done` |
| Own completion, CHANGELOG, Progress Tracker, board SHA | Return: files touched, docs updated, gates run / skip / fail |
| **Serial** if two children would edit the same authority-map owner | **Parallel** only for independent packages or read-only review/research |
| `compose_with`: at most **one** extra child, and only if the task clearly needs that concern | Never load the full compose matrix |
| Isolation **hint** only: `same-tree` / `read-only` / `isolated-tree` | Host maps the hint; this kit does not name APIs |

**Must not:** children write durable policy only in chat; parent “merges” it without opening the authority-map owner. That is a second RULES tree.

The [workboard](../rules/workboard.md) is the DAG for multi-phase work—not the parent transcript.

---

## Report shape

Before claiming a task complete under Instruct, state briefly (may fold into the [RULES Progress Tracker](../RULES.md#progress-tracker-minimum-shape)):

| Field | Example |
|-------|---------|
| Primary pack | `implementer` |
| Compose (if any) | `docs-author` |
| Expertise opened | paths/URLs consulted |
| L4 docs updated | e.g. `packages/foo/CLI-GUIDE.md` |
| BUILD regen | yes/no |
| Gates | Domain A/B + pack verify result |

**Always (maintenance turns):** end work-advancing replies with the hub [Operator enforcement](../RULES.md#operator-enforcement) **Progress Tracker** (ordered tasks + status + commit SHA when committed).

If any declared gate or required verify item failed or was skipped → **STOP**; do not claim complete ([completion rule](../rules/verification-and-ops.md#completion-rule)).

---

## Anti-patterns

| Bad | Prefer |
|-----|--------|
| Skip pack match; generic answer only | O3 match → one primary expert pack |
| Load every pack every turn | One primary; compose only when needed |
| Child writes policy; parent merges only in chat | Open L4 owner; parent owns complete |
| Parallel children on the same contract file | Serial when the same map owner would change |
| Fan-out the full compose matrix | At most one extra child |
| Empty expertise / no references | Curated authority_paths + references with purpose |
| External URL as overlay or law | Citation under expertise; L4 wins |
| Feature ships; packs unchanged | Lifecycle PLAN + BUILD |
| Full persona essay in `kit/RULES.md` | Description + link to OPS/agents only |
| Claim complete with failed declared gate | STOP; remediate |
| Treat O3 as Domain A/B gate | Policy + AI convention; real gates = inventory |

More: [examples/anti-patterns.md](./examples/anti-patterns.md).

---

## Document history

| Version | Notes |
|---------|--------|
| 1.3.2 | Drop in-body document-version echo (kit 2.8.1) |
| 1.3.1 | Density restyle (kit 2.8.0); unique O3, parent/child duties, and Instruct procedure unchanged |
| 1.3.0 | Parent/child duties when work is isolated; workboard as DAG (kit 2.6.0) |
| 1.2.0 | Co-maintain workboard on multi-phase ship (kit 2.4.0) |
| 1.1.0 | Co-maintain root docs/ AI workspace when research/plan/build applies (kit 2.3.0) |
| 1.0.1 | Report shape ties to RULES Progress Tracker / operator enforcement (kit 2.2.1) |
| 1.0.0 | Initial O3 utilization authority (kit 2.2.0): match, expertise, co-maintain, lifecycle |
