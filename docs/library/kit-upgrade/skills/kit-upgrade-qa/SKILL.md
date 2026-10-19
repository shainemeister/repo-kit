---
id: upgrade-qa
title: Upgrade QA
layer: playbook
portability: kit
activation: catalog_match
description: >
  The check is UPGRADE.md. That file stays the owner.
triggers:
  - check an upgrade
  - upgrade QA
  - does the upgrade fit
  - review the upgrade diff
negative_triggers:
  - adopt the kit
  - apply the fix list
  - edit the phase under check
  - rewrite the commit message
  - paste the kit changelog
authority_paths:
  - kit/UPGRADE.md
references:
  - path: kit/UPGRADE.md
    kind: repo
    purpose: The check. That file stays the owner
  - path: kit/skills/kit-review-change/SKILL.md
    kind: repo
    purpose: Reviewer. This pack does not carry its commit-message checks
  - path: ADOPTER.md
    kind: repo
    purpose: Not this pack. An adopted repository deletes it when the adopt is finished
  - path: kit/CHANGELOG.md
    kind: repo
    purpose: The span since the adopted version
  - path: WORKBOARD.md
    kind: repo
    purpose: The rows this upgrade registered
verify:
  - the changelog span since the adopted version was read
  - the workboard rows this upgrade registered were read
  - the report is fits, or a short fix list
  - the fixes were not applied
  - the phase under check was not edited
  - a product file was not treated as a kit file
  - project text in AGENTS.md or a filled MEMORY.md was not replaced
  - this kit's changelog was not pasted into the project
  - commit-message checks were not carried
  - this pack did not adopt
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Upgrade QA

The check is UPGRADE.md. That file stays the owner.

## Must not

- Do not edit the phase under check.
- Do not treat a product file as a kit file.
- Do not replace project text in [AGENTS.md](../../../../../AGENTS.md) or a filled [MEMORY.md](../../../../../MEMORY.md).
- Do not paste this kit's changelog into the project.
- Do not paste [UPGRADE.md](../../../../../kit/UPGRADE.md) or [ADOPTER.md](../../../../../ADOPTER.md).
- Do not apply the fixes.
- Do not carry the commit-message checks from [kit-review-change](../../../../../kit/skills/kit-review-change/SKILL.md).
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- [UPGRADE.md](../../../../../kit/UPGRADE.md) — the check. That file stays the owner
- [kit-review-change](../../../../../kit/skills/kit-review-change/SKILL.md) — reviewer. Do not carry its commit-message checks
- [ADOPTER.md](../../../../../ADOPTER.md) — not this pack. An adopted repository deletes it when the adopt is finished
- [CHANGELOG.md](../../../../../kit/CHANGELOG.md) — the span since the adopted version
- [WORKBOARD.md](../../../../../WORKBOARD.md) — the rows this upgrade registered

### External (citations — guidance only)

- None.

## Procedure

1. Open [UPGRADE.md](../../../../../kit/UPGRADE.md). That file stays the owner. Do not paste it. This pack checks an upgrade. It does not adopt. A missing [ADOPTER.md](../../../../../ADOPTER.md) is not a failed check. An adopted repository deletes that file when the adopt is finished.
2. Read the changelog span since the adopted version in [kit/CHANGELOG.md](../../../../../kit/CHANGELOG.md). Read the workboard rows this upgrade registered in [WORKBOARD.md](../../../../../WORKBOARD.md).
3. Report fits, or a short fix list. Stop. Do not apply the fixes. Do not carry the commit-message checks in [kit-review-change](../../../../../kit/skills/kit-review-change/SKILL.md).

## Open for law

See authority_paths. The check stays in `kit/UPGRADE.md`.
