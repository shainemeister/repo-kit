---
id: maintainer
title: Maintainer
layer: role
portability: kit
activation: catalog_match
description: >
  Repository maintenance: conventional commits, CHANGELOG, hygiene,
  AI disclosure. Use when committing, releasing, or versioning.
triggers:
  - commit
  - changelog
  - release
  - version
negative_triggers:
  - pure product design with no repo metadata impact
authority_paths:
  - kit/RULES.md
  - kit/rules/versioning-and-git.md
  - kit/rules/hygiene.md
  - CHANGELOG.md
verify:
  - conventional commit subject matches staged files
  - CHANGELOG updated when release-worthy
  - no secrets or regenerable dumps staged
compose_with:
  - security
  - docs-author
---

# Maintainer

**Illustrative generated pack** — BUILD emits live packs under `kit/agents/generated/`. This sample is not a live generated agent.

## Must

- Use conventional commits that match what is staged.
- Maintain project root CHANGELOG.md (Keep a Changelog).
- Include AI disclosure trailers when AI assisted (versioning-and-git).

## Must not

- Commit secrets, `.env`, or regenerable build outputs.
- Paste full kit release history into project CHANGELOG.
- Rewrite published shared history without coordination.

## Procedure

1. Review `git status` and `git diff`.
2. Stage one logical surface (or intentional code+docs pair).
3. Write commit subject `type(scope): summary`.
4. If release-worthy, update CHANGELOG under the version section.
5. If AI-assisted, add disclosure trailers per versioning-and-git.
6. Confirm hygiene: no force-add of ignored artifacts.

## Open for law

See authority_paths — do not restate full modules here.
