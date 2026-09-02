# Changelog

History of the **Repository Standards Kit**. **Kit version** is defined by dated release sections (`### [X.Y.Z] - YYYY-MM-DD`) under `## repo-kit`. Upstream: https://github.com/shainemeister/repo-kit.

This file is the history of the Repository Standards Kit itself (path: `kit/CHANGELOG.md`).  
**Adopting projects** maintain their own root `CHANGELOG.md` for *project/package* history (behavior, contracts, releases, kit adoption/upgrade notes).  
They record the adopted kit version in the **Kit baseline** table inside `RULES.md` (see [RULES — Kit baseline](./RULES.md#kit-baseline) and [Mandatory project CHANGELOG](./rules/versioning-and-git.md#mandatory-project-changelog)).

Versioned standards also record per-document history in YAML frontmatter and document-history tables. Those document versions are independent of kit and product versions—see [versioning-and-git](./rules/versioning-and-git.md).

**Structure:** `## <Repository Name>` (integrated repository) → `### [X.Y.Z] - YYYY-MM-DD` (version change/update) → `#### Added` / `#### Changed` / … (categories). Categories follow [Keep a Changelog](https://keepachangelog.com/). Dates are ISO 8601. There is no Unreleased section—record each change under the version section that ships it.

**Upgrades:** [UPGRADE.md](./UPGRADE.md).

---

## [Repository Name]

### [X.Y.Z] - YYYY-MM-DD

#### Added

- *(project/package history for this repository — not kit release notes)*

---

## repo-kit

### [2.11.2] - 2026-09-01

#### Changed

- Board template: progress-log hygiene lives in the copy footer, not a live paragraph adopters would ship on their board.
- OOO template: archive-stable `kit/` cite hint is an HTML comment, not annex body law.
- YAML templates: `{{DESCRIPTION}}` hint **cites** the identity test (does not reprint the sibling/title claims).
- DIR-README example Function rows are product-shaped (`CLI-GUIDE` / `SECURITY` / `METHODOLOGY`), not kit `SETUP`/`UPGRADE`/`RULES` paths.
- SETUP 4c: fill the phase brief before **delegating** a phase (not Instruct-only “isolate”).

#### Notes

- Patch on **2.11.1**. No hub Must-map, inventory, SAST, or layout change. Workboard unique rules unchanged.

### [2.11.1] - 2026-09-01

#### Added

- Workboard **sub-agent packet** (`kit/rules/workboard.md` **1.2.0**): when an annex exists, fill current state · issue · fix · allow/deny · exit **before** spawn. Child gets board row + brief + listed paths; does not edit the board or Progress Tracker.

#### Changed

- **Keep** the full Progress Tracker (ordered tasks · status · SHA). Do not collapse it because a board exists. Board still wins “what is open.”
- Progress log: drop stale `active` lines after the phase row is `done` with a SHA. Board Notes: one-line exit/allow hint. One phase = one allow list.
- Archive: OOO body prefers repo-root `kit/…` cites; retarget `related:` + Board lines only. Annex **Next phase** matches the board `active`/`blocked` row.
- TEMPLATE-OOO **1.2.0** brief table; program-README next-phase match; board template Notes/log hints.
- OPS **1.3.3** / ai-docs-workspace **1.1.5** / SETUP 4c / UPGRADE **1.8.7** / CATALOG **1.2.6** plan-author: cite only. Preserve live boards; no complete-fail for historical annexes without the six-field brief.

#### Notes

- Patch on **2.11.0**. No hub Must-map, inventory, SAST, or layout migration. Default annex remains optional (packet applies when an annex exists). RULES tracker shape unchanged.

### [2.11.0] - 2026-09-01

#### Added

- Description **identity test** (MARKDOWN-STANDARD **1.5.0**): `description` must add a claim not already in `title` / filename / `doc_type`, and would be wrong if swapped onto a sibling. When-to-open only if the definition does not already imply it. One sentence remains legal. No sentence quota.

#### Changed

- Directory-index **Function** cells use the same test at one-line resolution (unique role in this folder; not a paste of YAML `description`). Column name stays **Function**.
- files.md **1.0.2** / authoring-and-style **1.2.4**: cite the identity test. Adopt-mode matrix and files.md Must table unchanged.
- TEMPLATE-DIR-README **1.1.0**: catalog blurb + example-only Function rows. YAML templates hint the test. Landing / host-alias / AGENTS templates stay unfenced.
- SETUP: fill `description` per the identity test on new files and when already editing. UPGRADE **1.8.6**: no complete-fail for historical tautological blurbs (forward-only / on-edit).
- RULES hub **2.7.3**: authority-map concern label names description identity. Must index unchanged.
- CATALOG **1.2.5** docs-author verify: identity test (new/on-edit; not a historical gate).

#### Notes

- Minor on **2.10.0**. No inventory, SAST, hub Must-map, or layout migration. No directory-index backfill. No external CLI contract. Identity test is new/on-edit; historical tautological blurbs are not a failed complete.

### [2.10.0] - 2026-08-31

#### Added

- Optional YAML `keywords` (omit-if; replace, don’t append).

#### Changed

- MARKDOWN-STANDARD **1.4.0**: durable markdown has YAML except a closed omit list (landing README, host aliases, regenerable dumps, Keep a Changelog files, root `AGENTS.md`). `description` is the one prose blurb (one sentence is legal). Descriptive language Must in writing conventions.
- files.md **1.0.1** / authoring-and-style **1.2.3**: cite omit list; adopt-mode matrix unchanged.
- Templates: `description` blurb; landing / host-alias / AGENTS templates stay unfenced.
- SETUP dogfood fence; UPGRADE **1.8.5**: no complete-fail for historical missing YAML. Examples and `docs/` indexes fenced.
- CATALOG **1.2.4** docs-author verify.

#### Notes

- Minor on **2.9.0**. No inventory, SAST, hub Must-map, or layout migration. No external CLI contract. Directory-index and YAML backfill remain forward-only / on-edit.

### [2.9.0] - 2026-08-31

#### Added

- [files.md](./rules/files.md) **1.0.0**: file creation, placement, and naming; category-first paths; noun code leaves; same names by path; directory-index `README.md` **forward-only** (not Domain A/B).
- [TEMPLATE-DIR-README.md](./templates/TEMPLATE-DIR-README.md): directory index skeleton (file → function; not landing).

#### Changed

- RULES hub **2.7.2**: authority-map + domain-index row for `files.md`; Must index unchanged.
- hygiene **1.6.1** / security **1.1.2** / ai-docs-workspace **1.1.4** / HABITAT **1.0.3** / contracts **1.4.2** / authoring-and-style **1.2.2**: cite `files.md`; unique peer rules unchanged.
- SETUP: copy-table + existing-adopt forward-only index. UPGRADE **1.8.4**: merge `files.md`; no historical directory-README backfill; no root `./rules/` compat tree; folded hub port-or-keep.
- MARKDOWN-STANDARD **1.3.2**; verification-and-ops **1.7.2**; examples map rows; CATALOG **1.2.3** + seed templates `authority_paths`. TEMPLATE-AGENTS: one line when adding a path.

#### Notes

- Minor on **2.8.2**. New domain module. Adopt/upgrade do **not** require directory-README backfill. No inventory, SAST, trailer, or hub Must-map rewrite. No layout migration.

### [2.8.2] - 2026-08-22

#### Changed

- workboard **1.1.0**: restore unique Must-not digest; OPS on `related:`; SHA / duplicate-id / archive path substitutions.
- ai-docs-workspace **1.1.3** / PLAN-HOOK **1.3.3**: restore unique Must-not digests (chat-only enablement; empty four-module trees; Agent models stay in PLAN).
- OOO templates **1.1.0**: allow/deny, exit criterion, active-phase brief omit-if; program README points at `OOO.md`.

#### Notes

- Patch on **2.8.1**. Planning-contract restore + OOO template tighten. No inventory, SAST, verify-table, trailer, or hub Must-map changes.

### [2.8.1] - 2026-08-21

#### Changed

- RUNTIME **1.3.2**: `related:` capped at 7; CATALOG matching and [completion rule](./rules/verification-and-ops.md#completion-rule) stay as body cites.
- Instruct docs: drop in-body document-version echo; CATALOG Contents no longer lists Summary first.
- MARKDOWN-STANDARD **1.3.1**: hub `related:` may list the module index; other files stay 3–7.
- Examples (python/cli/rust/c-cpp): Docs-only verify names density and last citations.

#### Notes

- Patch on **2.8.0**. Citation ceiling self-applied (RUNTIME); leftover Instruct chrome removed; hub `related:` exception recorded. No inventory, SAST, verify-table, or trailer changes.

### [2.8.0] - 2026-08-21

#### Changed

- RULES hub **2.7.1**: chrome only (identity echo, Contents). Must index unchanged (complete map).
- continuity **1.0.1** / versioning-and-git **1.0.5** / workboard **1.0.3** / ai-docs-workspace **1.1.2**: density restyle (P5a); unique overlay, CHANGELOG/trailer, status/checklist, and workspace rules unchanged.
- authoring-and-style **1.2.1** / verification-and-ops **1.7.1** / security **1.1.1**: density restyle (P5b); style-gate, verify, and inventory/SAST catalogs unchanged.
- contracts **1.4.1**: density restyle (P5c); ownership, same-change-set, and incorporation unchanged.
- HABITAT **1.0.1** / OPS **1.3.1** / FRAMEWORK **1.2.1** / PARAMS **1.1.1** / BUILD **1.2.1** / PLAN-HOOK **1.3.1** / agents README **1.2.2**: density restyle (P6); unique Instruct procedure, O3, schema, fill rules, and host catalog unchanged.
- UPGRADE **1.8.3** / examples docs-only verify: density chrome (P7); upgrade steps unchanged.

#### Notes

- Wave 2 **shipped**. Editorial restyles of `kit/rules/*` and Instruct docs. On adopter upgrade: merge policy; **do not** restyle filled product README/CLI/SECURITY; preserve local `rules/*` additions.

### [2.7.0] - 2026-08-21

#### Added

- Density, force, and incorporation doctrine (MARKDOWN-STANDARD 1.3.0; contracts 1.4.0).
- Minimum-core templates (GENERIC, README, CLI, SECURITY, METHODOLOGY, CONCEPT): extra sections labeled omit-if.

#### Changed

- Contents threshold; citation cap 3–7; author checklist; authoring 1.2.0; verification 1.7.0; RULES hub 2.7.0 one Must.
- docs-author seed + CATALOG **1.2.1** verify: required core / density operators; no Summary→Contents mandate; second-home and last-cite checks; Contents only if threshold.
- SETUP: refresh Contents **if present**; new docs use required core (omit-if extras).
- UPGRADE **1.8.2**: preserve filled package README / CLI / SECURITY / methodology; 2.8.0+ `rules/*` restyles editorial.
- agents README **1.2.1** / RUNTIME **1.3.1**: density pointer; L0/pack budgets unchanged.
- hygiene **1.6.0** / architecture **1.1.0**: density restyle (P3 pilots); unique packaging and architecture rules unchanged.

#### Notes

- Wave 1 **shipped** after the P3 pilot gate (2026-08-21). Adopter upgrade target for density doctrine, min-core templates, and the two pilot restyles.
- Remaining `kit/rules/*` and Instruct-doc restyles are **kit 2.8.0**, editorial on upgrade (preserve local additions).

### [2.6.3] - 2026-08-14

#### Changed

- UPGRADE **1.8.1**: routine upgrade (and 1.x checklist) reshapes root `README.md` to the required landing shape; preserve product Overview; do not paste upstream adopt fences.
- MARKDOWN-STANDARD **1.2.1**: landing checklist requires `## Overview` then `## Operator prompts`; root landing removed from the optional/lighter table.

### [2.6.2] - 2026-08-14

#### Changed

- **Root README landing is required** for every adopting repo: `## Overview` then `## Operator prompts` (no frontmatter). Package READMEs stay on the full MARKDOWN-STANDARD + [TEMPLATE-README](./templates/TEMPLATE-README.md).
- MARKDOWN-STANDARD **1.2.0**; [TEMPLATE-LANDING-README.md](./templates/TEMPLATE-LANDING-README.md). Operator prompts = **this repo’s** session load path — not upstream kit adopt fences, not a second RULES tree.
- RULES hub **2.6.2** Must + map; SETUP; hygiene **1.5.1**; authoring **1.1.2**; contracts **1.3.2**; examples; docs-author seed.

### [2.6.1] - 2026-08-14

#### Changed

- Root README: **Overview** (landing) then **Operator prompts** (load order + pasteable adopt/upgrade). No Human/AI headings. Style-gate chapters and duplicate source inventory removed from the landing.
- MARKDOWN-STANDARD **1.1.1**: landing may end with Operator prompts; ~120-line budget applies to Overview.

### [2.6.0] - 2026-08-14

#### Added

- **Host habitat (L0)** — [kit/agents/HABITAT.md](./agents/HABITAT.md): detect a coding-agent host, create a thin root `AGENTS.md`, alias only if that host cannot see it, map the path. Law stays under `kit/`.
- Templates: [TEMPLATE-AGENTS.md](./templates/TEMPLATE-AGENTS.md), [TEMPLATE-HOST-ALIAS.md](./templates/TEMPLATE-HOST-ALIAS.md).
- **Parent / child protocol** in [OPS](./agents/OPS.md) (duties only: one primary, serial vs parallel, workboard as DAG, parent owns complete). No spawn-tool names.
- This repository dogfoods a pointer-only root [AGENTS.md](../AGENTS.md) (docs-only; Instruct off).

#### Changed

- RULES hub **2.6.0**: Must + authority-map row for L0.  
- hygiene **1.5.0**, contracts **1.3.1**, ai-docs-workspace **1.1.1**, workboard **1.0.2**.  
- FRAMEWORK **1.2.0**, RUNTIME **1.3.0**, OPS **1.3.0**, agents README **1.2.0**.  
- SETUP **If any coding agent** (never Always); host-introduced-later step. UPGRADE **1.8.0** preserve filled `AGENTS.md`.  
- README / examples: habitat rows; docs-only omits L0 unless an agent maintains the repo.

#### Notes

- Optional. No evidence of a host ⇒ do not create habitat files.  
- Prefer one portable L0 (`AGENTS.md`). Do not ship `.claude/`, `.cursor/`, Copilot instruction matrices, or `GEMINI.md` as kit payload.  
- Host path table in HABITAT is **informative** (dated); confirm current host docs before writing an alias.  
- Filled `AGENTS.md` is **project data** on upgrade.

### [2.5.1] - 2026-08-14

#### Changed

- RULES hub **2.5.1**: one authority-map row for language style configs (copy only if declared).
- authoring-and-style **1.1.1**: Python adopt steps start with the inventory row (parity with Rust/C++).
- verification-and-ops **1.6.1**: docs-only prune sentence; Domain B verify rows point at style-gate Command cells.
- SETUP first-verify, README Command cells, and Rust/C++ examples no longer fork the full clippy/cppcheck argv.

#### Notes

- Canonical Domain B command strings stay in [authoring-and-style](./rules/authoring-and-style.md). Security inventory/SAST tables remain the catalog (named tools + typical command).
- No gate behavior change. Inventory is still the on/off switch.

### [2.5.0] - 2026-08-14

#### Added

- **Named Rust and C / C++ style + SAST path** (Python-parity of *surfaces*, not pylint 10.00/10): inventory rows, style-gate chapters, starter configs, filled examples.
- Domain B configs: `kit/configs/rustfmt.toml`, `kit/configs/clippy.toml`, `kit/configs/clang-format`, `kit/configs/clang-tidy`.
- Domain A (Bandit pattern — command only, no kit SAST config): **cargo-audit** (already catalogued) and **cppcheck** for C / C++.
- Examples: [rust-library.md](./examples/rust-library.md), [c-cpp-library.md](./examples/c-cpp-library.md).

#### Changed

- RULES hub **2.5.0**: Must names **declared** Domain B gates (pylint / rustfmt+clippy / clang-format+clang-tidy as inventory requires).
- authoring-and-style **1.1.0**, security **1.1.0**, verification-and-ops **1.6.0**, hygiene **1.4.1**, versioning-and-git **1.0.4**, UPGRADE **1.7.0**.
- SETUP copy table: rustfmt/clippy **If Rust**, clang-format/clang-tidy **If C/C++** (never Always). First-verify blocks labeled if applicable.
- Root README piece table, use cases, and style-gate sections.

#### Notes

- **Inventory is the on/off switch.** Docs-only and empty inventories do not run rustfmt, clippy, clang-format, clang-tidy, cargo-audit, or cppcheck. Unused files under `kit/configs/` after a whole-tree copy are dormant catalog (same as unused `pylintrc` today).
- This repository remains **docs-only** — no Rust/C++ product code and no new Domain A/B gates on repo-kit itself.
- Only pylint keeps the **10.00/10** score rule. Rust/C++ pass is exit 0 / check-mode clean under the starter configs.
- clang-tidy requires a product `compile_commands.json` when C / C++ is declared; missing DB is a failed gate unless a header-only fallback is documented.

### [2.4.0] - 2026-08-12

#### Added

- **Plan control** — three-surface model: root `PLAN.md` (mission / Agent models), `docs/WORKBOARD.md` (live multi-phase execution), optional annex under `docs/plan/<program-id>/` with `docs/plan/archive/` on program complete.
- Policy module **`kit/rules/workboard.md`**: status vocabulary, board shape, annex/archive checklists, agent resume protocol, path aliases.
- Optional **`kit/rules/continuity.md`**: surgical-edit overlay policy with **no product paths** in kit defaults. Adopters fill [TEMPLATE-CONTINUITY.md](./templates/TEMPLATE-CONTINUITY.md) at a recorded project path; they do not overwrite this module.
- Templates: `kit/templates/docs/WORKBOARD.md`, `kit/templates/docs/plan/TEMPLATE-PROGRAM-README.md`, `kit/templates/docs/plan/TEMPLATE-OOO.md`, `kit/templates/TEMPLATE-CONTINUITY.md`.
- This repository dogfoods the board at root **`docs/WORKBOARD.md`**.

#### Changed

- RULES hub **2.4.0**: Must rows; Operator step 4 names the workboard; authority-map and domain index.
- ai-docs-workspace **1.1.0**: PLAN dual surface → **triple**; workboard + annex/archive.
- hygiene **1.4.0**, contracts **1.3.0**, verification-and-ops **1.5.0**.
- OPS **1.2.0**, PLAN-HOOK **1.3.0**, CATALOG / plan-author / implementer / docs-author: workboard co-maintain.
- SETUP **4c** optional workboard; UPGRADE **1.6.0** preserve board, annexes, aliases, filled continuity overlay.
- Root README piece table, layout, overlays, upgrade prompt, source files.

#### Notes

- Workboard is optional until multi-phase work exists (same dual-path idea as Agent Instruct).
- Not a Domain A/B gate. Enforcement is policy + Operator / OPS procedure.
- Do not paste live phase tables into PLAN.md. Do not overwrite a filled board on upgrade.
- Existing `docs/planning/` adopters keep that path via authority-map alias.

### [2.3.1] - 2026-08-10

#### Changed

- **AI disclosure enforcement** — `Instructed-by` is dynamic: `git config user.name` → ask user and record (prefer Git config; else project note) → last resort `User`.
- versioning-and-git **1.0.3**: resolution cascade; no `Directed-by` trailer; blank line before trailers.
- RULES hub **2.3.1**: Operator step 5 and Must row name `Assisted-by` / `Compliance` / `Instructed-by` with link to domain module.
- verification-and-ops **1.4.1**: contributor checklist matches dynamic cascade.

#### Notes

- Full trailer law remains in `kit/rules/versioning-and-git.md` (hub is discoverability only).
- “Directed by” means `Instructed-by`, not a separate trailer.

### [2.3.0] - 2026-08-10

#### Added

- **AI docs workspace** — project root `docs/` as modular AI resource tree: `research/`, `plan/`, `project_build/`, `resources/` + index.
- Policy module **`kit/rules/ai-docs-workspace.md`**: lifecycle (scaffold when needed, maintain when used), promotion to L4, PLAN dual surface, enforcement triggers, anti-patterns.
- Templates **`kit/templates/docs/**`** for adopter scaffold.
- This repository demonstrates the pattern under root **`docs/`** (kit-maintainer notes).
- RULES hub **2.3.0**: authority map rows, Must, operator step 4 (plan + docs workspace).

#### Changed

- hygiene **1.3.0**: root `docs/` outside kit; separation rules.
- contracts **1.2.0**: docs workspace is not a product contract; promotion anti-pattern.
- verification-and-ops **1.4.0**: before-complete, cadence, checklist for docs workspace.
- SETUP / UPGRADE **1.5.0**: scaffold path; preserve project `docs/` content on upgrade.
- OPS co-maintain includes docs workspace when research/plan/build applies.
- Examples and root README layout/overlays/source tables.

#### Notes

- Dynamic: trivial Q&A need not touch `docs/`; multi-step research/plan/build must maintain relevant modules.
- Does not replace package contracts, kit standards, or root PLAN Agent models.
- Not a Domain A/B gate.

### [2.2.1] - 2026-08-10

#### Added

- **RULES Operator enforcement** — concise always-on maintenance checklist: verify request → validate procedure → apply Agent/Persona (when Instruct) → plan when needed → git/complete → Progress Tracker with commit SHA per completed committed task.
- Progress Tracker minimum shape in `kit/RULES.md` (status + commit columns; pure Q&A one-liner).

#### Changed

- RULES hub **2.2.1**: Summary Must row + Contents entry for operator enforcement.
- OPS **1.0.1**: report shape ties to Progress Tracker.
- verification-and-ops **1.3.1**: before-complete and contributor checklist reference operator enforcement / Progress Tracker.
- Root README governance digest: operator enforcement row.

#### Notes

- Thin hub digest only—detail remains in OPS, PLAN-HOOK, versioning-and-git, and verification modules.
- Bare adopt still skips persona packs; Progress Tracker still applies when advancing repo work.

### [2.2.0] - 2026-08-10

#### Added

- **`kit/agents/OPS.md`** — canonical order of operations (O3): detect Instruct, match one primary expert pack, open expertise, co-maintain L4 docs/rules, lifecycle BUILD, verify, report.
- **RULES hub** subsection **When Agent Instruct is in use** + Must rows for primary-pack match, expertise, co-maintain, and agent lifecycle (Instruct-adopted only; bare adopt still skips).
- **Expertise schema** in PARAMS: required `references` / body Expertise map for generated packs; external `https://` citations with purpose (guidance only); forbidden remote URLs in `authority_paths` and overlays.
- Seed template **Expertise maps** and co-maintain procedures for all seven roles; sample generated maintainer pack updated.
- PLAN-HOOK **feature and core-task lifecycle** + expanded `regenerate_when` defaults.
- Verification-and-ops before-complete step 1 (OPS O3 when Instruct in use); cadence and anti-patterns for skip-match, empty expertise, stale packs after features.
- contracts **Instruct bridge**: packs direct owners; L4 still owns text.

#### Changed

- agents README **1.1.0**: OPS-first utilization; expert packs; enforcement wording (policy + AI convention).
- RUNTIME **1.2.0** / FRAMEWORK **1.1.0** / BUILD **1.2.0** / PLAN-HOOK **1.2.0** / CATALOG **1.1.0** / PARAMS **1.1.0** aligned to O3 and expertise.
- RULES hub **2.2.0**; verification-and-ops **1.3.0**; contracts **1.1.0**; UPGRADE **1.4.0** (merge OPS; preserve adopter expertise).
- SETUP Agent Instruct path points at OPS after first BUILD.
- Root README purpose, governance digest, and index rows for OPS.
- Anti-patterns expanded for utilization and expertise failures.

#### Notes

- Bare adopt without Agent models still skips O3/BUILD.
- External citations are not law and are not overlays; L4 wins on conflict.
- “Automatic” maintenance = mandatory O3 procedure when Instruct is adopted, not a background daemon.
- Not a Domain A/B gate; real completion gates remain inventory style/SAST.

### [2.1.1] - 2026-08-05

#### Changed

- PARAMS **1.0.3**: PLAN delta table uses `tuning.must_not_extra` (aligned with PLAN-HOOK/BUILD).
- PLAN-HOOK **1.1.1** / BUILD **1.1.1**: markdown-native empty Active models (zero bullets / `*(none)*`); `active_models: []` is BUILD algorithm shorthand only.
- Root README purpose directories list includes `agents/`.
- SETUP permanent-after lead mentions optional `kit/agents/` + PLAN Agent models when using Instruct.
- Seed templates `maintainer` / `docs-author`: STOP + completion-rule parity with other roles.
- PLAN snippet / anti-patterns: empty Active models wording clarified.

#### Removed

- Implementation plan package `plans/agent-instruct/` (landed; not adopter payload).

#### Notes

- Post-audit polish only—no schema or catalog redesign. Empty Active models still means emit nothing; unset after first BUILD still requires an explicit list (or `use_catalog_defaults`).

### [2.1.0] - 2026-08-05

#### Added

- **`kit/agents/` Agent Instruct** — portable agent personas as **views** over L4 law (`kit/RULES.md` + `kit/rules/*` + product contracts). Core docs: `README`, `FRAMEWORK`, `PARAMS`, `CATALOG`, `PLAN-HOOK`, `BUILD`, `RUNTIME`.
- Seed role **templates** (`plan-author`, `adopter`, `maintainer`, `implementer`, `docs-author`, `security`, `reviewer`) and **examples** (PLAN Agent models snippet, sample generated pack, anti-patterns).
- `kit/agents/generated/.gitkeep` — project-filled thin packs; track recommended.
- SETUP **Agent Instruct path** (PLAN dual path: required when using agents; bare adopt may skip BUILD).
- UPGRADE merge/preserve/regen for agents + PLAN Agent models.
- RULES hub map rows: agents index, PLAN control surface, generated packs (description + link only).

#### Changed

- Root README purpose, layout, piece tables, and overlays for Agent Instruct.
- Root README **upgrade + quick-path prompts** include conditional/optional Agent Instruct; governance digest packs-as-views row; Source files hygiene wording (unified packaging, not dual layout).
- Hygiene: PLAN required when using agents; `kit/agents/` packaging note.
- Verification-and-ops **1.2.0**: agent verify rows plus cadence, anti-patterns, before-complete step, and contributor checklist for Agent Instruct.
- UPGRADE document version **1.3.0**: preserve vs regen by pack portability; BUILD source load order on upgrade (kit seeds regen; adopter/platform packs preserved).
- RULES hub **2.1.1**: Optional Instruct subsection; agents **not foldable** into the hub.
- BUILD **1.1.0**: unset vs empty `active_models`; source load order; empty placeholder omit; overlay shadow + trust boundary.
- PLAN-HOOK **1.1.0**: `active_models` semantics; `use_catalog_defaults`; trust boundary (repo-relative overlays only).
- RUNTIME **1.1.0**: authority-map-first matching; STOP on failed declared gates.
- FRAMEWORK **1.0.1**: hard rules for STOP, repo-relative overlays, non-foldable hub, adopter pack preserve.
- PARAMS **1.0.2**: validation forbids raw placeholders in generated packs.
- CATALOG **1.0.1**: plan-author dual-path verify; security Domain A focus.
- Seed dual-path fixes: adopter conditional `kit/agents/` copy; plan-author conditional Agent models; implementer/security/reviewer STOP + completion-rule links.
- contracts **1.0.1** and versioning-and-git **1.0.2**: thin Agent Instruct cross-links (packs are not contracts; `agents`/`plan` commit scopes).
- Product examples: PLAN-HOOK + PLAN snippet pointers when using agents.
- Anti-patterns expanded for empty `active_models`, clobber on upgrade, remote overlays, STOP on gates.

#### Notes

- Packs do not redefine law; on conflict L4 wins. v1 is docs + AI-executed BUILD (convention, not a Domain A/B gate).
- Default catalog is portable maintenance/docs/security seeds only—no product/game/CAD pipelines.
- Explicit empty Active models list means emit nothing; do not re-enable the full catalog.

### [2.0.1] - 2026-07-28

#### Changed

- **Adopter packaging doctrine:** new implementations keep **standards under `kit/`** (same model as this repository); **repository-specific** data (product packages, project `CHANGELOG.md`, `PLAN.md`) stays **outside** `kit/`.
- README **Suggested root layout after adopt** corrected (no longer flattens RULES/standards onto product root).
- SETUP copy targets → project `kit/`; permanent hub path → `kit/RULES.md`.
- UPGRADE 1.1.0: migrate 1.x/root-layout standards **into** `kit/`; routine merges target `kit/`.
- Hygiene 1.1.0: unified packaging (replaces “copy onto root” dual layout).
- RULES hub 2.0.1, examples, versioning-and-git: authority map and baseline paths aligned.

#### Notes

- Supersedes 2.0.0 wording that adopters “usually keep RULES at project root after copy.”

### [2.0.0] - 2026-07-28

#### Added

- **`kit/` payload directory** — all standards source under one directory; repository root holds only `README.md`, `LICENSE`, and `.gitignore`.
- **`kit/rules/` domain modules** (7): `hygiene.md`, `authoring-and-style.md`, `architecture.md`, **`contracts.md`**, `security.md`, `versioning-and-git.md`, `verification-and-ops.md`.
- **`kit/UPGRADE.md`** — durable upgrade guide (routine procedure, **1.x → 2.0 migration**, merge options, AI prompts). Not deleted after initiation.
- Dedicated **contract policy** module (`rules/contracts.md`): ownership, same-change-set, cross-reference rules.
- Root README **Mandatory governance** digest and bottom **Source files** inventory.
- SETUP **Existing repository (first adopt)** section for live codebases without a kit baseline.

#### Changed

- **BREAKING:** Public kit paths moved under `kit/` (see migration table below).
- `RULES.md` is a **hub** (authority map, kit baseline, module index); body content lives in `rules/*`.
- MARKDOWN-STANDARD 1.0.1 → **1.1.0**: cross-linking form; kit paths.
- README how-to: three paths (new / existing first adopt / upgrade) pointing at SETUP vs UPGRADE.
- Upgrade procedure deferred from RULES body to **UPGRADE.md**.
- Kit CHANGELOG location: `kit/CHANGELOG.md` (this file).

#### Removed

- Root-level `RULES.md`, `SETUP.md`, `MARKDOWN-STANDARD.md`, `CHANGELOG.md`, `configs/`, `templates/`, `examples/` (moved under `kit/`).

#### Migration (1.x → 2.0)

| Old (1.x) | New (2.0) |
|-----------|-----------|
| `/RULES.md` | `/kit/RULES.md` + `/kit/rules/*` |
| `/SETUP.md` | `/kit/SETUP.md` |
| *(none)* | `/kit/UPGRADE.md` |
| `/MARKDOWN-STANDARD.md` | `/kit/MARKDOWN-STANDARD.md` |
| `/CHANGELOG.md` | `/kit/CHANGELOG.md` |
| `/configs/` | `/kit/configs/` |
| `/templates/` | `/kit/templates/` |
| `/examples/` | `/kit/examples/` |

Adopting projects keep **standards under `kit/`** and **project** `CHANGELOG.md` at repo root (see [2.0.1](#201---2026-07-28)). Upstream **reading** paths for upgrades are under `kit/`. Full procedure: [UPGRADE.md — Migrate from kit 1.x / root layout to 2.x](./UPGRADE.md#migrate-from-kit-1x--root-layout-to-2x).

### [1.2.1] - 2026-07-28

#### Changed

- README quick-path upgrade label renamed to **Upgrade repo-kit** (`####` heading); AI upgrade prompt now references project Kit baseline (Adopted kit version, Kit source) and the canonical kit source.
- Quick-path modes promoted to stable `####` headings (New implementation, Alternative, Upgrade repo-kit) for deep links.
- RULES.md document version 1.4.0 → **1.4.1**: upgrade procedure starts from Kit baseline **Kit source**; deep link to README prompt corrected to `#upgrade-repo-kit`.
- SETUP upgrade pointer includes README **Upgrade repo-kit** alongside RULES.

### [1.2.0] - 2026-07-28

#### Added

- **Language surface inventory** in RULES.md: full catalog aligned with existing style + SAST tables (Python, Python deps, PowerShell, JavaScript/TypeScript/Node, Go, Rust, Shell, Other/mixed, Secrets, Semgrep) with Domain A (security) and Domain B (code validation) columns.
- **Security and code-validation certification** policy in RULES.md: single `certification/` folder, certificate JSON/TXT schema, OverallPass rules, developer-only and non–product-gate constraints (no runnable harness yet).
- **Completion rule** and **Before marking work complete** steps (humans and AI agents): declared style + SAST gates required when inventory lists the surface.
- `templates/TEMPLATE-CERTIFICATION-README.md` operator guide skeleton for adopter `certification/README.md`.
- SETUP, examples (docs-only / Python library / CLI), TEMPLATE-SECURITY, README, and `.gitignore` updates for inventory, required-when-declared SAST, and regenerable cert outputs.

#### Changed

- RULES.md document version 1.3.1 → **1.4.0**: SAST posture from advisory-only to **required when declared**; verification, checklist, maintenance cadence, and anti-patterns updated.

#### Removed

- Root `SECURITY_PLAN.md` — product-oriented concept fully absorbed into RULES (language inventory, SAST required-when-declared, certification schema, completion rule); RULES is the sole authority.

### [1.1.7] - 2026-07-26

#### Changed

- Root README Purpose: fixed typo (“percision” → “precision”) and tightened the sentence while preserving instructional voice.

### [1.1.6] - 2026-07-26

#### Added

- Root README **Upgrading an existing adoption** pointer (with copy-pasteable AI upgrade prompt) and navigation rows in “You want to…”, Use cases, and Where to go next.
- Explicit CHANGELOG discipline sentence in RULES.md upgrade procedure: read only kit CHANGELOG entries since the current Adopted kit version; merge only what you need; never copy the full kit history into the project CHANGELOG.
- Cross-link from RULES upgrade section to the README AI upgrade prompt.

#### Changed

- RULES.md document version 1.3.0 → **1.3.1** (upgrade-path clarity only).

#### Removed

- Completed root `PLAN.md` for the upgrade-instructions / existing-adopters cycle (enhancement fully executed).

### [1.1.5] - 2026-07-26

#### Added

- Security documentation modularity in RULES.md: omit `SECURITY.md` when a package has no execution surface, network access, elevated privilege, or secrets handling.
- Advisory multi-language **Security / SAST gates** in RULES.md, keyed by language/surface (Bandit, pip-audit, PSScriptAnalyzer, npm audit, govulncheck, cargo-audit, ShellCheck, Gitleaks, optional Semgrep)—declare only languages the repo ships.
- Optional verification-table row for language-specific security / SAST commands.
- Brief “delete if not applicable” guidance on key sections of `templates/TEMPLATE-SECURITY.md`.
- SETUP pointers for optional security docs and language-scoped SAST gates.
- Explicit modularity notes in `examples/docs-only.md`, `examples/python-library.md`, and `examples/cli-tool.md`.

#### Changed

- RULES.md document version 1.2.2 → **1.3.0** (security modularity + SAST section; anti-pattern updates).

#### Removed

- Completed root `PLAN.md` for the modular security documentation & multi-language SAST gates cycle (enhancement fully executed).

### [1.1.4] - 2026-07-26

#### Changed

- Root README How-to section: fixed typo, added explicit “no traditional install” sentence, and smoothed agent prompts for cleaner copy-paste use.

### [1.1.3] - 2026-07-26

#### Added

- Root README **Purpose** and **How to use (quick path)** blocks: human consistency + AI-agent context efficiency; recommend a user-supplied project `PLAN.md`; copy-pasteable clone and agent-context prompts.

#### Changed

- Root README Quick start: primary 9-step checklist deferred to [SETUP.md](./SETUP.md); suggested layout notes recommended project `PLAN.md`.
- Root README lead and maintainers section: surface AI-context differentiator.

#### Removed

- Completed root `PLAN.md` for the README purpose / AI-context cycle (enhancement fully executed).

### [1.1.2] - 2026-07-25

#### Added

- Required AI-assisted commit disclosure footers in RULES.md Git rules: `Assisted-by` (AI make/model per commit), `Compliance: RULES.md`, `Instructed-by` (from `git config user.name`).

#### Changed

- RULES.md document version 1.2.1 → 1.2.2; strengthened pre-commit and contributor checklists for AI transparency.

### [1.1.1] - 2026-07-25

#### Changed

- Hierarchical CHANGELOG structure: repository H2 → version H3 → category H4; Unreleased workflow removed.
- Clarified kit vs project history distinction in this file’s header and in root README.
- Strengthened anti-pattern guidance in RULES.md against putting kit release history into a project CHANGELOG.
- Aligned `RULES.md`, `README.md`, `SETUP.md`, and `examples/` with the hierarchical structure (RULES document version **1.2.1**).

### [1.1.0] - 2026-07-25

#### Added

- Ephemeral `SETUP.md` for one-time project initiation (adoption modes, authority-map fill, template pick).
- `examples/` with filled authority-map and verification skeletons (CLI, Python library, docs-only).
- `CHANGELOG.md` for kit-level history (canonical **kit version** authority).
- Non-Python style-gate guidance table in `RULES.md`.
- Stronger commit-message guidance in `RULES.md` (modularity, scopes, body, examples, optional footers).
- Root hygiene rules in `RULES.md`.
- **Mandatory project CHANGELOG** policy in `RULES.md` (Keep a Changelog; required for all adopters, including docs-only).
- **Kit baseline** block in `RULES.md` (adopted kit version, date, source) so upgrades remain trackable after SETUP is removed.
- Kit upgrade procedure pointing at https://github.com/shainemeister/repo-kit.
- SETUP step to record kit baseline and ensure root CHANGELOG before delete.
- Sample kit baseline + required CHANGELOG rows in `examples/`.

#### Changed

- Root `README.md`: initiation checklist moved to `SETUP.md`; landing page kept light.
- `RULES.md` **Versioning and change control**: three surfaces (kit / project-package / document); CHANGELOG required; consistency rules strengthened (document version **1.2.0**).
- Root hygiene: `CHANGELOG.md` required (was recommended); SETUP lifecycle note for kit shippers and adopters.
- `configs/pylintrc`: louder adopter guidance that `py-version` **must** be set (3.13 remains starter default only).
- `.gitignore`: richer starter set (Python caches/build, venvs, coverage, light `node_modules/`) with adopter header comment.
- README maintainers section: kit version = CHANGELOG releases; canonical source URL; SETUP lifecycle.

#### Removed

- Completed prior-cycle `PLAN.md` (improvement plan fully executed).

### [1.0.1] - 2026-07-22

#### Changed

- Initiation-from-interest guidance and platform-aware verify/examples in `RULES.md` and related docs.
- Pylintrc path wording aligned (copy as `.pylintrc` or pass `--rcfile`).

### [1.0.0] - 2026-07-22

#### Added

- Initial portable kit: `MARKDOWN-STANDARD.md`, `RULES.md`, `templates/`, `configs/pylintrc`.
- Root landing README pattern (no frontmatter; use cases first).
- MIT license.
