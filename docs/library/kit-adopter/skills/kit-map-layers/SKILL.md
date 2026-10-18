---
title: Agent Instruct Framework
description: Agent Instruct is a layered context system. Thin always-on rules, PLAN as the control surface, these packs as the build and run playbook, generated AgentPacks as on-demand expert views, and canonical kit and product docs as the only law.
version: "1.10.1"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - ../../../../../kit/skills/README.md
  - ../kit-use-instruct/SKILL.md
  - ../kit-define-pack/SKILL.md
  - ../kit-author-plan/SKILL.md
  - ../kit-emit-packs/SKILL.md
  - ../kit-discover-host/SKILL.md
last_updated: "2026-10-17"
---

# Agent Instruct Framework

Agent Instruct is a layered context system. Thin always-on rules, PLAN as the control surface, these packs as the build and run playbook, generated AgentPacks as on-demand expert views, and canonical kit and product docs as the only law.

This file owns the layers, the job types, portability, activation, and size budgets. When the task is utilization, that skill is [kit-use-instruct](../kit-use-instruct/SKILL.md).

**Related:** [README.md](../../../../../kit/skills/README.md) · [kit-use-instruct](../kit-use-instruct/SKILL.md) · [kit-define-pack](../kit-define-pack/SKILL.md) · [kit-author-plan](../kit-author-plan/SKILL.md) · [kit-emit-packs](../kit-emit-packs/SKILL.md) · [kit-discover-host](../kit-discover-host/SKILL.md)

Related lists maintainer peers. Do not load them for this task.

---

## Summary

| This file owns | Elsewhere |
|----------------|-----------|
| L0–L4, and the rule that L4 wins | — |
| Job types and portability | — |
| Activation and size budgets | — |
| — | One task loads one skill: [path-pattern.md](../../../../../kit/rules/path-pattern.md) |
| — | Bare adopt: [kit-author-plan](../kit-author-plan/SKILL.md#plan-dual-path) |
| — | Utilization: [kit-use-instruct](../kit-use-instruct/SKILL.md#order-of-operations-o3) |
| — | Match rows: [skills index](../../../../../kit/skills/README.md#match-index) |

---

## Contents

1. [Layers (L0–L4)](#layers-l0l4)
2. [Job types (taxonomy)](#job-types-taxonomy)
3. [Portability](#portability)
4. [Activation modes](#activation-modes)
5. [Size budgets](#size-budgets)
6. [Default paths](#default-paths)
7. [Where the other rules live](#where-the-other-rules-live)
8. [Document history](#document-history)

---

## Layers (L0–L4)

```text
L0  Habitat (thin) — root AGENTS.md (or host alias)
    pointer: kit/RULES.md; PLAN + docs/library/kit-adopter/skills/kit-use-instruct/SKILL.md only if Instruct
         │
L1  PLAN.md
    mission, stages, non-goals, Agent models section (user knob)
         │
L2  Procedure packs
    calibration: docs/library/kit-adopter/skills/
    repeated verbs: kit/skills/
    match rows: kit/skills/README.md
         │
L3  Generated AgentPacks (docs/library/kit-adopter/generated/)
    role/doctrine views — short procedures + links
         │
L4  Canonical law
    kit/RULES.md, kit/rules/*, product PLAN/architecture/security docs
```

| Layer | Source of truth for… | Regenerated? |
|-------|----------------------|--------------|
| L0 | Session environment constraints | Rarely |
| L1 | What agents are active + user tuning | Human/AI edit |
| L2 | How to build/run agents | Kit upgrade |
| L3 | Task-shaped instructions | Yes, via BUILD |
| L4 | Contracts, paths, verify commands | Contract process |

If L3 and L4 conflict, L4 wins. Fix the pack or BUILD. Do not let the pack override the law.

---

## Job types (taxonomy)

| Type | Answers | Kit default use |
|------|---------|-----------------|
| **environment** | Where am I? What must I never break operationally? | Thin L0 only |
| **role** | How do I act as maintainer / implementer / security? | Yes — catalog core |
| **doctrine** | Hard pass/fail quality or correctness rules | Optional thin packs |
| **playbook** | Ordered steps for a capability (adopt, plan) | adopter, plan-author |
| **pipeline** | Scripts + deterministic postprocess | Not in kit defaults |
| **reference** | Large API/corpus lookup | Not in kit defaults (link out) |

Project-generated agents may use role, doctrine, or playbook. The kit catalog does not list product pipelines.

---

## Portability

| Value | Meaning | Lives in |
|-------|---------|----------|
| **kit** | Valid for any adopter of repo-kit | `kit/skills/` catalog and seed files |
| **adopter** | Product- or org-specific | PLAN overlays / generated packs |
| **platform** | Specific agent host | Optional adopter emit only |

A platform or adopter pack becomes a kit default only through an explicit kit design decision and a changelog entry.

---

## Activation modes

| Mode | When the body loads | Kit default use |
|------|---------------------|-----------------|
| `always_on` | Every turn | Rare. An L0 pointer only |
| `catalog_match` | The task matches the description or the triggers | Default for roles |
| `tool_gated` | Before a named tool family | Optional |
| `slash_only` | An explicit invoke | Optional |
| `stage_gated` | The stage is at least `stage_min` | Optional |

If the task matches `negative_triggers` more strongly than `triggers`, do not load that pack as primary.

One skill for the task. Utilization is [kit-use-instruct](../kit-use-instruct/SKILL.md#order-of-operations-o3). Open that skill only when utilization is the task. The same five values are the activation enum in [kit-define-pack](../kit-define-pack/SKILL.md#enums).

---

## Size budgets

| Surface | Budget |
|---------|--------|
| L0 always-on project rules | Prefer at most about 100–150 lines. Shorter is the aim |
| Catalog description per agent | A few sentences and a trigger list |
| Generated pack body | A scannable procedure and an expertise map |
| RULES map row | One short description and a path |
| `always_on_extra` in PLAN | A few bullets |
| Reference or expertise dumps | Open on demand |
| Markdown form | [MARKDOWN-STANDARD](../../../../../kit/MARKDOWN-STANDARD.md#author-checklist) |

When a surface is over budget, split the doctrine, move the text to an L4 document, or shorten the pack to links.

---

## Default paths

| Artifact | Path |
|----------|------|
| Instruct pack | `docs/library/kit-adopter/skills/kit-<action>/SKILL.md` |
| Utilization | `docs/library/kit-adopter/skills/kit-use-instruct/SKILL.md` |
| Match index | `kit/skills/README.md` |
| Host alias blank | `docs/library/kit-adopter/skills/kit-discover-host/template/host-alias.md` |
| Generated packs | `docs/library/kit-adopter/generated/` |
| Project catalog slice | `docs/library/kit-adopter/generated/CATALOG.project.md` |

A host mirror of those packs is [kit-discover-host](../kit-discover-host/SKILL.md#mirrors-vs-law). Kit correctness does not depend on a host skill directory.

---

## Where the other rules live

| Rule | Owner |
|------|--------|
| L4 wins on conflict with a pack | The layer rule above |
| One task loads one skill | [path-pattern.md](../../../../../kit/rules/path-pattern.md) |
| Utilization when Instruct is in use | [kit-use-instruct](../kit-use-instruct/SKILL.md#order-of-operations-o3) |
| Bare adopt skips BUILD and this procedure | [kit-author-plan](../kit-author-plan/SKILL.md#plan-dual-path) |
| Overlays stay in the repo | [kit-author-plan](../kit-author-plan/SKILL.md#trust-boundary) |
| Durable versus this session | [kit-author-plan](../kit-author-plan/SKILL.md#durable-vs-session-only) |
| Emit and regen | [kit-emit-packs](../kit-emit-packs/SKILL.md) |
| Pack schema and citations | [kit-define-pack](../kit-define-pack/SKILL.md) |
| Activation and size budgets | This file |
| Match rows | [skills index](../../../../../kit/skills/README.md#match-index) |
| Completion | [kit/RULES.md](../../../../../kit/RULES.md#completion) |
| Same change set | [contracts.md](../../../../../kit/rules/contracts.md#same-change-set-rule) |
| Hub stays a map | [kit/RULES.md](../../../../../kit/RULES.md) |

---

## Document history

| Version | Notes |
|---------|--------|
| 1.10.1 | One task loads one skill cites path-pattern.md |
| 1.10.0 | Calibration packs and generated packs live under `docs/library/kit-adopter/` |
| 1.9.0 | This file owns activation, size budgets, and the default paths. `kit-load-packs` is gone |
| 1.8.0 | Home is `kit/skills/kit-<action>/`. A blank is `template/<noun>.md` |
| 1.7.0 | Kit packs are `skills/kit-<action>/`. Ids stay. `kit-adopter` and `generated/` stay |
| 1.6.0 | This file keeps L0–L4, job types, and portability. Composition and size cite their owners |
| 1.5.1 | Layer list and owner labels use the action directories. Ids stay |
| 1.5.0 | One skill per task. Compose examples no longer name a second pack to load |
| 1.4.1 | Pack path is `skills/<action>/SKILL.md` |
| 1.4.0 | This file owns L0–L4. Compose, hard-rule reprints, and the size table cite their owners |
| 1.3.0 | Layer map names the `skills/` procedure files |
| 1.2.2 | Drop in-body document-version echo (kit 2.8.1) |
| 1.2.1 | Density restyle (kit 2.8.0); unique L0–L4 layers, L4-wins, and size/activation principles unchanged |
| 1.2.0 | L0 is AGENTS.md (habitat); compose = at most one extra child (kit 2.6.0) |
| 1.1.0 | O3 required when Instruct in use; expertise principle; OPS link (kit 2.2.0) |
| 1.0.1 | STOP on failed gates; overlays repo-relative; preserve adopter packs; RULES not foldable |
| 1.0.0 | Initial framework (kit 2.1.0) |
