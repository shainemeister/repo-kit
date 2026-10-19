---
title: Agent BUILD Procedure
description: BUILD is the AI-executable procedure that resolves the active agent set and emits thin expert AgentPacks from templates and the authority map.
version: "1.11.0"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - ../../../../../kit/skills/README.md
  - ../kit-use-instruct/SKILL.md
  - ../kit-define-pack/SKILL.md
  - ../kit-author-plan/SKILL.md
  - ../kit-map-layers/SKILL.md
  - ../../../../../kit/UPGRADE.md
last_updated: "2026-10-18"
---

# Agent BUILD Procedure

BUILD is the AI-executable procedure that resolves the active agent set and emits thin expert AgentPacks from templates and the authority map. Prefer deterministic template fill over freeform rewriting of kit law.

**After BUILD:** operators use packs via **[kit-use-instruct](../kit-use-instruct/SKILL.md)** (detect, report, and a new persona when that is the task).

**Related:** [README.md](../../../../../kit/skills/README.md) · [kit-use-instruct](../kit-use-instruct/SKILL.md) · [kit-define-pack](../kit-define-pack/SKILL.md) · [kit-author-plan](../kit-author-plan/SKILL.md) · [kit-map-layers](../kit-map-layers/SKILL.md) · [UPGRADE.md](../../../../../kit/UPGRADE.md)

---

## Summary

| Must |
|------|
| Read PLAN Agent models before emit; do not emit packs that ignore `disabled` |
| Fill from authority map real paths; keep pack bodies short; link L4; fill expertise map (do not paste full `kit/rules/*.md`) |
| Validate packs per [PARAMS](../kit-define-pack/SKILL.md) (including expertise/references) |
| Emit only under `docs/library/kit-adopter/generated/` |
| Regen when PLAN / authority / kit templates / feature surfaces change |

**Prerequisite:** Agent models section present in PLAN.md. If missing and the project uses Agent Instruct, insert from [kit-author-plan](../kit-author-plan/SKILL.md) first. Bare adopt without Agent models → **skip BUILD** ([PLAN dual path](../kit-author-plan/SKILL.md#plan-dual-path)).

---

## Contents

1. [Inputs](#inputs)
2. [Outputs](#outputs)
3. [Algorithm](#algorithm)
4. [Resolution rules](#resolution-rules)
5. [Source load order](#source-load-order)
6. [Template fill rules](#template-fill-rules)
7. [Failure modes](#failure-modes)
8. [Regen triggers](#regen-triggers)
9. [Document history](#document-history)

---

## Inputs

| Input | Source |
|-------|--------|
| Active set & tuning | PLAN.md Agent models |
| Mission / stages / non-goals | PLAN.md (other sections) |
| Default catalog | [kit/skills/README.md](../../../../../kit/skills/README.md#match-index) |
| Schema | `docs/library/kit-adopter/skills/kit-define-pack/SKILL.md` |
| Role seeds | The seed file for the id. See [Source load order](#source-load-order) |
| Authority map | [RULES.md](../../../../../kit/RULES.md) and the files it names |
| Domain modules | `kit/rules/*` (link targets, not paste sources) |
| Overlays | Paths listed in PLAN |
| Optional this-turn instruction | User message (ephemeral unless written to PLAN) |

---

## Outputs

| Output | Default path |
|--------|----------------|
| Generated packs | **`docs/library/kit-adopter/generated/<id>.md`** only |
| Optional project catalog slice | `docs/library/kit-adopter/generated/CATALOG.project.md` |
| Optional host skill emit | Host-specific path (adopter opt-in only) |
| PLAN `last_generated` | Optional stamp in Agent models section |

**Tracking (recommended):** commit thin generated packs so clones work offline. This kit ships `docs/library/kit-adopter/generated/.gitkeep` and no live packs.

---

## Algorithm

```text
1. READ PLAN.md
   - If no PLAN / no Agent models and bare adopt → stop (no BUILD)
   - If Agent models missing but agents intended → insert the template in ../kit-author-plan/template/plan.md; continue
2. LOAD the match index in kit/skills/README.md + PARAMS schema + the seed file for each id
3. READ kit/RULES.md authority map and the owners it names
4. RESOLVE active set (see Resolution rules)
5. FOR each id in active set:
   a. Resolve source pack via Source load order (do not invent kits silently)
   b. If preserve (adopter/platform generated) → keep file; skip destructive overwrite
   c. Else FILL placeholders from PLAN + authority map + expertise/references
   d. APPLY tuning (emphasize notes, must_not_extra under Must not/Tuning, stage_min)
   e. ENSURE Expertise map + references (PARAMS); external entries need purpose
   f. VALIDATE (PARAMS validation rules including expertise)
   g. EMIT docs/library/kit-adopter/generated/<id>.md (kit-portability seeds and filled overlays)
6. FOR each new project agent created this BUILD (explicit PLAN/user action only):
   a. Ensure pack file exists under docs/library/kit-adopter/generated/
   b. Ensure PLAN lists id; durable map note if project maintains extra rows
7. EMIT optional CATALOG.project.md (id + description + triggers only)
8. OPTIONAL: host skill-shaped emit if PLAN/runtime config requests it
9. UPDATE PLAN last_generated if using that field
10. REPORT summary: enabled ids, disabled, overlays, shadows, preserves, validate warnings
```

---

## Resolution rules

Absent, unset, and empty are defined in [kit-author-plan](../kit-author-plan/SKILL.md#active_models-semantics). Apply those meanings. An explicit empty list does not turn on the catalog.

PLAN is markdown-native. Bullets under `### Active models` are the list. The shorthand `active_models: []` below means that list is empty: zero bullets, or a single `*(none)*` line.

```text
if Agent models section absent:
  → bare adopt → SKIP BUILD

if active_models field ABSENT or UNSET:
  if first_BUILD_for_agents OR PLAN.use_catalog_defaults == true:
    active := CATALOG suggested defaults for repo kind
      (infer docs-only vs code from the repository and PLAN)
    REPORT: "applied catalog defaults (first BUILD or use_catalog_defaults)"
  else:
    FAIL resolve: require explicit active_models list
    (do not invent full catalog)

if active_models present and is empty list []:
  # empty = zero bullets under ### Active models, or *(none)*
  active := []
  REPORT: "active set empty — emit nothing"
  # do NOT fall back to catalog defaults

if active_models present and non-empty:
  active := PLAN.active_models

active := active − PLAN.disabled

if PLAN.overlays:
  for each overlay path:
    if path is http(s) URL → FAIL that overlay (repo-relative only; see Trust)
    load overlay pack; add its id to active
    if id shadows a CATALOG seed id → WARN in report (overlay wins)

if stage_gates present:
  emit with activation: stage_gated where applicable

this-turn user instruction:
  if durable language → propose PLAN edit, then re-resolve
  if ephemeral → temporary compose only (do not write generated pack unless asked)
```

**Checks:** Fill `verify` from the checks the authority map already names. A docs-only repository uses the author checklist. Do not invent tools. Language checks, when a repository has them, sit outside this kit.

---

## Source load order

For each id in the resolved active set, choose **one** source. Emit path is always `docs/library/kit-adopter/generated/<id>.md`.

| Priority | Source | Action |
|----------|--------|--------|
| 1 | PLAN **overlay** path for this id | Load overlay; fill/emit; **overlay wins** if id also exists as kit seed (report shadow) |
| 2 | Existing `generated/<id>.md` with `portability: adopter` or `platform` | **Preserve** — do not overwrite unless PLAN/user explicitly requests refresh for that id |
| 3 | Kit seed file for the id (table below) | Fill → emit (`portability: kit`) |
| 4 | Unknown id, no overlay, no existing pack | **Fail that id**; report; **do not invent** a PARAMS skeleton that clobbers future work |

**New project agents (explicit creation only):** When the user/PLAN deliberately adds a **new** project persona (not a typo id on regen), create from [PARAMS](../kit-define-pack/SKILL.md) skeleton under `generated/`, set `portability: adopter` (or `platform`), add to `active_models`. Skeleton creation is **not** the path for unknown ids during routine UPGRADE regen.

**Seed files.** The id in PLAN stays stable. The source file is the procedure name.

| id | Source |
|----|--------|
| `plan-author` | `docs/library/kit-adopter/skills/kit-author-plan/SKILL.md` |
| `adopter` | `docs/library/kit-adopter/skills/kit-adopter/SKILL.md` |
| `maintainer` | `kit/skills/kit-commit/SKILL.md` |
| `workboard-register` | `kit/skills/kit-workboard-register/SKILL.md` |
| `workboard-advance` | `kit/skills/kit-workboard-advance/SKILL.md` |
| `workboard-close` | `kit/skills/kit-workboard-close/SKILL.md` |
| `workboard-archive` | `kit/skills/kit-workboard-archive/SKILL.md` |
| `implementer` | `kit/skills/kit-apply-change/SKILL.md` |
| `name-path` | `kit/skills/kit-name-path/SKILL.md` |
| `index-directory` | `kit/skills/kit-index-directory/SKILL.md` |
| `docs-author` | `kit/skills/kit-author-docs/SKILL.md` |
| `security` | `kit/skills/kit-apply-security/SKILL.md` |
| `reviewer` | `kit/skills/kit-review-change/SKILL.md` |

**UPGRADE / regen:** Re-emit **kit-portability** packs from those seed files. Preserve **adopter/platform** packs. See [UPGRADE.md](../../../../../kit/UPGRADE.md).

---

## Template fill rules

| Placeholder class | Fill from |
|-------------------|-----------|
| Authority paths | RULES authority map rows relevant to role (**repo-relative only**) |
| Verify commands | Checks named by the authority map. Never invent tools |
| Expertise / references | Template defaults + map paths; add project contract paths; keep curated external citations with purpose |
| Mission must_not | PLAN non-goals / must not invent |
| Project name | README / PLAN title |
| Kit paths | Always `kit/...` as adopted |
| `must_not_extra` | PLAN tuning → **Must not** or **Tuning** section |

**Empty optional fills:**

| Situation | Behavior |
|-----------|----------|
| Optional bullet empty (`{{TUNING_MUST_NOT_EXTRA}}`, extra notes) | **Omit the line/bullet** entirely |
| `{{VERIFY_COMMANDS}}` / `{{SAST_COMMANDS}}` with nothing declared | Write “none declared” — **never invent tools** |
| Required project field unfilled | Fail validation; do not emit |
| Any remaining raw `{{PLACEHOLDER}}` | Fail validation ([PARAMS](../kit-define-pack/SKILL.md)) — finished generated packs must not ship unfilled tokens |

**Body rules:**

1. Procedure steps only (ordered); include co-maintain L4 + STOP on failed gates.  
2. Must / Must not bullets (short).  
3. **Expertise map** — in-repo + external citations with purpose (align with YAML `references`).  
4. “Open these docs” list = authority_paths (+ expertise).  
5. No full reproduction of contracts.md or versioning-and-git.md.  
6. Source resolution uses [Source load order](#source-load-order) — never silent skeleton invent on unknown id.  
7. No `http(s)` in `authority_paths`; external only under references/expertise as citations.

**Trust boundary (overlays):** Apply [kit-author-plan](../kit-author-plan/SKILL.md#trust-boundary). A remote overlay path fails. Do not download citations into the tree.

---

## Failure modes

| Failure | Response |
|---------|----------|
| No PLAN.md (agents intended) | Create minimal PLAN from interest + Agent models template; do not invent product architecture |
| No PLAN / no Agent models (bare adopt) | Skip BUILD |
| `active_models` unset after first BUILD (no `use_catalog_defaults`) | Fail resolve; require explicit list |
| `active_models: []` | Emit nothing; report empty set (not a failure) |
| Authority map empty | Stop BUILD for implementer-heavy packs; run adopter/SETUP path first |
| Unknown agent id (no overlay, no generated pack) | Fail that id; report; do not invent skeleton |
| Existing adopter/platform pack on regen | Preserve; do not clobber |
| Overlay path missing | Fail that overlay; continue others; report |
| Overlay is remote URL | Fail that overlay; report trust boundary |
| Overlay id shadows CATALOG seed | Overlay wins; **warn** in report |
| Pack fails validation | Do not emit; fix template fill |
| Missing expertise/references on generated pack | Do not emit; fill from template + map ([PARAMS](../kit-define-pack/SKILL.md)) |
| External reference without purpose | Do not emit; add purpose or drop link |
| `http(s)` in authority_paths | Fail validation; move to references as citation if appropriate |
| Conflict must vs must_not_extra | Prefer stricter must_not; surface in report |

---

## Regen triggers

Re-run BUILD when:

- PLAN Agent models fields change  
- PLAN mission/stages/non-goals change materially  
- Authority map changes
- Pack schema or seed upgrade ([UPGRADE.md](../../../../../kit/UPGRADE.md))  
- New project agent packs added  
- **New package, public surface, language, or durable task class** (update expertise/active set first)  
- User explicitly requests “regenerate agents”  

On kit upgrade regen, apply [Source load order](#source-load-order) so adopter packs survive.

Lifecycle context: [kit-use-instruct](../kit-use-instruct/SKILL.md#lifecycle-features-and-core-tasks) · [kit-author-plan](../kit-author-plan/SKILL.md#mid-project-adjustment-procedure).

---

## Document history

| Version | Notes |
|---------|--------|
| 1.11.0 | The seed table includes `name-path` and `index-directory` |
| 1.10.0 | The seed table includes the workboard ids |
| 1.9.0 | The emit target is `docs/library/kit-adopter/generated/` |
| 1.8.0 | Absent, unset, and empty stay defined in `kit-author-plan`. This file applies them |
| 1.7.0 | Home is `kit/skills/kit-<action>/`. A blank is `template/<noun>.md` |
| 1.6.0 | Kit packs are `skills/kit-<action>/`. Ids stay. `kit-adopter` and `generated/` stay |
| 1.5.3 | The default catalog is the match index in `skills/README.md` |
| 1.5.2 | Adopter seed path is `skills/kit-adopter/SKILL.md`. The id stays |
| 1.5.1 | Maintainer seed path is `skills/commit/SKILL.md`. The id stays |
| 1.5.0 | Directory is `emit-packs`. Seed paths use the action names. Ids stay |
| 1.4.1 | Seed path is `skills/<action>/SKILL.md`. Ids stay stable |
| 1.4.0 | Emit reads the authority map. Retired gate lists are not inputs. The upgrade cite is the file |
| 1.3.0 | Seed sources are the procedure files under `skills/`. Ids stay stable |
| 1.2.2 | Drop in-body document-version echo (kit 2.8.1) |
| 1.2.1 | Density restyle (kit 2.8.0); unique fill rules, source load order, and regen triggers unchanged |
| 1.2.0 | Expertise fill + validation; feature/surface regen triggers; OPS pointer (kit 2.2.0) |
| 1.1.1 | Note: PLAN markdown-native empty Active models; `[]` is BUILD shorthand only |
| 1.1.0 | Unset vs empty active_models; source load order; preserve adopter packs; empty placeholder omit; overlay shadow + trust boundary |
| 1.0.0 | Initial BUILD procedure (kit 2.1.0) |
