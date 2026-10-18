---
id: implementer
title: Implementer
layer: role
portability: kit
activation: catalog_match
description: >
  Adopt the skills and documents this repository already has for the change. Cite the kit owner. Add a path only when the role is absent.
triggers:
  - implement
  - feature
  - fix
  - refactor
  - code
  - existing skill
  - existing docs
negative_triggers:
  - docs-only policy edit with no code
  - pure kit adoption
authority_paths:
  - kit/RULES.md
  - kit/rules/contracts.md
  - kit/rules/path-pattern.md
  - WORKBOARD.md
  - PLAN.md
references:
  - path: kit/rules/path-pattern.md
    kind: repo
    purpose: One role per path. Extend the file that already holds the role
  - path: kit/rules/contracts.md
    kind: repo
    purpose: Boundaries and same-change-set updates
  - path: kit/RULES.md
    kind: repo
    purpose: Authority map and completion
  - path: docs/README.md
    kind: repo
    purpose: Notes this repository already keeps
  - path: library/platforms/style-gates.md
    kind: repo
    purpose: Style commands when a platform pack names them. Not kit law
verify:
  - the change follows the skill or document that already holds the role
  - a new path was added only when that role was absent
  - canonical owner updated when behavior changed
  - declared checks for this repository were run
  - "{{VERIFY_COMMANDS}}"
# BUILD fills: {{PROJECT_NAME}}, {{VERIFY_COMMANDS}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Implementer

Adopt the skills and documents this repository already has for the change. Cite the kit owner. Add a path only when the role is absent.

## Must

- Find the skill or document that already holds the role. Follow that file.
- Cite the kit owner. The owners are [path-pattern.md](../../rules/path-pattern.md#one-role), [contracts.md](../../rules/contracts.md), and [completion](../../RULES.md#completion).
- When the role is absent, the next task is `kit-name-path`. Stop.
- Run the checks this repository declares. Fill {{VERIFY_COMMANDS}} from those checks. Do not invent tools.
- When a second concern appears, name that task and stop.

## Must not

- Copy a local skill or document into this pack.
- Restate a kit principle in this pack.
- Invent a check the authority map does not name.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- The repository's own skill or document for this role
- `kit/rules/path-pattern.md` — one role, and when to add a path
- `kit/rules/contracts.md` — boundaries and co-updates
- `kit/RULES.md` — authority map and completion
- `WORKBOARD.md` — multi-phase record
- `PLAN.md` — mission and non-goals

### External (citations — guidance only)

- Add vendor docs for this repository during BUILD. Do not invent tools.

## Procedure

1. Open the authority map.
2. Find the skill or document that already holds this role. Follow that file. Cite the kit owner it uses.
3. When no file holds the role, the next task is `kit-name-path`. Stop.
4. Make the smallest change that does the task. When behavior changes, follow the [same-change-set rule](../../rules/contracts.md#same-change-set-rule).
5. Run {{VERIFY_COMMANDS}} when the repository names them.
6. If the work should outlive this session, the next task is kit-author-plan, then kit-emit-packs. Stop.
7. If a declared check failed or was skipped, stop ([completion](../../RULES.md#completion)).

## Open for law

See authority_paths. Do not restate those files.
