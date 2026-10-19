---
id: context-register
title: Context register
layer: playbook
portability: kit
activation: catalog_match
description: >
  The table shape is kit-workboard-register. That file stays the owner.
  Add one phase for one catalogued path on this adopt or this upgrade.
triggers:
  - register one catalogued path
  - add one phase
  - edge case on the workboard
  - context register
negative_triggers:
  - open a program
  - the primary program is not this adopt or this upgrade
  - write the program directory index
  - copy the register procedure
authority_paths:
  - kit/skills/kit-workboard-register/SKILL.md
  - kit/skills/kit-workboard-register/template/workboard.md
  - kit/rules/directory-index.md
references:
  - path: kit/skills/kit-workboard-register/SKILL.md
    kind: repo
    purpose: The table shape. That file stays the owner
  - path: kit/skills/kit-workboard-register/template/workboard.md
    kind: repo
    purpose: The blank. Draft sentence and the File cell
  - path: kit/rules/directory-index.md
    kind: repo
    purpose: The program-directory index
  - path: WORKBOARD.md
    kind: repo
    purpose: The live table this pack adds one phase to
  - path: kit/skills/kit-index-directory/SKILL.md
    kind: repo
    purpose: Next task. Writes the index. This pack does not
verify:
  - one catalogued path was added as one phase
  - a primary program that was not this adopt or this upgrade was left in place
  - that stop named kit-workboard-register
  - the File cell is a relative link to the product file
  - the phase draft path is not in the File cell
  - Notes hold the edge case and do not repeat that path
  - the phase draft has working text
  - the register procedure was not copied into this pack
  - the next task named is kit-index-directory
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Context register

The table shape is kit-workboard-register. That file stays the owner.

## Must not

- Do not open a second program.
- Do not copy the register procedure into this pack.
- Do not put the phase draft path in the File cell.
- Do not restate the directory index.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- [kit-workboard-register](../../../../../kit/skills/kit-workboard-register/SKILL.md) — the table shape
- [template/workboard.md](../../../../../kit/skills/kit-workboard-register/template/workboard.md) — the blank
- [directory-index.md](../../../../../kit/rules/directory-index.md) — the program-directory index
- [WORKBOARD.md](../../../../../WORKBOARD.md) — the live table

### External (citations — guidance only)

- None.

## Procedure

1. Take one catalogued path.
2. Open [WORKBOARD.md](../../../../../WORKBOARD.md). If the primary program is not this adopt or this upgrade, stop. Name [kit-workboard-register](../../../../../kit/skills/kit-workboard-register/SKILL.md).
3. Add one phase for that path. The File cell is the product file. Notes hold the edge case.
4. Write the draft the [blank](../../../../../kit/skills/kit-workboard-register/template/workboard.md) names, with the working text, in the same change set as the row. Do not paste that sentence here.
5. The program directory gets an index by naming [kit-index-directory](../../../../../kit/skills/kit-index-directory/SKILL.md) as the next task. The index rule is [directory-index.md](../../../../../kit/rules/directory-index.md#directory-index). Stop. Do not open that skill.

## Open for law

See authority_paths. Do not restate those files.
