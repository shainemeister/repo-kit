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
  - kit/rules/path-pattern.md
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
  - path: kit/rules/path-pattern.md
    kind: repo
    purpose: Confirm a path already follows the pattern
  - path: kit/rules/contracts.md
    kind: repo
    purpose: An authorized commit updates the board before that commit is created
  - path: WORKBOARD.md
    kind: repo
    purpose: The multi-phase record updated before the commit is created
verify:
  - subject names the staged change and the type matches the staged files
  - identity checks pass
  - trailer block present when AI assisted, and omitted on a human-only commit
  - changelog sentence updated when the change is notable
  - staged files are ones versioning-and-git.md tracks
  - the board update required by contracts is in this commit
  - this task did not create a second commit for the board
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
- When a path is added, confirm it already follows [path-pattern.md](../../rules/path-pattern.md). Do not name the path in this task.
- Before the commit is created, update [WORKBOARD.md](../../../WORKBOARD.md). [Contracts](../../rules/contracts.md#boundaries) owns that update. Follow [kit-workboard-archive](../kit-workboard-archive/SKILL.md) for the edit, and include the result in this commit.

## Must not

- Stage secrets, environment files, or regenerable output ([what git tracks](../../rules/versioning-and-git.md#what-git-tracks)).
- Paste this kit's history into a project changelog ([changelog](../../rules/versioning-and-git.md#changelog)).
- Restate the version surfaces or the changelog sentence in the message.
- Leave the board update for a second commit.
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
- `kit/rules/path-pattern.md` — confirm a new path already follows the pattern
- `kit/rules/contracts.md` — an authorized commit updates the board before that commit is created
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
8. Update [WORKBOARD.md](../../../WORKBOARD.md) before the commit is created. Follow [kit-workboard-archive](../kit-workboard-archive/SKILL.md). Include that edit in this commit.
9. Create the commit with that message.
10. Stop. Do not make a second commit for the board.

## Open for law

See authority_paths. The principle stays in `kit/rules/git-commit.md`.
