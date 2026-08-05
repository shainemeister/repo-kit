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
  - kit/rules/verification-and-ops.md
  - kit/rules/contracts.md
  - kit/rules/versioning-and-git.md
  - kit/RULES.md
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

## Must not

- Rubber-stamp when inventory gates were skipped.
- Expand into unrelated refactors while reviewing.
- {{TUNING_MUST_NOT_EXTRA}}

## Procedure

1. Open authority map + inventory + verification table; identify surfaces touched.
2. Confirm Domain A/B gates for those surfaces.
3. Confirm canonical docs updated if behavior changed.
4. Check commit/CHANGELOG hygiene for the change set.
5. Report pass/fail and open risks.
6. If any declared gate or required verify item failed or was skipped → report **fail**; do not endorse “complete”; list remediation ([completion rule](../../rules/verification-and-ops.md#completion-rule)).

## Open for law

See authority_paths — do not restate full modules here.
