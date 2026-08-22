---
title: Agent Runtime
description: Activation modes, size budgets, and matching guidance for Agent Instruct.
version: "1.3.2"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - README.md
  - OPS.md
  - FRAMEWORK.md
  - PARAMS.md
  - BUILD.md
  - PLAN-HOOK.md
  - ../RULES.md
last_updated: "2026-08-21"
---

# Agent Runtime

Agent Instruct assumes a **discovery + selective load** runtime: short **catalog** text is always available for matching; **pack bodies** load when activation rules fire. Always-on content stays minimal.

**Full task lifecycle** (match → expertise → co-maintain → verify → agent evolve): **[OPS.md](./OPS.md)** — required when Instruct is in use.

**Related:** [README.md](./README.md) · [OPS.md](./OPS.md) · [FRAMEWORK.md](./FRAMEWORK.md) · [PARAMS.md](./PARAMS.md) · [BUILD.md](./BUILD.md) · [PLAN-HOOK.md](./PLAN-HOOK.md) · [RULES.md](../RULES.md)

---

## Summary

| Must | Must not |
|------|----------|
| When Instruct is in use: follow **[OPS](./OPS.md)** O3 (match one primary expert pack before substantive work) | Skip pack match and improvise durable policy only in chat |
| Prefer `catalog_match` for kit defaults | Mark all roles `always_on` |
| Respect PLAN `disabled` and stage gates | Load disabled agents’ full bodies |
| Open authority map + inventory + pack expertise before inventing paths/tools | Implement from pack prose alone without L4 |
| Load **one primary** pack; compose only when needed | Inject all generated packs into standing context |
| STOP when declared gates fail; do not claim complete | Skip inventory gates and call the task done |
| Keep L0 thin | Require any host skill directory for kit correctness |

**Enforcement:** Policy + AI convention when Instruct is in use ([RULES](../RULES.md), [OPS](./OPS.md))—**not** a Domain A/B style or SAST gate. Real completion gates: [verification-and-ops](../rules/verification-and-ops.md#completion-rule). Bare adopt skips agents.

---

## Contents

1. [Activation modes](#activation-modes)
2. [Compose default](#compose-default)
3. [Size budgets](#size-budgets)
4. [Default paths](#default-paths)
5. [Harness notes (informative)](#harness-notes-informative)
6. [Matching guidance for AI](#matching-guidance-for-ai)
7. [Document history](#document-history)

---

## Activation modes

| Mode | When body loads | Kit default use |
|------|-----------------|-----------------|
| `always_on` | Every turn | Rare; L0 pointer only |
| `catalog_match` | Task matches description/triggers | **Default for roles** |
| `tool_gated` | Before using named tool family | Optional adopter |
| `slash_only` | Explicit invoke | Optional |
| `stage_gated` | Stage ≥ `stage_min` | Optional reviewer etc. |

**Negative triggers:** If the task matches a pack’s `negative_triggers` more strongly than `triggers`, do not load that pack as primary.

---

## Compose default

1. Score catalog descriptions / triggers against the user task.  
2. Load **one primary** pack.  
3. Load a `compose_with` pack **only** if the task clearly needs a second concern (e.g. release commit → maintainer + security).  
4. **Never** auto-load the full compose matrix because a hub matched.

Full ordered lifecycle: [OPS.md](./OPS.md).

---

## Size budgets

| Surface | Budget guidance |
|---------|-----------------|
| L0 always-on project rules | Prefer ≤ ~100–150 lines; ideal much less |
| Catalog description per agent | A few sentences + trigger list |
| Generated pack body | Scannable procedure + expertise map; avoid essay-length law |
| RULES map row | One short description + path |
| always_on_extra in PLAN | Few bullets only |
| Reference / expertise dumps | Not in always-on; open on demand |
| Markdown class budgets | Live in [MARKDOWN-STANDARD density](../MARKDOWN-STANDARD.md#density-force-and-incorporation); **L0 and pack budgets in this table stay unchanged** |

If over budget: split doctrine, move text to L4 docs, shorten pack to links.

---

## Default paths

| Artifact | Path |
|----------|------|
| Instruct (law of system) | `kit/agents/*.md` |
| Order of operations | `kit/agents/OPS.md` |
| Templates | `kit/agents/templates/` |
| Generated packs | `kit/agents/generated/` |
| Project catalog slice | `kit/agents/generated/CATALOG.project.md` |
| Optional host skills | Host-specific (adopter opt-in) |

---

## Harness notes (informative)

**Discovery (L0):** establish a thin habitat file where the host already looks — prefer root `AGENTS.md`. Procedure: [HABITAT.md](./HABITAT.md). Do not invent host folder trees.

Agent hosts may also discover skills from a host-specific directory when present. Implications:

| Goal | Approach |
|------|----------|
| Portable kit-only | Packs under `kit/agents/generated/` only |
| Host auto-match | Optionally **mirror** packs to the host skill format (adopter opt-in) |
| Avoid shipping regenerable mirrors | gitignore the host dir; keep `kit/agents` tracked |

Map AgentPack fields to the host’s skill/rule format without changing PARAMS schema. Prefer adapters over forking CATALOG. Kit correctness does **not** depend on any host skill directory.

Isolating a pack as a helper: [OPS parent/child](./OPS.md#parent--child-when-work-is-isolated) (duties only; no spawn-tool names).

---

## Matching guidance for AI

Prefer the full **[OPS O3](./OPS.md#order-of-operations-o3)** sequence. Matching-focused summary:

1. **If Agent Instruct is in use:** read PLAN Agent models (active / disabled / overlays / tuning) first. If bare adopt → skip packs; use L4 only.  
2. **Open L4 early:** `kit/RULES.md` authority map + language surface inventory + verification table (before inventing product paths or verify tools). L4 wins on conflict with pack text ([FRAMEWORK](./FRAMEWORK.md)).  
3. Score [CATALOG](./CATALOG.md) descriptions against the user task.  
4. Load **one primary** pack; add `compose_with` only if needed.  
5. Open pack **Expertise map** (`authority_paths` + `references`); external URLs are citations only.  
6. Follow pack Procedure; open `authority_paths` when making contract decisions; **co-maintain** L4 in the same change set.  
7. Run pack `verify[]` and declared Domain A/B gates for touched surfaces before “done.”  
8. **If any declared gate or required verify item fails or is skipped → STOP;** do not claim complete; list remediation ([completion rule](../rules/verification-and-ops.md#completion-rule)).  
9. If task is pure product domain and PLAN lists an overlay, prefer overlay + implementer (or project specialist), not random kit roles.  
10. For creative/design/modeling tasks with no kit seed match: use project-generated pack if present; otherwise BUILD a thin adopter pack grounded in map paths — do not invent gates.  
11. On feature / surface / language / durable task-class growth: PLAN Agent models delta + [BUILD](./BUILD.md) ([OPS lifecycle](./OPS.md#lifecycle-features-and-core-tasks)).  
12. Prefer opening `kit/agents/README.md` + [OPS](./OPS.md) + PLAN Agent models first; load FRAMEWORK/BUILD only when building or changing agents.

---

## Document history

| Version | Notes |
|---------|--------|
| 1.3.2 | Citation cap 3–7; CATALOG and completion-rule remain body cites (kit 2.8.1) |
| 1.3.1 | Markdown class budgets live in MARKDOWN-STANDARD; L0/pack budgets unchanged (kit 2.7.0) |
| 1.3.0 | Harness notes point at HABITAT; parent/child pointer (kit 2.6.0) |
| 1.2.0 | OPS O3 required when Instruct in use; expertise open; lifecycle pointer (kit 2.2.0) |
| 1.1.0 | Authority-map-first matching; STOP on failed gates; completion-rule cross-link |
| 1.0.0 | Initial runtime (kit 2.1.0) |
