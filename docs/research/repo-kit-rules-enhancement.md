---
title: "Repo kit rules — forked-path enhancement"
description: Research note proposing a three-tier kit rule (naming, placement, README index gate) so code paths get the same one-owner, no-fork discipline docs already have. Not a kit Must until promoted.
version: "1.0.0"
status: draft
audience:
  - ai-agents
  - developers
doc_type: other
related:
  - ../../kit/RULES.md
  - ../../kit/rules/files.md
  - ../../kit/rules/contracts.md
  - ./repo-kit-rework.md
last_updated: "2026-10-13"
---

# Repo kit rules — forked-path enhancement

Proposal only. This is **not** kit law until promoted into `kit/RULES.md` or a rule overlay.

**Related:** [RULES](../../kit/RULES.md) · [files.md](../../kit/rules/files.md) · [contracts](../../kit/rules/contracts.md) · [rework](./repo-kit-rework.md)

## What the kit already says

- **Placement** ([files.md](../../kit/rules/files.md)): a path exists only with evidence. The surface is real, it is on the inventory, the user asked, or a module is genuinely needed.
- **Naming:** files and modules follow noun/verb naming.
- **Indexes:** each new navigable directory gets a README index.
- **Authority map:** updates land in the same change set as the change.
- **Contracts** ([contracts](../../kit/rules/contracts.md)): every rule has one canonical owner. Don't fork a second full statement of an owned rule.

## Gap

These rules govern documents and rules, not code paths. Nothing stops a one-off code path that duplicates an existing shared one.

## Proposal (three tiers)

1. **Naming.** Use one noun per concept, so two modules can't quietly own the same thing under different labels.
2. **Placement.** Extend the evidence rule: the justification for a new path must name the existing shared path it extends, not create a parallel one.
3. **README index as the gate.** Before a new file lands, check the per-directory README map (file to function). If the function already exists, extend that file instead. This is where the forked-path law lives: one shared path per concept, and a one-off patch that splits from it is a defect to flag.

## Where it would live

The forked-path check would be a **new** rule. Its natural home is the continuity overlay ([continuity](../../kit/rules/continuity.md)) or one line in the authority map in `kit/RULES.md`.

## Standing check

Add a standing check that flags new one-offs as they appear, so this never turns into a periodic cleanup pass.
