---
id: execute
title: Execute
layer: playbook
portability: adopter
activation: catalog_match
description: >
  Implement the approved plan and nothing beyond it. Completion stays in kit/RULES.md.
triggers:
  - implement the approved plan
  - execute the plan
  - carry out the plan in a worktree
negative_triggers:
  - review the result
  - check edge cases
  - check placement or focus order
  - write a second design
authority_paths:
  - kit/RULES.md
  - kit/rules/path-pattern.md
references:
  - path: kit/RULES.md
    kind: repo
    purpose: Completion. Do not claim the work done if a named check was skipped
  - path: kit/rules/path-pattern.md
    kind: repo
    purpose: Read the files the plan names before editing
verify:
  - the files the plan names were read before editing
  - the checks the plan names were run
  - the result lists the files changed, the checks run, and any plan item left open
  - the edits stayed in the private worktree named in the result
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Execute

Implement the approved plan and nothing beyond it. Completion stays in [kit/RULES.md](../../../../kit/RULES.md#completion).

The approved plan is the whole prompt. [path-pattern.md](../../../../kit/rules/path-pattern.md) stays the owner for which files to read before editing.

## Must

- Treat the approved plan as the whole prompt.
- Read the files the plan names before editing.
- Follow the decisions, edge cases, and design choices as written.
- Run the checks the plan names.
- Keep the edits in a private worktree. The result includes that worktree path.
- List the files changed, the checks run, and any plan item left open.

## Must not

- Invent a second design.
- Implement anything the approved plan does not name.
- Review the result in this task. Name `check-code` or `check-ui` and stop.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `kit/RULES.md` — completion
- `kit/rules/path-pattern.md` — read the named files before editing

### External (citations — guidance only)

- None.

## Procedure

1. Open [kit/RULES.md](../../../../kit/RULES.md#completion) and the approved plan.
2. Read the files the plan names before editing.
3. Implement the decisions, edge cases, and design choices as written.
4. Run the checks the plan names.
5. List the files changed, the checks run, and any plan item left open. Include the worktree path.
6. When the result needs a QA or UI check, name `check-code` or `check-ui` and stop.
7. If a declared check failed or was skipped, stop.

## Open for law

See authority_paths. The principle stays in the owner file.
