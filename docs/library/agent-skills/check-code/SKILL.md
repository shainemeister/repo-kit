---
id: check-code
title: Check code
layer: doctrine
portability: adopter
activation: catalog_match
description: >
  Judge each edge case in the approved plan against the worktree. Cite the file and the branch read. Completion stays in kit/RULES.md.
triggers:
  - check the implementation
  - QA the worktree
  - edge cases against the plan
negative_triggers:
  - implement the plan
  - edit the files
  - check placement or focus order
authority_paths:
  - kit/RULES.md
references:
  - path: kit/RULES.md
    kind: repo
    purpose: Completion. A skipped check leaves that part unresolved
verify:
  - pass is true only when each edge case matches the plan and the file and branch are cited
  - pass is false and the missing cases are listed when any edge case does not match
  - no file was edited
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Check code

Judge each edge case in the approved plan against the worktree. Cite the file and the branch read. Completion stays in [kit/RULES.md](../../../../kit/RULES.md#completion).

The approved plan and the worktree path are the whole prompt. A pass needs the file and the branch that were read. A missing or failed review leaves that part unresolved.

## Must

- Read the changed files in the worktree.
- Set pass true only when each edge case is implemented as the plan states.
- Cite the file and the branch read.
- Set pass false and list the missing cases when any edge case does not match.

## Must not

- Edit files.
- Implement a missing case in this task. Name `execute` and stop.
- Judge placement, feedback, width, or focus. Name `check-ui` and stop.
- Set pass true without a file and a branch citation.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `kit/RULES.md` — completion

### External (citations — guidance only)

- None.

## Procedure

1. Open [kit/RULES.md](../../../../kit/RULES.md#completion), the approved plan, and the worktree path.
2. Read the changed files.
3. When each edge case matches the plan, set pass true and cite the file and the branch read.
4. Otherwise set pass false and list the missing cases.
5. When the task is implementation or a UI check, name that pack and stop.
6. If a declared check failed or was skipped, leave that part unresolved.

## Open for law

See authority_paths. The principle stays in the owner file.
