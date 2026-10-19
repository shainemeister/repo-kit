---
title: Active workboard
description: Open multi-phase work. One program is active at a time.
version: "1.2.0"
status: current
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - kit/RULES.md
  - kit/CHANGELOG.md
  - docs/README.md
last_updated: "2026-10-18"
---

# Workboard

Open multi-phase work. One program is active at a time.

**Updated:** —
**Primary program:** —
**Rules:** [kit/RULES.md](kit/RULES.md)

| Status | Meaning |
|--------|---------|
| `open` | Not started |
| `active` | Current phase (prefer exactly one) |
| `blocked` | Waiting on a decision |
| `done` | Finished |
| `cancelled` | Dropped |
| `deferred` | Parked |

Primary program `—` means no program is registered.

An authorized commit updates this file before that commit is created, and files it only for a named program with no phase `open`, `active`, or `blocked` ([contracts](kit/rules/contracts.md#boundaries)).

## Active program

| Field | Value |
|-------|--------|
| **Goal** | — |
| **Base** | — |
| **L4 docs to update** | — |
| **Optional annex** | — |
| **Smoke / gates** | — |

### Decisions

| Rule | Owner |
|------|--------|
| — | — |

### Phases

| ID | Work | Status | Notes |
|----|------|--------|-------|
| — | — | — | — |

### Progress log (newest first, max ~15 lines)

- —

## Deferred

| ID | Note |
|----|------|
| — | — |

## Not on this board

| Concern | Where |
|---------|--------|
| Session order | `AGENTS.md` |
| Agent notepad | `MEMORY.md` |
| Kit law | `kit/RULES.md` |

Check a phase off by setting its status. A registered program replaces the `—` rows.
