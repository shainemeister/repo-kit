---
id: reviewer
title: Reviewer
layer: doctrine
portability: kit
activation: catalog_match
description: >
  Pre-merge / pre-done review: contracts, verify table, scope creep,
  commit hygiene, missing CHANGELOG.
triggers:
  - review
  - check work
  - pre-merge
  - self-verify
  - acceptance
negative_triggers:
  - early exploratory spike explicitly labeled draft
authority_paths:
  - kit/RULES.md
  - kit/rules/contracts.md
  - kit/rules/versioning-and-git.md
  - kit/RULES.md
references:
  - path: kit/RULES.md
    kind: repo
    purpose: Completion checklist and gates
  - path: kit/rules/contracts.md
    kind: repo
    purpose: Same-change-set contract rules
  - path: library/skills/OPS.md
    kind: repo
    purpose: O3 utilization; primary pack used for the change
  - path: library/skills/PARAMS.md
    kind: repo
    purpose: Pack schema if reviewing agent packs
verify:
  - verification checklist items addressed
  - open risks listed if incomplete
compose_with:
  - implementer
  - security
  - maintainer
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Reviewer

## Must

- Check declared gates and contract co-updates before “done.”
- Flag scope creep and missing CHANGELOG for release-worthy work.
- List residual risks when incomplete.
- Do not endorse complete when declared gates failed or were skipped.
- When Instruct is in use: confirm O3 was followed (primary pack, expertise, co-maintain).

## Must not

- Rubber-stamp when inventory gates were skipped.
- Expand into unrelated refactors while reviewing.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `kit/RULES.md` — before-complete and checklist
- `kit/rules/contracts.md` — co-update policy
- `kit/rules/versioning-and-git.md` — commit/CHANGELOG hygiene
- `kit/RULES.md` — authority map
- `library/skills/OPS.md` — utilization expectations

### External (citations — guidance only)

- Prefer in-repo law for review criteria. Optional: project-declared coding standards already in inventory.

## Procedure

1. If Instruct is in use: open OPS; note which primary pack should have owned the change.
2. Open authority map + inventory + verification table; identify surfaces touched.
3. Confirm Domain A/B gates for those surfaces.
4. Confirm canonical docs updated if behavior changed.
5. Check commit/CHANGELOG hygiene for the change set, including [commit-note identity](../../../kit/rules/versioning-and-git.md#commit-note-identity).
6. If agents/templates/enablement changed: confirm BUILD regen and expertise present.
7. Report pass/fail and open risks.
8. If any declared gate or required verify item failed or was skipped → report **fail**; do not endorse “complete”; list remediation ([completion rule](../../../kit/RULES.md#completion)).

## Open for law

See authority_paths and Expertise map — do not restate full modules here.
