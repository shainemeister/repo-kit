---
title: Agent Instruct
description: Portable agent personas as views over repo-kit law—index, decisions, and start paths.
version: "1.0.0"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - FRAMEWORK.md
  - PARAMS.md
  - CATALOG.md
  - PLAN-HOOK.md
  - BUILD.md
  - RUNTIME.md
  - ../RULES.md
  - ../SETUP.md
  - ../../README.md
last_updated: "2026-08-05"
---

# Agent Instruct

Portable way for AI (and humans) to **build and maintain modular agent personas** from project interest, **PLAN.md**, and the filled authority map—without replacing maintenance law or bloating `kit/RULES.md`.

**Document version:** 1.0.0  

**Related:** [FRAMEWORK.md](./FRAMEWORK.md) · [PARAMS.md](./PARAMS.md) · [CATALOG.md](./CATALOG.md) · [PLAN-HOOK.md](./PLAN-HOOK.md) · [BUILD.md](./BUILD.md) · [RUNTIME.md](./RUNTIME.md) · [RULES.md](../RULES.md)

---

## Summary

| Must | Must not |
|------|----------|
| Treat packs as **views** over L4 law (`kit/RULES.md` + `kit/rules/*` + product contracts) | Invent a second RULES tree inside packs |
| Use root **PLAN.md** Agent models as the durable control surface when using agents | Hide enablement only in chat memory |
| Prefer thin packs that **link** to authority paths | Paste multi-thousand-line rule modules into every pack |
| Load **one primary** pack by catalog match | Auto-load the full compose matrix |
| Ship kit-default **portable seed roles** only | Ship product/game/CAD pipelines as kit defaults |

**Enforcement (v1):** Agent Instruct is a **convention** (docs + AI-executed BUILD). It is **not** a declared Domain A/B style or SAST gate. See [verification-and-ops](../rules/verification-and-ops.md) for real completion gates.

---

## Contents

1. [Summary](#summary)
2. [Start here](#start-here)
3. [Layers (quick map)](#layers-quick-map)
4. [Document index](#document-index)
5. [Pack format note](#pack-format-note)
6. [When to use PLAN](#when-to-use-plan)
7. [Document history](#document-history)

---

## Start here

| You want to… | Open |
|--------------|------|
| Understand layers and hard rules | [FRAMEWORK.md](./FRAMEWORK.md) |
| See AgentPack schema / validation | [PARAMS.md](./PARAMS.md) |
| List default seed agents | [CATALOG.md](./CATALOG.md) |
| Wire PLAN Agent models | [PLAN-HOOK.md](./PLAN-HOOK.md) · [examples/PLAN-agent-models-snippet.md](./examples/PLAN-agent-models-snippet.md) |
| Emit or regen packs | [BUILD.md](./BUILD.md) |
| Match / load at runtime | [RUNTIME.md](./RUNTIME.md) |
| First adopt | [SETUP.md](../SETUP.md) (Agent Instruct path) |
| Kit upgrade | [UPGRADE.md](../UPGRADE.md) |

---

## Layers (quick map)

```text
L0  Thin always-on project rules (point at PLAN + this index)
L1  PLAN.md — Agent models (active / disabled / overlays / tuning)
L2  kit/agents/* Instruct (this tree — how to build & run)
L3  kit/agents/generated/* AgentPacks (views — short procedure + links)
L4  Canonical law — kit/RULES.md, kit/rules/*, product contracts
```

If L3 and L4 conflict, **L4 wins**. Fix the pack or BUILD; do not silently override law.

Detail: [FRAMEWORK.md](./FRAMEWORK.md).

---

## Document index

| Doc | Role |
|-----|------|
| [FRAMEWORK.md](./FRAMEWORK.md) | Layers, taxonomy, composition, hard rules |
| [PARAMS.md](./PARAMS.md) | AgentPack fields, enums, validation, emit shapes |
| [CATALOG.md](./CATALOG.md) | Default portable seed agents |
| [PLAN-HOOK.md](./PLAN-HOOK.md) | PLAN.md Agent models contract |
| [BUILD.md](./BUILD.md) | Resolve active set; template fill; emit packs |
| [RUNTIME.md](./RUNTIME.md) | Activation, budgets, matching |
| [templates/](./templates/) | Seed role templates (PARAMS frontmatter) |
| [examples/](./examples/) | PLAN snippet, sample pack, anti-patterns |
| [generated/](./generated/) | Project-filled packs (`<id>.md`); track thin packs |

---

## Pack format note

| Artifact | Format |
|----------|--------|
| Instruct law docs (this README, FRAMEWORK, BUILD, …) | [MARKDOWN-STANDARD](../MARKDOWN-STANDARD.md) — frontmatter, Summary, Contents |
| Templates and generated packs | **AgentPack** YAML frontmatter per [PARAMS.md](./PARAMS.md) + short markdown body |

Do not force full MARKDOWN-STANDARD `doc_type` package shape onto every generated pack.

---

## When to use PLAN

| Path | PLAN.md | BUILD |
|------|---------|--------|
| **With Agent Instruct** | **Required** — include `## Agent models` | Run after adopt and when enablement changes |
| **Bare kit adopt** | Optional | Skip if no Agent models section |

Durable intent (enable security agent, disable adopter, project overlays) belongs in PLAN—not only in session chat. See [PLAN-HOOK.md](./PLAN-HOOK.md).

---

## Document history

| Version | Notes |
|---------|--------|
| 1.0.0 | Initial Agent Instruct index (kit 2.1.0) |
