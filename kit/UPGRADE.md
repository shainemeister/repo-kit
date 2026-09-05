---
title: Upgrade repo-kit
description: Durable guide for upgrading an existing kit baseline, including 1.x to 2.x layout migration (standards under kit/) and merge options.
version: "1.8.8"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - RULES.md
  - SETUP.md
  - CHANGELOG.md
  - ../README.md
  - rules/versioning-and-git.md
  - rules/hygiene.md
  - rules/workboard.md
last_updated: "2026-09-04"
---

# Upgrade repo-kit

Durable procedure for **repositories that already adopted** the Repository Standards Kit. Not deleted after initiation—keep under project `kit/` or always open this file at Kit source.

**Related:** [RULES.md](./RULES.md) · [SETUP.md](./SETUP.md) · [CHANGELOG.md](./CHANGELOG.md) · [README.md](../README.md) · [versioning-and-git.md](./rules/versioning-and-git.md) · [hygiene.md](./rules/hygiene.md) · [workboard.md](./rules/workboard.md)

---

## Summary

| Situation | Use |
|-----------|-----|
| **No** Kit baseline / never adopted | Stop — use [SETUP.md](./SETUP.md) (first adopt) |
| Baseline ≥ 2.0 **and** standards already under `kit/` | [Routine upgrade procedure](#routine-upgrade-procedure) |
| Baseline **&lt; 2.0** **or** standards still on **project root** (1.x layout) | [Migrate from kit 1.x / root layout to 2.x](#migrate-from-kit-1x--root-layout-to-2x) then routine steps for remaining deltas |

**Prerequisite:** Kit baseline table exists (in `kit/RULES.md`, or root `RULES.md` until migrated). See [Kit baseline](./RULES.md#kit-baseline).

**Packaging target:** merge standards into the project’s **`kit/`** tree. Keep product code and **project root** `CHANGELOG.md` outside `kit/`. See [hygiene.md](./rules/hygiene.md).

---

## Contents

1. [Choose your path](#choose-your-path)
2. [Routine upgrade procedure](#routine-upgrade-procedure)
3. [Migrate from kit 1.x / root layout to 2.x](#migrate-from-kit-1x--root-layout-to-2x)
4. [Merge strategy options](#merge-strategy-options)
5. [Agent Instruct on upgrade](#agent-instruct-on-upgrade)
6. [Preserve list](#preserve-list)
7. [Copy-paste AI prompts](#copy-paste-ai-prompts)
8. [Document history](#document-history)

---

## Choose your path

| Path | Condition | Jump to |
|------|-----------|---------|
| **First adopt into existing repo** | No Kit baseline | [SETUP.md](./SETUP.md) (selective / align mode) |
| **Routine upgrade** | Standards under `kit/`; baseline current major | [Routine upgrade procedure](#routine-upgrade-procedure) |
| **Layout + path migration** | 1.x baseline **or** root-level RULES/MARKDOWN-STANDARD/rules | [Migrate from kit 1.x / root layout to 2.x](#migrate-from-kit-1x--root-layout-to-2x) |

---

## Routine upgrade procedure

1. Read this project’s **Kit baseline** (Adopted kit version, Kit source, Adopted on) in **`kit/RULES.md`**.  
2. Open **Kit source** (canonical: https://github.com/shainemeister/repo-kit) → [`kit/CHANGELOG.md`](./CHANGELOG.md) → `## repo-kit`.  
3. List releases **after** your Adopted kit version only.  
4. Build a **focused merge plan**: only pieces this project uses (hub `RULES.md`, `rules/*` including **ai-docs-workspace**, **workboard**, **continuity** policy, **files.md**, `MARKDOWN-STANDARD.md` (**1.6.0** — YAML except omit list + description identity test including current-content summary; do not sweep product trees for historical fences, tautological blurbs, or stale descriptions), templates including **TEMPLATE-LANDING-README.md**, **templates/docs/** and **WORKBOARD.md**, configs, **`kit/agents/HABITAT.md`** if a coding agent is used, remaining **`kit/agents/`** if Instruct is used, `.gitignore` patterns).  
5. **Merge into project `kit/`** — not onto the product root. **Preserve** project root **`docs/`** content (do not overwrite with empty templates). **Never** replace a filled `docs/WORKBOARD.md` with the empty template. Merge new files under `kit/configs/` (pylintrc, rustfmt.toml, clippy.toml, clang-format, clang-tidy) as **catalog**. Do **not** force-copy them onto the product root; copy to `.pylintrc` / `rustfmt.toml` / `.clang-format` only when that language is **in the inventory**. If a coding agent is used (or root `AGENTS.md` exists): merge `kit/agents/HABITAT.md` and L0 templates. **Preserve** a filled root `AGENTS.md` and host aliases — do not overwrite with the empty template. Kit **2.7.0** density and templates are the contract; later module restyles are editorial — preserve local additions.  
6. **Root `README.md`:** required [landing](./MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) — no frontmatter; `## Overview` then `## Operator prompts`. Rewrite in place or start from [TEMPLATE-LANDING-README.md](./templates/TEMPLATE-LANDING-README.md). Keep this repo’s Overview content; Operator prompts is **this** repo’s session load path — do not paste upstream kit adopt/upgrade fences. Package READMEs stay on [TEMPLATE-README.md](./templates/TEMPLATE-README.md).  
7. **Preserve** project-specific values — see [Preserve list](#preserve-list).  
8. Fix relative links (`../README.md`, `../CHANGELOG.md`, `../packages/…`).  
9. **Agent Instruct (if used):** merge upstream `kit/agents/` core docs (include **OPS.md**) + templates; **preserve** PLAN Agent models, expertise on adopter packs, and adopter/platform generated packs; re-run [BUILD](./agents/BUILD.md) with [source load order](./agents/BUILD.md#source-load-order) (kit seeds regen with expertise; do not clobber adopter packs). See [Agent Instruct on upgrade](#agent-instruct-on-upgrade).  
10. Update **Adopted kit version** and **Adopted on**; keep Kit source unchanged (unless deliberate fork).  
11. **Project root** `CHANGELOG.md`: short note (e.g. “Upgraded repo-kit baseline to X.Y.Z”)—**never** paste full kit history.  
12. Re-run the project verification table / [completion rule](./rules/verification-and-ops.md#completion-rule).  
13. Optional: refresh local `kit/UPGRADE.md` from upstream.

---

## Migrate from kit 1.x / root layout to 2.x

Kit **2.0+** packages standards under `kit/` and splits RULES into a hub plus domain modules. **Adopting projects** should use the same packaging: standards under **`kit/`**, repository-specific data outside.

### Upstream path migration (kit source)

| Old (1.x upstream) | New (2.x upstream) |
|--------------------|--------------------|
| `/RULES.md` | `/kit/RULES.md` + `/kit/rules/*` |
| `/SETUP.md` | `/kit/SETUP.md` |
| *(none)* | `/kit/UPGRADE.md` (this file) |
| `/MARKDOWN-STANDARD.md` | `/kit/MARKDOWN-STANDARD.md` |
| `/CHANGELOG.md` | `/kit/CHANGELOG.md` (kit history only) |
| `/configs/` | `/kit/configs/` |
| `/templates/` | `/kit/templates/` |
| `/examples/` | `/kit/examples/` |

### Adopter layout migration (your product repo)

| Before (1.x-style product repo) | After (2.x-style product repo) |
|---------------------------------|--------------------------------|
| Root `RULES.md` | **`kit/RULES.md`** |
| Root `rules/` (if any) | **`kit/rules/`** — [files.md](./rules/files.md) lands here after migrate into `kit/`; **never** leave law at root `./rules/` |
| Root `MARKDOWN-STANDARD.md` | **`kit/MARKDOWN-STANDARD.md`** |
| Root `SETUP.md` | Remove after use; do not keep permanent |
| Root `UPGRADE.md` (if any) | **`kit/UPGRADE.md`** |
| Root `CHANGELOG.md` | **Stay at project root** (project history) |
| Packages / src | **Stay outside `kit/`** |

### What to do

| Topic | Guidance |
|-------|----------|
| Move standards into `kit/` | `git mv` or equivalent; update all relative links |
| Modular rules | Prefer `kit/RULES.md` + `kit/rules/*` |
| Contracts module | Ensure [contracts](./rules/contracts.md) exists; authority-map row for contract policy |
| File placement (`files.md`) | After migrate into `kit/`, keep [files.md](./rules/files.md) under **`kit/rules/`**; do **not** create a root `./rules/` compat tree |
| Project CHANGELOG | Remains at **repo root** |
| Product code | Never under `kit/` |
| Authority map | Standards → `kit/…`; product → packages/paths outside; history → `../CHANGELOG.md` from kit files |
| AI / runbooks | Point at `kit/UPGRADE.md`, `kit/RULES.md`, Kit source `kit/CHANGELOG.md` |

### Checklist

- [ ] Confirm baseline is 1.x **or** standards still live at project root  
- [ ] Create `kit/` if missing; move RULES, MARKDOWN-STANDARD, rules modules, UPGRADE into `kit/`  
- [ ] Merge hub shape + domain modules from upstream  
- [ ] Keep project `CHANGELOG.md` at root; do not replace it with kit CHANGELOG  
- [ ] Update authority map paths and deep links  
- [ ] Update agent prompts / internal docs to `kit/…` paths  
- [ ] Root `README.md` uses landing shape (`## Overview` then `## Operator prompts`; no frontmatter)  
- [ ] Set baseline to latest 2.x after applying deltas  
- [ ] Project CHANGELOG note for major kit / layout upgrade  

Then run [Routine upgrade procedure](#routine-upgrade-procedure) for any remaining releases.

---

## Merge strategy options

| Strategy | When | How |
|----------|------|-----|
| **Selective file merge into `kit/`** | Default | Copy/merge changed upstream kit files into project `kit/` |
| **Reference / submodule** | Want upstream tracking | Submodule or sibling clone; filled project hub still documents product paths; compare `kit/CHANGELOG` on upgrade |
| **Single-file RULES under `kit/`** | Small teams | One `kit/RULES.md`; port deltas from hub + children manually; still record baseline |
| **Hub + rules/ under `kit/`** | Recommended | `kit/RULES.md` + `kit/rules/*.md` |

---

## Agent Instruct on upgrade

When the project uses Agent Instruct (`kit/agents/` present and PLAN has Agent models):

| Artifact | Action |
|----------|--------|
| Upstream Instruct docs + `templates/` + CATALOG + **OPS.md** | **Merge** into project `kit/agents/` |
| Root PLAN **Agent models** | **Always preserve** (`active_models`, `disabled`, `overlays`, `tuning`, etc.) — never reset to kit defaults without user intent; add OPS to Instruct authority table if missing |
| Overlay source files (PLAN paths) | **Preserve** |
| Generated packs with `portability: kit` (from seeds) | **Regen** via [BUILD](./agents/BUILD.md) after template merge (includes expertise map) |
| Generated packs with `portability: adopter` or `platform` | **Preserve** expertise and body — do not overwrite unless PLAN/overlay is the emit source **and** user requests refresh for that id |
| BUILD re-run | Required after template/catalog merge; must follow [source load order](./agents/BUILD.md#source-load-order) |
| Ongoing utilization | After upgrade, operators use [OPS.md](./agents/OPS.md) O3 |

**Conflict resolution:** Preserve and Regen are **not** equal-priority for the same file. Kit-derived seeds regen; adopter/platform packs preserve. BUILD must not invent skeletons for unknown ids on upgrade.

If a coding agent is used, merge [HABITAT.md](./agents/HABITAT.md) even when Instruct is not adopted. Merging the **rest** of `kit/agents/` (OPS, BUILD, packs) stays optional until first Instruct use ([SETUP Agent Instruct path](./SETUP.md#agent-instruct-path) / [PLAN-HOOK](./agents/PLAN-HOOK.md)).

---

## Preserve list

Never clobber on merge:

- Authority map **product paths** (outside `kit/`)  
- Language surface inventory **filled rows**  
- Verification commands  
- Adopter-edited values in **already copied** product style files (`py-version` in `.pylintrc`, rustfmt `edition`, clang-format `BasedOnStyle`) — merge new kit starter comments into `kit/configs/` only  
- Unused `kit/configs/*` left as dormant catalog (do not invent inventory rows or product-root copies for languages the repo does not ship)  
- Filled root **`AGENTS.md`** and recorded host aliases (merge HABITAT policy only; do not reset L0)  
- Filled **package README / CLI / SECURITY / methodology** bodies — merge kit templates for *new* files only; **do not restyle** adopter filled product docs on upgrade  
- Kit `rules/*` **editorial restyles** in 2.8.0+ are optional/editorial; preserve local additions  
- Root README **product** Overview (reshape headings; do not replace with upstream kit landing copy)  
- Project root CHANGELOG **history**  
- Project root **`docs/`** content (AI workspace notes—merge policy/templates under `kit/` only)  
- Project **`docs/WORKBOARD.md`** and `docs/plan/**` (including `archive/`) — merge kit policy only; do **not** restyle a filled board or fail complete for historical annexes that lack a six-field phase brief ([workboard](./rules/workboard.md) **1.2.0** is forward-only / on-edit)  
- Recorded path **aliases** (e.g. `docs/planning/` instead of `docs/plan/`) — do not force rename  
- Filled **continuity overlay** (adopter protected-surface table at the recorded project path — **not** a rewrite of portable `kit/rules/continuity.md`)  
- Kit baseline **Kit source** URL (unless deliberate fork)  
- PLAN **Agent models** section (active/disabled/overlays/tuning) — **always** when Instruct is used  
- Custom `kit/agents/generated/` packs with `portability: adopter` or `platform`  
- PLAN overlay source files (repo-relative paths)  
- Do **not** backfill directory-index READMEs for historical folders ([files.md](./rules/files.md) is **forward-only**; not a failed complete)  
- Do **not** treat historical missing YAML fences as a failed complete ([MARKDOWN-STANDARD](./MARKDOWN-STANDARD.md#when-to-use-this-standard) is **forward-only** / on-edit; same spirit as directory-index)  
- Do **not** treat historical tautological, title-paraphrase, or stale YAML `description` values as a failed complete (identity test including current-content summary is new/on-edit; same spirit as YAML fences)  
- Do **not** create root `./rules/` as a compat tree; law stays under `kit/`  
- Folded-hub adopters: port [files.md](./rules/files.md) into the hub **or** keep `kit/rules/files.md`; record in the map  

---

## Copy-paste AI prompts

### Routine upgrade

```text
Upgrade repo-kit for this repository (Kit baseline in kit/RULES.md).

1. Read Kit baseline (Adopted kit version, Kit source).
2. Open kit/UPGRADE.md and kit/CHANGELOG.md under ## repo-kit at Kit source (https://github.com/shainemeister/repo-kit).
3. Follow UPGRADE routine procedure; merge only appropriate deltas into this project's kit/; preserve authority map product paths and verification.
4. Reshape root README.md to landing if needed (no frontmatter; ## Overview then ## Operator prompts). Keep this repo's Overview; do not paste upstream kit adopt/upgrade fences. Package READMEs unchanged.
5. If a coding agent is used (or AGENTS.md exists): merge kit/agents/HABITAT.md; do not overwrite a filled root AGENTS.md or host aliases.
6. If Agent Instruct is in use: merge the rest of kit/agents/ docs+templates; preserve PLAN Agent models and adopter/platform generated packs; re-run kit/agents/BUILD.md (kit seeds regen only; source load order).
7. Preserve docs/WORKBOARD.md, docs/plan/** (or recorded alias), and any filled continuity overlay. Merge kit/rules/workboard.md policy; do not overwrite a live board with the empty template.
8. Update Kit baseline; add a short note to project root CHANGELOG.md.
```

### 1.x / root layout → 2.x migration

```text
Migrate this repository to repo-kit 2.x packaging using kit/UPGRADE.md (Migrate from kit 1.x / root layout to 2.x).
Move standards under kit/; keep product code and project CHANGELOG outside kit/. Preserve authority map product paths. Reshape root README.md to landing (Overview then Operator prompts) if needed. Update baseline and project CHANGELOG.
```

### First adopt into existing repo (no baseline)

```text
This repository has no repo-kit baseline. Follow kit/SETUP.md selective adoption: add kit/ for standards, keep product outside kit/, record Kit baseline in kit/RULES.md. Do not use UPGRADE until after first adopt.
```

---

## Document history

| Version | Notes |
|---------|--------|
| 1.8.8 | Merge MARKDOWN-STANDARD 1.6.0; no complete-fail for historical stale descriptions (kit 2.12.0) |
| 1.8.7 | Merge workboard 1.2.0; no complete-fail for historical annexes without a phase brief (kit 2.11.1) |
| 1.8.6 | Merge MARKDOWN-STANDARD 1.5.0; no complete-fail for historical tautological descriptions (kit 2.11.0) |
| 1.8.5 | Merge MARKDOWN-STANDARD 1.4.0; no complete-fail for historical missing YAML fences (forward-only / on-edit) (kit 2.10.0) |
| 1.8.4 | Merge files.md with rules/*; no directory-index backfill; no root `./rules/` compat tree (kit 2.9.0) |
| 1.8.3 | Density chrome (kit 2.8.0); preserve list and upgrade steps unchanged |
| 1.8.2 | Preserve filled product docs; 2.8.0+ rules restyles editorial (kit 2.7.0) |
| 1.8.1 | Routine upgrade reshapes root README to landing (kit 2.6.3) |
| 1.8.0 | Merge HABITAT; preserve filled AGENTS.md and host aliases (kit 2.6.0) |
| 1.7.0 | Merge kit/configs as catalog; do not force product-root style copies; preserve adopter edition / BasedOnStyle / py-version (kit 2.5.0) |
| 1.6.0 | Preserve workboard, plan annexes, path aliases, continuity overlay (kit 2.4.0) |
| 1.5.0 | Preserve root docs/; merge ai-docs-workspace + templates/docs (kit 2.3.0) |
| 1.4.0 | Merge OPS.md; preserve adopter expertise; kit seeds regen with expertise (kit 2.2.0) |
| 1.3.0 | Agent Instruct: preserve vs regen by portability; source load order; non-clobber BUILD on upgrade |
| 1.2.0 | Agent Instruct: merge kit/agents/; preserve PLAN Agent models; BUILD regen; preserve list + AI prompt |
| 1.1.0 | Adopter target is project `kit/`; 1.x/root layout migration moves standards into kit/; product CHANGELOG stays at root |
| 1.0.0 | Initial durable upgrade guide for kit 2.0 |
