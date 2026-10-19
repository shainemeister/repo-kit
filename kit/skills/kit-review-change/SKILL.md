---
id: reviewer
title: Reviewer
layer: doctrine
portability: kit
activation: catalog_match
description: >
  Review a change against the owners it touched. When the commit message needs a rewrite, the next task is kit-commit.
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
  - kit/rules/git-commit.md
  - kit/rules/versioning-and-git.md
references:
  - path: kit/RULES.md
    kind: repo
    purpose: Completion
  - path: kit/rules/contracts.md
    kind: repo
    purpose: Same-change-set contract rules
  - path: kit/rules/git-commit.md
    kind: repo
    purpose: The subject principle and the trailer block
  - path: kit/rules/versioning-and-git.md
    kind: repo
    purpose: Versions and what git tracks
verify:
  - declared checks addressed or listed as open risks
  - canonical owners updated when behavior changed
  - commit rewrite named as the next task when the message does not match the principle
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Reviewer

The subject principle is [git-commit.md](../../rules/git-commit.md). That file stays the owner.

## Must not

- Rewrite the commit message in this review.
- Carry the type table, the body shape, or the identity checks. Those belong to [kit-commit](../kit-commit/SKILL.md).
- Endorse complete when a declared check was skipped.
- Expand the change while reviewing it.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `kit/RULES.md` — completion and the changelog sentence
- `kit/rules/contracts.md` — same change set
- `kit/rules/git-commit.md` — subject principle and the trailer block
- `kit/rules/versioning-and-git.md` — versions and what git tracks

### External (citations — guidance only)

- None required.

## Procedure

1. If Instruct matched a primary pack, name that id. Do not open another skill.
2. Open the authority map and the surfaces the change touched.
3. Confirm canonical docs updated if behavior changed.
4. Report whether the message matches the principle in [git-commit.md](../../rules/git-commit.md). When the change is notable, cite the [changelog](../../RULES.md#changelog) sentence.
5. When the message needs a rewrite, name kit-commit as the next task. Stop. Do not open that skill.
6. Otherwise report pass, fail, or open risks.
7. If a declared check failed or was skipped, report fail ([completion](../../RULES.md#completion)).

## Open for law

See authority_paths. Do not restate those files.
