---
title: "files-law-2.9.0 — order of operations"
description: Goals, adoptability invariants, phased OOO, verification, and risks for file-management law.
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
  - ../../../../kit/rules/hygiene.md
  - ../../../../kit/rules/contracts.md
  - ../../../../kit/SETUP.md
  - ../../../../kit/UPGRADE.md
last_updated: "2026-08-31"
---

# File law 2.9.0 — order of operations

**Board:** [docs/WORKBOARD.md](../../../WORKBOARD.md)  
**Annex index:** [README.md](./README.md)

Program-level OOO. Per-phase file patches wait until that phase is `active`. Law ships as kit **2.9.0** (new domain module). Current baseline: **2.8.2**.

---

## 1. Goals and non-goals

### Goals (must)

| ID | Goal |
|----|------|
| F1 | Add **one** flat domain module `kit/rules/files.md` that owns file **creation**, **placement** (category), and **naming**. |
| F2 | Keep modular packaging: hub + `kit/rules/*`; fold path remains; no root `./rules/`; no `kit/rules/<category>/` nesting. |
| F3 | Three adopt modes stay viable: **greenfield**, **existing first adopt**, **upgrade from a prior kit** (1.x root layout or 2.x `kit/`). |
| F4 | Wire the hub and peers by **citation**, not reprint. Last citations remain. |
| F5 | Directory index `README.md` is a navigable-dir contract going **forward**, not a retrofit gate. |
| F6 | L0 stays root `AGENTS.md` → `kit/RULES.md`. `files.md` is reached from the authority map. |
| F7 | Ship kit **2.9.0** with SETUP/UPGRADE/examples/templates that do not force a product tree rewrite. |

### Non-goals (must not in this program)

| Item | Why |
|------|-----|
| Move `kit/rules/` to repo-root `./rules/` | Hosts do not auto-load that path; undoes 2.x hygiene |
| Nested `kit/rules/foo/bar.md` or `kit/foundation/` | Depth-2 kind directories only |
| Treat `kit/` as a second `docs/` | Law vs working memory stay distinct |
| Domain A/B or inventory rows | This tree is docs-only; files.md is not a style/SAST gate |
| Backfill directory READMEs on upgrade | Would fail complete for prior-iteration adopters |
| Retrofit every dir in *this* kit (`configs/`, `templates/`, …) | Ceremony; dogfood the *new* files only |
| Paste `files.md` into `AGENTS.md` / Operator prompts as a mandatory session step | L0 stays a pointer; open files.md **when adding a path** |
| Rename HABITAT, L0, Domain A/B, Instruct | Stable kit ids; gloss at first use in *new* product docs |
| Enable Instruct / run BUILD in this repo | Instruct remains off here |
| Change landing README shape | Overview + Operator prompts unchanged |
| New host trees (`.grok/rules/`, `.cursor/`, `.claude/`) | HABITAT: evidence + alias only; AGENTS.md already loads |

### Invariants (hard)

```text
1. Standards stay under kit/. Product, project CHANGELOG, PLAN, live docs/ stay outside.
2. Unique rule, one owner. files.md owns create/place/name/index. hygiene keeps kit-vs-product + SETUP/UPGRADE lifecycle. Do not fork a second catalog.
3. Fold path: adopters may fold files.md into kit/RULES.md; record that in the authority map. Do not require un-folding.
4. Greenfield: copy files.md with rules/; directory index on NEW navigable dirs from first create.
5. Existing first adopt: map reality; do not rewrite product directories; directory index applies to dirs created after adopt.
6. Upgrade (1.x→2.x then routine, or 2.8.x→2.9.0): merge files.md; preserve filled AGENTS.md, authority-map product paths, inventory, verify commands, package docs, docs/WORKBOARD.md. Never fail complete for missing historical directory READMEs. Never create root ./rules/.
7. Directory index is policy + author checklist, not Domain A/B. Missing old READMEs are not a failed gate.
8. Same leaf names are allowed when category + path scopes them. Source modules are nouns. Procedure docs may be verbs.
9. Language trees (src/, packages, crates) nest as the language requires. Kit does not impose extra folders that fight the language.
10. Evidence before create. No empty trees for ceremony.
11. SETUP remains ephemeral. UPGRADE remains durable. Kit baseline + project CHANGELOG on ship/upgrade.
12. Instruct optional: update seed authority_paths; do not force Instruct on bare adopt.
13. related: 3–7 except the RULES hub. Last citation of an owner remains.
14. Surgical edits. No full-file rewrite of policy files.
15. Parent owns the board. Instruct off; no PLAN.md in this repo.
```

---

## 2. Constraint map

| Fact | Implication for the OOO |
|------|-------------------------|
| This repo **is** the kit; docs-only; Instruct off | Skip O3; no generated packs; no language gates; author checklist only |
| Kit **2.8.2** shipped; hub document version **2.7.1** | New module + map row = **2.9.0**; hub doc version bumps only if the Must map changes |
| 2.x packaging already moved root RULES/`rules/` **into** `kit/` | Do not reverse that in this program |
| HABITAT: preferred L0 is `AGENTS.md`; Grok auto-loads `AGENTS.md` and `.grok/rules/`, **not** `./rules/` | Pointer stays `AGENTS.md`; no root `rules/` shim |
| Hygiene owns “kit vs product” and SETUP/UPGRADE lifecycle | P3 cites files.md; do not delete hygiene’s invariant Musts |
| Security owns inventory + when `SECURITY.md` exists | files.md places the file; security keeps the *trigger* |
| ai-docs owns `docs/` modules and promotion | files.md owns mkdir evidence; ai-docs keeps workspace contract |
| Density: Must table ≤ 5; cite don’t reprint | files.md Summary ≤ 5 Musts; extra unique rules as Must-not list or body tables — not a second Must table |
| Fold option already in RULES domain-modules paragraph | P2 documents files.md as foldable; P4 UPGRADE mentions port-or-keep |
| UPGRADE preserve list is the adopter contract | P4 adds files.md merge + “no directory-README backfill” without shrinking preserve |
| examples/* are patterns, not product names | One authority-map row each; do not invent packages |
| CATALOG seed `authority_paths` are kit-portable | P5 adds `kit/rules/files.md` to adopter/maintainer/docs-author/implementer as needed; no BUILD here |

**Surfaces this program may touch** (name them; leave others alone):

| Surface | Paths |
|---------|--------|
| New law | `kit/rules/files.md` |
| Hub | `kit/RULES.md` (map row, domain index, optional one Must that **cites** files.md) |
| Incorporation (cite) | `kit/rules/hygiene.md` · `security.md` · `ai-docs-workspace.md` · `contracts.md` · `authoring-and-style.md` · `kit/agents/HABITAT.md` |
| Adopt / upgrade | `kit/SETUP.md` · `kit/UPGRADE.md` |
| Form | `kit/MARKDOWN-STANDARD.md` (directory-index type or omit-if subsection) · `kit/templates/TEMPLATE-DIR-README.md` (**new**) · `kit/templates/TEMPLATE-AGENTS.md` (one optional line) |
| Examples | `kit/examples/*.md` (map row + verify note) |
| Instruct seeds | `kit/agents/CATALOG.md` · `kit/agents/templates/{adopter,maintainer,docs-author,implementer}.md` |
| History | `kit/CHANGELOG.md` under `## repo-kit` |
| Execution | `docs/WORKBOARD.md` · this annex · `docs/plan/README.md` |

Do **not** touch unless a later phase explicitly allows: root `README.md` landing body (except a need-link if P4 requires it — prefer not), root `AGENTS.md` (map is enough), `kit/configs/*`, product-shaped templates (`TEMPLATE-README`, `TEMPLATE-CLI`, `TEMPLATE-SECURITY`) except a one-line “see files.md when adding siblings” if density allows, `kit/agents/OPS.md` / FRAMEWORK / BUILD / PARAMS / RUNTIME, `kit/rules/workboard.md` / `continuity.md` / `architecture.md` / `versioning-and-git.md` / `verification-and-ops.md` except a **single** verify-table row in P4 if needed (“new navigable dir → directory README same change set” as docs-only, not a language gate).

### Allow / deny

| Phase | Allow | Deny |
|-------|--------|------|
| **P0** | `docs/WORKBOARD.md`, `docs/plan/files-law-2.9.0/**`, `docs/plan/README.md`, `docs/README.md` (plan module honesty) | Any `kit/**` law, templates, examples, AGENTS.md, root README |
| **P1** | `kit/rules/files.md` **create only** | Hub, hygiene, SETUP, UPGRADE, templates, examples, Instruct, CHANGELOG ship section |
| **P2** | `kit/RULES.md` (map + domain index + cite; document history) | Reprint of files.md tables; inventory/verify/trailer edits; baseline version stamp (that is P6) |
| **P3** | Named incorporation files in the surfaces table (surgical cite + last-citation grep) | Full-file rewrites; moving hygiene invariant Musts; inventing root `./rules/` |
| **P4** | SETUP, UPGRADE, MARKDOWN-STANDARD, TEMPLATE-DIR-README.md, TEMPLATE-AGENTS.md, examples/*, optional verification-and-ops **one row** | Clobber preserve list; force directory-README backfill; Operator prompts mandatory 6th step; restyle filled example *product* names |
| **P5** | CATALOG + listed agent templates `authority_paths` / verify hints | BUILD; generated/; OPS/FRAMEWORK/PARAMS; enabling Instruct in this repo |
| **P6** | CHANGELOG `### [2.9.0]`; document-history / `last_updated` on touched L4; archive annex; board close | New features; retrofit READMEs; version jump to 3.x |

---

## 3. Master order of operations

```text
P0 Register annex + freeze adoptability
   → Board primary = files-law-2.9.0; annex linked; no kit/ edits
        │
        ▼
P1 Write kit/rules/files.md (unique owner)
   → Module exists; Must ≤ 5; three adopt modes in the module; no other L4
        │
        ▼
P2 Wire kit/RULES.md
   → Map row + domain index + cite; fold still documented; no reprint
        │
        ▼
P3 Incorporate peers (cite, don’t reprint)
   → hygiene/security/ai-docs/HABITAT/contracts(/authoring) cite files.md; inbound links retargeted; last citations remain
        │
        ▼
P4 Adopt, upgrade, templates, examples
   → Greenfield / existing / 1.x / 2.x paths name files.md; no tree rewrite; TEMPLATE-DIR-README exists
        │
        ▼
P5 Instruct seeds (optional path)
   → CATALOG + templates list files.md; BUILD not run here
        │
        ▼
P6 Ship 2.9.0 + archive
   → CHANGELOG section; baseline note; annex archived; board primary none
```

| Phase | Theme | Why this order | Exit criterion |
|-------|--------|----------------|----------------|
| **P0** | Freeze scope | Adoptability must be written **before** law text so P1 cannot invent a retrofit gate | Annex + board + plan index; user can reject before any `kit/` edit |
| **P1** | Unique owner | A module must exist before the hub points at it (no dangling map row) | `kit/rules/files.md` complete per frozen decisions below; author checklist; no other L4 |
| **P2** | Hub | Map and domain index are how adopters (and L0) find the owner | Authority-map row + domain-modules row; hub cites files.md; fold sentence still true |
| **P3** | Incorporation | Peers currently *own* overlapping catalogs; cite after the owner exists so we do not dual-write | Grep: no second full placement table; hygiene invariant Musts still present; last citations remain |
| **P4** | Adoptability surfaces | SETUP/UPGRADE/examples are how **new / existing / prior-kit** repos meet the module | Copy table + existing-adopt + UPGRADE preserve/merge; directory README **forward-only**; examples have a map row |
| **P5** | Instruct (optional) | Seeds are views; after L4 is stable so packs cannot become a second RULES tree | `authority_paths` include files.md where create/place applies; this repo still Instruct-off |
| **P6** | Ship | Version + archive only after L4 and adopt surfaces agree | `### [2.9.0]` under `## repo-kit`; annex archived; board closed |

Defer per-phase implementation patches until that phase is `active` on the board.

### Frozen decisions (P1 must implement; do not re-litigate)

These are program constraints, not the shipped module text.

| Topic | Decision |
|-------|----------|
| Path | `kit/rules/files.md` (flat) |
| Title | File creation, placement, and naming |
| Path shape | `<category>/` then noun or procedure directory; no sentence-paths that add taxonomy every layer |
| Categories | Align with hygiene homes: law (`kit/`), form, landing, history, product contract, working memory (`docs/`), habitat, Instruct views, style catalog, regenerable — plus **language/source tree** as unconstrained nesting under a product category |
| Code leaves | **Nouns** (module is a thing). Functions may be verbs. |
| Procedure docs | Verb titles allowed (`UPGRADE.md`) |
| Same names | Allowed when **category + path** scopes them (`README.md`, `SECURITY.md`, …) |
| Directory index | `README.md` in **navigable, versioned** dirs that contain other **intentional** files; table `file → function`; **not** landing shape |
| Index exclusions | Regenerable, vendor, `.git/`, secrets, host trees not created by this repo, language leaves already listed in the parent **package** README |
| Gate class | **Not** Domain A/B. Docs-only / author checklist. Upgrade does **not** fail complete for historical missing indexes |
| Create | Evidence only (surface exists, inventory row, user asked, module needed) |
| L0 | `AGENTS.md` → `kit/RULES.md` → map → `files.md` when adding/moving/splitting a path |
| Fold | Permitted into `kit/RULES.md`; map records the choice |
| FILE-CATALOG.md | Stays optional whole-repo list; directory README is the distributed catalog |

### Adopt mode matrix (P1 body + P4 surfaces)

| Mode | What we ship for them | What we must not demand |
|------|----------------------|-------------------------|
| **Greenfield** (SETUP full copy) | `files.md` in `kit/rules/`; TEMPLATE-DIR-README for new navigable dirs; map row | Empty `docs/` or package trees “for completeness” |
| **Existing repo, first adopt** | Selective `kit/`; map **real** paths; files.md recommended with `rules/`; directory index **from the adopt date forward** | Rewrite `src/` / `packages/`; add README to every historical folder; flatten kit to root |
| **Upgrade 2.x (baseline present)** | Merge `kit/rules/files.md`; add map row if missing; preserve product docs and AGENTS.md | Backfill directory READMEs; restyle package README/CLI/SECURITY; overwrite filled AGENTS.md |
| **Upgrade 1.x / root layout** | Existing UPGRADE migrate **into `kit/` first**, then same as 2.x routine (files.md lands under `kit/rules/`) | Leave law at root `./rules/` as a “compat” tree |
| **Folded hub** (single `kit/RULES.md`) | Port files.md sections **or** keep `kit/rules/files.md` beside a thin hub; document in map | Force un-fold; drop create/place/name rules on fold |
| **Bare adopt (no agents)** | files.md still recommended (humans add files too); skip HABITAT/AGENTS | Require AGENTS.md or `.grok/rules/` |
| **Instruct adopters** | P5 seed paths; they BUILD locally | Run BUILD in *this* repo; require Instruct on bare adopt |

### Active phase brief

Fill **only** the phase that is `active` on the board, plus the next `open` if needed to start it.

### P0

Register this annex and freeze the invariants above. No `kit/` law edits. Exit: board **Optional annex** points here; `docs/plan/README.md` lists the open pack; P1 remains `open` until the user confirms.

### P1 *(next; do not start until `active`)*

Create `kit/rules/files.md` only. Implement frozen decisions. Summary Must ≤ 5. Separate Must-not list for unique prohibitions (empty trees, sentence-paths, retrofit gate, root `./rules/`, verb-named modules). Include the adopt-mode matrix as **policy** (short table), not SETUP reprint. `related:` 3–7 (RULES, hygiene, contracts, MARKDOWN-STANDARD, HABITAT or ai-docs). Document history `1.0.0`. Stop.

---

## 4. Verification

This repo: empty inventory. No pylint / rustfmt / clang / SAST.

| Phase | Declared gates / checks |
|-------|-------------------------|
| **P0** | Author checklist on annex; relative links from `docs/plan/files-law-2.9.0/` resolve; no leftover `{{PLACEHOLDERS}}`; board annex field set |
| **P1** | Author checklist + density on `files.md`; Must ≤ 5; last citations of hygiene/contracts/HABITAT remain **in those owners** (files.md cites them) |
| **P2** | Map row exists; domain index lists files.md; hub does not contain a second full category table |
| **P3** | `rg` for duplicate placement catalogs; inbound links to moved headings retargeted same change set; hygiene still states kit-vs-product |
| **P4** | SETUP copy table has files.md; UPGRADE preserve includes no-backfill + no root `./rules/`; examples each have one map row; TEMPLATE-DIR-README has no unresolved tokens in the *template* sense (tokens are the point — checklist: tokens documented) |
| **P5** | CATALOG paths exist on disk; this repo `kit/agents/generated/` still empty |
| **P6** | CHANGELOG `### [2.9.0]`; relative links; annex archived; no L4 file still says “active planning” for this program |

Do not invent language gates.

---

## 5. Docs and CHANGELOG on ship

| Phase | L4 owners to update |
|-------|---------------------|
| **P0** | — (working memory only) |
| **P1** | `kit/rules/files.md` (create) |
| **P2** | `kit/RULES.md` |
| **P3** | hygiene, security, ai-docs-workspace, HABITAT, contracts, authoring-and-style (citation only) |
| **P4** | SETUP, UPGRADE, MARKDOWN-STANDARD, new TEMPLATE-DIR-README, TEMPLATE-AGENTS, examples/* ; optional verification-and-ops one row |
| **P5** | CATALOG + listed agent templates |
| **P6** | `kit/CHANGELOG.md` `### [2.9.0]`; history/`last_updated` on all touched L4; archive this annex |

P6 CHANGELOG notes should state: new module; adopt/upgrade do **not** require directory-README backfill; no inventory/SAST/trailer/hub-Must-map rewrite beyond the one cite; no layout migration.

---

## 6. Risks and rollback

| Risk | Mitigation |
|------|------------|
| Directory README becomes a silent complete-fail for old repos | Frozen: not Domain A/B; UPGRADE explicit no-backfill; verification row is forward-only |
| Dual catalog: hygiene *and* files.md both list “what belongs where” | P1 owner first; P3 cite + shrink peer catalogs; grep before P3 ship |
| Folded-hub adopters miss the module | P2 + P4: port-or-keep; map records choice |
| 1.x adopters grow root `./rules/` | Non-goal; UPGRADE migrate into `kit/` first; HABITAT unchanged |
| L0 bloat (`AGENTS.md` pastes files.md) | Deny in P4/P5; TEMPLATE-AGENTS at most one “when adding files” line |
| Instruct packs become a second RULES tree | P5 authority_paths only; L4 wins; no BUILD here |
| Scope creep (rename HABITAT, restyle 2.8.0 modules) | Surfaces table + allow/deny; surgical patches |
| Annex treated as the contract after ship | P6 archive + L4 promotion; board Recently completed points at `files.md` + CHANGELOG |
| Rollback of a phase | Revert that phase’s commit; do not revert later cites first (P3 depends on P1) |

If the user rejects the OOO before P1: set program `cancelled` or keep P1 `open`; do not create `kit/rules/files.md`.
