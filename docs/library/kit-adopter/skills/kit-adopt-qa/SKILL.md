---
id: adopt-qa
title: Adopt QA
layer: playbook
portability: kit
activation: catalog_match
description: >
  The check is ADOPTER.md. That file stays the owner.
triggers:
  - adopt qa
  - check this phase
  - phase fits the adopt
  - fix list for the phase
  - check the File cell
negative_triggers:
  - review a finished change
  - rewrite the commit message
  - edit the phase
  - apply the fixes
  - replace project text in AGENTS.md
authority_paths:
  - ADOPTER.md
references:
  - path: ADOPTER.md
    kind: repo
    purpose: The check. That file stays the owner
  - path: kit/skills/kit-review-change/SKILL.md
    kind: repo
    purpose: Finished-change review. This pack does not carry its commit-message checks
verify:
  - both the phase draft and the file in the File cell were read
  - the report is fits, or a short fix list
  - the phase under check was not edited
  - the fixes were not applied
  - ADOPTER.md was not restated
  - project text in AGENTS.md was left in place
  - commit-message checks from kit-review-change were not carried
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Adopt QA

The check is ADOPTER.md. That file stays the owner.

## Must not

- Do not edit the phase under check.
- Do not restate [ADOPTER.md](../../../../../ADOPTER.md).
- Do not replace project text in [AGENTS.md](../../../../../AGENTS.md).
- Do not carry the commit-message checks in [kit-review-change](../../../../../kit/skills/kit-review-change/SKILL.md).
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- [ADOPTER.md](../../../../../ADOPTER.md) — the check. That file stays the owner
- [kit-review-change](../../../../../kit/skills/kit-review-change/SKILL.md) — finished-change review. This pack does not copy that procedure

### External (citations — guidance only)

- None.

## Procedure

1. Read the phase draft and the file in the File cell.
2. Report fits, or a short fix list.
3. Stop. Do not apply the fixes.

## Open for law

See authority_paths. Do not restate those files.
