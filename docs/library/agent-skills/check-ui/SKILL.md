---
id: check-ui
title: Check UI
layer: doctrine
portability: adopter
activation: catalog_match
description: >
  Judge placement, feedback, narrow width, and focus order against the approved plan. Cite what was read. Completion stays in kit/RULES.md.
triggers:
  - check the interface
  - review placement and focus
  - UI check of the worktree
negative_triggers:
  - implement the plan
  - edit the files
  - check edge cases in code
authority_paths:
  - kit/RULES.md
references:
  - path: kit/RULES.md
    kind: repo
    purpose: Completion. A skipped check leaves that part unresolved
verify:
  - pass is true only when placement, feedback, narrow width, and focus order match the plan and the read is cited
  - pass is false and the mismatch is named when any of those four do not match
  - no file was edited
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Check UI

Judge placement, feedback, narrow width, and focus order against the approved plan. Cite what was read. Completion stays in [kit/RULES.md](../../../../kit/RULES.md#completion).

The approved plan and the worktree path are the whole prompt. A pass needs a citation of what was read. A missing or failed review leaves that part unresolved.

## Must

- Read the changed surface the plan names.
- Set pass true only when placement, feedback, narrow width, and focus order match the plan.
- Cite what was read.
- Set pass false and name the mismatch when any of those four do not match.

## Must not

- Edit files.
- Implement a mismatch in this task. Name `execute` and stop.
- Judge code edge cases. Name `check-code` and stop.
- Set pass true without citing what was read.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `kit/RULES.md` — completion

### External (citations — guidance only)

- None.

## Procedure

1. Open [kit/RULES.md](../../../../kit/RULES.md#completion), the approved plan, and the worktree path.
2. Read the changed surface the plan names.
3. When placement, feedback, narrow width, and focus order match the plan, set pass true and cite what was read.
4. Otherwise set pass false and name the mismatch.
5. When the task is implementation or a code check, name that pack and stop.
6. If a declared check failed or was skipped, leave that part unresolved.

## Open for law

See authority_paths. The principle stays in the owner file.
