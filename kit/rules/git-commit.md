---
title: "Commit messages"
description: "Subject form, commit-note identity, and the required AI trailers. The changelog summary and version numbers live elsewhere."
version: "1.0.0"
status: current
audience:
  - developers
  - ai-agents
doc_type: other
related:
  - ../RULES.md
  - ./versioning-and-git.md
  - ./contracts.md
last_updated: "2026-10-13"
---

# Commit messages

Subject form, commit-note identity, and the required AI trailers.

**Related:** [RULES](../RULES.md) · [versioning](./versioning-and-git.md) · [contracts](./contracts.md)

## Subject

```text
<type>(<scope>): <imperative summary of the staged change>
```

The subject names the staged change, not the finished objective. Imperative mood, specific, about 72 characters, no trailing period. Omit `scope` only when the change has no single area.

| type | Use when |
|------|----------|
| `feat` | User-visible behavior |
| `fix` | A correction that keeps the intended contract |
| `docs` | Documentation only |
| `chore` | Tooling, ignore rules, or layout with no behavior change |
| `refactor` | Internal structure with the same public contract |
| `test` | Fixtures or probes with no product API change |

`scope` is the area (`rules`, `markdown`, a package name). Consistency inside one repository matters more than this list.

## Body

Required unless the subject alone names the staged actions. State what changed, in a few sentences at most. Why or a migration note may follow. Do not paste a diff.

## Identity

| # | Test |
|---|------|
| 1 | Names what this commit changed. It would be stale if the staged files changed and the text did not. |
| 2 | Uses `type(scope):`, and the type matches the staged files. |
| 3 | Would be wrong if swapped onto another commit. |
| 4 | The body is present unless the subject alone names the staged actions. |

Do not rewrite published history to make old messages match this file.

## AI trailers

When an AI assisted the change or the message, end the message with this block. A human-only commit omits it. There is no `Directed-by` trailer.

```text
Assisted-by: <AI make / model>
Compliance: RULES.md
Instructed-by: <directing human>
```

| Field | Resolution |
|-------|------------|
| `Assisted-by` | The AI that did this commit. Do not copy a vendor from a doc. |
| `Compliance` | `RULES.md`, or the rules file that governed the change. |
| `Instructed-by` | `git config user.name` when it is non-empty. Otherwise ask and record that name. If no name can be obtained, use `User`. |

Place the block after the body, with a blank line before it. Do not put it in the subject.

## Example

```text
docs(rules): require AI trailers on assisted commits

Add the Assisted-by, Compliance, and Instructed-by block.
Instructed-by comes from git user.name.

Assisted-by: Grok (xAI)
Compliance: RULES.md
Instructed-by: Jane Developer
```
