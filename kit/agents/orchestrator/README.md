---
title: Orchestrator crew packs
description: Host-agnostic explicit-dispatch crew packs (Router, Scout, Builder, Reviewer) that adopt a target repo's installed kit at runtime.
version: "1.2.0"
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
last_updated: "2026-09-22"
---

# Orchestrator crew packs

Portable **Agent Instruct** packs for a parent session that dispatches a small crew. They live under `kit/agents/orchestrator/` and stay generic: role, procedure, and reporting contract only. No product paths, host CLIs, or gates are hard-coded here.

At runtime each agent opens the **target repository's** installed kit (`kit/RULES.md` and declared `kit/rules/*`) and adopts that law. On conflict, target `kit/RULES.md` wins.

These packs follow the AgentPack shape in [PARAMS.md](../PARAMS.md). Utilization still follows [OPS.md](../OPS.md): one primary pack per worker, and at most one extra when the task needs it. They are not a substitute for L4. They are optional `slash_only` seeds, not the default active set. Register them from [CATALOG.md](../CATALOG.md) only when a repo wants explicit dispatch.

The parent session is the dispatcher. It is not a host product.

---

## Summary

| Must |
|------|
| Keep packs lean and portable; load target `kit/` at runtime |
| Dispatch the smallest set: one primary; Reviewer after a mutation or when validation was asked |
| Run Scout beside Builder only when their path bounds do not share an authority-map owner |
| Every pack returns its Reporting contract to the parent session |
| On receiving a result: **digest → act → report** |
| The parent reads that report; the host chooses how to invoke the worker |
| On L3 vs L4 conflict, **target `kit/RULES.md` wins** |

---

## Contents

1. [Crew](#crew)
2. [Chain](#chain)
3. [Local catalog](#local-catalog)
4. [How to use](#how-to-use)
5. [Handoff](#handoff)
6. [Document history](#document-history)

---

## Crew

| Pack | Id | Role |
|------|-----|------|
| [router.md](./router.md) | `orchestrator-router` | Decompose; dispatch the smallest set; roll up reports |
| [scout.md](./scout.md) | `orchestrator-scout` | Read-only exploration and kit/repo mapping |
| [builder.md](./builder.md) | `orchestrator-builder` | Execute the authorized unit under target kit law |
| [reviewer.md](./reviewer.md) | `orchestrator-reviewer` | Validate against target `kit/RULES.md` |

---

## Chain

```text
parent session
      │
      ▼
   Router
      │
      ├─ one primary: Scout or Builder
      ├─ Reviewer only after a mutation, or when validation was asked
      └─ Scout beside Builder only when authority-map owners do not overlap
      │
      ▼
parent session   ◄── Reporting contract from each worker
```

- **Router** plans and dispatches. It does not replace Builder for product edits.
- **Scout** never writes.
- **Builder** mutates only inside the authorized unit. A missing in-scope L4 owner is `blocked`.
- **Reviewer** issues `pass` / `fail` / `blocked` with kit citations. A missing in-scope owner is `fail`.

---

## Local catalog

Crew-local index. Upstream registration is the optional subsection in [CATALOG.md](../CATALOG.md). These ids are not in the default active set.

| id | layer | activation | compose_with |
|----|-------|------------|--------------|
| `orchestrator-router` | playbook | slash_only | — |
| `orchestrator-scout` | role | slash_only | — |
| `orchestrator-builder` | role | slash_only | reviewer |
| `orchestrator-reviewer` | role | slash_only | — |

---

## How to use

1. Ensure the **target** repo has an adopted `kit/` (at least `kit/RULES.md`).
2. Copy this directory’s packs (see [INSTALL.md](./INSTALL.md)) or dispatch them from this tree.
3. Invoke **Router** explicitly for multi-step work. Pass the user goal and the target worktree.
4. Require each worker’s Reporting contract before closing the task.
5. Leave host launchers outside `kit/`. This directory does not ship one.

Bare adopt without Instruct still works: these packs run only when the parent dispatches them.

---

## Handoff

On receiving a result, the worker digests it, acts in role, and reports. The receiver repeats that duty.

```text
parent → Router → one primary (Scout or Builder) → parent
                 ↘ Reviewer, when required ──────↗
```

---

## Document history

| Version | Notes |
|---------|--------|
| 1.2.0 | `slash_only` smallest-set dispatch; host invocation stays outside this directory (kit 2.15.0) |
| 1.1.0 | Handoff digest/act/report; host launcher added (removed in 1.2.0) |
| 1.0.0 | Initial Router / Scout / Builder / Reviewer crew packs |
