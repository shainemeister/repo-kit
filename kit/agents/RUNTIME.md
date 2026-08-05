---
title: Agent Runtime
description: Activation modes, size budgets, and matching guidance for Agent Instruct.
version: "1.1.0"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - README.md
  - FRAMEWORK.md
  - PARAMS.md
  - CATALOG.md
  - BUILD.md
  - PLAN-HOOK.md
  - ../RULES.md
  - ../rules/verification-and-ops.md
last_updated: "2026-08-05"
---

# Agent Runtime

Agent Instruct assumes a **discovery + selective load** runtime: short **catalog** text is always available for matching; **pack bodies** load when activation rules fire. Always-on content stays minimal.

**Document version:** 1.1.0  

**Related:** [README.md](./README.md) · [FRAMEWORK.md](./FRAMEWORK.md) · [PARAMS.md](./PARAMS.md) · [CATALOG.md](./CATALOG.md) · [BUILD.md](./BUILD.md) · [PLAN-HOOK.md](./PLAN-HOOK.md) · [RULES.md](../RULES.md)

---

## Summary

| Must | Must not |
|------|----------|
| Prefer `catalog_match` for kit defaults | Mark all roles `always_on` |
| Respect PLAN `disabled` and stage gates | Load disabled agents’ full bodies |
| Open authority map + inventory before inventing paths/tools | Implement from pack prose alone without L4 |
| Load **one primary** pack; compose only when needed | Inject all generated packs into standing context |
| STOP when declared gates fail; do not claim complete | Skip inventory gates and call the task done |
| Keep L0 thin | Require any host skill directory for kit correctness |

**Enforcement (v1):** Convention for agents—not a declared Domain A/B gate. Real completion gates: [verification-and-ops](../rules/verification-and-ops.md#completion-rule).

---

## Contents

1. [Summary](#summary)
2. [Activation modes](#activation-modes)
3. [Compose default](#compose-default)
4. [Size budgets](#size-budgets)
5. [Default paths](#default-paths)
6. [Harness notes (informative)](#harness-notes-informative)
7. [Matching guidance for AI](#matching-guidance-for-ai)
8. [Document history](#document-history)

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

---

## Size budgets

| Surface | Budget guidance |
|---------|-----------------|
| L0 always-on project rules | Prefer ≤ ~100–150 lines; ideal much less |
| Catalog description per agent | A few sentences + trigger list |
| Generated pack body | Scannable procedure; avoid essay-length law |
| RULES map row | One short description + path |
| always_on_extra in PLAN | Few bullets only |
| Reference dumps | Not in always-on; open on demand |

If over budget: split doctrine, move text to L4 docs, shorten pack to links.

---

## Default paths

| Artifact | Path |
|----------|------|
| Instruct (law of system) | `kit/agents/*.md` |
| Templates | `kit/agents/templates/` |
| Generated packs | `kit/agents/generated/` |
| Project catalog slice | `kit/agents/generated/CATALOG.project.md` |
| Optional host skills | Host-specific (adopter opt-in) |

---

## Harness notes (informative)

Agent hosts may discover skills from a skills directory when present on disk. Implications:

| Goal | Approach |
|------|----------|
| Portable kit-only | Use `kit/agents/generated/` only |
| Host auto-match | Optionally mirror packs to host skill format |
| Avoid shipping host skills to remote | gitignore host dir; keep kit/agents tracked |

Map AgentPack fields to the host’s skill/rule format without changing PARAMS schema. Prefer adapters over forking CATALOG. Kit correctness does **not** depend on any host skill directory.

---

## Matching guidance for AI

1. **If Agent Instruct is in use:** read PLAN Agent models (active / disabled / overlays / tuning) first.  
2. **Open L4 early:** `kit/RULES.md` authority map + language surface inventory + verification table (before inventing product paths or verify tools). L4 wins on conflict with pack text ([FRAMEWORK](./FRAMEWORK.md)).  
3. Score catalog descriptions against the user task.  
4. Load **one primary** pack; add `compose_with` only if needed.  
5. Follow pack Procedure; open `authority_paths` when making contract decisions.  
6. Run pack `verify[]` and declared Domain A/B gates for touched surfaces before “done.”  
7. **If any declared gate or required verify item fails or is skipped → STOP;** do not claim complete; list remediation ([completion rule](../rules/verification-and-ops.md#completion-rule)).  
8. If task is pure product domain and PLAN lists an overlay, prefer overlay + implementer (or project specialist), not random kit roles.  
9. For creative/design/modeling tasks with no kit seed match: use project-generated pack if present; otherwise BUILD a thin adopter pack grounded in map paths — do not invent gates.  
10. Prefer opening `kit/agents/README.md` + PLAN Agent models first; load FRAMEWORK/BUILD only when building or changing agents.

---

## Document history

| Version | Notes |
|---------|--------|
| 1.1.0 | Authority-map-first matching; STOP on failed gates; completion-rule cross-link |
| 1.0.0 | Initial runtime (kit 2.1.0) |
