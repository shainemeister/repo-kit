---
title: "workboard-rigidity-2.8.2 — order of operations"
description: Goals, constraints, phased OOO, and verify for restoring workboard rigidity.
version: "1.0.0"
status: archived
audience:
  - ai-agents
  - maintainers
doc_type: plan
related:
  - ./README.md
  - ../../../WORKBOARD.md
  - ../../../../kit/rules/workboard.md
last_updated: "2026-08-22"
---

# Workboard rigidity 2.8.2 — order of operations

**Board:** [docs/WORKBOARD.md](../../../WORKBOARD.md)  
**Annex index:** [README.md](./README.md)

Program-level OOO only. Per-phase file patches live with the parent until that phase is `active`. Restore text is verbatim from `git show 12e0b4b` Summaries — do not paraphrase.

---

## 1. Goals and non-goals

### Goals (must)

| ID | Goal |
|----|------|
| W1 | Restore unique Must nots on `kit/rules/workboard.md` Summary (source `12e0b4b`). |
| W2 | Restore unique Must nots on `ai-docs-workspace.md` and `PLAN-HOOK.md` Summaries. |
| W3 | Put **OPS** on `workboard.md` `related:` (stay ≤7 YAML peers). |
| W4 | Short SHA / no-duplicate-phase-id / annex archive-link substitution rules in `workboard.md`. |
| W5 | Tighten `TEMPLATE-OOO.md` + program README: allow/deny, exit criterion, brief only `active` (+ next `open`). |
| W6 | Dogfood: trim this board’s log without wiping a live program. |
| W7 | Ship kit **2.8.2**. Do not slim status vocab, checklists, or catalogs. |

### Non-goals (must not in this program)

| Item | Why |
|------|-----|
| Seventh status token | User gates stay `blocked` + Notes |
| Allow/deny or ledgers on the board | Board is an index |
| Revert `d96110d` wholesale | Would restore chrome we meant to drop |
| Restyle workboard body checklists | They still have the rules |
| Touch `AGENTS.md` / root README / RULES Must table / inventory / MARKDOWN-STANDARD | Out of scope |

### Invariants (hard)

```text
1. Unique normative rules are never deleted. Restoring Must nots is restore, not invention.
2. Replace, don’t erase. Body checklists stay.
3. Board cap ~200. OOO lives in the annex (or not at all).
4. Six tokens only: open active blocked done cancelled deferred.
5. Surgical patches. No full-file rewrite of policy files.
6. related: 3–7 except RULES hub. Last citation of an owner remains.
7. Parent owns the board. Instruct off; no PLAN.md.
8. Invert does not apply to unique prohibitions.
```

---

## 2. Constraint map

| Fact | Implication for the OOO |
|------|-------------------------|
| This repo **is** the kit; docs-only; Instruct off | Skip O3; no `PLAN.md`; no generated packs |
| Baseline kit **2.8.1** (`a48324b` / `7dfd891`) | Patch **2.8.2**; do not open 2.9.0 |
| Unique Must nots dropped at `d96110d` / `5a8eca7` | Restore digest from `12e0b4b`; do not revert those commits |
| Density Must table ≤ 5 | Five Musts + **separate** unique Must not list (not ¬Must filler) |
| `workboard.md` `related:` already 7, includes hygiene, omits OPS | Drop hygiene from YAML; body-cite hygiene; add OPS |
| Hygiene is YAML/Related-only today | Body cite is mandatory in the same P1 patch |
| Historic board used `GATE` as a phase id | Forbidden; user wait = `blocked`; drop that log line in P4 |

**Surfaces this program may touch**

| Surface | Paths |
|---------|--------|
| Execution board | `docs/WORKBOARD.md` |
| This annex | `docs/plan/workboard-rigidity-2.8.2/` |
| Plan indexes | `docs/plan/README.md`, `docs/README.md`, `docs/plan/archive/README.md` (P5) |
| Workboard policy | `kit/rules/workboard.md` |
| Workspace / Instruct hook | `kit/rules/ai-docs-workspace.md`, `kit/agents/PLAN-HOOK.md` |
| OOO templates | `kit/templates/docs/plan/TEMPLATE-OOO.md`, `TEMPLATE-PROGRAM-README.md`, optional one line on `kit/templates/docs/WORKBOARD.md` |
| Kit history | `kit/CHANGELOG.md` |

### Allow / deny

| Phase | Allow | Deny |
|-------|--------|------|
| **P0** | `docs/WORKBOARD.md`, this annex, `docs/plan/README.md`, `docs/README.md` | `kit/**` |
| **P1** | `kit/rules/workboard.md`, `kit/CHANGELOG.md`, board status | Restyle of checklists / status vocab; other rules |
| **P2** | `kit/rules/ai-docs-workspace.md`, `kit/agents/PLAN-HOOK.md`, CHANGELOG, board | `workboard.md` (done); FRAMEWORK/OPS/BUILD bodies |
| **P3** | TEMPLATE-OOO, TEMPLATE-PROGRAM-README, optional WORKBOARD template one-liner, CHANGELOG, board | Seventh status; stripping `{{…}}` from templates |
| **P4** | `docs/WORKBOARD.md` only (log trim) | L4; clearing the live phase table |
| **P5** | CHANGELOG, board, `git mv` annex + substitutions, plan indexes | `AGENTS.md`, root `README.md`, RULES Must table, inventory |

---

## 3. Master order of operations

```text
P0  Register board + thin annex
        → exit: board primary = this id; annex linked; no kit/ edits
        │
        ▼
P1  workboard.md Summary Must not + SHA/dup-id/archive substitutions + OPS related:
        → exit: unique Must nots present; status vocab unchanged; related: = 7 including OPS; hygiene body-cited
        │
        ▼
P2  ai-docs + PLAN-HOOK Summary Must not (unique only)
        → exit: chat-only enablement visible; dual-path tables unchanged
        │
        ▼
P3  TEMPLATE-OOO allow/deny + exit criterion + PROGRAM-README
        → exit: placeholders remain; no seventh status; later-phase briefs omit-if
        │
        ▼
P4  Dogfood: trim this repo board log (do not clear live phases)
        → exit: log ≤15; Recently completed still has density-era; this program still primary
        │
        ▼
P5  CHANGELOG 2.8.2, archive annex, primary none
        → exit: dated 2.8.2; annex under docs/plan/archive/; AGENTS.md and root README untouched
```

| Phase | Theme | Why this order | Exit criterion |
|-------|--------|----------------|----------------|
| **P0** | Register | Board before L4 | Annex linked; `kit/` diff empty |
| **P1** | Workboard digest | Law owner first | Unique Must nots; OPS in `related:`; hygiene cited in body |
| **P2** | Peer Summaries | After workboard owner | Unique Must nots; no inverse-only rows |
| **P3** | Templates | After policy | Allow/deny + exit; `{{…}}` remain |
| **P4** | Dogfood log | After L4 shape known | Live program kept; log scannable |
| **P5** | Ship | Last | Dated 2.8.2; annex archived |

Defer per-phase implementation detail until that phase is `active` on the board.

### Active phase brief

### P1

Restore `kit/rules/workboard.md` Summary Must nots from `12e0b4b` **verbatim** as a second table under five unchanged Musts. Add OPS to `related:` (drop hygiene from YAML; body-cite hygiene). Insert Phase table hygiene H3 and archive substitution table. Open `kit/CHANGELOG.md` `### [2.8.2] - 2026-08-22 (in progress)`. Do not restyle status vocab, channel mapping, or checklists.

---

## 4. Verification

| Phase | Checks |
|-------|--------|
| P0 | `git diff -- kit` empty; board Optional annex links this folder |
| P1 | Status vocab unchanged; Must not strings from `12e0b4b` present; YAML `related:` = 7 including OPS; `hygiene.md` body-cited |
| P2 | PLAN dual path unchanged; “enablement only in chat” in PLAN-HOOK Summary |
| P3 | No seventh status; template placeholders remain |
| P4 | Recently completed still has md-density + density-fixups; this program still primary |
| P5 | Dated `### [2.8.2]`; annex under `docs/plan/archive/`; `AGENTS.md` and root README untouched |

Do not invent gates. This tree is docs-only (author checklist + relative links).

---

## 5. Docs and CHANGELOG on ship

| Phase | L4 owners to update |
|-------|---------------------|
| P0 | — (board + annex only) |
| P1 | `kit/rules/workboard.md` **1.1.0**; open CHANGELOG 2.8.2 |
| P2 | `ai-docs-workspace.md` **1.1.3**; `PLAN-HOOK.md` **1.3.3** |
| P3 | templates **1.1.0** |
| P4 | — |
| P5 | CHANGELOG dated; annex archive + indexes |

---

## 6. Risks and rollback

| Risk | Mitigation |
|------|------------|
| Duplicate phase IDs | Replace the row; never insert a second same ID |
| Invented `GATE` status | Six tokens only; user wait = `blocked` |
| Amend to inject SHA | `—` then parent SHA commit |
| Hygiene last-cite loss | Body cite in the same P1 patch as YAML drop |
| Paraphrased Must nots | Paste `12e0b4b` Summary text |
| `git mv` without `../` rewrite | Archive substitution table on README + OOO Board/frontmatter lines |
