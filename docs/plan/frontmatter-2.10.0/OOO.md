---
title: "frontmatter-2.10.0 — order of operations"
description: Goals, omit list, under-prescription bounds, phased OOO, verification, and risks for markdown identity YAML.
version: "1.0.0"
status: current
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
last_updated: "2026-08-31"
---

# Frontmatter 2.10.0 — order of operations

**Board:** [docs/WORKBOARD.md](../../WORKBOARD.md)  
**Annex index:** [README.md](./README.md)

Program-level OOO. Per-phase file patches wait until that phase is `active`. Law ships as kit **2.10.0**. Current baseline: **2.9.0**. Instruct off. No root `PLAN.md`.

---

## 1. Goals and non-goals

### Goals (must)

| ID | Goal |
|----|------|
| M1 | Durable markdown has YAML **except** a closed omit list. Owner: [MARKDOWN-STANDARD](../../../kit/MARKDOWN-STANDARD.md). |
| M2 | YAML `description` is the **one** prose blurb (what it owns + when to open). Not a sentence-count quota. Lead does not reprint the whole blurb. `## Summary` stays a Must table or omit-if. |
| M3 | Optional `keywords:` — capped; replace, don’t append; never a per-chat tag log. |
| M4 | One language Must in writing conventions: descriptive nouns/verbs; no unexplained cryptic names; gloss kit terms at first use. No `language.md`. |
| M5 | Cite from `files.md` and authoring. No hub Must. No Operator-prompts step. No new directory. |
| M6 | Adoptability: required on **new** markdown and **when already editing**; missing YAML on old notes is **not** a failed complete. |
| M7 | This kit dogfoods YAML on durable docs we already owe (SETUP, examples, `docs/` indexes) — not a universe sweep. |
| M8 | Ship kit **2.10.0**. |

### Non-goals (must not in this program)

| Item | Why |
|------|-----|
| External CLIs, search tools, or “harvester” product contracts | Out of scope; future tools may **read** the fence later |
| `language.md` or a second naming module | `files.md` owns paths; MARKDOWN-STANDARD owns prose form |
| Mandatory `keywords`, mandatory 3–4 sentence `description`, named “full vs thin profiles” as a procedure | Over-prescriptive; use omit-if |
| YAML on landing `README.md`, host aliases, regenerable dumps, Keep a Changelog files, root `AGENTS.md` | Closed omit list |
| Hub Must-map rewrite; Domain A/B; inventory rows | Author checklist only |
| Reopen `files.md` adopt-mode matrix | Cite it |
| Root `./rules/`; nested `kit/rules/<category>/` | 2.x packaging unchanged |
| Paste field tables into `AGENTS.md` | L0 stays a pointer |
| Enable Instruct / run BUILD in this repo | Instruct remains off |
| Restyle every body while adding a fence | Surgical: fence + `description`; leave unique law |

### Invariants (hard)

```text
1. Unique rule, one owner. MARKDOWN-STANDARD owns YAML form + description job + keywords omit-if + language Must.
2. Density: no fact in frontmatter AND lead AND Summary AND body. Description owns the blurb.
3. related: 3–7 on substantial docs only. Thin files do not fake a peer dump.
4. files.md still owns create/place/name/directory index. This program cites, does not fork.
5. Greenfield: new markdown gets the fence at create time.
6. Existing first adopt: map reality; do not rewrite product trees to inject YAML.
7. Upgrade: merge MARKDOWN-STANDARD; do not fail complete for historical missing fences.
8. Regenerable dumps = output a command can recreate (dist/, coverage, last_certification.*, host mirrors of packs). Not authored docs. Do not YAML-stamp them.
9. SETUP ephemeral / UPGRADE durable. Kit baseline + CHANGELOG on ship.
10. Fold path unchanged. Instruct optional; seeds may cite; no BUILD here.
11. Surgical edits. Must table ≤ 5 on policy files we touch.
12. Parent owns the board.
```

---

## 2. Constraint map

| Fact | Implication for the OOO |
|------|-------------------------|
| This repo **is** the kit; docs-only; Instruct off | Skip O3; no language gates; author checklist only |
| Kit **2.9.0**; MARKDOWN-STANDARD **1.3.2**; `related:` already 7 | P1 bumps standard version; stay 3–7 YAML peers (no extra peer unless one is dropped) |
| `description` today is “single sentence” | Change the **job**, not a 3–4 sentence quota |
| Tiny-sample loophole (~30 lines, no fence) | Close for **durable** docs; omit list replaces it |
| Landing README required shape | Unchanged: no frontmatter |
| HABITAT: L0 ≪ 100 lines, pointer only | Root `AGENTS.md` stays omit |
| Keep a Changelog H2 → H3 → H4 | `CHANGELOG.md` / `kit/CHANGELOG.md` stay omit |
| `files.md` 1.0.0 just shipped | One cite: new markdown path gets fence except omit list |
| Hub Must map complete (2.7.2 / 2.9.0) | Do not add a Must; map already points at MARKDOWN-STANDARD |
| UPGRADE preserve: no directory-README backfill | Same pattern: no YAML backfill gate |

**Surfaces this program may touch**

| Surface | Paths |
|---------|--------|
| Form (owner) | `kit/MARKDOWN-STANDARD.md` |
| Cites | `kit/rules/files.md` · `kit/rules/authoring-and-style.md` |
| Templates | `kit/templates/TEMPLATE-*.md` that already have YAML; **not** TEMPLATE-LANDING-README, TEMPLATE-HOST-ALIAS, TEMPLATE-AGENTS (those stay omit/output-omit) |
| Adopt | `kit/SETUP.md` · `kit/UPGRADE.md` |
| Examples | `kit/examples/*.md` (pattern + dogfood YAML) |
| This-kit indexes | `docs/README.md` · `docs/plan/README.md` · `docs/plan/archive/README.md` · `docs/research/README.md` · `docs/project_build/README.md` · `docs/resources/README.md` · `kit/SETUP.md` (payload file) |
| Instruct | `kit/agents/CATALOG.md` docs-author · `kit/agents/templates/docs-author.md` |
| History | `kit/CHANGELOG.md` under `## repo-kit` |
| Execution | `docs/WORKBOARD.md` · this annex · `docs/plan/README.md` |

Do **not** touch unless a later phase explicitly allows: root `README.md` body, root `AGENTS.md`, `kit/CHANGELOG.md` body structure (ship section only in P6), `kit/RULES.md` Must table, HABITAT, OPS/BUILD/PARAMS/RUNTIME, `kit/rules/workboard.md` / hygiene / security / contracts (except authoring/files cites), `kit/configs/*`, host-alias templates.

### Allow / deny

| Phase | Allow | Deny |
|-------|--------|------|
| **P0** | `docs/WORKBOARD.md`, `docs/plan/frontmatter-2.10.0/**`, `docs/plan/README.md`, `docs/README.md` (plan-module honesty) | Any `kit/**` law |
| **P1** | `kit/MARKDOWN-STANDARD.md` **only** | Templates, SETUP, UPGRADE, files.md, examples, CHANGELOG ship, RULES Musts |
| **P2** | `kit/rules/files.md`, `kit/rules/authoring-and-style.md` (one-sentence cites) | Reprint of the field table; new Musts that duplicate M2–M4; reopen adopt-mode matrix |
| **P3** | Allowed templates with YAML skeletons | TEMPLATE-LANDING-README (no fence); TEMPLATE-HOST-ALIAS; TEMPLATE-AGENTS output shape |
| **P4** | SETUP, UPGRADE, examples, this-kit index READMEs listed above | YAML on CHANGELOG, AGENTS.md, landing README; universe sweep of every historical md |
| **P5** | CATALOG docs-author + `templates/docs-author.md` | BUILD; generated/; other seed packs unless a one-line path is needed |
| **P6** | CHANGELOG `### [2.10.0]`; history/`last_updated` on touched L4; archive annex; board close | New features; retrofit YAML on omit-list files |

---

## 3. Master order of operations

```text
P0 Register annex + freeze omit list and under-prescription
   → Board primary = frontmatter-2.10.0; annex linked; no kit/ edits
        │
        ▼
P1 MARKDOWN-STANDARD (unique owner)
   → When-to-use + omit list; description job; optional keywords; language Must; author checklist
        │
        ▼
P2 Cite files.md + authoring (no reprint)
   → New markdown path → fence except omit list; new docs fill description
        │
        ▼
P3 Templates
   → Placeholders for description / optional keywords; landing & alias templates unchanged
        │
        ▼
P4 Adopt surfaces + this-kit dogfood
   → SETUP/UPGRADE forward-only; examples + docs indexes + SETUP file get YAML
        │
        ▼
P5 Instruct docs-author seed
   → Verify fence except omit list; no BUILD
        │
        ▼
P6 Ship 2.10.0 + archive
   → CHANGELOG; annex archived; board primary none
```

| Phase | Theme | Why this order | Exit criterion |
|-------|--------|----------------|----------------|
| **P0** | Freeze | Omit list and “don’t over-prescribe” must exist before field text | Annex + board; user can reject before `kit/` edits |
| **P1** | Unique owner | Form law before cites or templates | When-to-use table + omit list + description job + optional keywords + one language Must; Must ≤ 5; `related:` still 3–7 |
| **P2** | Incorporation | Peers cite after the owner exists | One sentence each; no second field table; files.md adopt matrix untouched |
| **P3** | Skeletons | Templates follow the owner | YAML templates have `description`; keywords omit-if; landing/alias/AGENTS templates stay omit |
| **P4** | Adopt + dogfood | Procedure and this-kit gaps after the standard exists | SETUP/UPGRADE say new-file / on-edit; no complete-fail; listed kit files have YAML |
| **P5** | Instruct views | Seeds after L4 | docs-author verify; generated/ empty |
| **P6** | Ship | Version after L4 agrees | `### [2.10.0]`; annex archived |

Defer per-phase implementation patches until that phase is `active`.

### Frozen decisions (do not re-litigate)

| Topic | Decision |
|-------|----------|
| Owner | `kit/MARKDOWN-STANDARD.md` |
| Required identity fields | `title`, `description`, `status`, `last_updated`, `doc_type` |
| Omit-if | `related:` / `audience` on thin files; `keywords` always optional |
| `description` | Canonical blurb: what it owns and when to open. One sentence is legal. More only if needed. No fluff. |
| Lead | At most one sentence; **Should** align with `description` sentence 1; not a Must to rewrite on backfill |
| `## Summary` | Must table or omit-if — not a third prose recap |
| `keywords` | Optional YAML list; if present, small cap; do not duplicate title/description; replace a weak token rather than grow; never append from each user turn |
| Language | One Must + one Must-not in writing conventions. Gloss kit ids (`HABITAT`, Domain A) at first use; do not rename them |
| Omit YAML | Root landing `README.md`; host aliases; regenerable dumps; Keep a Changelog files; root `AGENTS.md` |
| Regenerable dumps | Output a documented command can recreate (`dist/`, coverage, `last_certification.*`, host mirrors of packs). Not hand-written notes |
| New files | Fence in the same change set as create (`files.md` cite) |
| Old files | Fence when that file is **already being edited**; not a failed complete |
| This-kit dogfood | SETUP, `kit/examples/*`, `docs/README.md`, `docs/plan/README.md`, `docs/plan/archive/README.md`, `docs/research/README.md`, `docs/project_build/README.md`, `docs/resources/README.md` |
| Hub | No new Must; no new authority-map row (markdown row already names MARKDOWN-STANDARD) |
| Future CLIs | Do not name or specify them in L4 |

### Active phase brief

Fill **only** the `active` phase, plus the next `open` if needed to start it.

### P0

Register this annex. No `kit/` law edits. Exit: board **Optional annex** points here; plan index lists the open pack; P1 remains `open` until the user confirms.

### P1 *(next; do not start until `active`)*

Edit `kit/MARKDOWN-STANDARD.md` only. Replace the optional/lighter table with the omit list. Change field reference: `description` job; optional `keywords`. Writing conventions: language Must. Author checklist: fence except omit list; description is the blurb; no triple reprint. Do not add Contents unless already required. Stay `related:` 3–7. Bump **1.3.2 → 1.4.0** (when-to-use contract). `last_updated` 2026-08-31. History row. Stop.

---

## 4. Verification

Empty inventory. No language gates.

| Phase | Checks |
|-------|--------|
| **P0** | Author checklist on annex; links from `docs/plan/frontmatter-2.10.0/` resolve; no leftover `{{PLACEHOLDERS}}`; board annex set |
| **P1** | Omit list present; no 3–4 sentence quota; keywords optional; landing still no YAML; Must ≤ 5 if a Must table is added; density (description vs lead vs Summary) |
| **P2** | files.md / authoring cite only; adopt-mode matrix in files.md unchanged |
| **P3** | Landing/alias/AGENTS templates still omit YAML; other YAML templates have `description` |
| **P4** | UPGRADE: no complete-fail for old missing fences; SETUP: new markdown gets fence; dogfood files have YAML; CHANGELOG and AGENTS.md still have none |
| **P5** | generated/ empty; BUILD not run |
| **P6** | CHANGELOG `### [2.10.0]`; annex archived; no L4 “active planning” |

---

## 5. Docs and CHANGELOG on ship

| Phase | L4 owners |
|-------|-----------|
| **P0** | — |
| **P1** | `kit/MARKDOWN-STANDARD.md` |
| **P2** | `files.md` · `authoring-and-style.md` |
| **P3** | listed templates |
| **P4** | SETUP · UPGRADE · examples · this-kit indexes |
| **P5** | CATALOG docs-author · docs-author template |
| **P6** | `kit/CHANGELOG.md` `### [2.10.0]`; archive this annex |

P6 notes should state: YAML required except omit list; description is the one blurb; keywords optional; no complete-fail for historical missing fences; no inventory/SAST/hub Must-map change; no layout migration; no external CLI contract.

---

## 6. Risks and rollback

| Risk | Mitigation |
|------|------------|
| Over-prescription (sentence quotas, required keywords, two profiles) | Frozen: omit-if; P1 review against non-goals |
| Triple identity (YAML + lead + Summary) | Description owns blurb; checklist item |
| YAML on AGENTS.md / CHANGELOG / landing | Deny lists; P4/P6 grep |
| Adopter complete-fail on old docs | UPGRADE explicit; same as directory-index forward-only |
| files.md absorb a second schema | P2 one sentence only |
| Universe sweep of every `.md` | Dogfood list is closed in P4 allow |
| Future CLI sneaks into L4 | Non-goal; grep P1–P6 for product CLI names before ship |
| Rollback | Revert that phase first; P2–P5 depend on P1 |

If the user rejects the OOO before P1: do not edit `kit/MARKDOWN-STANDARD.md`.
