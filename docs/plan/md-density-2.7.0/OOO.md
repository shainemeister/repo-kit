---
title: "md-density-2.7.0 — order of operations"
description: Goals, constraints, phased OOO, verification, and risks for Markdown density.
version: "1.0.0"
status: active
audience:
  - ai-agents
  - maintainers
doc_type: plan
related:
  - ./README.md
  - ../../WORKBOARD.md
  - ../../../kit/rules/workboard.md
  - ../../../README.md
  - ../../../kit/MARKDOWN-STANDARD.md
  - ../../../kit/rules/contracts.md
last_updated: "2026-08-19"
---

# Markdown density — order of operations

**Board:** [docs/WORKBOARD.md](../../WORKBOARD.md)  
**Annex index:** [README.md](./README.md)  
**Mission:** root [README.md](../../../README.md) (this repo has no `PLAN.md`; Instruct is off).  
**Policy:** [kit/rules/workboard.md](../../../kit/rules/workboard.md)

Editorial / density law so authors and agents produce comprehensive documentation **as a corpus**, not as standalone reprints — without deleting unique rules, without removing the last pointer to an owner, and without forcing adopter product docs to be rewritten on upgrade.

## Contents

1. [Goals and non-goals](#1-goals-and-non-goals)
2. [Locked decisions](#2-locked-decisions)
3. [Constraint map](#3-constraint-map)
4. [Master order of operations](#4-master-order-of-operations)
5. [Conflicts](#5-conflicts)
6. [Parent and child protocol](#6-parent-and-child-protocol)
7. [Unique-rule ledger](#7-unique-rule-ledger)
8. [Verification](#8-verification)
9. [Docs and CHANGELOG on ship](#9-docs-and-changelog-on-ship)
10. [Risks and rollback](#10-risks-and-rollback)

---

## 1. Goals and non-goals

### Goals (must)

| ID | Goal |
|----|------|
| G1 | Ship a binding density + incorporation doctrine in L4 (`MARKDOWN-STANDARD`, `contracts`, `authoring-and-style`, author checklist). |
| G2 | Keep every `doc_type` (landing, readme, cli, methodology, security, concept, runbook, other). Change **required core vs omit-if**, not the type set. |
| G3 | Keep identity (YAML), authority map, same-change-set, load order, bidirectional critical pairs, landing Overview + Operator prompts. |
| G4 | Instruct agents: over-documentation is a defect; deleting the last citation is a defect. Checklists and the docs-author seed must fail both. |
| G5 | Slim templates so the **default is the minimum core**, every extra section labeled **omit if**. |
| G6 | Pilot the new shape on two low-blast kit modules and prove unique Musts survived before any wider restyle. |
| G7 | Dogfood-restyle remaining kit law only after a human gate on the pilot. Treat restyles as editorial for adopters. |

### Non-goals (must not in this program)

| Item | Why |
|------|-----|
| Domain A/B line-count gate | Would mutilate CLI / methodology contracts |
| One global “every md < N lines” | Contracts are allowed to be long; policy modules are not |
| Rename Must → “black letter” across the tree | Jargon shock; inbound language in every file |
| Split `MARKDOWN-STANDARD.md` into multiple files | High inbound-anchor risk; defer |
| Enable Agent Instruct / create `PLAN.md` / generate packs | This repo: Instruct off |
| Invent host trees or paste doctrine into `AGENTS.md` | Habitat: L0 stays a pointer |
| Force-restyle adopter package READMEs / CLI guides on UPGRADE | Product docs are project data |
| Delete types, merge SECURITY into README, or drop `related:` | That causes context loss |
| Big-bang rewrite of all `kit/rules/*` in one commit | Continuity + review risk |
| Fill `{{PLACEHOLDERS}}` in the RULES authority map | Those are the adopter template |

### Invariants (hard)

```text
1. Unique normative rules are never deleted to hit a line budget. Split the file or keep the rule.
2. Replace, don’t erase: a reprint may go only if a one-sentence citation + deep link to the owner remains.
3. Bidirectional critical pairs stay two-way (hub ↔ modules; contracts ↔ versioning ↔ verification).
4. Load order unchanged: kit/RULES.md first. L0 does not grow a second RULES tree.
5. Same-change-set includes: owner text, map row if path moved, inbound deep links if anchor moved, CHANGELOG if release-worthy.
6. Docs-only inventory: only gate is author checklist + relative links + no leftover {{PLACEHOLDERS}} in finished policy.
7. Surgical edits. No full-file rewrite of MARKDOWN-STANDARD, RULES.md, contracts.md, SETUP.md, or UPGRADE.md.
8. Prefer exactly one active workboard phase. Parent owns board status + SHA. Children do not mark the program done.
9. Kit-native vocabulary in law files (Must, owner, cite, omit-if). Legal/ISO terms appear only in a short mapping table.
```

---

## 2. Locked decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Vocabulary | Kit-native. Mapping table to Restatement / ISO / statute terms in MARKDOWN-STANDARD only | Avoid renaming every Must table |
| Citation | Keep YAML `related:` (3–7 peers). Keep a human peer list (Related line **or** lead citations). Cap, don’t delete | Last-link deletion = context loss |
| Contents | Optional unless ≥ 5 H2s **or** ≳ 150 lines. Never list Summary as item 1 | Chrome, not a joint |
| Document history | Required on standalone contracts (CLI, methodology, SECURITY). Kit-internal modules: frontmatter `version`/`last_updated` + `kit/CHANGELOG.md` | Slip law vs code |
| Templates | Minimum core + **omit if** on every extra section | Agents copy the default |
| Releases | **Wave 1 = kit 2.7.0** (doctrine + templates + docs-author + verify + 2 pilots). **Wave 2 = kit 2.8.0** (remaining dogfood restyles) | Adopter merge stays reviewable |
| Hard gate | Orchestrator **stops after P3** for user acceptance of the pilot shape before P4–P8 | Error-free / no silent restyle |
| MARKDOWN-STANDARD file | Add chapters in place; do not split this program | Preserve anchors |
| This repo Instruct | Stays off. Update **seed templates** (`docs-author`, CATALOG verify) so adopters who use Instruct get the new procedure. Do not emit `generated/` | Matches current habitat |

**Citation rule (must):** keep `related:` at **3–7** purpose-labeled peers. Related line *or* lead citations. Never zero peers on a substantial file. **Replace, don’t erase** — a reprint may go only if a one-sentence citation plus a deep link to the owner remains. Deleting the last citation of an owner is context loss.

---

## 3. Constraint map

Facts that **bound** the OOO (current architecture, not a wish list).

| Fact | Implication for the OOO |
|------|-------------------------|
| Instruct off; no `PLAN.md`; `kit/agents/generated/` empty | Skip OPS O3 / BUILD. Use `kit/RULES.md` + workboard parent/child duties only |
| Docs-only inventory | No pylint/rustfmt/SAST. Verify = author checklist, links, no placeholders, unique-rule diff on restyles |
| `contracts.md` requires Related line + `related:` + bidirectional pairs | P1 **extends** this; it must not repeal citations |
| docs-author seed requires Summary → Contents → body | Must change in wave 1 or agents keep emitting the old shape |
| MARKDOWN-STANDARD Contents if ≥ ~3 H2s | Must raise the bar in the same commit as density law |
| UPGRADE merge of `kit/rules/*` and templates | Wave-2 restyles are a large adopter diff — isolate in 2.8.0; UPGRADE must say restyles are editorial |
| Authority map still has `{{PACKAGE}}` placeholders | Do not “fix” them; they are the template |
| SETUP is kept in this repo (it *is* the kit) | Adopters still delete SETUP; we only update copy, not delete it here |
| HABITAT / RUNTIME already budget L0 and packs | Align markdown class budgets; do not contradict L0 ≪ 100–150 |
| No continuity overlay | Still surgical; no full-file rewrite of protected surfaces |
| Optional `docs/research/` notes | Reporter’s notes are **not** P0 and are not law |

**Surfaces this program may touch** (name them; leave others alone):

| Surface | Paths (from authority map) | When |
|---------|----------------------------|------|
| Markdown shape + density | `kit/MARKDOWN-STANDARD.md` | P1 surgical; P2 checklist vs templates |
| Incorporation / citations | `kit/rules/contracts.md` | P1 surgical; restyle last in wave 2 |
| Authoring Must | `kit/rules/authoring-and-style.md` | P1 |
| Docs-only verify | `kit/rules/verification-and-ops.md` | P1 |
| Hub Must index | `kit/RULES.md` | P1 one Must row; P4 optional digest trim |
| Templates | `kit/templates/TEMPLATE-*.md` (GENERIC, README, CLI, SECURITY, METHODOLOGY, CONCEPT; landing only if omit-if notes help) | P2 |
| Docs-author + catalog | `kit/agents/templates/docs-author.md`, `kit/agents/CATALOG.md` | P2 |
| Pack / budget pointers | `kit/agents/README.md`, `kit/agents/RUNTIME.md` | P2 (short) |
| Pilot restyles | `kit/rules/hygiene.md`, `kit/rules/architecture.md` | P3 |
| Remaining module restyles | other `kit/rules/*`, selected `kit/agents/*.md` | Wave 2 |
| Adopt/upgrade copy | `kit/SETUP.md`, `kit/UPGRADE.md` | P2 note + P7 |
| Examples | `kit/examples/*.md` | P7 |
| Kit version | `kit/CHANGELOG.md` under `## repo-kit` | Open 2.7.0 in P1; 2.8.0 in P8 |
| Execution board | `docs/WORKBOARD.md` | Every phase, same change set |
| Optional annex | `docs/plan/md-density-2.7.0/` | P0; archive on program complete |

Landing root `README.md` and `AGENTS.md`: **no doctrine paste**. Optional one-line pointer only if the landing Overview still scans under its 120-line budget (P7, optional).

**Never restyle as law:** `LICENSE`, `.gitignore`, configs, `kit/agents/generated/` (empty), root `AGENTS.md` body (pointer only).

---

## 4. Master order of operations

Prefer **exactly one `active` phase**. No L4 edit before P0. Live status is on the board, not here.

```text
P0  Register board + annex
        │
        ▼
P1  Doctrine (MARKDOWN-STANDARD, contracts, authoring, verification, RULES one Must, CHANGELOG open)
        │
        ▼
P2  Bind agents/humans (templates min-core, docs-author, CATALOG, RUNTIME pointer, SETUP/UPGRADE notes)
        │
        ▼
P3  Pilot restyle hygiene.md + architecture.md + unique-rule audit
        │
        ▼
    ★ HARD GATE — user accepts pilot shape (or requests doctrine tweaks → loop P1/P3, do not start wave 2)
        │
        ├─ Wave 1 ship: date kit 2.7.0, board note, stop if user wants a release cut
        │
        ▼
P4  Hub digest trim (optional / small) — only what P3 proved
        │
        ▼
P5  Restyle remaining kit/rules/* (serial; contracts.md last)
        │
        ▼
P6  Restyle kit/agents/*.md Instruct docs (serial; not packs)
        │
        ▼
P7  SETUP / UPGRADE / examples / optional landing one-liner
        │
        ▼
P8  Kit 2.8.0 CHANGELOG, program complete, archive annex
```

| Phase | Theme | Why this order |
|-------|--------|----------------|
| **P0** | Register board + annex | No L4 edit before the program is on the board |
| **P1** | Doctrine | Law before templates and restyles |
| **P2** | Min-core templates + docs-author | Default shape must match the new checklist (serial after P1) |
| **P3** | Pilot restyle hygiene + architecture + ledger | Apply written operators; prove unique Musts survived |
| **GATE** | User accepts P3 pilot shape | No silent wave 2 |
| **P4** | Hub Must digest trim (optional) | Only after modules can stand as the unique home |
| **P5** | Restyle remaining `kit/rules/*` | Serial; `contracts.md` last |
| **P6** | Restyle `kit/agents/*.md` Instruct docs | Serial; not packs; not `generated/` |
| **P7** | SETUP / UPGRADE / examples polish | After the law shape is stable |
| **P8** | CHANGELOG 2.8.0 + archive annex | Program complete |

P1 and P2 are **serial**. P3 is serial after P2. P5 module restyles are **serial with each other**. A read-only inbound-link audit child may run **parallel** to a restyle child that does not change anchors.

### Waves

| Wave | Kit version | Scope |
|------|-------------|--------|
| **1** | **2.7.0** | P0–P3: doctrine, templates, docs-author, verify, two pilots. Date/close 2.7.0 only when P0–P3+P2 templates+seeds are in and the P3 gate passes. |
| **2** | **2.8.0** | P4–P8: remaining dogfood restyles. Do not start until the user accepts the pilot. |

### P0–P3 allow / deny briefs

| Phase | Allow | Deny | Notes |
|-------|-------|------|--------|
| **P0** | `docs/WORKBOARD.md`, `docs/plan/md-density-2.7.0/**`, `docs/README.md`, `docs/plan/README.md` | `kit/**` | Register program; copy durable OOO here. No leftover template tokens. Commit message (parent): `docs(plan): register md-density-2.7.0` |
| **P1** | `kit/MARKDOWN-STANDARD.md`, `kit/rules/contracts.md`, `kit/rules/authoring-and-style.md`, `kit/rules/verification-and-ops.md`, `kit/RULES.md`, `kit/CHANGELOG.md` | Templates, pilots, SETUP/UPGRADE bodies beyond a CHANGELOG mention | Surgical only. Density chapter, type cores, Contents threshold, history rule, incorporation, one hub Must. Open CHANGELOG `### [2.7.0]` **without** dating as shipped. Commit: `docs(std): density and incorporation doctrine` |
| **P2** | `kit/templates/TEMPLATE-{GENERIC,README,CLI,SECURITY,METHODOLOGY,CONCEPT}.md`, `kit/agents/templates/docs-author.md`, `kit/agents/CATALOG.md`, `kit/agents/README.md`, `kit/agents/RUNTIME.md`, `kit/SETUP.md` (Contents/checklist sentences only), `kit/UPGRADE.md` (preserve/editorial sentences only), `kit/CHANGELOG.md` | Full restyle of law files; `TEMPLATE-AGENTS.md` density paste; `TEMPLATE-CONTINUITY.md`; workspace scaffolds under `kit/templates/docs/**` | Extra sections **omit if**. docs-author verify: second-home + last-cite. Commit: `docs(std): minimum-core templates and docs-author verify` |
| **P3** | `kit/rules/hygiene.md`, `kit/rules/architecture.md`, `kit/CHANGELOG.md` | `contracts.md`, `MARKDOWN-STANDARD.md`, hub map placeholders | Pre-step: snapshot unique Musts + inbound anchors. Writer restyles. Audit diffs the ledger. **Then STOP for the user.** Commit: `docs(rules): restyle hygiene and architecture to density shape` |

### P4–P8 (after acceptance only)

Do not write separate later-phase implementation novels until that phase is `active` on the board. Intended allowlists:

| Phase | Allow (intent) |
|-------|----------------|
| **P4** | `kit/RULES.md` Must-table trim only if it remains a complete map |
| **P5** | One `kit/rules/*` module per child; **`contracts.md` last**. Keep `security.md` inventory/SAST tables; keep workboard status vocabulary; keep versioning trailer/CHANGELOG rules |
| **P6** | One `kit/agents/*.md` Instruct doc per child; skip `generated/`; skip pack bodies |
| **P7** | `kit/SETUP.md`, `kit/UPGRADE.md`, `kit/examples/*.md`; optional landing one-liner if Overview still scans |
| **P8** | `kit/CHANGELOG.md` `### [2.8.0]`; board complete; `git mv` annex to `docs/plan/archive/md-density-2.7.0/`; indexes; inbound annex links retargeted |

P1 payload (doctrine, not restyle): density chapter in MARKDOWN-STANDARD (classes, over-documentation test, force layers, required core vs omit-if, section recipe, compression operators, citation floor/ceiling, living vs frozen, budgets, vocabulary mapping); raise Contents threshold and history rule in the **same** commit; contracts incorporation (second home = drift; last-cite deletion = context loss; inbound-link duty on anchor/path change); hub **one** Must row, no essay.

---

## 5. Conflicts

This table is why the annex exists. Do not “resolve” a row by inventing a different choice.

| ID | Conflict | Why it bites | Resolution |
|----|----------|--------------|------------|
| C1 | Density “drop Related” vs contracts “Related required” | Earlier exploration proposed dropping the Related line | **Keep citations.** Cap 3–7. Related line *or* lead citations. YAML `related:` stays |
| C2 | “Files need not stand alone” vs agents that only open one file | Context loss; invented policy | Load order stays. Point-of-use citation **required** when a foreign constraint applies. L0 still points at RULES, not the density chapter |
| C3 | Line budget vs unique CLI/inventory/SAST tables | Shrinking would delete law | Class budgets. Contract/catalog tables are annex-length by design. Budget restatement, not unique facts |
| C4 | docs-author still requires Summary → Contents | Agents ignore new standard | P2 **same wave** as P1: change seed + CATALOG verify. Wave 1 incomplete without this |
| C5 | MARKDOWN-STANDARD Contents ≥ 3 H2s vs new threshold | Law disagrees with itself | Change threshold in the **same P1 commit** as density |
| C6 | Dual-path (Instruct / inventory / habitat) repeated in every module | Cutting all copies loses local consequence | Hub owns the switch. Module keeps **one local sentence + link**. P3+ restyles follow this; P1 does not strip other modules yet |
| C7 | Per-doc history vs kit CHANGELOG (slip law vs code) | Two histories drift | Kit-internal: frontmatter + CHANGELOG. Standalone contracts keep history tables |
| C8 | UPGRADE merge of restyled `rules/*` | Huge adopter diffs, false conflicts | Wave 2 = 2.8.0. UPGRADE: editorial restyles; preserve local additions; do not rewrite product README/CLI |
| C9 | Hub Must table is already a reprint index | Trimming too early orphans modules | P1 **adds** one row. Hub restyle only in wave 2 after modules are slim |
| C10 | `contracts.md` is both citation-law owner and a restyle candidate | P1 and restyle colliding | P1 surgical only. Restyle contracts **last** in wave 2 |
| C11 | Pilot `hygiene.md` restyle vs P1 not yet binding | Restyle without law = taste | P3 **after** P1+P2 ship. Child must apply written operators, not vibes |
| C12 | Legal/ISO jargon vs existing Must language | Dual vocabulary | Mapping table only. Law stays Must / Must not / omit-if |
| C13 | Split MARKDOWN-STANDARD vs inbound `#` anchors | Breaks SETUP/UPGRADE/examples/packs | No split this program |
| C14 | Full-file rewrite vs continuity / review | Lost polish, unreviewable diffs | Surgical on law files. Template skeletons may be replaced wholesale (they are placeholders) |
| C15 | Parallel children on same owner | Overwrites | **Serial** on any shared authority-map owner. Parallel only for read-only grep/audit |
| C16 | Child marks phase `done` | Board lies | Parent only updates workboard + CHANGELOG + Progress Tracker |
| C17 | Instruct off vs updating docs-author | Seems unused here | Seeds are kit payload for adopters. Do not run BUILD or fill `generated/` |
| C18 | `verification-and-ops` anti-pattern “Long docs without Summary” | Contradicts optional Summary | Reword in P1: long docs need a decision table **or** meet omit-Summary conditions |
| C19 | SETUP “refresh Contents links” | Forces TOC | Change to “refresh Contents **if present**” |
| C20 | Security inventory tables look like “over-documenting” | They are the catalog | Do not slim the inventory/SAST **catalog** in `security.md`. Slim only dual-path essays around it |
| C21 | Wave-1 incomplete if examples still show 13-H2 README | Adopters copy examples | P7: at least `docs-only.md` + README template already slim; other examples can wait 2.8.0 if timeboxed |
| C22 | Opening CHANGELOG 2.7.0 before P3 gate | Adopters might treat half-doctrine as done | Date and call 2.7.0 **shipped** only when P0–P3+P2 templates+seeds are in and P3 gate passes. Until then heading may exist as in-progress bullets; do not tell adopters to upgrade mid-program |
| C23 | Restyle deletes an H2 that others deep-link | Silent 404 anchors | Before restyle: `rg` the heading text and `#anchor`. Same change set: retarget or keep the H2 as an alias |
| C24 | “Say once” vs hub Must index | Index looks like a second home | Hub index is **map** (one line + link), not a copy. Explicitly allowed as necessary redundancy |
| C25 | Parent/child isolation vs this repo’s single tree | Worktree isolation would fork kit law | `same-tree` only. Serial phases. No worktree merge puzzles for docs-only kit |

---

## 6. Parent and child protocol

Instruct is off. Use workboard parent/child **duties** (kit names duties, not APIs). **Serial writers** on any shared authority-map owner.

### Parent must

1. Read `docs/WORKBOARD.md` + this OOO at session start; continue the `active` phase.  
2. Spawn **one** writer child per focused segment with an explicit **file allowlist** and **denylist**.  
3. After the child returns: **parent-verify** ([§8](#8-verification)) before any `done` or commit recommendation.  
4. Own: workboard status + SHA, CHANGELOG bullets, Progress Tracker, inbound-link retarget if the child missed one.  
5. If verify fails: do not mark done; resume the **same** child with the defect list, or revert the files.  
6. Stop at the P3 hard gate until the user accepts.  
7. Never let two writers edit the same owner concurrently.

P0 is the register exception: the P0 child may edit the board and annex (allowlist). After P0, children do not update the workboard or the CHANGELOG version heading.

### Child must

1. Touch only the allowlist. Stop if it “needs” a denylist file — report to parent.  
2. Apply compression operators; **replace, don’t erase**.  
3. Return: files touched, unique Musts removed (should be none), citations added/removed, anchors renamed, checklist items run, anything skipped.  
4. Not update the workboard or CHANGELOG version heading (parent) — except P0 board register as allowlisted.  
5. Not invent host trees, language gates, or Instruct enablement.  
6. Not mark the program done.

### Suggested child types

| Segment | Isolation |
|---------|-----------|
| P0 annex + board | same-tree (this phase) |
| P1 doctrine (standard + contracts + authoring + verify + hub row) | same-tree, **one child**, those files only |
| P2 templates | same-tree; templates only |
| P2 docs-author + CATALOG | after templates, or same child if serial |
| P3 restyle | hygiene + architecture only |
| P3 unique-rule / inbound-link audit | read-only; parallel OK |
| Parent review of child diff | read-only |
| Wave 2 each module | one writer per file; serial |

Do not use a scratch design-doc loop as a substitute for L4 edits.

---

## 7. Unique-rule ledger

**Required for every restyle** (P3 and wave 2). Do not restyle without the ledger.

Before editing a file, parent or audit child records:

```text
FILE: kit/rules/hygiene.md
ANCHORS: #summary #unified-packaging #what-belongs-at-project-root ...
UNIQUE:
  - Standards under kit/; product outside
  - Project CHANGELOG outside kit
  - docs/ outside kit
  - SETUP ephemeral; UPGRADE durable
  - ...
CITES (must remain as cite if not unique here):
  - landing shape → MARKDOWN-STANDARD
  - workboard → workboard.md
```

After edit: every UNIQUE still present in-file or converted to a one-sentence cite of an owner that already stated it. Every ANCHOR still exists or inbound hits retargeted in the same change set.

---

## 8. Verification

Docs-only declared gate, plus program-specific checks. **Fail = not done.** Do not invent language/SAST gates.

### All phases

- [ ] Allowlist only; no drive-by SETUP/UPGRADE/README unless that phase owns them
- [ ] Relative links from the file’s directory resolve (spot-check every new/changed link)
- [ ] No `{{PLACEHOLDERS}}` in finished policy (templates may keep them; RULES authority-map adopter tokens stay)
- [ ] Frontmatter `version` + `last_updated` bumped on edited law files; version matches any remaining in-body version line if both exist
- [ ] Author checklist (updated after P1) considered
- [ ] Workboard same change set (status, SHA after commit) — parent
- [ ] Conventional commit `docs(…)` matching staged files; AI trailers when committing — parent

### P0 extra

- [ ] Annex `README.md` + `OOO.md` exist; program id `md-density-2.7.0`; no leftover template tokens
- [ ] Board primary program matches; Optional annex links this folder; exactly one `active` phase after register (P1)
- [ ] `docs/README.md` plan module on; `docs/plan/README.md` lists this annex
- [ ] No `kit/**` edits; no new root `PLAN.md`

### P1 extra

- [ ] Density chapter exists and does **not** tell authors to drop all Related/`related:`
- [ ] Contents threshold, history rule, checklist, and contracts incorporation **agree**
- [ ] Hub has exactly one new Must row pointing at those owners (no essay)
- [ ] Bidirectional critical pairs still present in contracts
- [ ] Landing README chapter unchanged in requirements (Overview + Operator prompts)

### P2 extra

- [ ] Each TEMPLATE-* extra section has **omit if**
- [ ] TEMPLATE-README core does not include a full CLI matrix
- [ ] docs-author procedure no longer mandates Contents; verify includes second-home + last-cite
- [ ] CATALOG `docs-author` verify matches the seed
- [ ] AgentPack format still **not** forced onto generated packs
- [ ] UPGRADE preserve list says: do not restyle filled product docs; 2.8.0 restyles editorial

### P3 extra (pilot)

- [ ] **Unique-rule ledger:** extract Must/Must-not propositions from pre-restyle hygiene + architecture; every unique proposition remains (or is a one-sentence cite to an owner that already had it)
- [ ] No inbound `#anchor` broken (`rg` old headings)
- [ ] First unique rule appears by ~line 40
- [ ] `related:` still 3–7, purpose-bearing
- [ ] Dual-path (Instruct/inventory) not fully deleted unless replaced by one sentence + hub link
- [ ] File shorter **and** no unique law missing
- [ ] User acceptance recorded before any P4 allowlist

### Wave 2 extra (after gate)

- Same unique-rule ledger per file
- `security.md` inventory/SAST tables intact
- `workboard.md` status vocabulary intact
- `versioning-and-git.md` trailer cascade intact

### Wave-1 ship extra

- [ ] `kit/CHANGELOG.md` `### [2.7.0] - YYYY-MM-DD` complete (Added/Changed)
- [ ] Document versions on touched law files consistent
- [ ] User accepted P3 gate

If any item fails: **do not claim complete**.

---

## 9. Docs and CHANGELOG on ship

Parent owns CHANGELOG version headings and board SHAs.

| Phase | L4 / docs to update |
|-------|---------------------|
| **P0** | Board + this annex + `docs/README.md` + `docs/plan/README.md`. No kit law. |
| **P1** | MARKDOWN-STANDARD, contracts, authoring-and-style, verification-and-ops, RULES (one Must). Open `kit/CHANGELOG.md` `### [2.7.0]` (in-progress bullets; do not date as shipped). |
| **P2** | Named templates, docs-author, CATALOG, agents README/RUNTIME pointers, SETUP/UPGRADE sentences, CHANGELOG bullets. |
| **P3** | hygiene.md, architecture.md, CHANGELOG bullets. Then hard gate. |
| **Wave 1 ship** | Date 2.7.0 only after P3 gate. |
| **P4–P7** | Per-phase owners in [§4](#4-master-order-of-operations); CHANGELOG bullets under 2.8.0 when that wave is open. |
| **P8** | `### [2.8.0]`; archive annex; retarget inbound links; board Recently completed. |

Do not tell adopters to upgrade mid-program (C22).

---

## 10. Risks and rollback

| Risk | Likelihood | Mitigation |
|------|------------|------------|
| Agent “helpfully” reprints modules after 2.7.0 | High | P2 docs-author verify; checklist fail |
| Pilot looks good, wave-2 deletes a gate command | Med | Ledger + security/workboard/versioning “do not slim catalogs” |
| Adopters merge 2.8.0 and lose local RULES additions | Med | UPGRADE editorial note; 2.7.0 usable without 2.8.0 |
| Doctrine chapter makes MARKDOWN-STANDARD even longer | High, accepted | Split deferred; density chapter must itself be tight (~80–120 lines of unique law) |
| Hard gate skipped | Process | Parent protocol: no P4 allowlist until user says proceed |
| Two children edit contracts | Process | Serial; denylist on P3 |

Rollback: revert the phase change set; do not mark `done`; resume the same child with the defect list. Do not start wave 2 to “fix” a P3 shape the user rejected — loop P1/P3 instead.
