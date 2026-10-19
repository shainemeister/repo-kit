---
id: upgrade-qa
title: Upgrade QA
layer: playbook
portability: kit
activation: catalog_match
description: >
  Read every phase draft, its File, and that phase's skill.
  Report fits, or a short fix list that names the phase skill.
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
    purpose: Orchestrator routes. This pack reads every phase
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
  - every phase draft, its File, and that phase's skill were read
  - the report is fits, or a short fix list that names the phase skill
  - the fixes were not applied
  - the phase under check was not edited
  - a product file was not treated as a kit file
  - each phase was checked against its skill
  - this kit's changelog was not pasted into the project
  - commit-message checks were not carried
  - this pack did not adopt
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Upgrade QA

Read every phase draft, its File, and that phase's skill. Report fits, or a short fix list that names the phase skill.

## Must not

- Do not edit the phase under check.
- Do not treat a product file as a kit file.
- Do not edit [AGENTS.md](../../../../../AGENTS.md) or [MEMORY.md](../../../../../MEMORY.md). The phase skill owns those files.
- Do not paste this kit's changelog into the project.
- Do not paste [UPGRADE.md](../../../../../kit/UPGRADE.md) or [ADOPTER.md](../../../../../ADOPTER.md).
- Do not apply the fixes.
- Do not carry the commit-message checks from [kit-review-change](../../../../../kit/skills/kit-review-change/SKILL.md).
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- [UPGRADE.md](../../../../../kit/UPGRADE.md) — orchestrator routes. This pack reads every phase
- [kit-review-change](../../../../../kit/skills/kit-review-change/SKILL.md) — reviewer. Do not carry its commit-message checks
- [ADOPTER.md](../../../../../ADOPTER.md) — not this pack. An adopted repository deletes it when the adopt is finished
- [CHANGELOG.md](../../../../../kit/CHANGELOG.md) — the span since the adopted version
- [WORKBOARD.md](../../../../../WORKBOARD.md) — the rows this upgrade registered

### External (citations — guidance only)

- None.

## Handback

You are the sub-agent for this file. Do this procedure. Do not open another pack. Do not deploy a sub-agent. Return fits, or a short fix list that names the phase skill. Then stop.

## Procedure

1. Read every phase draft on this upgrade, the file in each File cell, and that phase's skill. This pack checks an upgrade. A missing [ADOPTER.md](../../../../../ADOPTER.md) is not a failed check. An adopted repository deletes that file when the adopt is finished. Do not paste [UPGRADE.md](../../../../../kit/UPGRADE.md).
2. Read the changelog span since the adopted version in [kit/CHANGELOG.md](../../../../../kit/CHANGELOG.md). Read the workboard rows this upgrade registered in [WORKBOARD.md](../../../../../WORKBOARD.md).
3. Report fits, or a short fix list that names the phase skill. Stop. Do not apply the fixes. Do not carry the commit-message checks in [kit-review-change](../../../../../kit/skills/kit-review-change/SKILL.md).

## Open for law

The routes stay in [UPGRADE.md](../../../../../kit/UPGRADE.md). The phase skill owns its work.
