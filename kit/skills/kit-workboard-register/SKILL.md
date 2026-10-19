---
id: workboard-register
title: Workboard register
layer: playbook
portability: kit
activation: catalog_match
description: >
  Open one program on the workboard before phased work starts. Record the goal, the decisions, and the phases.
triggers:
  - register a program
  - multi-phase plan
  - workboard
  - open phases
negative_triggers:
  - a program is already registered for this work
  - the task is one edit with no phases
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
  - one program is recorded before the phase work
  - an existing primary program was left in place
  - the live table is not copied into another file
  - each phase File cell is a relative link or `—`
  - each registered phase has a draft with a body, and the File cell is not that draft
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Workboard register

The record is [WORKBOARD.md](../../../WORKBOARD.md). That file stays the owner.

## Must not

- Replace a program that is already primary.
- Paste the live phase table into another file.
- Do the phase's product work in this task.
- Restate the status meanings. Those stay on the board.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `WORKBOARD.md` — the multi-phase record
- `template/workboard.md` — the blank copied to the root
- `kit/rules/contracts.md` — same change set when a phase ships
- `kit/RULES.md` — completion

### External (citations — guidance only)

- None.

## Procedure

1. Open [WORKBOARD.md](../../../WORKBOARD.md). If it is missing, copy the fenced body of [template/workboard.md](template/workboard.md) to the repository root and remove the fence. Set `last_updated` to the day you copy it.
2. If the primary program is not `—`, stop.
3. If this work has no phases, stop. Do not open a program.
4. Write one program: goal, base, decisions, and every step in the phase table. One phase is `active` only when that phase is the work about to start. The others stay `open`. The File cell is a relative link to the file that phase edits, or `—` when it edits no file. Notes do not repeat that path. The blank owns the columns. Write the draft the blank names, with that phase's working text, in the same change set as the row. Do not create a draft that has no body.
5. Add one progress line.
6. Name the next task and stop. Do not open that skill.

## Open for law

See authority_paths. Do not restate those files.
