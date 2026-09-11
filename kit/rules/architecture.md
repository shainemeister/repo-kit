---
title: Architecture and Boundaries
description: Package composition, entry points, runtime separation, dependency policy, and source layout (cite files.md).
version: "1.2.0"
status: current
audience:
  - developers
  - architects
doc_type: other
related:
  - ../RULES.md
  - ./contracts.md
  - ./security.md
  - ./files.md
last_updated: "2026-09-10"
---

# Architecture and Boundaries

Package composition, entry points, runtime separation, dependency policy, and source layout (cite [files.md](./files.md)).

**Related:** [RULES.md](../RULES.md) · [contracts.md](./contracts.md) · [security.md](./security.md) · [files.md](./files.md)

---

## Summary

Keep packages composable at the workflow layer. Document intentional cross-stack boundaries. Prefer schema- and config-driven behavior over buried hard-coding.

---

## Architecture rules

| Rule | Detail |
|------|--------|
| **Clear entry points** | Prefer documented CLI launchers, `__main__` modules, or public package APIs over ad-hoc scripts as the primary surface |
| **Composition** | Join packages at the **workflow** layer (files, CLI, messages), not by merging unrelated engines into one process unless that is an explicit design |
| **Runtime separation** | Do not call one stack from another in product code without an intentional, documented boundary |
| **Dependencies** | Declare the dependency policy in README and security docs (e.g. stdlib-only, locked set, or full package index). No hidden downloads or telemetry in product paths unless documented ([security baseline](./security.md#security-baseline) when that file exists) |
| **Domain hard-coding** | Prefer schema-, config-, or interface-driven behavior over hard-coded business field lists buried in engines |
| **Source layout** | Programming source home and path shape: [files.md](./files.md) |

Fill project-specific rows (runtimes, “never do X”) in a thin overlay or by expanding this table for the repo.

Public automation surfaces (CLI, API, schema fields) must follow [contracts.md](./contracts.md#same-change-set-rule) for co-updates and versioning.

---

## Document history

| Version | Notes |
|---------|--------|
| 1.2.0 | Source-layout row cites files.md (kit 2.14.0); unique architecture rules otherwise unchanged |
| 1.1.0 | Density restyle; rules unchanged |
| 1.0.0 | Extracted from RULES 1.4.1 for kit 2.0; data/contract rules moved to contracts.md |
