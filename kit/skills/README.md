---
title: Skills
description: "Index of procedure packs and the match rows for the seed ids. Open the pack whose action matches the task."
version: "1.15.0"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - kit-commit/SKILL.md
  - kit-workboard-register/SKILL.md
  - kit-workboard-advance/SKILL.md
  - kit-workboard-close/SKILL.md
  - kit-apply-change/SKILL.md
  - kit-author-docs/SKILL.md
  - kit-review-change/SKILL.md
last_updated: "2026-10-17"
---

# Skills

Index of procedure packs and the match rows for the seed ids. Open the pack whose action matches the task.

**Related:** [kit-commit](kit-commit/SKILL.md) · [kit-workboard-register](kit-workboard-register/SKILL.md) · [kit-workboard-advance](kit-workboard-advance/SKILL.md) · [kit-workboard-close](kit-workboard-close/SKILL.md) · [kit-apply-change](kit-apply-change/SKILL.md) · [kit-author-docs](kit-author-docs/SKILL.md) · [kit-review-change](kit-review-change/SKILL.md)

Related lists maintainer peers. Do not load them for this task.

One task loads one skill ([files.md](../rules/files.md)). Adopt and upgrade orders are [kit-adopter](../../docs/library/kit-adopter/README.md).

---

## Contents

1. [Start here](#start-here)
2. [Document index](#document-index)
3. [Match index](#match-index)
4. [Document history](#document-history)

---

## Start here

| You want to… | Open |
|--------------|------|
| Commit the staged change | [kit-commit](kit-commit/SKILL.md) |
| Open, advance, close, or archive a program | [kit-workboard-register](kit-workboard-register/SKILL.md) · [kit-workboard-advance](kit-workboard-advance/SKILL.md) · [kit-workboard-close](kit-workboard-close/SKILL.md) · [kit-workboard-archive](kit-workboard-archive/SKILL.md) |
| Do the change a phase names | [kit-apply-change](kit-apply-change/SKILL.md) |
| Write durable markdown | [kit-author-docs](kit-author-docs/SKILL.md) |
| Review a change | [kit-review-change](kit-review-change/SKILL.md) |
| Apply the security baseline | [kit-apply-security](kit-apply-security/SKILL.md) |
| Match a seed id | [Match index](#match-index) |
| Adopt or upgrade | [kit-adopter](../../docs/library/kit-adopter/README.md) |
| The multi-phase record | [WORKBOARD.md](../../WORKBOARD.md) |

---

## Document index

| Directory | Role in this tree |
|-----------|-------------------|
| [kit-commit/](kit-commit/SKILL.md) | Specific verb. Write the commit for the staged change |
| [kit-workboard-register/](kit-workboard-register/SKILL.md) | Open one program on the workboard |
| [kit-workboard-advance/](kit-workboard-advance/SKILL.md) | Set the one active phase and add the progress line |
| [kit-workboard-close/](kit-workboard-close/SKILL.md) | Mark a phase done, cancelled, or deferred |
| [kit-workboard-archive/](kit-workboard-archive/SKILL.md) | Update the board after a commit. File it when every phase is done |
| [kit-apply-change/](kit-apply-change/SKILL.md) | Agnostic verb. Adopt the repository's existing role, or seed one when it is absent |
| [kit-author-docs/](kit-author-docs/SKILL.md) | Author durable markdown. Blanks in `template/` |
| [kit-review-change/](kit-review-change/SKILL.md) | Review a change. A commit rewrite is the next task |
| [kit-apply-security/](kit-apply-security/SKILL.md) | Apply the security baseline. Blank in `template/security.md` |

---

## Match index

Match text only. Open the seed for procedure, authority paths, and verify. Triggers and negative triggers live on the seed.

| id | activation | Match | Seed |
|----|------------|-------|------|
| `maintainer` | catalog_match | Commit the staged change | [kit-commit](kit-commit/SKILL.md) |
| `workboard-register` | catalog_match | Open one program on the workboard | [kit-workboard-register](kit-workboard-register/SKILL.md) |
| `workboard-advance` | catalog_match | Set the one active phase and add the progress line | [kit-workboard-advance](kit-workboard-advance/SKILL.md) |
| `workboard-close` | catalog_match | Mark a phase done, cancelled, or deferred | [kit-workboard-close](kit-workboard-close/SKILL.md) |
| `workboard-archive` | catalog_match | Update the board after a commit. File it when every phase is done | [kit-workboard-archive](kit-workboard-archive/SKILL.md) |
| `implementer` | catalog_match | Adopt the repository's existing role for the change | [kit-apply-change](kit-apply-change/SKILL.md) |
| `docs-author` | catalog_match | Author durable markdown | [kit-author-docs](kit-author-docs/SKILL.md) |
| `security` | catalog_match | Apply the security baseline | [kit-apply-security](kit-apply-security/SKILL.md) |
| `reviewer` | catalog_match | Review a change in this session | [kit-review-change](kit-review-change/SKILL.md) |

### Suggested default set

`on` is emit eligibility. It does not load those packs into this session. BUILD fills the exact set from PLAN. Open the emit pack only when the task is an emit ([shelf](../../docs/library/kit-adopter/README.md)).

| id | Default |
|----|---------|
| `maintainer` | on |
| `workboard-register` | match |
| `workboard-advance` | match |
| `workboard-close` | match |
| `workboard-archive` | match |
| `implementer` | on |
| `docs-author` | on |
| `security` | on when the change touches privilege, network, or secrets; otherwise match |
| `reviewer` | match |

Keep these ids stable. PLAN may disable any default. A product persona is an overlay or `docs/library/kit-adopter/generated/<id>.md`. It is not a row in this table. Creating one is its own task ([kit-author-plan trust boundary](../../docs/library/kit-adopter/skills/kit-author-plan/SKILL.md#trust-boundary)).

The retired crew is archived outside this tree. Do not register it.

---

## Document history

| Version | Notes |
|---------|--------|
| 1.15.0 | `kit-workboard-archive` runs after every commit. A finished program is filed and the blank restored |
| 1.14.0 | This index lists nine repeated verbs. `kit-workboard-archive` files a finished board and restores the blank |
| 1.13.0 | This index lists the eight repeated verbs. Adopt and upgrade packs are the shelf index |
| 1.12.0 | Activation and size live in `kit-map-layers`. The match rows stay in this index. `kit-load-packs` and `kit-match-agents` are gone |
| 1.11.0 | Home is `kit/skills/kit-<action>/`. A blank is `template/<noun>.md` |
| 1.10.0 | Kit packs are `skills/kit-<action>/`. Ids stay. `kit-adopter` and `generated/` stay |
| 1.9.0 | The match rows and the suggested default set live here. Layers, the bare-adopt skip, and pack format cite their owners |
| 1.8.2 | The adopt verb is `kit-adopter/`. Id `adopter` stays |
| 1.8.1 | The commit verb is `commit/`. Id `maintainer` stays |
| 1.8.0 | Action directories are `use-instruct`, `author-plan`, `emit-packs`, `commit-version`, `apply-change`, `author-docs`, and `review-change`. Ids stay |
| 1.7.0 | The retired crew left this tree. It is not a live pack |
| 1.6.0 | One task loads one skill. `dispatch-crew` is deprecated. No sub-agent delegation |
| 1.5.0 | The pack file is `SKILL.md`. The directory name is the action, one to three words joined by `-`. No README beside `SKILL.md` |
| 1.4.0 | Each pack is a directory. Framework owns layers. Runtime owns load and budgets. Shared examples and templates are gone |
| 1.3.0 | Home is root `skills/`. Seed files use a noun or a verb name. `plan.md` holds the agent-model contract |
| 1.2.4 | Index row for the optional slash_only orchestrator crew (kit 2.15.0) |
| 1.2.3 | Drop in-body document-version echo (kit 2.8.1) |
| 1.2.2 | Density restyle (kit 2.8.0); index, layers map, and AgentPack format note unchanged |
| 1.2.1 | Instruct law docs follow density (Summary/Contents when required); packs stay AgentPack (kit 2.7.0) |
| 1.2.0 | HABITAT L0 + parent/child start-here (kit 2.6.0) |
| 1.1.0 | OPS index; expert packs; O3 Musts; lifecycle (kit 2.2.0) |
| 1.0.0 | Initial Agent Instruct index (kit 2.1.0) |
