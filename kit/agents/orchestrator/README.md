---
title: Orchestrator crew packs
description: Generic Master Orchestrator agent packs (Router, Scout, Builder, Reviewer) that adopt a target repo's installed kit at runtime.
version: "1.1.0"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - ../README.md
  - ../OPS.md
  - ../PARAMS.md
  - ../CATALOG.md
  - ../FRAMEWORK.md
last_updated: "2026-09-21"
---

# Orchestrator crew packs

Portable **Agent Instruct** packs for a Master Orchestrator crew. They live under `kit/agents/orchestrator/` and stay **generic**: role, procedure, and reporting contract only. No product-specific paths, tools, or gates are hard-coded here.

At runtime each agent opens the **target repository's** installed kit (`kit/RULES.md` and declared `kit/rules/*`) and adopts that law dynamically.

These packs follow the same AgentPack shape as [PARAMS.md](../PARAMS.md) and seed templates under [templates/](../templates/). Utilization still follows [OPS.md](../OPS.md) (one primary pack per worker). They are **not** a substitute for L4 law and are **not** registered in the upstream [CATALOG.md](../CATALOG.md) by default — enable them via PLAN overlays or explicit Master Orchestrator dispatch.

---

## Summary

| Must |
|------|
| Keep packs lean and portable; load target `kit/` at runtime |
| Chain: **Router first** → **Scout** and **Builder** (parallel when safe) → **Reviewer last** |
| Every pack reports back to the **Master Orchestrator** using its Reporting contract |
| On receiving a result: **digest → act → report / handoff** to the next agent or Master Orchestrator |
| CLI helpers use `grok … -p … --output-format streaming-json` (parse JSON; no tty scrape) |
| On L3 vs L4 conflict, **target `kit/RULES.md` wins** |

---

## Contents

1. [Crew](#crew)
2. [Chain](#chain)
3. [Local catalog](#local-catalog)
4. [How to use](#how-to-use)
5. [Handoff](#handoff)
6. [JSON invocation (Grok Build CLI)](#json-invocation-grok-build-cli)
7. [Document history](#document-history)

---

## Crew

| Pack | Id | Role |
|------|-----|------|
| [router.md](./router.md) | `orchestrator-router` | Decompose task; dispatch workers; roll up reports |
| [scout.md](./scout.md) | `orchestrator-scout` | Read-only exploration and kit/repo mapping |
| [builder.md](./builder.md) | `orchestrator-builder` | Execute authorized changes under target kit law |
| [reviewer.md](./reviewer.md) | `orchestrator-reviewer` | Validate against target `kit/RULES.md`; last gate |

---

## Chain

```text
Master Orchestrator
        │
        ▼
     Router          (always first)
      /        \
   Scout      Builder   (parallel when units do not conflict)
      \        /
      Reviewer          (always last when Builder ran; optional after Scout-only)
        │
        ▼
Master Orchestrator   ◄── all Reporting contracts
```

- **Router** plans and dispatches; does not replace Builder for product edits.
- **Scout** never writes.
- **Builder** mutates only within authorized scope.
- **Reviewer** issues `pass` / `fail` / `blocked` with kit citations.

---

## Local catalog

Crew-local index (not merged into upstream CATALOG unless you choose to):

| id | layer | activation | compose_with |
|----|-------|------------|--------------|
| `orchestrator-router` | playbook | catalog_match | scout, builder, reviewer |
| `orchestrator-scout` | role | catalog_match | router |
| `orchestrator-builder` | role | catalog_match | router, reviewer |
| `orchestrator-reviewer` | role | catalog_match | router |

---

## How to use

1. Ensure the **target** repo has an adopted `kit/` (at least `kit/RULES.md`).
2. Point Master Orchestrator at this directory (or copy these packs into the target repo's `kit/agents/orchestrator/`).
3. Start with **Router** for multi-step work; pass the user goal and target worktree.
4. Require each worker's Reporting contract before closing the task.
5. Optional PLAN: add these ids under Agent models overlays without editing upstream CATALOG.

Bare adopt without Instruct elsewhere still works: treat these as explicit slash/dispatch packs.


---

## Handoff

On receiving a result, each agent **digests** it, **acts** in role, then **reports** — handing the synthesized output to the next agent in the chain or back to the Master Orchestrator. Receivers repeat: digest, act, report.

```text
MO → Router → (Scout ∥ Builder) → Reviewer → MO
         ↑____________handoff / report_______________|
```

---

## JSON invocation (Grok Build CLI)

Prefer headless streaming JSON (see [bots/invoke.sh](./bots/invoke.sh)):

```bash
grok -p "…" --output-format streaming-json
grok --agent=kit/agents/orchestrator/bots/scout.agent.md --cwd=<target> \
     -p "…" --output-format streaming-json

# Wrapper (parses stream → JSON object on stdout):
./bots/invoke.sh scout /path/to/target-repo "Map kit + version"
```

Do not scrape interactive TUI output for automation.

---

## Document history

| Version | Notes |
|---------|--------|
| 1.1.0 | Handoff digest/act/report; streaming-json tooling; invoke.sh JSON default |
| 1.0.0 | Initial Router / Scout / Builder / Reviewer crew packs |
