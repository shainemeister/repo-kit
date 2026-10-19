---
title: "Repo kit rules — forked-path enhancement"
description: "Unpromoted proposal for a forked-path check on code paths. path-pattern.md keeps this note as the edge record."
version: "1.1.1"
status: draft
audience:
  - ai-agents
  - developers
doc_type: other
related:
  - ../../kit/RULES.md
  - ../../kit/rules/path-pattern.md
  - ../../kit/rules/directory-index.md
  - ../../kit/rules/contracts.md
  - ./repo-kit-rework.md
last_updated: "2026-10-19"
---

# Repo kit rules — forked-path enhancement

Unpromoted proposal for a forked-path check on code paths.

path-pattern.md keeps this note as the edge record.

**Related:** [RULES](../../kit/RULES.md) · [path pattern](../../kit/rules/path-pattern.md) · [directory index](../../kit/rules/directory-index.md) · [contracts](../../kit/rules/contracts.md) · [rework record](./repo-kit-rework.md)

Not kit law. Checked on 2026-10-15. [path-pattern.md](../../kit/rules/path-pattern.md#one-role) still points here so the edge record has one home. The continuity overlay named in the 1.0.0 draft was removed in the rework and is not a home for this check.

## Gap

[path-pattern.md](../../kit/rules/path-pattern.md) and [contracts.md](../../kit/rules/contracts.md) give a document one owner. A new code path can still duplicate a shared path under another name. Nothing in the hub requires the new path to name the path it extends.

## Proposal

1. **Naming.** One noun per concept, so two modules cannot own the same thing under different labels.
2. **Placement.** The evidence for a new path names the existing shared path it extends.
3. **Index gate.** The [directory README](../../kit/rules/directory-index.md#directory-index) is the check. When the function cell already lists that role, edit that file. A one-off that splits from the shared path is a defect.

## Where it would live

One sentence on [path-pattern.md](../../kit/rules/path-pattern.md#one-role) One role, or one authority-map row if the hub needs to name it. Not a new module. Promoting it means editing that owner in the same change set. Until then this note is the only copy of the proposal.

## Standing check

If the sentence is promoted, the author checklist cites it. The check does not get its own file.
