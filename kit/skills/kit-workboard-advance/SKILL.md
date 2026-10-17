---
id: workboard-advance
title: Workboard advance
layer: playbook
portability: kit
activation: catalog_match
description: >
  Set the one active phase on the workboard and add the progress line.
triggers:
  - advance a phase
  - active phase
  - progress line
  - workboard update
negative_triggers:
  - no program is registered
  - the task is to close the program
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
verify:
  - exactly one phase is active
  - the progress log has the new line first and stays within its cap
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Workboard advance

Set the one active phase on the workboard and add the progress line.

The record is [WORKBOARD.md](../../../WORKBOARD.md). That file stays the owner.

## Must

- Set exactly one phase to `active` on [WORKBOARD.md](../../../WORKBOARD.md).
- Add one progress line, newest first.
- Keep the progress log inside the cap the board states.

## Must not

- Do the phase's product work in this task.
- Mark a phase done. That is `kit-workboard-close`.
- Restate the status meanings. Those stay on the board.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `WORKBOARD.md` — the multi-phase record
- `kit/rules/contracts.md` — same change set when a phase ships
- `kit/RULES.md` — completion

### External (citations — guidance only)

- None.

## Procedure

1. Open [WORKBOARD.md](../../../WORKBOARD.md).
2. If no program is registered, the next task is `kit-workboard-register`. Stop.
3. Set the phase that is starting to `active`. Set any other `active` phase back to `open` or to the status the work has reached.
4. Add one progress line, newest first. Drop the oldest line when the log is over the cap.
5. Name the next task and stop. Do not open that skill.

## Open for law

See authority_paths. Do not restate those files.
