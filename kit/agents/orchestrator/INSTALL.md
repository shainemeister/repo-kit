---
title: Orchestrator crew install
description: Copy the four host-agnostic crew packs into a target kit and register them as slash_only, disabled by default.
version: "1.0.0"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - ./README.md
  - ../CATALOG.md
  - ../PARAMS.md
last_updated: "2026-09-22"
---

# Orchestrator crew install

Surgical adopt of the crew packs into a repo that already has `kit/RULES.md`. Copy files only. Leave host launchers outside `kit/`.

## Procedure

1. **Copy packs** — Copy `README.md`, `INSTALL.md`, `router.md`, `scout.md`, `builder.md`, and `reviewer.md` into the target repo as `kit/agents/orchestrator/`. Do not overwrite unrelated `kit/agents/` files. Do not copy a host adapter into `kit/`.

2. **Register** — In the target `kit/agents/CATALOG.md` (create a minimal one if it is absent), add four entries, `enabled-by-default: false`, `activation: slash_only`:

   | id | role | enabled-by-default |
   |----|------|--------------------|
   | `orchestrator-router` | Decompose and dispatch the smallest set | false |
   | `orchestrator-scout` | Read-only exploration | false |
   | `orchestrator-builder` | Execute the authorized unit | false |
   | `orchestrator-reviewer` | Validate against kit law | false |

   Point each entry at `kit/agents/orchestrator/<name>.md`. Dispatch them explicitly. Do not add them to the default active set.

3. **Verify runtime law** — Open the target `kit/RULES.md`. Confirm the inventory and verify table are readable. Packs adopt that law at runtime.

## Done when

- `kit/agents/orchestrator/` contains the four packs, `README.md`, and this file.
- The catalog lists all four ids with `enabled-by-default: false` and `activation: slash_only`.
- Target `kit/RULES.md` opens for the crew to follow.
- No host launcher lives under that `kit/agents/orchestrator/` tree.
