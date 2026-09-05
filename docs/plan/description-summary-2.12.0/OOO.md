---
title: "description-summary-2.12.0 — order of operations"
description: Goals, frozen identity-test (current-content summary), phased OOO, verification, and risks for kit 2.12.0.
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
  - ../../../kit/MARKDOWN-STANDARD.md
  - ../../../kit/rules/files.md
  - ../../../kit/rules/authoring-and-style.md
  - ../../../kit/UPGRADE.md
last_updated: "2026-09-04"
---

# Description summary 2.12.0 — order of operations

**Board:** [docs/WORKBOARD.md](../../WORKBOARD.md)  
**Annex index:** [README.md](./README.md)

Program-level OOO. Per-phase file patches wait until that phase is `active`. Law ships as kit **2.12.0**. Current baseline: **2.11.2**. Instruct off. No root `PLAN.md`.

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
| S1 | Unique owner: `kit/MARKDOWN-STANDARD.md` identity test **requires** YAML `description` to summarize this file’s **current content** (owned rules, surfaces, or procedures). Stale leftover, title paraphrase, and when-to-open-only blurbs fail. |
| S2 | Keep uniqueness: still add a claim not in `title` / filename / `doc_type`; still wrong if swapped onto a sibling. When-to-open only if the summary does not already imply it. |
| S3 | Same-change-set: when this file’s owned facts change, refresh `description` with the body. Cite `kit/rules/contracts.md`; do not fork a second co-update table. |
| S4 | Directory-index **Function** cells stay uniqueness at one-line resolution (not a paste of YAML `description`). Column name stays **Function**. `kit/rules/files.md` **cites**. |
| S5 | Templates teach the job (YAML `{{DESCRIPTION}}` hint + DIR-README). Agents copy skeletons, not a second test table. |
| S6 | Adoptability: test applies to **new** markdown and **when already editing**. Historical stale or tautological blurbs are **not** a failed complete. |
| S7 | Hub stays a pointer: **no** new Must; **no** new authority-map row. Optional concern-label retarget only. |
| S8 | Ship kit **2.12.0**. |

### Non-goals (must not in this program)

| Item | Why |
|------|-----|
| Sentence quota, mandatory 3–4 sentence `description`, named “full vs thin” profiles | Rejected in frontmatter-2.10.0 / definitional-identity-2.11.0 |
| Universe sweep of every existing `description:` | On-edit only, same as YAML fences and 2.11.0 |
| Requiring Function cell = full YAML `description` | Second home (density) |
| Hub Must, Operator-prompts step, or new map row | Map already names MARKDOWN-STANDARD |
| Reopen `files.md` adopt-mode matrix, categories, or path-shape | Cite only |
| Backfill directory-index READMEs | files-law-2.9.0 forward-only |
| YAML on landing `README.md`, host aliases, regenerable dumps, Keep a Changelog files, root `AGENTS.md` | Closed omit list (2.10.0) |
| Domain A/B, inventory rows, FILE-CATALOG.md required | Author checklist only |
| Enable Instruct / run BUILD | Instruct remains off |
| Restyle every body while tightening the test | Surgical: field job + cites + skeletons |

### Invariants (hard)

```text
1. Unique rule, one owner. MARKDOWN-STANDARD owns the identity test + YAML form.
   files.md owns create/place/name/when an index exists. Do not fork a second test.
2. Density: no fact in frontmatter AND lead AND Summary AND body. Description owns
   the blurb. Lead Should match description sentence 1. Function may overlap
   uniqueness only — not the whole blurb.
3. related: 3–7 on substantial docs. Hub exception unchanged. Last citation remains.
4. One sentence remains legal IF tests 1–3 hold. Folded scalar legal. No sentence quota.
5. Greenfield: new markdown gets a current-content description at create time.
6. Existing first adopt: map reality; do not rewrite product trees to inject blurbs.
7. Upgrade: merge MARKDOWN-STANDARD; do not fail complete for historical
   stale, tautological, or title-paraphrase descriptions.
8. Directory index remains forward-only and not Domain A/B.
9. SETUP ephemeral / UPGRADE durable. Kit baseline + CHANGELOG on ship.
10. Heading ### Description identity and #description-identity stay (no cite churn).
11. Surgical edits. Must table ≤ 5 on policy files we touch. files.md Must table
    already has 5 — P2 adds body/cite only, not a sixth Must row.
12. Parent owns the board. Instruct off; no PLAN.md in this repo.
```

---

## 2. Constraint map

| Fact | Implication for the OOO |
|------|-------------------------|
| This repo **is** the kit; docs-only; Instruct off | Skip O3; no language gates; author checklist only |
| Kit **2.11.2**; MARKDOWN-STANDARD **1.5.0**; identity test is uniqueness + optional when-to-open | Add **current-content** as test 1; keep 2–4; keep one-sentence-legal |
| `related:` already 7 on MARKDOWN-STANDARD | P1: no extra peer; stay 3–7 |
| files.md **1.0.2** Must table has 5 rows | P2: one sentence; no new Must; matrix untouched |
| Hub Must map complete | No new Must; optional concern-label only → hub **2.7.4** if that label changes |
| UPGRADE already has no complete-fail for tautological descriptions | Extend that sentence to **stale** (body no longer matches) |
| verification-and-ops docs-only row already says author checklist including density | Do **not** add a verify-table row |
| Landing / AGENTS / CHANGELOG omit YAML | Unchanged |

**Surfaces this program may touch**

| Surface | Paths |
|---------|--------|
| Form (owner) | `kit/MARKDOWN-STANDARD.md` |
| Cites | `kit/rules/files.md` · `kit/rules/authoring-and-style.md` |
| Templates | `kit/templates/TEMPLATE-DIR-README.md`; YAML templates that already have `description: "{{DESCRIPTION}}"` (HTML comment only) |
| Adopt | `kit/SETUP.md` · `kit/UPGRADE.md` |
| Hub (optional) | `kit/RULES.md` authority-map **concern label** for MARKDOWN-STANDARD only |
| Instruct | `kit/agents/CATALOG.md` docs-author verify · `kit/agents/templates/docs-author.md` |
| History | `kit/CHANGELOG.md` under `## repo-kit` |
| Execution | `docs/WORKBOARD.md` · this annex · `docs/plan/README.md` · `docs/README.md` |

Do **not** touch unless a later phase explicitly allows: root `README.md` body, root `AGENTS.md`, `kit/RULES.md` Must table, HABITAT, OPS/BUILD/PARAMS/RUNTIME/FRAMEWORK, workboard/hygiene/security/contracts/verification-and-ops/continuity/architecture/versioning-and-git, `kit/configs/*`, `kit/examples/*` bodies, `TEMPLATE-LANDING-README.md`, `TEMPLATE-HOST-ALIAS.md`, `TEMPLATE-AGENTS.md`, `TEMPLATE-PROGRAM-README.md`, new directory READMEs under existing `kit/` trees, universe sweep of `kit/rules/*.md` descriptions.

### Allow / deny

| Phase | Allow | Deny |
|-------|--------|------|
| **P0** | `docs/WORKBOARD.md`, `docs/plan/description-summary-2.12.0/**`, `docs/plan/README.md`, `docs/README.md` (plan-module honesty) | Any `kit/**` law |
| **P1** | `kit/MARKDOWN-STANDARD.md` **only** | Templates, SETUP, UPGRADE, files.md, examples, CHANGELOG ship, RULES Musts, new H2, new `#description-identity` slug |
| **P2** | `kit/rules/files.md`, `kit/rules/authoring-and-style.md` (one-sentence cites + on-edit `description` if that file’s blurb fails the new test) | Reprint of the identity test; new Musts; reopen adopt-mode matrix; verification-and-ops; examples |
| **P3** | `TEMPLATE-DIR-README.md`; HTML comment next to `{{DESCRIPTION}}` on TEMPLATE-README / CLI / SECURITY / METHODOLOGY / CONCEPT / GENERIC | TEMPLATE-LANDING-README; TEMPLATE-HOST-ALIAS; TEMPLATE-AGENTS; TEMPLATE-PROGRAM-README |
| **P4** | SETUP (one sentence); UPGRADE (forward-only + merge version); optional RULES map-row **label** | YAML on CHANGELOG / AGENTS.md / landing; universe sweep; Operator prompts; new hub Must or map row |
| **P5** | CATALOG docs-author + `templates/docs-author.md` | BUILD; generated/; other seed packs |
| **P6** | CHANGELOG `### [2.12.0]`; history/`last_updated` on touched L4 if missed; archive annex; board close; on-edit `docs/project_build/kit-context.md` ship-state row | New features; retrofit descriptions on files this program did not patch |

---

## 3. Master order of operations

```text
P0 Register annex + freeze identity test
   → Board primary = description-summary-2.12.0; annex linked; no kit/ edits
        │
        ▼
P1 MARKDOWN-STANDARD (unique owner)
   → Test 1 = current-content summary; keep uniqueness; same-change-set cite; checklist; anti-pattern
        │
        ▼
P2 Cite files.md + authoring (no reprint)
   → Function: uniqueness (tests 2–3) at one line; authoring cite retargets
        │
        ▼
P3 Templates
   → {{DESCRIPTION}} hint names current-content; DIR-README still uniqueness for Function
        │
        ▼
P4 Adopt surfaces + optional hub label
   → SETUP/UPGRADE forward-only; no complete-fail for historical stale blurbs
        │
        ▼
P5 Instruct docs-author seed
   → Verify current-content + uniqueness; no BUILD
        │
        ▼
P6 Ship 2.12.0 + archive
   → CHANGELOG; annex archived; board primary none
```

| Phase | Theme | Why this order | Exit criterion |
|-------|--------|----------------|----------------|
| **P0** | Freeze | Test and non-goals exist before field text | Annex + board; P1 `active` after this freeze |
| **P1** | Unique owner | Form law before cites or templates | Tests 1–4 present; no sentence quota; YAML sample still a content summary; checklist item; anti-pattern; no new H2; `#description-identity` unchanged; version **1.6.0** |
| **P2** | Incorporation | Peers cite after the owner exists | One sentence each; files.md adopt matrix untouched; Must table still 5 |
| **P3** | Skeletons | Templates follow the owner | DIR-README Function still uniqueness; YAML hints name current-content; landing/alias/AGENTS still omit YAML |
| **P4** | Adopt | Procedure after the standard exists | UPGRADE: no complete-fail; SETUP: new markdown fills current-content description; hub Must index unchanged |
| **P5** | Instruct views | Seeds after L4 | docs-author verify names current-content summary; generated/ empty |
| **P6** | Ship | Version after L4 agrees | `### [2.12.0]`; annex archived |

### Frozen decisions (do not re-litigate)

| Topic | Decision |
|-------|----------|
| Owner | `kit/MARKDOWN-STANDARD.md` |
| Kit version | **2.12.0** (minor on 2.11.2: new author-checklist fail for new/on-edit stale descriptions) |
| Document versions | MARKDOWN-STANDARD **1.5.0 → 1.6.0**; files.md **1.0.2 → 1.0.3**; authoring-and-style **1.2.4 → 1.2.5**; UPGRADE **1.8.7 → 1.8.8**; CATALOG **1.2.6 → 1.2.7**; TEMPLATE-DIR-README **1.1.0 → 1.1.1**; RULES hub **2.7.4** only if the map-row label changes |
| Identity test (`description`) | (1) **Current-content summary:** states what this file actually contains now (owned rules, surfaces, or procedures); would be **stale** if those owned facts changed and this line did not. (2) Adds at least one claim not already in `title`, filename, or `doc_type`. (3) Would be **wrong** if swapped onto a sibling in the same directory. (4) When-to-open only if the summary does not already imply it. |
| Length | One sentence remains **legal** if (1)–(3) hold. Folded scalar legal. No sentence quota. No fluff. Not a Contents reprint. |
| Lead | At most one sentence; **Should** match `description` sentence 1 |
| Same-change-set | When this file’s owned facts change, refresh `description` in the same change set (`kit/rules/contracts.md` — cite, don’t reprint) |
| Function cells | Tests **(2)–(3)** at **one-line** resolution: unique role **in this folder**. Not a paste of YAML `description`. Not test (1) restated. Column name **Function**. |
| H3 / anchor | Keep `### Description identity` and `#description-identity` |
| YAML sample | Keep `description: "CLI verbs, flags, exits, and stable stdout. Open when changing invocation or output; not the library API."` (already a content summary) |
| Anti-pattern to **add** | Avoid: stale or topic-only `description` that does not match the current body. Prefer: a summary that would be wrong after a material body change. **Keep** title-restated and padding-to-quota rows. |
| Checklist | `description` passes the identity test (current-content summary + uniqueness); lead does not reprint all of it; refresh when owned facts changed |
| `{{DESCRIPTION}}` hint | Identity test: current-content summary + uniqueness; not a sentence count |
| Hub | No new Must; no new map row. **May** retarget concern text to `Markdown structure, frontmatter / description identity (current-content summary), author checklist`. |
| New files | Fence + current-content `description` in the same change set as create |
| Old files | Apply the test when that file is **already being edited**; not a failed complete |
| This-kit dogfood | On-edit only: files this program patches. Do **not** sweep `kit/rules/*.md` descriptions |
| verification-and-ops | No new row |
| examples | No body edits |

### Active phase brief

Fill **only** the `active` / current wait phase, plus the next `open` if needed to start it.

### P0

| Field | Value |
|-------|--------|
| **Current state** | Identity test (MARKDOWN-STANDARD **1.5.0**) is uniqueness + optional when-to-open. Descriptions need not match the current body. |
| **Issue** | A legal `description` can be a title paraphrase or stale leftover and still pass. |
| **Fix** | Freeze test 1 as current-content summary; uniqueness stays; on-edit / forward-only. |
| **Allow** | `docs/WORKBOARD.md`, `docs/plan/description-summary-2.12.0/**`, `docs/plan/README.md`, `docs/README.md` |
| **Deny** | Any `kit/**` law |
| **Exit** | Annex linked from the board; plan index lists the open pack; P1 `active` |

### P2

| Field | Value |
|-------|--------|
| **Current state** | MARKDOWN-STANDARD **1.6.0** has tests 1–4. files.md still cites the identity test at one line without splitting uniqueness from content summary. |
| **Issue** | Peers could apply test 1 to Function cells or reprint the table. |
| **Fix** | One-sentence cites: Function = tests 2–3; YAML `description` keeps test 1. |
| **Allow** | `kit/rules/files.md`, `kit/rules/authoring-and-style.md` |
| **Deny** | Reprint of the identity test; new Musts; reopen adopt-mode matrix; verification-and-ops; examples |
| **Exit** | One sentence each; files.md Must table still 5; adopt-mode matrix untouched |

---

## 4. Verification

Empty inventory. No language gates.

| Phase | Checks |
|-------|--------|
| **P0** | Author checklist on annex; links from `docs/plan/description-summary-2.12.0/` resolve; no leftover `{{PLACEHOLDERS}}`; board annex set; plan index lists the open pack |
| **P1** | Test 1 is current-content; uniqueness 2–3 remain; one sentence legal; no new H2; slug unchanged; checklist names current-content; anti-pattern added |
| **P2** | files.md / authoring cite only; Function = tests 2–3; adopt-mode matrix unchanged; files.md Must rows still 5 |
| **P3** | Landing/alias/AGENTS still omit YAML; `{{DESCRIPTION}}` hint names current-content; Function examples stay uniqueness |
| **P4** | UPGRADE: no complete-fail for historical stale descriptions; SETUP: new markdown fills current-content description; hub Must index unchanged |
| **P5** | generated/ empty; BUILD not run; docs-author verify names current-content summary |
| **P6** | CHANGELOG `### [2.12.0]`; annex archived; no L4 “active planning” |

---

## 5. Docs and CHANGELOG on ship

| Phase | L4 owners |
|-------|-----------|
| **P0** | — |
| **P1** | `kit/MARKDOWN-STANDARD.md` |
| **P2** | `files.md` · `authoring-and-style.md` |
| **P3** | listed templates |
| **P4** | SETUP · UPGRADE · optional `kit/RULES.md` map-row label |
| **P5** | CATALOG docs-author · docs-author template |
| **P6** | `kit/CHANGELOG.md` `### [2.12.0]`; archive this annex |

P6 notes should state: identity test requires a current-content summary; uniqueness unchanged; no sentence quota; forward-only / on-edit; no complete-fail for historical stale blurbs; no inventory, SAST, hub Must-map, or layout migration.

---

## 6. Risks and rollback

| Risk | Mitigation |
|------|------------|
| Sentence quota sneaks back | Frozen: one sentence legal if 1–3 hold |
| Function cell becomes a pasted `description` | Frozen: tests 2–3 only; P2 cite |
| Adopter complete-fail on old blurbs | UPGRADE explicit; same as YAML / 2.11.0 |
| Universe sweep of every `.md` description | On-edit only; P4/P6 deny |
| Anchor churn (`#description-identity`) | Frozen: keep H3 title |
| Contents reprint as “summary” | Frozen: not a Contents reprint; owned facts only |
| Hub Must or extra map row | S7; optional label only |
| Rollback | Revert that phase first; P2–P5 depend on P1 |
