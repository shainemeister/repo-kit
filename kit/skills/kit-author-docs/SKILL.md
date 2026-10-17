---
id: docs-author
title: Docs author
layer: role
portability: kit
activation: catalog_match
description: >
  Author durable markdown by applying the markdown standard, and cite an owner instead of restating it.
triggers:
  - documentation
  - README
  - guide
  - markdown
  - frontmatter
  - docs
negative_triggers:
  - binary asset work
  - pure runtime debug
authority_paths:
  - kit/MARKDOWN-STANDARD.md
  - library/platforms/style-gates.md
  - kit/rules/contracts.md
  - WORKBOARD.md
  - kit/rules/files.md
  - kit/skills/kit-author-docs/template/
references:
  - path: kit/MARKDOWN-STANDARD.md
    kind: repo
    purpose: Form and the author checklist
  - path: kit/rules/contracts.md
    kind: repo
    purpose: No dual contracts; co-updates
  - path: docs/README.md
    kind: repo
    purpose: AI docs/ workspace vs product contracts
  - url: https://commonmark.org/help/
    kind: external
    purpose: CommonMark basics for portable markdown
    trust_note: Guidance only; MARKDOWN-STANDARD is project/kit law
verify:
  - links resolve
  - author checklist in kit/MARKDOWN-STANDARD.md passes
  - no second copy of a rule that already has an owner
  - no leftover placeholders in finished docs
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Docs author

Author durable markdown by applying the markdown standard, and cite an owner instead of restating it.

## Must

- Apply [MARKDOWN-STANDARD](../../MARKDOWN-STANDARD.md) for frontmatter, the lead, and the [author checklist](../../MARKDOWN-STANDARD.md#author-checklist).
- Cite the owner. Do not paste a second copy of its rule ([contracts](../../rules/contracts.md)).
- When adding a path, follow [files.md](../../rules/files.md#directory-index).

## Must not

- Leave `{{PLACEHOLDERS}}` in a finished document.
- Treat `docs/` as the only home of a public contract.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `kit/MARKDOWN-STANDARD.md` — form and the author checklist
- `kit/rules/contracts.md` — one owner, one statement
- `kit/rules/files.md` — directory index
- `template/` — blanks: landing, readme, dir, cli, concept, methodology, generic

### External (citations — guidance only)

- CommonMark help — https://commonmark.org/help/

## Procedure

1. Edit the file that already holds the role.
2. Apply the markdown standard. Run the author checklist.
3. If a declared check failed or was skipped, stop ([completion](../../RULES.md#completion)).

## Open for law

See authority_paths. Do not restate those files.
