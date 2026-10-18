---
id: agent-orchestrator
title: Orchestrate
layer: playbook
portability: adopter
activation: catalog_match
description: >
  Plan phases on the root workboard, or run one phase by spawning the pack that step needs. The record stays WORKBOARD.md.
triggers:
  - orchestrate the work
  - plan the workboard phases
  - run a workboard phase
  - spawn the execute and check agents
negative_triggers:
  - the task is only to implement the plan
  - the task is only a code check
  - the task is only a UI check
  - the task is only to register, advance, or close the board
authority_paths:
  - WORKBOARD.md
  - kit/RULES.md
  - kit/rules/contracts.md
references:
  - path: WORKBOARD.md
    kind: repo
    purpose: The multi-phase record. One program is active at a time
  - path: kit/RULES.md
    kind: repo
    purpose: Completion
  - path: kit/rules/contracts.md
    kind: repo
    purpose: The board update and the filing rule
  - path: docs/library/agent-skills/execute/SKILL.md
    kind: repo
    purpose: Implement one approved phase in a private worktree
  - path: docs/library/agent-skills/check-code/SKILL.md
    kind: repo
    purpose: Pass or fail that phase's edge cases
  - path: docs/library/agent-skills/check-ui/SKILL.md
    kind: repo
    purpose: Pass or fail placement, feedback, narrow width, and focus order
verify:
  - plan mode asked a concise question for each open decision and did not spawn a pack
  - run mode spawned execute with the active phase, then check-code, and check-ui only when the phase has a visible surface
  - a failed check was sent back to execute with the miss, or a missing decision was asked of the user
  - a satisfied phase named kit-workboard-close and this task stopped
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Orchestrate

Plan phases on the root workboard, or run one phase by spawning the pack that step needs. The record stays [WORKBOARD.md](../../../../WORKBOARD.md).

[Contracts](../../../../kit/rules/contracts.md#boundaries) owns when that board is updated and filed. Completion stays in [kit/RULES.md](../../../../kit/RULES.md#completion).

## Must

- Choose plan or run from the request.
- In plan mode, name the edge cases and ask a concise question for each decision the request leaves open.
- When those answers are in, name `kit-workboard-register` and stop. The phases are the order of operations.
- When the primary program is not `—`, leave that program in place.
- In run mode, spawn `execute` with the active phase as its whole prompt, in a private worktree.
- After `execute` returns, spawn `check-code` with the plan and that worktree path.
- Spawn `check-ui` when the phase names placement, feedback, width, or focus.
- Send a failed check back to `execute` with the miss. Ask the user when the miss is a decision the phase does not contain.
- When the phase is satisfied, name `kit-workboard-close` and stop.

## Must not

- Invent a second design.
- Edit the product files in this task.
- Spawn `check-code` or `check-ui` before the worktree path exists.
- Spawn a pack for a step that is not the current one.
- Run a later phase in the same spawn. One phase is the task.
- Replace a primary program.
- Restate [execute](../execute/SKILL.md), [check-code](../check-code/SKILL.md), or [check-ui](../check-ui/SKILL.md).
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `WORKBOARD.md` — the multi-phase record
- `kit/rules/contracts.md` — board update and filing
- `kit/RULES.md` — completion
- `docs/library/agent-skills/execute/SKILL.md` — implement the active phase
- `docs/library/agent-skills/check-code/SKILL.md` — edge cases
- `docs/library/agent-skills/check-ui/SKILL.md` — placement, feedback, narrow width, and focus order

### External (citations — guidance only)

- None.

## Procedure

1. Open [WORKBOARD.md](../../../../WORKBOARD.md) and [kit/RULES.md](../../../../kit/RULES.md#completion).
2. When the request is to plan the work, name the edge cases. Ask a concise question for each open decision. When the answers are in, name `kit-workboard-register` and stop. When the primary program is not `—`, stop and leave it in place.
3. When the request is to run a phase, take the active phase as the approved plan. Spawn a sub-agent on [execute](../execute/SKILL.md) with that phase as its whole prompt and a private worktree.
4. Spawn a sub-agent on [check-code](../check-code/SKILL.md) with the phase and the worktree path. Spawn a sub-agent on [check-ui](../check-ui/SKILL.md) only when the phase names placement, feedback, width, or focus.
5. When a check sets pass false, spawn `execute` again with that miss. When the miss is a decision the phase does not contain, ask the user and wait.
6. When every check that this phase required sets pass true and cites what it read, name `kit-workboard-close` and stop.
7. If a declared check failed or was skipped, stop.

## Open for law

See authority_paths. The workboard procedures stay in `kit/skills/`. The three packs stay the owners of their steps.
