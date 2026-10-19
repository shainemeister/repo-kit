---
id: adopt-qa
title: Adopt QA
layer: playbook
portability: kit
activation: catalog_match
description: >
  Read every phase draft, its File, and that phase's skill.
  Report fits, or a short fix list that names the phase skill.
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
  - edit the session file
authority_paths:
  - ADOPTER.md
  - docs/library/kit-adopter/skills/kit-discover-host/template/agents.md
references:
  - path: ADOPTER.md
    kind: repo
    purpose: Orchestrator routes. This pack reads every phase
  - path: docs/library/kit-adopter/skills/kit-discover-host/template/agents.md
    kind: repo
    purpose: Session file. This pack checks it and does not edit it
  - path: kit/skills/kit-review-change/SKILL.md
    kind: repo
    purpose: Finished-change review. This pack does not carry its commit-message checks
verify:
  - every phase draft, its File, and that phase's skill were read
  - the report is fits, or a short fix list that names the phase skill
  - the phase under check was not edited
  - the fixes were not applied
  - ADOPTER.md was not restated
  - the session file was checked against template/agents.md
  - commit-message checks from kit-review-change were not carried
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Adopt QA

Read every phase draft, its File, and that phase's skill. Report fits, or a short fix list that names the phase skill.

## Must not

- Do not edit the phase under check.
- Do not restate [ADOPTER.md](../../../../../ADOPTER.md).
- Do not edit the session file. [agents.md](../kit-discover-host/template/agents.md) owns that rule.
- Do not carry the commit-message checks in [kit-review-change](../../../../../kit/skills/kit-review-change/SKILL.md).
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- [ADOPTER.md](../../../../../ADOPTER.md) — orchestrator routes. This pack reads every phase
- [agents.md](../kit-discover-host/template/agents.md) — session file. This pack checks it and does not edit it
- [kit-review-change](../../../../../kit/skills/kit-review-change/SKILL.md) — finished-change review. This pack does not copy that procedure

### External (citations — guidance only)

- None.

## Handback

You are the sub-agent for this file. Do this procedure. Do not open another pack. Do not deploy a sub-agent. Return fits, or a short fix list that names the phase skill. Then stop.

## Procedure

1. Read every phase draft on this adopt, the file in each File cell, and that phase's skill.
2. Check the session file against [agents.md](../kit-discover-host/template/agents.md).
3. Report fits, or a short fix list that names the phase skill. Stop. Do not apply the fixes.

## Open for law

The routes stay in [ADOPTER.md](../../../../../ADOPTER.md). The phase skill owns its work.
