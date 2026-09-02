---
title: "workboard-packet-2.11.1 — order of operations"
description: Goals, freeze, phased OOO, verification, and risks for a sub-agent phase packet and execution-precision tighten. Open while this program is workboard primary; not a second workboard module.
version: "1.0.0"
status: draft
audience:
  - ai-agents
  - maintainers
doc_type: plan
related:
  - ./README.md
  - ../../WORKBOARD.md
  - ../../../kit/rules/workboard.md
  - ../../../kit/templates/docs/plan/TEMPLATE-OOO.md
  - ../../../kit/agents/OPS.md
  - ../../../kit/UPGRADE.md
last_updated: "2026-09-01"
---

# Workboard packet 2.11.1 — order of operations

**Board:** [docs/WORKBOARD.md](../../WORKBOARD.md)  
**Annex index:** [README.md](./README.md)

Program-level OOO. Per-phase file patches wait until that phase is `active`. Law ships as kit **2.11.1**. Current baseline: **2.11.0**. Instruct off. No root `PLAN.md`.

Body cites below use repo-root `kit/…` so they survive archive. `related:` and the Board line stay relative.

---

## Contents

1. [Goals and non-goals](#1-goals-and-non-goals)
2. [Constraint map](#2-constraint-map)
3. [Master order of operations](#3-master-order-of-operations)
4. [Verification](#4-verification)
5. [Docs and CHANGELOG on ship](#5-docs-and-changelog-on-ship)
6. [Risks and rollback](#6-risks-and-rollback)

---

## 1. Goals and non-goals

### Goals (must)

| ID | Goal |
|----|------|
| W1 | Unique owner: `kit/rules/workboard.md` owns a **sub-agent phase packet** and execution **precision** (stale log, archive cites, Notes, SHA fill). Hub Must index **unchanged**. |
| W2 | **Keep** the full chat Progress Tracker (ordered tasks · status · SHA). Continuity overlap with the board is **intentional**. Do not collapse the tracker because a board exists. |
| W3 | **Keep** WORKBOARD + annex OOO as the execution pair. When an annex exists, fill the **active phase brief** (current state · issue · fix · allow/deny · exit) **before** isolating/spawning that phase. |
| W4 | Templates teach the packet (`TEMPLATE-OOO`, program-README next-phase match, board Notes / log). |
| W5 | Adoptability: merge policy; **preserve** filled `docs/WORKBOARD.md` and live annexes. Missing historical briefs are **not** a failed complete. |
| W6 | Ship kit **2.11.1**. |

### Non-goals (must not in this program)

| Item | Why |
|------|-----|
| Collapse Progress Tracker to one row | User-rejected; tracker is continuity ([RULES](../../../kit/RULES.md) operator step 6) |
| New hub Must, new map row, or `docs/context/` tree | Map already names workboard; no second module |
| Require an annex for every two-phase edit | Default remains **board-only** when the phase table can hold the OOO |
| Change status vocabularies or merge tracker/board enums | Channels stay distinct; board wins “what is open” |
| Reopen files.md, MARKDOWN-STANDARD identity test, or landing README | Out of scope |
| Restyle filled adopter boards or paste live phases into PLAN / `AGENTS.md` | Existing Must nots |
| Enable Instruct / run BUILD in this repo | Instruct remains off |
| SHA-only commits as a new requirement | Existing: fill SHA on the **next** board edit; do not amend |

### Invariants (hard)

```text
1. Unique rule, one owner. workboard.md owns board/annex/archive/agent protocol.
   RULES.md owns the Progress Tracker minimum shape. Do not fork a second tracker.
2. Continuity overlap is allowed: full tracker AND phase table AND annex next-phase.
   Precision = no drift (same phase IDs; README next-phase matches board; no stale log).
3. Must table on workboard.md stays 5 rows. New unique rules: Must not + agent-protocol body.
4. related: 3–7. Last citation remains. Density: cite don't reprint.
5. One phase = one allow list + one exit. One active phase. Parent owns board + tracker.
6. Child receives: board row + filled brief + listed paths. Child does not edit the board
   or the tracker. Child does not load the full OOO unless the parent says so.
7. Upgrade: merge workboard policy; never overwrite a live board with the empty template.
8. SETUP ephemeral / UPGRADE durable. CHANGELOG on ship.
9. Surgical edits. No full-file rewrite of workboard.md.
10. Parent owns this board. Instruct off.
```

---

## 2. Constraint map

| Fact | Implication for the OOO |
|------|-------------------------|
| Kit **2.11.0**; workboard **1.1.0**; Must table has 5 | P1: no sixth Must; unique rules in Must not + Agent protocol |
| RULES already requires a full Progress Tracker | Cite it; do not rewrite the hub shape |
| OPS parent/child already gives a **phase id**; parent owns tracker | One-sentence cite of the brief; OPS `related:` already 7 — no extra peer |
| TEMPLATE-OOO says fill only the active brief; body is unstructured | Replace the brief with the packet table; keep “defer later phases” |
| Archive checklist already retargets README + Board lines | Add: OOO **body** prefers repo-root `kit/…` |
| This board’s progress log still has stale 2.11.0 `P2 active` lines | P0 dogfood: drop those lines when registering (phase table / complete line already have SHAs) |
| Default annex is optional | Unchanged. Packet is **required only when an annex exists** |
| Bare adopt / no multi-phase | Skip this module as today |

**Surfaces this program may touch**

| Surface | Paths |
|---------|--------|
| Policy (owner) | `kit/rules/workboard.md` |
| Templates | `kit/templates/docs/plan/TEMPLATE-OOO.md` · `TEMPLATE-PROGRAM-README.md` · `kit/templates/docs/WORKBOARD.md` |
| Cites | `kit/agents/OPS.md` (parent/child one sentence) · `kit/rules/ai-docs-workspace.md` (indexes ≠ phase table) |
| Adopt | `kit/SETUP.md` 4c one sentence · `kit/UPGRADE.md` |
| Instruct seed | `kit/agents/CATALOG.md` plan-author verify · `kit/agents/templates/plan-author.md` |
| History | `kit/CHANGELOG.md` under `## repo-kit` |
| Execution | `docs/WORKBOARD.md` · this annex · `docs/plan/README.md` |

Do **not** touch unless a later phase allows: `kit/RULES.md` Must table or tracker minimum shape, `kit/MARKDOWN-STANDARD.md`, `kit/rules/files.md`, HABITAT, AGENTS.md, landing README, `kit/examples/*`, BUILD, generated/, continuity, verification-and-ops.

### Allow / deny

| Phase | Allow | Deny |
|-------|--------|------|
| **P0** | `docs/WORKBOARD.md`, `docs/plan/workboard-packet-2.11.1/**`, `docs/plan/README.md` | Any `kit/**` law |
| **P1** | `kit/rules/workboard.md` **only** | Templates, SETUP, UPGRADE, OPS, CHANGELOG ship, RULES Musts, sixth Must row |
| **P2** | The three templates listed above | Landing/AGENTS templates; restyle of this repo’s filled board outline |
| **P3** | OPS parent/child one sentence; ai-docs-workspace one sentence | OPS `related:` rewrite; reprint of the packet table |
| **P4** | SETUP 4c; UPGRADE preserve/merge | Overwrite-live-board; complete-fail for old annexes without briefs |
| **P5** | CATALOG plan-author + `templates/plan-author.md` | BUILD; generated/; other seed packs |
| **P6** | CHANGELOG `### [2.11.1]`; archive annex; board close | New features; hub Must |

---

## 3. Master order of operations

```text
P0 Register annex + freeze packet; trim stale 2.11.0 log lines
   → Board primary = workboard-packet-2.11.1; annex linked
        │
        ▼
P1 workboard.md (unique owner)
   → Packet, tracker-keep, stale-log, archive cites, Notes; Must table still 5
        │
        ▼
P2 Templates
   → OOO brief table; program-README next-phase match; board Notes/log hints
        │
        ▼
P3 Cites
   → OPS + ai-docs-workspace one sentence each
        │
        ▼
P4 SETUP 4c + UPGRADE
   → Forward-only; preserve live boards
        │
        ▼
P5 plan-author seed
   → Verify brief when annex exists; no BUILD
        │
        ▼
P6 Ship 2.11.1 + archive
   → CHANGELOG; annex archived; board primary none
```

| Phase | Theme | Why this order | Exit criterion |
|-------|--------|----------------|----------------|
| **P0** | Freeze | Packet and non-goals before law text | Annex + board; stale 2.11.0 log lines gone |
| **P1** | Unique owner | Law before templates | workboard **1.2.0**; Must = 5; packet in Agent protocol; tracker-keep Must not |
| **P2** | Skeletons | Templates follow owner | Brief table present; next-phase match; Notes hint |
| **P3** | Incorporation | Peers cite after owner | One sentence each; no second packet table |
| **P4** | Adopt | Procedure after law | UPGRADE: no complete-fail; preserve live board |
| **P5** | Instruct view | Seeds after L4 | plan-author verify names the brief; generated/ empty |
| **P6** | Ship | Version after L4 agrees | `### [2.11.1]`; annex archived |

### Frozen decisions (do not re-litigate)

| Topic | Decision |
|-------|----------|
| Owner | `kit/rules/workboard.md` |
| Kit version | **2.11.1** (patch on 2.11.0). P0 may retarget **2.12.0** only if a hub Must is later required — it is **not** |
| Document versions | workboard **1.1.0 → 1.2.0**; TEMPLATE-OOO **1.1.0 → 1.2.0**; TEMPLATE-PROGRAM-README **1.1.0 → 1.2.0**; templates/docs/WORKBOARD **1.0.0 → 1.1.0**; OPS **1.3.2 → 1.3.3**; ai-docs-workspace **1.1.4 → 1.1.5**; UPGRADE **1.8.6 → 1.8.7**; CATALOG **1.2.5 → 1.2.6** |
| Hub | No new Must; no new map row; RULES tracker shape **untouched** |
| Progress Tracker | **Full** ordered list remains required. Align phase IDs with the board. Board wins “what is open.” |
| Phase brief (when annex exists) | Table: **Current state** · **Issue** · **Fix** · **Allow** · **Deny** · **Exit**. Fill **before** spawn/isolate. Fill only the `active` phase (+ next `open` if needed). |
| Child packet | Board row (ID, status, Notes) + that brief + listed paths. Do not edit board or tracker. Do not invent law. |
| Parent | Owns board status + SHA, CHANGELOG, **full** Progress Tracker, brief fill, spawn |
| Phase Notes (board) | One line: exit criterion or allow-path hint for the child — not a second OOO |
| Progress log | Register, blocked/unblocked, program complete. Drop lines that still say `active` after the phase row is `done` with SHA |
| SHA | Work commit may use `—`. Fill SHA on the **next** board edit. Do not amend. Do not add a required SHA-only commit |
| Annex README **Next phase** | Keep (continuity). Must match board `active` or `blocked` in the same change set |
| Indexes | `docs/plan/README.md` open vs archived. Do not reprint the live phase table there or on `docs/README.md` |
| Archive | OOO **body** prefers repo-root `kit/…` (or product L4). Retarget `related:` + Board lines only |
| Default annex | Still optional. Packet applies **when the annex exists** |
| One phase | One allow list + one exit. Do not merge unrelated owners into one phase to “go faster” |

### Active phase brief

Fill **only** the `active` phase (and the next `open` if needed to start it).

### P0

| Field | Value |
|-------|--------|
| **Current state** | workboard **1.1.0**; full tracker in RULES; OOO brief unstructured; this board log still has stale 2.11.0 `Pn active` lines |
| **Issue** | Children lack a state/issue/fix packet; stale log contradicts the phase table; archive relative rewrites are brittle |
| **Fix** | Register this annex; freeze the tables above; trim stale 2.11.0 log lines; **no** `kit/` law |
| **Allow** | `docs/WORKBOARD.md`, `docs/plan/workboard-packet-2.11.1/**`, `docs/plan/README.md` |
| **Deny** | Any `kit/**` |
| **Exit** | Board primary + Optional annex set; plan index lists the open pack; stale 2.11.0 intermediates gone; P1 `active` (user asked to implement) |

### P1 *(next)*

| Field | Value |
|-------|--------|
| **Current state** | `kit/rules/workboard.md` 1.1.0; Must = 5; Agent protocol has session start / during / complete but no packet table |
| **Issue** | No mandatory brief before spawn; tracker-collapse not forbidden; log/archive/Notes underspecified |
| **Fix** | Surgical edit of that file only, per freeze |
| **Allow** | `kit/rules/workboard.md` |
| **Deny** | Templates, SETUP, UPGRADE, OPS, sixth Must, RULES.md |
| **Exit** | Version **1.2.0**; Must still 5; packet H3; three unique Must nots; identity-test `description` if the old blurb fails |

---

## 4. Verification

Empty inventory. No language gates.

| Phase | Checks |
|-------|--------|
| **P0** | Author checklist on annex; links from `docs/plan/workboard-packet-2.11.1/` resolve; board annex set; stale 2.11.0 `active` log lines gone; README next-phase matches board |
| **P1** | Must rows = 5; no hub Must; tracker-keep Must not present; packet fields named; “one sentence is legal” unused here; no landing YAML |
| **P2** | OOO template has the six-field brief; program-README next-phase match; board template Notes hint; no landing YAML |
| **P3** | OPS / ai-docs cite only; OPS `related:` still 3–7 |
| **P4** | UPGRADE preserve live board; no complete-fail for old briefs |
| **P5** | generated/ empty; BUILD not run |
| **P6** | CHANGELOG `### [2.11.1]`; annex archived; no L4 “active planning” |

---

## 5. Docs and CHANGELOG on ship

| Phase | L4 owners |
|-------|-----------|
| **P0** | — |
| **P1** | `kit/rules/workboard.md` |
| **P2** | listed templates |
| **P3** | OPS · ai-docs-workspace |
| **P4** | SETUP · UPGRADE |
| **P5** | CATALOG plan-author · plan-author template |
| **P6** | `kit/CHANGELOG.md` `### [2.11.1]`; archive this annex |

P6 notes: sub-agent phase packet; full Progress Tracker kept; stale-log / archive body cites / next-phase match; no hub Must-map; no layout migration; no inventory/SAST; preserve live boards.

---

## 6. Risks and rollback

| Risk | Mitigation |
|------|------------|
| Thinning the tracker “for efficiency” | W2; P1 Must not; do not edit RULES tracker shape |
| Sixth Must on workboard.md | Freeze; unique rules in Must not + body |
| Requiring annex always | Non-goal; default board-only unchanged |
| OPS grows a second packet table | P3 one sentence + deep link |
| Overwrite adopter boards on upgrade | UPGRADE preserve list |
| Rollback | Revert that phase first; P2–P5 depend on P1 |
