---
title: "files-law-2.9.0 — program annex"
description: File creation, placement, and naming law. Active only while the workboard Optional annex field points here.
version: "1.0.0"
status: current
audience:
  - ai-agents
  - maintainers
doc_type: plan
related:
  - ../../WORKBOARD.md
  - ../../../kit/rules/workboard.md
  - ./OOO.md
  - ../../../kit/RULES.md
last_updated: "2026-08-31"
---

# File law 2.9.0

**Board:** [docs/WORKBOARD.md](../../WORKBOARD.md) — this pack is active **only** while that board’s **Optional annex** field points here.  
Depth is `docs/plan/files-law-2.9.0/`; after archive, apply the substitution table in the [workboard archive checklist](../../../kit/rules/workboard.md#archive-annex-checklist).  
**Policy:** [kit/rules/workboard.md](../../../kit/rules/workboard.md)  
No root `PLAN.md` (Instruct off).

| Field | Value |
|-------|--------|
| **Program id** | `files-law-2.9.0` |
| **Status** | `active` |
| **Next phase** | `P6` |
| **L4 owners to update on ship** | `kit/rules/files.md` (new) · `kit/RULES.md` · `kit/rules/hygiene.md` · `kit/SETUP.md` · `kit/UPGRADE.md` · `kit/CHANGELOG.md` under `## repo-kit` — plus citation-only peers listed in [OOO.md](./OOO.md) |

## Contents of this annex

| File | Role |
|------|------|
| This README | Status, next phase, link **back** to the board |
| [OOO.md](./OOO.md) | Goals, adoptability invariants, master OOO, verify, risks |

## Rules

1. Do not duplicate the live phase table into a PLAN.md (none here).  
2. Do not write file-level patches for a later phase until that phase is `active` on the board.  
3. Do not start P1 until the user confirms this OOO (P1 stays `open`).  
4. On program complete: `git mv` this folder to `docs/plan/archive/files-law-2.9.0/` and promote promises to L4.
