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
  - docs/library/platforms/style-gates.md
  - kit/rules/contracts.md
  - WORKBOARD.md
  - kit/rules/directory-index.md
  - kit/rules/path-pattern.md
  - kit/skills/kit-author-docs/template/
references:
  - path: kit/MARKDOWN-STANDARD.md
    kind: repo
    purpose: Form and the author checklist
  - path: kit/rules/contracts.md
    kind: repo
    purpose: one owner, one statement
  - path: kit/rules/directory-index.md
    kind: repo
    purpose: When a directory gets an index
  - path: kit/rules/path-pattern.md
    kind: repo
    purpose: How a path is named
  - path: docs/README.md
    kind: repo
    purpose: AI docs/ workspace vs product contracts
  - path: kit/skills/kit-author-docs/template/
    kind: repo
    purpose: Blanks for landing, readme, cli, concept, methodology, and generic
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

The form is [kit/MARKDOWN-STANDARD.md](../../MARKDOWN-STANDARD.md). That file stays the owner.

## Must not

- Leave `{{PLACEHOLDERS}}` in a finished document.
- Treat `docs/` as the only home of a public contract.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `kit/MARKDOWN-STANDARD.md` — form and the author checklist
- `kit/rules/contracts.md` — one owner, one statement
- `kit/rules/directory-index.md` — when a directory gets an index
- `kit/rules/path-pattern.md` — how a path is named
- `docs/README.md` — AI docs/ workspace vs product contracts
- `template/` — blanks: landing, readme, cli, concept, methodology, generic. The index blank is `kit-index-directory/template/index.md`

### External (citations — guidance only)

- CommonMark help — https://commonmark.org/help/

## Procedure

1. Edit the file that already holds the role.
2. Cite the owner. Do not paste a second copy of its rule ([contracts](../../rules/contracts.md)).
3. When the task is the directory index, the next task is `kit-index-directory`. Stop.
4. When the task is naming a path, the next task is `kit-name-path`. Stop.
5. Apply the markdown standard. Run the author checklist.
6. If a declared check failed or was skipped, stop ([completion](../../RULES.md#completion)).

## Open for law

See authority_paths. Do not restate those files.
