---
id: adopter
title: Kit adopter
layer: playbook
portability: kit
activation: catalog_match
description: >
  The order is ADOPTER.md. That file stays the owner.
triggers:
  - adopt repo-kit
  - SETUP
  - first kit
  - authority map
  - kit baseline
negative_triggers:
  - kit already adopted (baseline present)
  - routine feature work
authority_paths:
  - ADOPTER.md
  - docs/library/kit-adopter/README.md
  - kit/RULES.md
  - AGENTS.md
  - kit/rules/path-pattern.md
  - kit/rules/directory-index.md
  - kit/UPGRADE.md
references:
  - path: ADOPTER.md
    kind: repo
    purpose: The order. That file stays the owner
  - path: docs/library/kit-adopter/README.md
    kind: repo
    purpose: Adopt order. This pack does the current row and names the next
  - path: AGENTS.md
    kind: repo
    purpose: kit/ vs product packaging
  - path: kit/UPGRADE.md
    kind: repo
    purpose: Later upgrades (not first adopt)
verify:
  - kit/ present with standards
  - kit baseline filled, including Kit source
  - target keeps UPGRADE and deletes ADOPTER.md when the adopt is finished
  - project root CHANGELOG exists
  - map real paths; directory index from adopt date forward (directory-index.md)
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Kit adopter

The order is ADOPTER.md. That file stays the owner.

## Must not

- Do not restate [ADOPTER.md](../../../../../ADOPTER.md).
- Do not delete Agent models.
- Do not open the next pack in this session.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `ADOPTER.md` — the order. That file stays the owner
- `docs/library/kit-adopter/README.md` — adopt order for this shelf
- `kit/RULES.md` — hub and baseline
- `kit/UPGRADE.md` — later upgrades

### External (citations — guidance only)

- Kit source — https://github.com/shainemeister/repo-kit

## Procedure

1. Open [docs/library/kit-adopter/README.md](../../README.md) and do the current row for this task.
2. Name the next row on that README and stop. Do not open that pack in this session.
3. A bare adopt, with no Agent Instruct, stops before `kit-author-plan`.
4. When adding a path, cite [path-pattern.md](../../../../../kit/rules/path-pattern.md) and [directory-index.md](../../../../../kit/rules/directory-index.md). Do not paste [ADOPTER.md](../../../../../ADOPTER.md) or those rules.

## Open for law

See authority_paths. Do not restate those files.
