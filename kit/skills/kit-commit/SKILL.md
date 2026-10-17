---
id: maintainer
title: Commit
layer: role
portability: kit
activation: catalog_match
description: >
  Write the commit for the staged change. Types, body shape, identity checks, and trailer placement are this procedure.
triggers:
  - commit
  - commit message
  - staged change
  - AI trailers
  - git hygiene
negative_triggers:
  - version or changelog work with no commit
  - pure product design with no commit
authority_paths:
  - kit/rules/git-commit.md
  - kit/RULES.md
  - kit/rules/versioning-and-git.md
  - kit/rules/files.md
  - kit/rules/contracts.md
  - WORKBOARD.md
references:
  - path: kit/rules/git-commit.md
    kind: repo
    purpose: Principle — the subject names the staged change, and an assisted commit carries the trailer block
  - path: kit/RULES.md
    kind: repo
    purpose: One changelog sentence for a notable change, and completion
  - path: kit/rules/versioning-and-git.md
    kind: repo
    purpose: Versions and what git tracks
  - path: kit/rules/files.md
    kind: repo
    purpose: New paths
  - path: kit/rules/contracts.md
    kind: repo
    purpose: The finishing commit leaves a fully done board in place
  - path: WORKBOARD.md
    kind: repo
    purpose: The multi-phase record read after the commit exists
verify:
  - subject names the staged change and the type matches the staged files
  - identity checks pass
  - trailer block present when AI assisted, and omitted on a human-only commit
  - changelog sentence updated when the change is notable
  - staged files are ones versioning-and-git.md tracks
  - when every phase is done, the next task named is kit-workboard-archive and this task did not edit the board
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Commit

Write the commit for the staged change. Types, body shape, identity checks, and trailer placement are this procedure.

The principle is [git-commit.md](../../rules/git-commit.md). That file stays the owner.

## Must

- Name the subject for the staged change ([subject](../../rules/git-commit.md#subject)).
- Use the [type table](#types) and the [body shape](#body).
- Pass the [identity checks](#identity).
- When AI assisted, place the [trailer block](../../rules/git-commit.md#ai-trailers) as [trailer placement](#trailer-placement) describes.
- When the change is notable, add the one changelog sentence ([changelog](../../RULES.md#changelog)).
- When a path is added, follow [files.md](../../rules/files.md).
- After the commit exists, when [WORKBOARD.md](../../../WORKBOARD.md) names a primary program other than `—` and every phase is `done`, name `kit-workboard-archive` as the next task. [Contracts](../../rules/contracts.md#boundaries) leaves the board in place for this commit.

## Must not

- Stage secrets, environment files, or regenerable output ([what git tracks](../../rules/versioning-and-git.md#what-git-tracks)).
- Paste this kit's history into a project changelog ([changelog](../../rules/versioning-and-git.md#changelog)).
- Restate the version surfaces or the changelog sentence in the message.
- File the workboard or replace it with the blank.
- {{TUNING_MUST_NOT_EXTRA}}

## Types

| type | Use when |
|------|----------|
| `feat` | User-visible behavior |
| `fix` | A correction that keeps the intended contract |
| `docs` | Documentation only |
| `chore` | Tooling, ignore rules, or layout with no behavior change |
| `refactor` | Internal structure with the same public contract |
| `test` | Fixtures or probes with no product API change |

`scope` is the area (`rules`, `markdown`, a package name). Consistency inside one repository matters more than this list. Imperative mood, specific, about 72 characters, no trailing period.

## Body

State what changed, in a few sentences at most. Why or a migration note may follow. Do not paste a diff. The body is required unless the subject alone names the staged actions ([subject](../../rules/git-commit.md#subject)).

## Identity

| # | Test |
|---|------|
| 1 | Names what this commit changed. It would be stale if the staged files changed and the text did not. |
| 2 | Uses `type(scope):`, and the type matches the staged files. |
| 3 | Would be wrong if swapped onto another commit. |
| 4 | The body is present unless the subject alone names the staged actions. |

Published history stays as it was published ([subject](../../rules/git-commit.md#subject)).

## Trailer placement

Use the block in [AI trailers](../../rules/git-commit.md#ai-trailers). Place it after the body, with a blank line before it. Keep it out of the subject.

| Field | Resolution |
|-------|------------|
| `Assisted-by` | The AI that did this commit. Do not copy a vendor from a doc. |
| `Compliance` | `RULES.md`, or the rules file that governed the change. |
| `Instructed-by` | `git config user.name` when it is non-empty. Otherwise ask and record that name. If no name can be obtained, use `User`. |

## Example

```text
docs(rules): require AI trailers on assisted commits

Add the Assisted-by, Compliance, and Instructed-by block.
Instructed-by comes from git user.name.

Assisted-by: Grok (xAI)
Compliance: RULES.md
Instructed-by: Jane Developer
```

## Expertise map

### In-repo

- `kit/rules/git-commit.md` — subject principle and the trailer block
- `kit/RULES.md` — changelog sentence and completion
- `kit/rules/versioning-and-git.md` — versions and what git tracks
- `kit/rules/files.md` — new paths
- `kit/rules/contracts.md` — the finishing commit leaves a fully done board in place
- `WORKBOARD.md` — read after the commit exists

### External (citations — guidance only)

- None. Commit shape is in-repo.

## Procedure

1. Review `git status` and `git diff`.
2. Stage one logical surface. Leave out anything [versioning-and-git.md](../../rules/versioning-and-git.md#what-git-tracks) excludes.
3. Write the subject from the [type table](#types). Add the [body](#body) unless the subject alone names the staged actions.
4. Run the [identity checks](#identity).
5. If the change is notable, update the changelog with one sentence ([changelog](../../RULES.md#changelog)).
6. If AI assisted, place the trailer block ([trailer placement](#trailer-placement)).
7. If a declared check failed or was skipped, stop ([completion](../../RULES.md#completion)).
8. Create the commit with that message.
9. If that commit exists, open [WORKBOARD.md](../../../WORKBOARD.md). When it names a primary program other than `—` and every phase is `done`, name `kit-workboard-archive` and stop. Do not open that skill. Otherwise stop.

## Open for law

See authority_paths. The principle stays in `kit/rules/git-commit.md`.
