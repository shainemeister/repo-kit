---
title: "Commit messages"
description: "The subject names the staged change. An assisted commit carries the trailer block. The changelog summary and version numbers live elsewhere."
version: "2.0.0"
status: current
audience:
  - developers
  - ai-agents
doc_type: other
related:
  - ../RULES.md
  - ./versioning-and-git.md
  - ./contracts.md
last_updated: "2026-10-15"
---

# Commit messages

The subject names the staged change. An assisted commit carries the trailer block.

**Related:** [RULES](../RULES.md) · [versioning](./versioning-and-git.md) · [contracts](./contracts.md)

## Subject

```text
<type>(<scope>): <imperative summary of the staged change>
```

The subject names the staged change, not the finished objective. Imperative mood. Omit `scope` only when the change has no single area. A body is required unless the subject alone names the staged actions. Do not rewrite published history to make old messages match this file.

## AI trailers

When an AI assisted the change or the message, end the message with this block. A human-only commit omits it. There is no `Directed-by` trailer.

```text
Assisted-by: <AI make / model>
Compliance: RULES.md
Instructed-by: <directing human>
```

## Elsewhere

A notable change gets one changelog sentence ([changelog](../RULES.md#changelog)). The detail stays in git. Versions and what git tracks are in [versioning-and-git.md](./versioning-and-git.md).

The type table, the body shape, the identity checks, and trailer placement are the commit verb when that skill is adopted. This file remains enough to write the message when the skill is absent.
