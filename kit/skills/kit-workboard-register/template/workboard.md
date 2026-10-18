---
title: "Workboard blank"
description: "Blank for root WORKBOARD.md. Copy the fenced body when that file is missing, and when a finished program is archived."
version: "1.0.1"
status: current
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - ../../../RULES.md
  - ../../../rules/contracts.md
  - ../../../rules/files.md
  - ../../../../WORKBOARD.md
last_updated: "2026-10-17"
---

# Workboard blank

Blank for root WORKBOARD.md. Copy the fenced body when that file is missing, and when a finished program is archived.

**Related:** [RULES](../../../RULES.md) · [contracts](../../../rules/contracts.md) · [files](../../../rules/files.md) · [live board](../../../../WORKBOARD.md)

The fence is the root file. Remove the fence when you copy it. Links inside the fence are written for that root file.

## Body

```markdown
---
title: Active workboard
description: Open multi-phase work. One program is active at a time.
version: "1.0.0"
status: current
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - kit/RULES.md
  - kit/CHANGELOG.md
  - docs/README.md
last_updated: "YYYY-MM-DD"
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

Every commit updates this file before the session closes ([contracts](kit/rules/contracts.md#boundaries)). When every phase is `done`, that update files a copy at `docs/plan/archive/<program>/WORKBOARD.md` and replaces this file with the blank.

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

| ID | Work | Status | Commit | Notes |
|----|------|--------|--------|-------|
| — | — | — | — | — |

### Progress log (newest first, max ~15 lines)

- —

## Deferred

| ID | Note |
|----|------|
| — | — |

## Recently completed (max 5 programs)

| Program | Ended | L4 pointer |
|---------|-------|------------|
| — | — | — |

## Not on this board

| Concern | Where |
|---------|--------|
| Session order | `AGENTS.md` |
| Agent notepad | `MEMORY.md` |
| Kit law | `kit/RULES.md` |

Check a phase off by setting its status. A registered program replaces the `—` rows.
```
