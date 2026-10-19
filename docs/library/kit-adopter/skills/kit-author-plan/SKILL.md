---
id: plan-author
title: PLAN author
layer: playbook
portability: kit
activation: catalog_match
description: >
  Draft or revise project PLAN.md, including the Agent models contract when Instruct is in use.
triggers:
  - plan
  - PLAN.md
  - project interest
  - roadmap
  - stages
  - non-goals
  - workboard
  - multi-phase
  - OOO
negative_triggers:
  - pure code bugfix with no plan impact
authority_paths:
  - PLAN.md
  - docs/README.md
  - WORKBOARD.md
  - kit/MARKDOWN-STANDARD.md
  - README.md
references:
  - path: docs/README.md
    kind: repo
    purpose: Triple surface — PLAN vs workboard vs docs/plan
  - path: WORKBOARD.md
    kind: repo
    purpose: Multi-phase board
  - path: kit/MARKDOWN-STANDARD.md
    kind: repo
    purpose: Structure for durable PLAN docs when applicable
verify:
  - PLAN has mission-level summary
  - Agent models section present per the contract in this file when using Agent Instruct (omit for bare adopt)
  - stages consistent if used
  - multi-step execution detail in docs/plan/ when used (not only chat)
  - multi-phase work registered on WORKBOARD.md when applicable
  - when an annex exists, active phase brief filled before the phase starts
  - PLAN does not contain a live phase-status table
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# PLAN author

The Agent models contract below Open for law stays in this file.

## Must not

- Invent product architecture not implied by interest or user.
- Duplicate full kit Instruct docs inside PLAN.
- Require Agent models for bare kit adopt (no Instruct).
- Move Agent models exclusively under `docs/` (control surface stays PLAN.md).
- Paste live phase tables into PLAN.md (use the workboard).
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `PLAN.md` — project plan (this surface)
- `docs/plan/` — detailed execution plans and optional annexes
- `WORKBOARD.md` — active multi-phase board
- `docs/README.md` — AI docs workspace
- `kit/MARKDOWN-STANDARD.md` — durable doc shape
- Root `README.md` — product purpose alignment

### External (citations — guidance only)

- Prefer project-specific planning conventions. No required external standard.

## Handback

You are the sub-agent for this file. Do this procedure. Do not open another pack. Do not deploy a sub-agent. Return done, or a short fix list. Then stop.

## Procedure

1. Restate project interest in one sentence.
2. Draft/update mission, non-goals, stages as needed.
3. If multi-step execution detail is needed: ensure `docs/plan/` (+ `docs/README.md` index) per ai-docs-workspace.
3b. If multi-phase: register or update `WORKBOARD.md`; create an annex only when the phase table cannot hold the OOO; link the annex from the board.
4. If using Agent Instruct: ensure the Agent models section matches the contract in this file. The Instruct authority field names kit-map-layers, kit-define-pack, kit-emit-packs, this file, and kit-use-instruct. Match rows are the skills index. After enablement or surface growth, return done. Do not open kit-emit-packs.
5. If bare adopt (no Instruct): omit Agent models and skip BUILD; mission/non-goals verify is enough.
6. On new durable task classes, the next task is creating a persona. Stop.

## Open for law

See authority_paths and Expertise map — do not restate full modules here.

## Agent models

### PLAN dual path

| Path | Requirement |
|------|-------------|
| **With Agent Instruct** | PLAN.md **required**; must include Agent models section. The emit after adopt or an enablement change is the kit-emit-packs task. Stop |
| **Bare kit adopt** | PLAN optional; no Agent models ⇒ no BUILD, no generated packs |

## Required section

**Title (recommended):** `## Agent models`

Acceptable aliases if consistent in-repo: `## Agents`, `## Agent Instruct`. Prefer **Agent models**.

**Placement:** After mission/summary and architecture pointers is fine; must be discoverable (listed in PLAN contents if PLAN has a contents block).

---

## Field contract

| Field | Required | Description |
|-------|----------|-------------|
| **Instruct authority** | yes | Links to kit-map-layers, kit-define-pack, kit-emit-packs, this file, and kit-use-instruct. Match rows are `kit/skills/README.md` |
| **active_models** | yes when Instruct in use | List of agent ids under `### Active models` (markdown bullets). **Empty list** (zero bullets, or a single `*(none)*` line) means no agents active (emit nothing). **Unset** after first BUILD is not the same as empty — see BUILD resolution |
| **disabled** | yes (may be empty) | Ids explicitly off |
| **overlays** | yes (may be empty) | **Repo-relative** paths to adopter/platform pack sources |
| **use_catalog_defaults** | optional | If `true`, first-time/BUILD may apply CATALOG suggested defaults when `active_models` is unset; default is first-BUILD-only behavior per [BUILD](../kit-emit-packs/SKILL.md#resolution-rules) |
| **tuning** | recommended | emphasize, must_not_extra, always_on_extra (keep tiny), notes |
| **stage_gates** | optional | Map agent id → min stage |
| **regenerate_when** | recommended | Conditions that require BUILD regen |
| **last_generated** | optional | ISO date / kit agents version note after BUILD |

### `active_models` semantics

PLAN is **markdown-native**. BUILD algorithm docs may write `active_models: []` as shorthand for an **empty** Active models list in PLAN.

| State | Meaning for BUILD |
|-------|-------------------|
| **Agent models** section **absent** | Bare adopt — no BUILD |
| Active models **unset** (section present, field never filled; Instruct in use) | Catalog defaults only on **first BUILD** or when `use_catalog_defaults: true`; otherwise require an explicit list |
| **Empty** Active models list | Zero bullets under `### Active models`, or a single `*(none)*` (or equivalent “none”) line — active set empty; **emit nothing**; **not** “all catalog agents” |
| **Non-empty** bullet list | Enabled set (minus `disabled`, plus overlay ids) |

Do **not** imply “all catalog agents always on” without an explicit list or documented first-BUILD defaults report.

### `tuning` subkeys (recommended)

| Key | Meaning |
|-----|---------|
| `emphasize` | Agent ids or themes to prefer when multiple match |
| `must_not_extra` | Project-specific prohibitions injected into relevant packs (**Must not** / Tuning) |
| `always_on_extra` | Extra always-on bullets (strict size budget) |
| `notes` | Freeform human notes for BUILD (not law) |

---

## Trust boundary

| Rule | Detail |
|------|--------|
| Overlay paths | **Repo-relative** only (e.g. `docs/agents/product-review.md`) |
| Remote URLs | BUILD must **not** follow `http://` or `https://` overlay paths |
| PLAN tuning | Intentional privileged instruction for **this** repo — not untrusted content fetched from outside the tree |
| Overlay vs kit seed | Same id: **overlay wins**; BUILD reports a shadow warning ([BUILD source load order](../kit-emit-packs/SKILL.md#source-load-order)) |

---

## Minimal template

Copy [example.md](template/plan.md). The field contract above is the meaning. The example is the section to paste.

---

## Mid-project adjustment procedure

```text
1. User (or AI with user intent) edits PLAN Agent models fields
2. Confirm durable vs session-only
3. Return done. Do not open kit-emit-packs.
```

| Change type | Typical commit type |
|-------------|---------------------|
| Enable/disable agents only | `chore(agents):` or `docs(plan):` |
| New product overlay / expert persona | `docs(agents):` + pack files |
| Feature/surface growth → expertise regen | `docs(agents):` or `chore(agents):` after map update |
| Kit template upgrade regen | `chore(agents):` after UPGRADE |

### Feature and core-task lifecycle

When the product gains durable work shapes, update agents in the same initiative—not only in chat.

| Trigger | PLAN / agent action |
|---------|---------------------|
| New package or product area | Record the authority-map paths. Return done. Do not open kit-emit-packs |
| New public CLI/API/behavior | Co-update L4 contracts. If verify paths change, return done. Do not open kit-emit-packs |
| New privilege, network, or secrets surface | Record `security` on the active set. Return done. Do not open kit-emit-packs |
| New durable task class | Name the persona task and stop. This session stays on kit-author-plan |
| Stage complete / post-adopt | `disabled` += `adopter` when appropriate; adjust `stage_gates` / `emphasize` |

Utilization is a different task. Name it and stop.

---

## Durable vs session-only

| Intent | Where it goes |
|--------|----------------|
| “From now on, security agent is required” | PLAN `active_models` |
| “For this PR, review harder” | Next task is kit-review-change. This session stays on kit-author-plan |
| “Never commit .env” | Prefer `.gitignore` + security pack verify; may add `must_not_extra` |
| “Ignore adopter agent” | PLAN `disabled` |
| “Add design-review persona” | Overlay or generated pack + active_models |

**Rule:** If the user will be angry when the next session forgets it → **PLAN**.

---

## Interaction with other PLAN sections

| PLAN area | Effect on agents |
|-----------|------------------|
| Mission / non-goals | Feeds implementer/reviewer must_not |
| Stages | stage_gates; adopter vs implementer emphasis |
| Verification policy | verify[] alignment |
| Architecture pointers | implementer authority_paths |
| “Must not invent” lists | Injected into implementer + reviewer |
| Live phase / todo tables | **Do not belong in PLAN.** Use `WORKBOARD.md` + optional `docs/plan/<id>/` annex ([workboard](../../../../../WORKBOARD.md)). PLAN may **point** at the board in one short subsection. |

BUILD reads these sections when filling templates; it does not delete them.

---

## SETUP and UPGRADE

Install is [ADOPTER.md](../../../../../ADOPTER.md). When Instruct is in use, this file's Agent models section is required. The first emit is the orchestrator's kit-emit-packs row. Do not open that pack in this session. An adopted repository deletes `ADOPTER.md` when the adopt is finished.

Later upgrades are [UPGRADE.md](../../../../../kit/UPGRADE.md). Preserve Agent models. After a template merge, return done. Do not open kit-emit-packs in this session. Do not reset `active_models` without user intent.

---
