---
title: Workboard Lifecycle
description: Single live multi-phase board, annex archive, and parent/child phase packet. Open when registering or advancing multi-phase work; not the Progress Tracker and not product API law.
version: "1.2.0"
status: current
audience:
  - developers
  - maintainers
  - ai-agents
doc_type: other
related:
  - ../RULES.md
  - ./contracts.md
  - ./ai-docs-workspace.md
  - ./continuity.md
  - ../agents/PLAN-HOOK.md
  - ../agents/OPS.md
  - ../templates/docs/WORKBOARD.md
last_updated: "2026-09-01"
---

# Workboard Lifecycle

Single live multi-phase board, annex archive, and parent/child phase packet.

This module is **domain-agnostic**. Product paths belong in the adopter’s authority map and filled board—not in this file.

**Related:** [RULES.md](../RULES.md) · [contracts.md](./contracts.md) · [ai-docs-workspace.md](./ai-docs-workspace.md) · [continuity.md](./continuity.md) · [OPS.md](../agents/OPS.md) · [PLAN-HOOK.md](../agents/PLAN-HOOK.md) · [templates/docs/WORKBOARD.md](../templates/docs/WORKBOARD.md)

---

## Summary

| Must |
|------|
| Keep **one** board at **`docs/WORKBOARD.md`**; **register** a program **before** phase code; update status + SHA in the **same change set** as phase ship |
| Prefer **exactly one** `active` phase |
| Optional annex only while open and **linked from the board**; on program complete **archive** (`git mv` → `docs/plan/archive/`); cap **Recently completed** (~5 one-line rows) |
| On ship: declared gates + **L4 owners** + **CHANGELOG** when contracts/behavior change ([contracts](./contracts.md#same-change-set-rule)) |
| When root **`PLAN.md`** exists, point it at the board in one short subsection (do not paste live phase tables); if there is no PLAN, the landing README is enough |

| Must not |
|----------|
| Start multi-phase work only in chat or only in an unlinked folder |
| Leave “open” planning packs with no workboard row |
| Claim a phase `done` without board status + commit SHA |
| Parallel silent programs with no primary |
| Leave L4 docs saying “active planning” after archive |
| Grow unlimited novels on the board (ideal cap ~200 lines) |
| Delete archive packs without an explicit project decision |
| Dump full order-of-operations history onto the board |
| Paste live phase tables into PLAN |
| Collapse the Progress Tracker to one row because a board exists |
| Isolate or spawn a phase when an annex exists without a filled brief (current state · issue · fix · allow/deny · exit) |
| Leave progress-log lines that still call a phase `active` after its table row is `done` with a SHA |

Trivial / single-step / pure Q&A need **no** board. Multi-phase or multi-session execution **does**. Bare adopt with no multi-phase work may skip this module. **Not** a Domain A/B gate.

**Execution contract** (what is open / next) lives on the board. **Product / maintenance promises** live on **L4** owners from the [authority map](../RULES.md#authority-map).

---

## Contents

1. [When this module applies](#when-this-module-applies)
2. [Three surfaces](#three-surfaces)
3. [Authority](#authority)
4. [Status vocabulary](#status-vocabulary)
5. [Status channel mapping](#status-channel-mapping)
6. [Lifecycle](#lifecycle)
7. [Board shape](#board-shape)
8. [Optional annex](#optional-annex)
9. [Create annex checklist](#create-annex-checklist)
10. [Archive annex checklist](#archive-annex-checklist)
11. [Agent protocol](#agent-protocol)
12. [Phase ship checklist](#phase-ship-checklist)
13. [Program complete checklist](#program-complete-checklist)
14. [Relationship to PLAN, docs/, and Progress Tracker](#relationship-to-plan-docs-and-progress-tracker)
15. [Path aliases](#path-aliases)
16. [Document history](#document-history)

---

## When this module applies

| Situation | Action |
|-----------|--------|
| Pure Q&A / no repo work | None |
| Trivial single-step edit | Optional; no forced board |
| Multi-phase program (two or more ordered phases) | **Register** on `docs/WORKBOARD.md` before phase code |
| Multi-session execution that must survive chat | **Register** on the board |
| Board already exists | Keep it honest; continue the `active` phase unless the user redirects |
| User asks for a workboard | Scaffold from [templates/docs/WORKBOARD.md](../templates/docs/WORKBOARD.md) |

---

## Three surfaces

```text
PLAN.md                 Durable mission, non-goals, stage doctrine, Agent models
        │               Rare edits. Not a todo list.
        ▼
docs/WORKBOARD.md       Single active execution board (open / next / SHA)
        │
        ├─ optional ─►  docs/plan/<program-id>/     Deep OOO while OPEN
        │                      │
        │ ship                 │ program complete (git mv)
        ▼                      ▼
L4 authority-map owners   docs/plan/archive/<program-id>/
```

**Rule:** if work is not linked from `docs/WORKBOARD.md`, it is **not** active multi-phase work.

When Agent Instruct **isolates** work ([OPS parent/child](../agents/OPS.md#parent--child-when-work-is-isolated)), the **parent** updates this board (status + SHA). Children execute a named phase; they do not own program status.

---

## Authority

| Concern | Canonical owner |
|---------|-----------------|
| Active multi-phase work / next phase | **`docs/WORKBOARD.md`** |
| Mission, principles, stage doctrine, Agent models | Root **`PLAN.md`** |
| Shipped how-it-works / public promises | **L4** — authority-map owners (package README, CLI, SECURITY, kit rules, …) |
| Deep phase archaeology | **`docs/plan/archive/`** (or recorded alias) |
| Release notes | **project** `CHANGELOG.md` |
| This policy | **`kit/rules/workboard.md`** |
| Optional surgical-edit overlay | [continuity.md](./continuity.md) + filled template |

---

## Status vocabulary

Use these exact tokens on the board:

| Status | Meaning |
|--------|---------|
| `open` | Not started |
| `active` | Current phase (prefer exactly one per primary program) |
| `blocked` | Waiting on user decision or external input |
| `done` | Shipped, verified, L4/CHANGELOG as required, commit recorded |
| `cancelled` | Explicitly dropped (one-line reason in Notes) |
| `deferred` | Parked; listed under Deferred, not Active phases |

---

## Status channel mapping

Do **not** merge these enums.

| Channel | Tokens | Scope |
|---------|--------|-------|
| **Workboard** | `open` `active` `blocked` `done` `cancelled` `deferred` | Multi-phase execution in-repo |
| **Progress Tracker** | `done` `in progress` `blocked` `skipped` | End of one reply ([RULES](../RULES.md#progress-tracker-minimum-shape)) |
| **Plan file frontmatter** | `draft` `active` `done` `archived` | A markdown plan document |

If they disagree, **the workboard wins** for “what is open.”

---

## Lifecycle

```text
User / agent proposes multi-phase work
        │
        ▼
Register program on docs/WORKBOARD.md
  (goal, phases, L4 docs to update, optional annex)
        │
        ▼
Phase work (surgical edits when a continuity overlay exists)
        │
        ▼
Phase ship checklist → board row done + commit SHA
        │
        ▼
Next phase or program complete checklist
        │
        ▼
Archive optional annex · prune board · L4 owners remain
```

---

## Board shape

Keep `docs/WORKBOARD.md` scannable (ideal cap ~200 lines). Required sections:

1. **Header** — Updated date · Primary program id · Link to this rule  
2. **Status legend** — table above (short form OK)  
3. **Active program** — goal · L4 docs to update · annex path · gates  
4. **Phases table** — ID · Work · Status · Commit · Notes  
5. **Progress log** — newest first; trim to ~15 lines. Log register, blocked/unblocked, and program complete. Drop lines that still call a phase `active` after its table row is `done` with a SHA  
6. **Deferred** — optional  
7. **Recently completed** — max ~5 programs, **one line** each  
8. **Not on this board** — pointers to PLAN / L4 / archive / CHANGELOG  

Copy [templates/docs/WORKBOARD.md](../templates/docs/WORKBOARD.md). Prefer copying a healthy existing board over inventing a new outline.

The filled board is **project data** outside `kit/` ([hygiene](./hygiene.md)).

### Phase table hygiene

- Prefer **exactly one** `active` row. **Do not** add a second row with the same phase ID; replace the existing row.
- User or external wait is status `blocked` on that phase. Do **not** invent phase ids such as `GATE`.
- **Notes:** one line — exit criterion or allow-path hint for a child. Not a second OOO.
- One phase = one allow list + one exit. Do not merge unrelated owners into one phase to go faster.
- SHA: the phase **work** commit may record Commit as `—`. The **parent** fills the SHA on the next board edit (often the next phase’s board update). Do not amend a published work commit solely to inject SHA. Do not invent SHAs. Do not require a SHA-only commit.

---

## Optional annex

Use a multi-file pack **only** when the phase table cannot hold the order of operations (large redesign, many gates, risk matrices).

| | |
|--|--|
| **Path while open** | `docs/plan/<program-id>/` |
| **Naming** | kebab-case program id matching the workboard primary program |
| **Minimum files** | `README.md` (status, next phase, link **back** to board) + optional OOO / phase notes |
| **Requirement** | Board field **Optional annex** **must** link the folder — if unlinked, it is **not** active work |
| **Default** | **No annex** — board-only phases for small/medium programs |
| **On program complete** | [Archive annex checklist](#archive-annex-checklist) |

**Do:** promote durable behavior to L4 owners on ship.  
**Do not:** put the only product contract inside an annex; leave open folders after program complete; treat archive as a todo list.

Skeletons: [TEMPLATE-PROGRAM-README.md](../templates/docs/plan/TEMPLATE-PROGRAM-README.md) · [TEMPLATE-OOO.md](../templates/docs/plan/TEMPLATE-OOO.md).

---

## Create annex checklist

Use when a multi-file OOO is required.

- [ ] Program already registered on **`docs/WORKBOARD.md`** (or register first)  
- [ ] Program id chosen (kebab-case); matches board primary / annex field  
- [ ] Folder created: `docs/plan/<program-id>/` (or recorded alias)  
- [ ] `README.md` includes: status · next phase · link to **WORKBOARD** · link to this rule. **Next phase** matches the board `active` or `blocked` row (same change set)  
- [ ] Detailed OOO (if any) lives under the annex, not duplicated into PLAN.md  
- [ ] Board **Optional annex** field set to the folder path  
- [ ] `docs/plan/` index (or `docs/README.md`) mentions the open annex (same change set)  
- [ ] Commit: `docs(plan): <id> open annex` (or include in first phase commit)

---

## Archive annex checklist

Use when the **program** (not a single phase) is complete.

1. **L4 docs**  
   - [ ] Durable truth written or updated on authority-map owners  
   - [ ] No product/kit doc still says this program is “active planning”  
   - [ ] CHANGELOG entry if release-worthy  

2. **Move**  
   - [ ] `git mv docs/plan/<program-id> docs/plan/archive/<program-id>`  
   - [ ] Prefer `git mv` over copy+delete (preserves history)  
   - [ ] After `git mv`, retarget **annex README + OOO frontmatter / Board lines only**. OOO **body** prefers repo-root `kit/…` (or product L4) so those cites survive the extra `../`. Do not rewrite every body relative path:

| In `docs/plan/<id>/` | After archive (`docs/plan/archive/<id>/`) |
|----------------------|-------------------------------------------|
| `../../WORKBOARD.md` | `../../../WORKBOARD.md` |
| `../../../kit/` | `../../../../kit/` |
| `../../../README.md` / `../../../PLAN.md` | `../../../../README.md` / `../../../../PLAN.md` |

3. **Indexes**  
   - [ ] Plan-module index / `docs/README.md` — remove from open annex; add archive row  
   - [ ] Archive index (if maintained) — pack row + “read instead” L4 links  

4. **Inbound links**  
   - [ ] Search for `docs/plan/<program-id>` (non-archive); retarget to L4 or archive path  
   - [ ] Board: clear **Optional annex** or point at archive only from Recently completed  

5. **Board close-out**  
   - [ ] All phases `done` / `cancelled` / `deferred`  
   - [ ] One-line **Recently completed** row  
   - [ ] Primary program → next work or `none`  

6. **Commit**  
   - [ ] Single logical commit preferred: `docs(plan): archive <program-id>` including indexes + board + L4 link retargets  

**Do not** delete archive packs without an explicit project decision.

---

## Agent protocol

### Session start

1. Read **`docs/WORKBOARD.md`** (when it exists or the task is multi-phase).  
2. If **`PLAN.md`** exists, read it for mission, non-goals, and constraints only (not todos). If it does not, use the repo landing README the same way. Do not create PLAN just to satisfy this step.  
3. Continue the **`active`** phase unless the user redirects.  
4. If the board is required but missing, recreate from the template and stop for confirmation if unsure.  
5. If **Optional annex** is set: open the **active phase brief** (current state · issue · fix · allow/deny · exit). Do not require a child to load the full OOO.

### During a phase

1. Surgical edits when a [continuity](./continuity.md) overlay is in use.  
2. Do not open a second primary program without user direction.  
3. Keep the **full** chat Progress Tracker **aligned** with the board (same phase IDs); **board wins** on conflict for “what is open.” Do not collapse the tracker to one row.  
4. When isolating work and an annex exists: the **parent fills the brief** for the `active` phase **before** spawn. The child receives the board row + that brief + listed paths. The child does **not** edit the board or the Progress Tracker.

### Sub-agent packet

When an annex exists, the parent hands the child **only**:

| Piece | Content |
|-------|---------|
| Board row | Phase ID, status, Notes (exit / allow hint) |
| Active phase brief | Current state · issue · fix · allow/deny · exit |
| Paths | The phase **Allow** list |

Parent owns board SHA, CHANGELOG, and the **full** Progress Tracker. Child returns files touched, docs updated, gates run / skip / fail. One child per `active` phase. [OPS parent/child](../agents/OPS.md#parent--child-when-work-is-isolated) when Instruct isolates work.

Board-only programs (no annex): the phase row **Notes** plus listed L4 paths are the packet.

### Phase complete

1. Run declared verification ([verification-and-ops.md](./verification-and-ops.md)).  
2. Update L4 owners + CHANGELOG when behavior/contracts change ([contracts.md](./contracts.md)).  
3. Set phase `done`, record **short commit SHA**, move `active` to the next phase (or clear).  
4. Progress log: do not leave a line that still calls this phase `active`. A program-complete line may list SHAs.  
5. Commit includes **`docs/WORKBOARD.md`** in the same change set as the phase ship when practical.

### Program complete

1. Run [Program complete checklist](#program-complete-checklist).  
2. Set primary program to next work or `none`.

---

## Phase ship checklist

- [ ] Scope matches the phase row (no drive-by protected-surface edits)  
- [ ] Declared gates green (as applicable)  
- [ ] Canonical L4 docs updated if contract/behavior changed  
- [ ] `CHANGELOG.md` entry if release-worthy  
- [ ] Workboard: status `done` · commit SHA · progress log  
- [ ] Conventional commit message matches staged files ([versioning](./versioning-and-git.md#commit-message-format))  

---

## Program complete checklist

- [ ] All phases `done`, `cancelled`, or `deferred` (none left `active` without handoff)  
- [ ] If annex existed: [Archive annex checklist](#archive-annex-checklist) complete  
- [ ] Plan-module / archive indexes consistent  
- [ ] No L4 doc still calls the program “active planning”  
- [ ] One-line row under **Recently completed** (drop oldest if > 5)  
- [ ] Active program section cleared or replaced  
- [ ] Primary program set to next work or `none`  

---

## Relationship to PLAN, docs/, and Progress Tracker

| Do | Do not |
|----|--------|
| Point PLAN.md at the workboard in one short subsection | Paste phase tables into PLAN.md |
| Put deep OOO in an optional annex under `docs/plan/` | Treat every file in `docs/plan/` as active work |
| Keep archive packs for archaeology | Treat archive as the live todo list |
| Promote shipped behavior to L4 owners | Leave the only explanation inside a chat or annex |
| Use the **full** Progress Tracker at end of a reply (ordered tasks · status · SHA) | Collapse the tracker to one row because a board exists; use the tracker as the durable board |

Workspace policy: [ai-docs-workspace.md](./ai-docs-workspace.md). Agent models stay in PLAN ([PLAN-HOOK](../agents/PLAN-HOOK.md)).

---

## Path aliases

Prefer kit default names. An existing repo may already use another folder (for example `docs/planning/` instead of `docs/plan/`).

| Default | Allowed |
|---------|---------|
| `docs/WORKBOARD.md` | Alternate board path **only** if the authority map and `docs/README.md` record it — still **one** board |
| `docs/plan/<id>/` | Recorded alias (e.g. `docs/planning/<id>/`) |
| `docs/plan/archive/` | Recorded alias (e.g. `docs/planning/archive/`) |

Do **not** run two live boards. Do **not** force a rename on upgrade—preserve content and record the alias ([UPGRADE.md](../UPGRADE.md)).

---

## Document history

| Version | Notes |
|---------|--------|
| 1.2.0 | Sub-agent phase packet; keep full Progress Tracker; stale-log drop; archive body prefers `kit/` cites; Notes / one-allow-list (kit 2.11.1). Must index unchanged |
| 1.1.0 | Restore unique Must-not digest; OPS on related:; SHA / duplicate-id / archive path substitutions (kit 2.8.2). Invert does not delete unique prohibitions; Must not is a separate list (not a second 5-row Must table). |
| 1.0.3 | Density restyle (kit 2.8.0); unique rules unchanged |
| 1.0.2 | Parent owns board status when Instruct isolates work (kit 2.6.0) |
| 1.0.1 | PLAN optional when absent; session start uses landing README (kit 2.4.0 clarification) |
| 1.0.0 | Initial portable workboard lifecycle (kit 2.4.0) |
