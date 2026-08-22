---
title: Agent Instruct
description: Portable agent personas as expert views over repo-kit law—index, decisions, and start paths.
version: "1.2.3"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - OPS.md
  - HABITAT.md
  - FRAMEWORK.md
  - PARAMS.md
  - CATALOG.md
  - PLAN-HOOK.md
  - BUILD.md
last_updated: "2026-08-21"
---

# Agent Instruct

Portable way for AI (and humans) to **build and maintain modular expert agent personas** from project interest, **PLAN.md**, and the filled authority map—without replacing maintenance law or bloating `kit/RULES.md`.

**Related:** [OPS.md](./OPS.md) · [HABITAT.md](./HABITAT.md) · [FRAMEWORK.md](./FRAMEWORK.md) · [PARAMS.md](./PARAMS.md) · [CATALOG.md](./CATALOG.md) · [PLAN-HOOK.md](./PLAN-HOOK.md) · [BUILD.md](./BUILD.md)

---

## Summary

| Must |
|------|
| Treat packs as **views** over L4 law (`kit/RULES.md` + `kit/rules/*` + product contracts); do not invent a second RULES tree inside packs |
| Use root **PLAN.md** Agent models as the durable control surface when using agents |
| When Instruct is in use: follow **[OPS](./OPS.md)** O3 (one primary expert pack, expertise, co-maintain, lifecycle) |
| Prefer thin packs that **link** to authority paths + curated expertise; load **one primary** pack by catalog match |
| Evolve agents when features/core tasks grow (PLAN + BUILD); ship kit-default **portable seed roles** only |

**Enforcement:** Policy + AI convention when Instruct is in use ([RULES](../RULES.md) Musts, [OPS](./OPS.md), completion steps). **Not** a Domain A/B style or SAST gate. Bare adopt may skip agents ([PLAN dual path](./PLAN-HOOK.md#plan-dual-path)). Real completion gates: [verification-and-ops](../rules/verification-and-ops.md).

**“Automatic” doc/rule maintenance** means mandatory O3 procedure (not a background daemon).

---

## Contents

1. [Start here](#start-here)
2. [Layers (quick map)](#layers-quick-map)
3. [Document index](#document-index)
4. [Pack format note](#pack-format-note)
5. [When to use PLAN](#when-to-use-plan)
6. [Document history](#document-history)

---

## Start here

| You want to… | Open |
|--------------|------|
| **Run a task with agents (utilization)** | **[OPS.md](./OPS.md)** |
| Make a host find this kit (L0 habitat) | **[HABITAT.md](./HABITAT.md)** · [TEMPLATE-AGENTS](../templates/TEMPLATE-AGENTS.md) |
| Isolate work (parent / child duties) | [OPS parent/child](./OPS.md#parent--child-when-work-is-isolated) |
| Track multi-phase work (workboard) | [../rules/workboard.md](../rules/workboard.md) |
| Understand layers and hard rules | [FRAMEWORK.md](./FRAMEWORK.md) |
| See AgentPack schema / expertise validation | [PARAMS.md](./PARAMS.md) |
| List default seed agents | [CATALOG.md](./CATALOG.md) |
| Wire PLAN Agent models | [PLAN-HOOK.md](./PLAN-HOOK.md) · [examples/PLAN-agent-models-snippet.md](./examples/PLAN-agent-models-snippet.md) |
| Emit or regen packs | [BUILD.md](./BUILD.md) |
| Match / load activation detail | [RUNTIME.md](./RUNTIME.md) |
| First adopt | [SETUP.md](../SETUP.md) (Agent Instruct path) |
| Kit upgrade | [UPGRADE.md](../UPGRADE.md) |

---

## Layers (quick map)

```text
L0  Habitat: root AGENTS.md (thin pointer) — [HABITAT.md](./HABITAT.md)
L1  PLAN.md — Agent models (active / disabled / overlays / tuning)
L2  kit/agents/* Instruct (this tree — how to build & run; OPS utilization)
L3  kit/agents/generated/* AgentPacks (expert views — procedure + expertise + links)
L4  Canonical law — kit/RULES.md, kit/rules/*, product contracts
```

If L3 and L4 conflict, **L4 wins**. Fix the pack or BUILD; do not silently override law.

Detail: [FRAMEWORK.md](./FRAMEWORK.md). Utilization: [OPS.md](./OPS.md).

---

## Document index

| Doc | Role |
|-----|------|
| **[OPS.md](./OPS.md)** | **Order of operations** — match, expertise, co-maintain, lifecycle; parent/child when isolated |
| [HABITAT.md](./HABITAT.md) | L0 host discovery — `AGENTS.md` / thin aliases |
| [FRAMEWORK.md](./FRAMEWORK.md) | Layers, taxonomy, composition, hard rules |
| [PARAMS.md](./PARAMS.md) | AgentPack fields, expertise/references, validation, emit shapes |
| [CATALOG.md](./CATALOG.md) | Default portable seed agents |
| [PLAN-HOOK.md](./PLAN-HOOK.md) | PLAN.md Agent models contract + feature lifecycle |
| [BUILD.md](./BUILD.md) | Resolve active set; template fill; emit packs |
| [RUNTIME.md](./RUNTIME.md) | Activation, budgets, matching |
| [templates/](./templates/) | Seed role templates (PARAMS frontmatter + expertise) |
| [examples/](./examples/) | PLAN snippet, sample pack, anti-patterns |
| [generated/](./generated/) | Project-filled packs (`<id>.md`); track thin packs |

---

## Pack format note

| Artifact | Format |
|----------|--------|
| Instruct law docs (this README, FRAMEWORK, OPS, BUILD, …) | [MARKDOWN-STANDARD](../MARKDOWN-STANDARD.md) **including density** — Summary/Contents only when required |
| Templates and generated packs | **AgentPack** YAML frontmatter per [PARAMS.md](./PARAMS.md) + short markdown body (Must / Must not / Expertise map / Procedure) |

Do not force full MARKDOWN-STANDARD `doc_type` package shape onto every generated pack.

---

## When to use PLAN

**Instruct vs bare:** [PLAN dual path](./PLAN-HOOK.md#plan-dual-path). Durable intent (enable security agent, disable adopter, project overlays, new expert personas) belongs in PLAN—not only in session chat.

---

## Document history

| Version | Notes |
|---------|--------|
| 1.2.3 | Drop in-body document-version echo (kit 2.8.1) |
| 1.2.2 | Density restyle (kit 2.8.0); index, layers map, and AgentPack format note unchanged |
| 1.2.1 | Instruct law docs follow density (Summary/Contents when required); packs stay AgentPack (kit 2.7.0) |
| 1.2.0 | HABITAT L0 + parent/child start-here (kit 2.6.0) |
| 1.1.0 | OPS index; expert packs; O3 Musts; lifecycle (kit 2.2.0) |
| 1.0.0 | Initial Agent Instruct index (kit 2.1.0) |
