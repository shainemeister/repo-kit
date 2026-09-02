---
title: "definitional-identity-2.11.0 — order of operations"
description: Goals, identity-test freeze, phased OOO, verification, and risks for the definitional-identity floor. Archived; read L4 MARKDOWN-STANDARD 1.5.0.
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
  - ../../../../kit/MARKDOWN-STANDARD.md
  - ../../../../kit/rules/files.md
  - ../../../../kit/rules/authoring-and-style.md
  - ../../../../kit/UPGRADE.md
last_updated: "2026-09-01"
---

# Definitional identity 2.11.0 — order of operations

**Board:** [docs/WORKBOARD.md](../../../WORKBOARD.md)  
**Annex index:** [README.md](./README.md)

Program-level OOO. Per-phase file patches wait until that phase is `active`. Law ships as kit **2.11.0**. Current baseline: **2.10.0**. Instruct off. No root `PLAN.md`.

If P0 review prefers patch numbering, retarget the ship version to **2.10.1** **before P1**. Scope does not change.

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
| D1 | Unique owner: [MARKDOWN-STANDARD](../../../../kit/MARKDOWN-STANDARD.md) owns a **definitional identity test** for YAML `description` (no sentence quota). |
| D2 | Same test at one-line resolution for directory-index **Function** cells. Column name stays **Function**. `files.md` **cites**; it does not reprint the test or absorb a field table. |
| D3 | Three resolutions, no second home: YAML `description` = full identity; lead = sentence 1; Function = unique role in that folder (not a paste of the blurb). |
| D4 | Templates actually teach the pattern (YAML sample + `TEMPLATE-DIR-README` + placeholder hint). Agents copy skeletons, not field tables. |
| D5 | Adoptability: test applies to **new** markdown and **when already editing**. Historical tautological blurbs / missing differentia are **not** a failed complete. |
| D6 | Hub stays a pointer: **no** new Must; **no** new authority-map row. Optional concern-label retarget only. |
| D7 | Ship kit **2.11.0** (or **2.10.1** if P0 retargets numbering). |

### Non-goals (must not in this program)

| Item | Why |
|------|-----|
| Sentence quota, mandatory 3–4 sentence `description`, named “full vs thin” profiles | Rejected in [frontmatter-2.10.0](../frontmatter-2.10.0/OOO.md); omit-if |
| Mandatory `keywords`, `language.md`, or a new domain module | 2.10.0 non-goal; files.md still owns paths; MARKDOWN-STANDARD owns prose identity |
| Requiring Function cell = full `description` | Second home ([density](../../../../kit/MARKDOWN-STANDARD.md#density-force-and-incorporation)) |
| Hub Must, Operator-prompts step, or new map row for “description” | Map already names MARKDOWN-STANDARD (frontmatter) and files.md (placement) |
| Reopen `files.md` adopt-mode matrix, categories, or path-shape rules | Cite only |
| Backfill directory-index READMEs (`kit/rules/`, `kit/templates/`, `kit/configs/`, `kit/examples/`, `kit/agents/`, historical product dirs) | [files-law-2.9.0](../files-law-2.9.0/OOO.md) forward-only; not a gate |
| Universe sweep of every existing `description:` | On-edit only, same as YAML fences |
| YAML on landing `README.md`, host aliases, regenerable dumps, Keep a Changelog files, root `AGENTS.md` | Closed omit list (2.10.0) |
| Rename Function → Role/Purpose; change annex **Role** column on `TEMPLATE-PROGRAM-README` | files.md already shipped Function; program-README Role is workboard |
| Domain A/B, inventory rows, FILE-CATALOG.md required | Author checklist only |
| Enable Instruct / run BUILD in this repo | Instruct remains off; generated/ empty |
| Restyle every body while tightening identity | Surgical: field job + cites + skeletons |

### Invariants (hard)

```text
1. Unique rule, one owner. MARKDOWN-STANDARD owns the identity test + YAML form.
   files.md owns create/place/name/when an index exists. Do not fork a second test.
2. Density: no fact in frontmatter AND lead AND Summary AND body. Description owns
   the blurb. Lead Should match description sentence 1. Function may overlap
   differentia only — not the whole blurb.
3. related: 3–7 on substantial docs. Hub exception unchanged. Last citation remains.
4. One sentence remains legal IF the identity test holds. Folded scalar legal.
   Do not pad to a sentence count.
5. Greenfield: new markdown gets a definitional description at create time.
6. Existing first adopt: map reality; do not rewrite product trees to inject blurbs.
7. Upgrade: merge MARKDOWN-STANDARD; do not fail complete for historical
   tautological or title-paraphrase descriptions (same spirit as YAML / directory-index).
8. Directory index remains forward-only and not Domain A/B.
9. SETUP ephemeral / UPGRADE durable. Kit baseline + CHANGELOG on ship.
10. Fold path unchanged. Instruct optional; seeds may cite; no BUILD here.
11. Surgical edits. Must table ≤ 5 on policy files we touch. files.md Must table
    already has 5 — P2 adds body/cite only, not a sixth Must row.
12. Parent owns the board. Instruct off; no PLAN.md in this repo.
```

---

## 2. Constraint map

| Fact | Implication for the OOO |
|------|-------------------------|
| This repo **is** the kit; docs-only; Instruct off | Skip O3; no language gates; author checklist only |
| Kit **2.10.0**; MARKDOWN-STANDARD **1.4.0**; `description` job is “owns + when to open”; “one sentence is legal” | Change the **quality floor**, not a quota; keep one-sentence-legal |
| `related:` already 7 on MARKDOWN-STANDARD | P1: no extra peer; stay 3–7 |
| files.md **1.0.1** Must table has 5 rows; adopt-mode matrix just shipped | P2: one sentence in Directory index; no new Must; matrix untouched |
| Hub Must map complete (2.7.2 / 2.9.0 / 2.10.0 left it unchanged) | No new Must; optional concern-label only → hub **2.7.3** if that label changes |
| UPGRADE: no complete-fail for historical missing YAML or directory READMEs | Same sentence for historical vague `description` |
| 2.9.0 non-goal: retrofit kit dirs for indexes | Do **not** add `kit/rules/README.md` (or templates/configs/examples/agents indexes) as dogfood |
| Dogfood lever is templates, not a historical index | `TEMPLATE-DIR-README` + YAML sample; on-edit descriptions only on files this program already patches |
| verification-and-ops docs-only row already says “author checklist including density” | Do **not** add a verify-table row; checklist is the owner |
| examples already say “author checklist including density” | Inherit the new checklist item; do not restyle example bodies |
| `TEMPLATE-PROGRAM-README` File **Role** vs files.md **Function** | Leave the program-README template alone (workboard). New directory indexes keep **Function** |
| Landing / AGENTS / CHANGELOG omit YAML | Unchanged |
| Future CLIs / harvesters | Still out of scope; do not name them in L4 |

**Surfaces this program may touch**

| Surface | Paths |
|---------|--------|
| Form (owner) | `kit/MARKDOWN-STANDARD.md` |
| Cites | `kit/rules/files.md` · `kit/rules/authoring-and-style.md` |
| Templates | `kit/templates/TEMPLATE-DIR-README.md` (**required**); YAML templates that already have `description: "{{DESCRIPTION}}"` (HTML comment only) |
| Adopt | `kit/SETUP.md` · `kit/UPGRADE.md` |
| Hub (optional) | `kit/RULES.md` authority-map **concern label** for MARKDOWN-STANDARD only |
| Instruct | `kit/agents/CATALOG.md` docs-author verify · `kit/agents/templates/docs-author.md` |
| History | `kit/CHANGELOG.md` under `## repo-kit` |
| Execution | `docs/WORKBOARD.md` · this annex · `docs/plan/README.md` · `docs/README.md` (plan-module honesty) |

Do **not** touch unless a later phase explicitly allows: root `README.md` body, root `AGENTS.md`, `kit/CHANGELOG.md` body structure (ship section only in P6), `kit/RULES.md` Must table, HABITAT, OPS/BUILD/PARAMS/RUNTIME/FRAMEWORK, `kit/rules/workboard.md` / hygiene / security / contracts / verification-and-ops / continuity / architecture / versioning-and-git, `kit/configs/*`, `kit/examples/*` bodies, `TEMPLATE-LANDING-README.md`, `TEMPLATE-HOST-ALIAS.md`, `TEMPLATE-AGENTS.md`, `TEMPLATE-PROGRAM-README.md`, new directory READMEs under existing `kit/` trees.

### Allow / deny

| Phase | Allow | Deny |
|-------|--------|------|
| **P0** | `docs/WORKBOARD.md`, `docs/plan/definitional-identity-2.11.0/**`, `docs/plan/README.md`, `docs/README.md` (plan-module honesty) | Any `kit/**` law |
| **P1** | `kit/MARKDOWN-STANDARD.md` **only** | Templates, SETUP, UPGRADE, files.md, examples, CHANGELOG ship, RULES Musts, new H2 (Contents already present) |
| **P2** | `kit/rules/files.md`, `kit/rules/authoring-and-style.md` (one-sentence cites + on-edit `description` if that file’s blurb fails the new test) | Reprint of the identity test; new Musts; reopen adopt-mode matrix; verification-and-ops; examples |
| **P3** | `TEMPLATE-DIR-README.md`; HTML comment next to `{{DESCRIPTION}}` on TEMPLATE-README / CLI / SECURITY / METHODOLOGY / CONCEPT / GENERIC | TEMPLATE-LANDING-README; TEMPLATE-HOST-ALIAS; TEMPLATE-AGENTS; TEMPLATE-PROGRAM-README; inventing a `kit/rules/README.md` |
| **P4** | SETUP (one sentence); UPGRADE (forward-only + merge version); optional RULES map-row **label** | YAML on CHANGELOG / AGENTS.md / landing; universe sweep; Operator prompts; new hub Must or map row |
| **P5** | CATALOG docs-author + `templates/docs-author.md` | BUILD; generated/; other seed packs unless a one-line path is already needed (it is not) |
| **P6** | CHANGELOG `### [2.11.0]`; history/`last_updated` on touched L4 if missed; archive annex; board close | New features; retrofit YAML/descriptions/indexes on omit-list or historical files |

---

## 3. Master order of operations

```text
P0 Register annex + freeze identity test
   → Board primary = definitional-identity-2.11.0; annex linked; no kit/ edits
        │
        ▼
P1 MARKDOWN-STANDARD (unique owner)
   → Identity test in YAML section (no new H2); field reference; sample; checklist; anti-pattern
        │
        ▼
P2 Cite files.md + authoring (no reprint)
   → Function cells: one sentence + deep link; authoring item 2 retargets “blurb”
        │
        ▼
P3 Templates
   → DIR-README definitional description + example Function rows; {{DESCRIPTION}} hint
        │
        ▼
P4 Adopt surfaces + optional hub label
   → SETUP/UPGRADE forward-only; no complete-fail; map-row label omit-if
        │
        ▼
P5 Instruct docs-author seed
   → Verify identity test; no BUILD
        │
        ▼
P6 Ship 2.11.0 + archive
   → CHANGELOG; annex archived; board primary none
```

| Phase | Theme | Why this order | Exit criterion |
|-------|--------|----------------|----------------|
| **P0** | Freeze | Test, owners, and non-goals must exist before field text | Annex + board; user can reject before `kit/` edits |
| **P1** | Unique owner | Form law before cites or templates | Identity test present; no sentence quota; YAML sample definitional; checklist item; anti-pattern; no new H2; `related:` still 3–7; version **1.5.0** |
| **P2** | Incorporation | Peers cite after the owner exists | One sentence each; files.md adopt matrix untouched; Must table still 5 |
| **P3** | Skeletons | Templates follow the owner | DIR-README passes the test; Function examples are definitional; landing/alias/AGENTS still omit YAML |
| **P4** | Adopt | Procedure after the standard exists | UPGRADE: no complete-fail; SETUP: new markdown fills description per field reference; hub Must index unchanged |
| **P5** | Instruct views | Seeds after L4 | docs-author verify names the test; generated/ empty |
| **P6** | Ship | Version after L4 agrees | `### [2.11.0]`; annex archived |

Defer per-phase implementation patches until that phase is `active`.

### Frozen decisions (do not re-litigate)

These are program constraints. P1 implements them in MARKDOWN-STANDARD; later phases cite or skeleton them. Do not invent extra tests, columns, or modules.

| Topic | Decision |
|-------|----------|
| Owner | `kit/MARKDOWN-STANDARD.md` |
| Kit version | **2.11.0** (minor on 2.10.0: new author-checklist fail for new/on-edit identity). P0 may retarget **2.10.1** before P1; scope unchanged |
| Document versions | MARKDOWN-STANDARD **1.4.0 → 1.5.0**; files.md **1.0.1 → 1.0.2**; authoring-and-style **1.2.3 → 1.2.4**; UPGRADE **1.8.5 → 1.8.6**; CATALOG **1.2.4 → 1.2.5**; TEMPLATE-DIR-README **1.0.0 → 1.1.0**; RULES hub **2.7.3** only if the map-row label changes |
| Identity test (`description`) | (1) Adds at least one claim not already in `title`, filename, or `doc_type`. (2) Would be **wrong** if swapped onto a sibling in the same directory. (3) When-to-open only if the definition does not already imply it. |
| Length | One sentence remains **legal** if (1)–(2) hold. Folded scalar legal. No sentence quota. No fluff. |
| Lead | At most one sentence; **Should** match `description` sentence 1; not a Must to rewrite on historical backfill |
| `## Summary` | Must table or omit-if — not a third prose recap |
| Function cells | Same tests (1)–(2) at **one-line** resolution: unique role **in this folder**. Not a paste of YAML `description`. Column name **Function** (do not rename). |
| YAML sample (P1 must use a definitional example, not the current tautology) | `description: "CLI verbs, flags, exits, and stable stdout. Open when changing invocation or output; not the library API."` (illustrative; `doc_type` in the sample stays `readme`) |
| Anti-pattern to **add** | Avoid: title restated + “open when looking here”. Prefer: a claim `title`/`doc_type` do not already contain; drop tautological when-to-open. **Keep** the existing “padding to a sentence quota” row. |
| Anti-pattern **not** to add | Inverse-only Must not that merely repeats the test |
| Checklist | Replace “`description` is the blurb (owns + when to open)” with the identity test (still: lead does not reprint all of it). Density item “`description` owns the blurb” stays. |
| `{{FILE_FUNCTION}}` meaning | Unique role in this folder (identity test at one line; not a filename restatement) |
| DIR-README default `description` | Replace “Index of files in this directory. Open when adding, moving, or finding a file here.” with a definition of **this catalog** (file → unique role; not landing; not package README). |
| DIR-README example rows | Keep `{{FILE_NAME}}` / `{{FILE_FUNCTION}}` as the live row. Add an **example-only** table (comment or fenced `markdown`) with three definitional Function cells, e.g. SETUP = first adopt (delete after initiation); UPGRADE = later bumps / 1.x→2.x; RULES = hub map + Must index. Label the example so copiers do not ship kit path names into a product folder. |
| `{{DESCRIPTION}}` hint | One HTML comment on GENERIC/README/CLI/SECURITY/METHODOLOGY/CONCEPT: identity test; not a sentence count. Do not add a new required template section. |
| Hub | No new Must; no new map row. **May** retarget concern text to `Markdown structure, frontmatter / description identity, author checklist`. |
| New files | Fence + definitional `description` in the same change set as create (`files.md` still owns create/place/name). |
| Old files | Apply the test when that file is **already being edited**; not a failed complete. |
| This-kit dogfood | On-edit only: files this program patches. Do **not** sweep `kit/rules/*.md` descriptions. Do **not** add historical directory READMEs. |
| verification-and-ops | No new row (author checklist already incorporated). |
| examples | No body edits (they already point at the author checklist). |
| Future CLIs | Do not name or specify them in L4 |

### Active phase brief

Fill **only** the `active` / current wait phase, plus the next `open` if needed to start it.

### P0

Register this annex and freeze the tables above. No `kit/` law edits. Exit: board **Optional annex** points here; plan index lists the open pack; P1 stays `blocked` (user confirm) until the user accepts the OOO (or retargets 2.10.1 numbering).

### P1 *(do not start until `active`)*

Edit `kit/MARKDOWN-STANDARD.md` only.

1. No new H2 (Contents already lists 15). Put the identity test **inside** [YAML frontmatter](../../../../kit/MARKDOWN-STANDARD.md#yaml-frontmatter) after the field reference (H3 allowed).  
2. Replace the sample `description` with the frozen illustrative line. Keep “one sentence is legal; do not pad to a sentence count.”  
3. Rewrite the `description` field-reference cell: canonical blurb; identity test (1)–(3); one sentence legal; no reprint in lead/Summary.  
4. Canonical-order lead row: keep “Should match `description` sentence 1.”  
5. Directory-index subsection: one sentence that Function cells use this test at one-line resolution; `files.md` still owns **when** the index exists.  
6. `{{FILE_FUNCTION}}` placeholder meaning per freeze.  
7. Author checklist (standard docs) + anti-pattern row per freeze.  
8. Bump **1.4.0 → 1.5.0**; `last_updated` 2026-09-01; history row. Align this file’s own `description` only if it fails the new test after the job exists.  
9. Stay `related:` 3–7. Must table: do not add one. Stop.

---

## 4. Verification

Empty inventory. No language gates.

| Phase | Checks |
|-------|--------|
| **P0** | Author checklist on annex; links from `docs/plan/definitional-identity-2.11.0/` resolve; no leftover `{{PLACEHOLDERS}}`; board annex set; plan index lists the open pack |
| **P1** | Identity test present; no 3–4 sentence quota; “one sentence is legal” remains; YAML sample is definitional; landing still no YAML; no new H2; density (description vs lead vs Summary); checklist names the test |
| **P2** | files.md / authoring cite only; adopt-mode matrix unchanged; files.md Must rows still 5; no second copy of the test table |
| **P3** | Landing/alias/AGENTS templates still omit YAML; DIR-README description passes the test; example Function rows are definitional and labeled example-only; `{{FILE_NAME}}`/`{{FILE_FUNCTION}}` still the live placeholders |
| **P4** | UPGRADE: no complete-fail for historical vague descriptions; SETUP: new markdown fills description per field reference; hub Must index unchanged; CHANGELOG and AGENTS.md still have no YAML |
| **P5** | generated/ empty; BUILD not run; docs-author verify names the identity test (not only “description is the blurb”) |
| **P6** | CHANGELOG `### [2.11.0]` (or `2.10.1` if retargeted); annex archived; no L4 “active planning” |

Do not invent Domain A/B commands.

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
| **P6** | `kit/CHANGELOG.md` `### [2.11.0]`; archive this annex |

P6 notes should state: definitional identity test for `description` and Function cells; no sentence quota; forward-only / on-edit; no complete-fail for historical tautological blurbs; no inventory, SAST, hub Must-map, or layout migration; no directory-index backfill; no external CLI contract.

---

## 6. Risks and rollback

| Risk | Mitigation |
|------|------------|
| Over-prescription (quotas, required keywords, two profiles) | Frozen non-goals; P1 review against “one sentence is legal” |
| Triple identity (YAML + lead + Summary) | Description owns blurb; Function is one-line differentia; checklist item |
| Function cell becomes a pasted `description` | Frozen: one line; not a reprint; P2 cite only |
| Adopter complete-fail on old blurbs | UPGRADE explicit; same as YAML / directory-index forward-only |
| files.md absorbs a second schema | P2 one sentence; adopt matrix deny |
| Historical `kit/` directory README backfill | Deny list; 2.9.0 non-goal |
| Hub Must or extra map row | D6; optional label only |
| Universe sweep of every `.md` description | On-edit only; P4 deny |
| Rename Function / fork Role | Frozen column name; skip TEMPLATE-PROGRAM-README |
| Future CLI sneaks into L4 | Non-goal; grep P1–P6 for product CLI/harvester names before ship |
| Rollback | Revert that phase first; P2–P5 depend on P1 |

If the user rejects the OOO before P1: do not edit `kit/MARKDOWN-STANDARD.md`.
