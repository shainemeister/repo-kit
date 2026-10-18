---
id: workboard-close
title: Workboard close
layer: playbook
portability: kit
activation: catalog_match
description: >
  Mark a phase done, cancelled, or deferred. Leave the program on the board.
triggers:
  - close a phase
  - phase done
  - defer a phase
  - cancel a phase
  - check off a phase
negative_triggers:
  - the phase is still the work in progress
  - no program is registered
authority_paths:
  - WORKBOARD.md
  - kit/rules/contracts.md
  - kit/RULES.md
references:
  - path: WORKBOARD.md
    kind: repo
    purpose: The multi-phase record
  - path: kit/rules/contracts.md
    kind: repo
    purpose: A shipped phase updates the board in the same change set
  - path: kit/RULES.md
    kind: repo
    purpose: One changelog sentence for a notable change
verify:
  - the phase status is done, cancelled, or deferred
  - the program is still the primary program
  - this task did not file a copy or restore the blank
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Workboard close

Mark a phase done, cancelled, or deferred. Leave the program on the board.

The record is [WORKBOARD.md](../../../WORKBOARD.md). That file stays the owner.

## Must

- Set the phase status on [WORKBOARD.md](../../../WORKBOARD.md) to `done`, `cancelled`, or `deferred`.
- Leave that program as the primary program.
- When no phase is `open`, `active`, or `blocked`, and the change is notable, name `kit-commit` as the next task. The changelog sentence stays in [kit/RULES.md](../../RULES.md#changelog). [Contracts](../../rules/contracts.md#boundaries) owns when the board is filed.

## Must not

- Do the phase's product work in this task.
- File a copy of the board or restore the blank. That is part of the authorized commit [contracts](../../rules/contracts.md#boundaries) names.
- Call the work done when a check this repository declares was skipped ([completion](../../RULES.md#completion)).
- Restate the status meanings. Those stay on the board.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `WORKBOARD.md` — the multi-phase record
- `kit/rules/contracts.md` — same change set when a phase ships
- `kit/RULES.md` — completion and the changelog sentence

### External (citations — guidance only)

- None.

## Procedure

1. Open [WORKBOARD.md](../../../WORKBOARD.md). If no program is registered, the next task is `kit-workboard-register`. Stop.
2. Set the phase to `done`, `cancelled`, or `deferred`.
3. Add one progress line, newest first. Drop the oldest line when the log is over the cap.
4. When no phase is `open`, `active`, or `blocked`, and the change is notable, name `kit-commit` as the next task. Stop. Do not open that skill.
5. Otherwise stop.

## Open for law

See authority_paths. Do not restate those files.
