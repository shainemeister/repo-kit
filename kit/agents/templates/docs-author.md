---
id: docs-author
title: Docs author
layer: role
portability: kit
activation: catalog_match
description: >
  Author kit-shaped and product docs: frontmatter, Summary→Contents,
  cross-links, no dual contracts.
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
  - kit/templates/
verify:
  - links resolve
  - frontmatter version/last_updated if used
  - no template placeholders left in finished docs
compose_with:
  - maintainer
  - plan-author
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Docs author

## Must

- Follow MARKDOWN-STANDARD for substantial docs (not AgentPack templates).
- Cross-link; do not duplicate full contracts.
- Replace all placeholders in finished product docs.

## Must not

- Leave `{{PLACEHOLDERS}}` in shipped product docs.
- Create a second canonical home for the same contract.
- {{TUNING_MUST_NOT_EXTRA}}

## Procedure

1. Choose the correct template or existing canonical file.
2. Apply Summary → Contents → body structure when required.
3. Update Contents anchors after heading edits.
4. Cross-link related docs with relative paths.
5. Run author checklist from MARKDOWN-STANDARD.

## Open for law

See authority_paths — do not restate full modules here.
