---
title: "commit-notes-2.13.0 — order of operations"
description: Goals, frozen commit-note identity test (staged-change summary), phased OOO, verification, and risks for kit 2.13.0. Archived; read L4 versioning-and-git 1.1.0.
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
  - ../../../../kit/rules/versioning-and-git.md
  - ../../../../kit/RULES.md
  - ../../../../kit/rules/verification-and-ops.md
  - ../../../../kit/UPGRADE.md
last_updated: "2026-09-04"
---

# Commit notes 2.13.0 — order of operations

**Board:** [docs/WORKBOARD.md](../../../WORKBOARD.md)  
**Annex index:** [README.md](./README.md)

Program-level OOO. Per-phase file patches wait until that phase is `active`. Law ships as kit **2.13.0**. Instruct off. No root `PLAN.md`.

Body cites below use repo-root `kit/…` so they survive archive. `related:` and the Board line stay relative.

<!-- Body cites: prefer repo-root kit/… so they survive archive. Keep related: and the Board line relative. -->

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
| C1 | Unique owner: `kit/rules/versioning-and-git.md` owns a **commit-note identity test**. Subject and body name the **staged change** (actions in the diff), not the completed objective. |
| C2 | **Keep** the current signature: Conventional `type(scope):` subject; AI trailers `Assisted-by` / `Compliance` / `Instructed-by` when assisted; no `Directed-by`. Instructed-by cascade unchanged. |
| C3 | Body required unless the subject alone names the staged actions. Body states **what changed**; why/migration may follow. Not a `git diff` dump. |
| C4 | Enforcement: owner pre-commit checks + contributor checklist cite + maintainer/reviewer verify. Hub **retargets** the existing commit Must; **no** new Must row. |
| C5 | Adoptability: test applies to **new** commits. Historical messages are **not** rewritten and are **not** a failed complete. |
| C6 | Ship kit **2.13.0**. |

### Non-goals (must not in this program)

| Item | Why |
|------|-----|
| Change `type(scope):` grammar or AI trailer names | User: keep the current signature |
| Rewrite published git history / amend old SHAs | Git rules forbid casual rewrite |
| Mandatory body on every one-line typo | Omit-if when the subject alone names the action |
| Sentence quota or required file-path dump in the body | Density; `git log --stat` already lists paths |
| New hub Must or new authority-map row | Map already names versioning-and-git |
| Universe restyle of `kit/examples/*` bodies | Sample subjects that already name actions pass |
| Domain A/B, inventory, Instruct BUILD | Author/maintainer checklist only |
| Reopen CHANGELOG structure or trailer cascade | Cite only |

### Invariants (hard)

```text
1. Unique rule, one owner. versioning-and-git owns commit notes + trailers.
2. Signature frozen: type(scope): subject · blank line · trailers when AI assisted.
3. related: 3–7. Hub exception unchanged. Last citation remains.
4. Must table on versioning-and-git stays 5 — retarget the conventional-commits row.
5. Hub Must index: same row count; optional wording retarget only.
6. Do not rewrite published history to “fix” old subjects.
7. After P1 ships, this program’s later commits must pass the new test.
8. Parent owns the board. Instruct off; no PLAN.md in this repo.
```

---

## 2. Constraint map

| Fact | Implication for the OOO |
|------|-------------------------|
| This repo **is** the kit; docs-only; Instruct off | Skip O3; no language gates; author checklist only |
| Kit **2.12.0**; versioning-and-git **1.0.5**; body is optional “why” | Change the **job** of subject/body to staged-change summary; keep signature |
| Hub Must row already names conventional commits + trailers | Retarget that row; do not add a sixth Must |
| versioning-and-git Must table already has 5 | Retarget row 3; no sixth Must |
| `related:` already 7 on versioning-and-git | P1: no extra peer |
| verification-and-ops already checklists `type(scope):` + years-later | Cite the identity test; do not reprint the table |
| UPGRADE cannot rewrite git history | Explicit no complete-fail for historical messages |
| generated/ empty; Instruct off | Update seed templates + CATALOG; no BUILD |

**Surfaces this program may touch**

| Surface | Paths |
|---------|--------|
| Owner | `kit/rules/versioning-and-git.md` |
| Hub | `kit/RULES.md` Must row + Operator step 5 (cite; no new Must) |
| Cites | `kit/rules/verification-and-ops.md` (checklist + anti-pattern) |
| Instruct | `kit/agents/CATALOG.md` maintainer (+ reviewer cite) · `kit/agents/templates/maintainer.md` · `kit/agents/examples/generated-maintainer.sample.md` |
| Adopt | `kit/UPGRADE.md` (forward-only) |
| History | `kit/CHANGELOG.md` under `## repo-kit` |
| Execution | `docs/WORKBOARD.md` · this annex · `docs/plan/README.md` · `docs/README.md` |

Do **not** touch unless a later phase explicitly allows: root `README.md` body, root `AGENTS.md`, HABITAT, OPS/BUILD/PARAMS/RUNTIME/FRAMEWORK, workboard/hygiene/security/contracts/files/authoring, `kit/configs/*`, `kit/examples/*` bodies, landing/host-alias/AGENTS templates, MARKDOWN-STANDARD, universe rewrite of git log.

### Allow / deny

| Phase | Allow | Deny |
|-------|--------|------|
| **P0** | `docs/WORKBOARD.md`, `docs/plan/commit-notes-2.13.0/**`, `docs/plan/README.md`, `docs/README.md` | Any `kit/**` law |
| **P1** | `kit/rules/versioning-and-git.md` **only** | RULES Must table extra row; new H2 if Contents already lists Commit message format; trailer cascade rewrite; CHANGELOG ship |
| **P2** | `kit/RULES.md` (existing commit Must + Operator step 5); `kit/rules/verification-and-ops.md` (cite) | New hub Must; reprint of the identity table; examples |
| **P3** | CATALOG maintainer/reviewer verify; `templates/maintainer.md`; `examples/generated-maintainer.sample.md` | BUILD; generated/; other seed packs except reviewer one-line cite |
| **P4** | `kit/UPGRADE.md` (no complete-fail for historical messages) | History rewrite; Operator prompts; universe sweep |
| **P5** | CHANGELOG `### [2.13.0]`; archive annex; board close; on-edit `docs/project_build/kit-context.md` ship-state | New features; amend published SHAs |

---

## 3. Master order of operations

```text
P0 Register annex + freeze
   → Board primary = commit-notes-2.13.0; annex linked; no kit/ edits
        │
        ▼
P1 versioning-and-git (unique owner)
   → Commit-note identity test; keep signature; pre-commit checks; examples voice
        │
        ▼
P2 Hub + verification cites
   → Retarget existing Must / Operator step 5; checklist + anti-pattern cite
        │
        ▼
P3 Instruct maintainer views
   → CATALOG + maintainer template/sample; no BUILD
        │
        ▼
P4 UPGRADE forward-only
   → No complete-fail for historical commit messages
        │
        ▼
P5 Ship 2.13.0 + archive
   → CHANGELOG; annex archived; board primary none
```

| Phase | Theme | Why this order | Exit criterion |
|-------|--------|----------------|----------------|
| **P0** | Freeze | Test exists before field text | Annex + board; P1 `active` |
| **P1** | Unique owner | Form law before cites | Tests 1–4 present; signature unchanged; Must table still 5; version **1.1.0** |
| **P2** | Incorporation | Peers cite after the owner | Hub Must count unchanged; no reprint of the test table |
| **P3** | Instruct views | Seeds after L4 | maintainer verify names staged-change; generated/ empty |
| **P4** | Adopt | Procedure after the standard | UPGRADE: no complete-fail; no history rewrite |
| **P5** | Ship | Version after L4 agrees | `### [2.13.0]`; annex archived |

### Frozen decisions (do not re-litigate)

| Topic | Decision |
|-------|----------|
| Owner | `kit/rules/versioning-and-git.md` |
| Kit version | **2.13.0** (minor on 2.12.0: new fail for objective-only commit notes on new commits) |
| Document versions | versioning-and-git **1.0.5 → 1.1.0**; verification-and-ops **1.7.2 → 1.7.3**; UPGRADE **1.8.8 → 1.8.9**; CATALOG **1.2.7 → 1.2.8**; RULES hub **2.7.5** (Must wording retarget; count unchanged) |
| Signature | Unchanged: `<type>(<scope>): <imperative summary>` · body · AI trailers when assisted |
| Identity test | (1) **Staged-change summary:** names what this commit actually changed (actions / rules / paths in the staged diff); stale if the diff changed and this text did not; not the program or phase objective. (2) Conventional signature; type matches staged files. (3) Wrong if swapped onto another commit in the same stack. (4) Body required unless the subject alone names the staged actions; body states **what changed**; why/migration may follow; not a diff dump. |
| Tiny omit-if | One-file wording / typo: subject-only is legal if test 1 holds |
| AI trailers | Unchanged (Assisted-by / Compliance / Instructed-by; cascade; no Directed-by) |
| H2 / anchor | Keep `## Commit message format` and `#commit-message-format`. New H3 `### Commit-note identity` → `#commit-note-identity` |
| Anti-pattern to **add** | Avoid: `ship 2.12.0`, `complete P1`, `finish the program`, body that only restates the goal. Prefer: the staged action (e.g. `docs(std): require current-content summary in identity test`). **Keep** `update stuff` / `wip` / type-mismatch rows. |
| Pre-commit checks | Add: names staged change not objective; body (when required) states what changed |
| Hub | Retarget existing commit Must + Operator step 5. No new Must. No new map row. |
| Historical commits | Do **not** rewrite. Not a failed complete on upgrade. |
| This-kit dogfood | After P1, later commits in this program pass the test. Do not amend published SHAs. |
| examples | No body edits |
| verification-and-ops | Cite; no second copy of the test table |

### Active phase brief

### P0

| Field | Value |
|-------|--------|
| **Current state** | Commit format is conventional type/scope + optional why-body + AI trailers. Subjects may name the objective (`ship 2.12.0`, `complete P1`). |
| **Issue** | History records goals, not the staged change. Enforcement is “avoid vague” only. |
| **Fix** | Freeze staged-change identity test; keep signature. |
| **Allow** | `docs/WORKBOARD.md`, `docs/plan/commit-notes-2.13.0/**`, `docs/plan/README.md`, `docs/README.md` |
| **Deny** | Any `kit/**` law |
| **Exit** | Annex linked; P1 `active` |

### P4

| Field | Value |
|-------|--------|
| **Current state** | L4 and Instruct views name the test. UPGRADE does not say historical commit messages are not a gate. |
| **Issue** | Adopters might try to rewrite git history or fail complete on old subjects. |
| **Fix** | UPGRADE preserve: no complete-fail; do not rewrite published history. |
| **Allow** | `kit/UPGRADE.md` |
| **Deny** | History rewrite; Operator prompts; universe sweep |
| **Exit** | UPGRADE names 1.1.0; no rewrite instruction |

---

## 4. Verification

Empty inventory. No language gates.

| Phase | Checks |
|-------|--------|
| **P0** | Author checklist on annex; links resolve; no `{{PLACEHOLDERS}}`; board annex set |
| **P1** | Identity test present; signature unchanged; one-file omit-if remains; Must rows still 5; `#commit-message-format` unchanged |
| **P2** | Hub Must count unchanged; verification cites only; no reprint of the test table |
| **P3** | generated/ empty; BUILD not run; maintainer verify names staged-change |
| **P4** | UPGRADE: no complete-fail; no instruction to rewrite history |
| **P5** | CHANGELOG `### [2.13.0]`; annex archived; no L4 “active planning” |

---

## 5. Docs and CHANGELOG on ship

| Phase | L4 owners |
|-------|-----------|
| **P0** | — |
| **P1** | `kit/rules/versioning-and-git.md` |
| **P2** | `kit/RULES.md` · `kit/rules/verification-and-ops.md` |
| **P3** | CATALOG · maintainer template/sample |
| **P4** | `kit/UPGRADE.md` |
| **P5** | `kit/CHANGELOG.md` `### [2.13.0]`; archive this annex |

P5 notes: commit-note identity test (staged-change summary); signature unchanged; forward-only for historical messages; no inventory/SAST/hub Must-count change.

---

## 6. Risks and rollback

| Risk | Mitigation |
|------|------------|
| Trailer / type(scope) churn | Frozen signature |
| Mandatory novel-length bodies | Omit-if when subject names the action; not a diff dump |
| History rewrite to “fix” old subjects | Explicit deny; UPGRADE no complete-fail |
| Sixth hub Must | C4; retarget only |
| Objective-only subjects after P1 in this program | Invariant 7 |
| Rollback | Revert that phase first; P2–P4 depend on P1 |
