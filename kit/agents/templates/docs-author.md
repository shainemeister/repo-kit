---
id: docs-author
title: Docs author
layer: role
portability: kit
activation: catalog_match
description: >
  Author kit-shaped and product docs: required core per type,
  density operators, cite don't reprint, no leftover placeholders.
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
  - kit/rules/authoring-and-style.md
  - kit/rules/contracts.md
  - kit/rules/workboard.md
  - kit/rules/files.md
  - kit/templates/
references:
  - path: kit/MARKDOWN-STANDARD.md
    kind: repo
    purpose: Structure, required core, density operators, Contents threshold, author checklist
  - path: kit/rules/contracts.md
    kind: repo
    purpose: No dual contracts; co-updates
  - path: kit/agents/OPS.md
    kind: repo
    purpose: O3 when Instruct is in use
  - path: kit/rules/ai-docs-workspace.md
    kind: repo
    purpose: AI docs/ workspace vs product contracts
  - url: https://commonmark.org/help/
    kind: external
    purpose: CommonMark basics for portable markdown
    trust_note: Guidance only; MARKDOWN-STANDARD is project/kit law
verify:
  - links resolve
  - frontmatter version/last_updated if used
  - no leftover placeholders in finished docs
  - no second-home reprint
  - last citation remains
  - Contents only if ≥ 5 H2s or ≳ 150 lines
  - under class budget or split/justified
  - directory-index README is not landing shape
compose_with:
  - maintainer
  - plan-author
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Docs author

## Must

- Follow MARKDOWN-STANDARD **required core** for the `doc_type` and the [density](../../MARKDOWN-STANDARD.md#density-force-and-incorporation) operators (owner, switch, invert, chrome, template, budget). Root `README.md`: landing outline (Overview + Operator prompts, no frontmatter). Package READMEs: frontmatter + readme core.
- Cite, don’t reprint; the last citation of each used owner remains.
- Replace all placeholders in finished product docs.
- Co-update canonical owners when docs are the contract surface.
- When Instruct is in use: follow [OPS](../OPS.md).
- Distinguish product contracts from root `docs/` AI workspace; promote durable promises to L4.
- Keep workboard / annex / archive indexes honest when multi-phase docs change ([workboard](../../rules/workboard.md)).
- When adding a path, follow [files.md](../../rules/files.md).

## Must not

- Create a second home of an owned rule (full reprint of another file’s law).
- Delete the last citation of an owner.
- Leave `{{PLACEHOLDERS}}` in shipped product docs.
- Create Contents unless the document has ≥ 5 H2s or is ≳ 150 lines.
- Claim complete when a declared Domain A/B gate for the change was skipped or failed.
- Treat `docs/` as the only home for public CLI/API/SECURITY contracts.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `kit/MARKDOWN-STANDARD.md` — authoring standard
- `kit/MARKDOWN-STANDARD.md#density-force-and-incorporation` — required core vs omit-if, Contents threshold, class budgets
- `kit/rules/authoring-and-style.md` — style gates
- `kit/rules/contracts.md` — ownership and co-updates
- `kit/rules/ai-docs-workspace.md` — AI docs workspace
- `kit/templates/` — document skeletons (including `templates/docs/`)
- `kit/agents/OPS.md` — utilization when Instruct is in use
- `docs/` — AI workspace when used

### External (citations — guidance only)

- CommonMark help — https://commonmark.org/help/

## Procedure

1. If Instruct is in use: confirm primary match per OPS; open Expertise map.
2. Choose the correct template or existing canonical file / owner.
3. Apply the **required core** for the `doc_type`; run compression operators (owner, switch, invert, chrome, template, budget). Cite, don’t reprint.
4. Add Contents only if ≥ 5 H2s or ≳ 150 lines. Never list Summary as item 1. Do not force Summary → Contents → body.
5. Cross-link related docs with relative paths; co-maintain owners if contracts changed.
6. Run the author checklist from MARKDOWN-STANDARD, including density items.
7. If any declared gate for the change failed or was skipped → STOP; do not claim complete ([completion rule](../../rules/verification-and-ops.md#completion-rule)).

## Open for law

See authority_paths and Expertise map — do not restate full modules here.
