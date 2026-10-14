---
title: "Skills evaluation rework"
description: "Maps duplicated rules, triple-stored personas, and kit-owner restatements in library/skills. Not kit law."
version: "1.1.0"
status: draft
audience:
  - ai-agents
  - developers
doc_type: other
related:
  - ../../library/skills/README.md
  - ../../library/skills/CATALOG.md
  - ../../library/skills/OPS.md
  - ../../kit/RULES.md
  - ./repo-kit-rework.md
last_updated: "2026-10-14"
---

# Skills evaluation rework

Maps duplicated rules, triple-stored personas, and kit-owner restatements in library/skills.

**Related:** [skills](../../library/skills/README.md) · [CATALOG](../../library/skills/CATALOG.md) · [OPS](../../library/skills/OPS.md) · [RULES](../../kit/RULES.md) · [rework](./repo-kit-rework.md)

Draft only. This is an evaluation of `library/skills/` as it stood on 2026-10-14, after the 3.0.0 move out of `kit/agents/`. Promoting a cut means editing those owners in one change set ([same-change-set](../../kit/rules/contracts.md#same-change-set-rule)).

## Summary

| Finding | Where |
|---------|--------|
| The same Instruct rule is written in several docs | Layers, compose, bare adopt, active models, overlay trust, activation budgets, O3, regen, anti-patterns, pack shape |
| Each seed persona is stored three times | [CATALOG.md](../../library/skills/CATALOG.md), [templates/](../../library/skills/templates/), and the [maintainer sample](../../library/skills/examples/generated-maintainer.sample.md) |
| The crew is indexed three times | [CATALOG.md](../../library/skills/CATALOG.md), [orchestrator/README.md](../../library/skills/orchestrator/README.md), [orchestrator/INSTALL.md](../../library/skills/orchestrator/INSTALL.md) |
| Seed packs restate kit owners | Commit law, contracts, markdown, install, workboard, completion |
| Four surfaces are not a second copy | [PARAMS](../../library/skills/PARAMS.md) schema, [BUILD](../../library/skills/BUILD.md) emit steps, [HABITAT](../../library/skills/HABITAT.md) host catalog, [orchestrator reporting contracts](../../library/skills/orchestrator/README.md) |

## Same rule, several files

| Rule | Copies |
|------|--------|
| L0–L4, and L4 wins | [README](../../library/skills/README.md) layers, [FRAMEWORK](../../library/skills/FRAMEWORK.md) layers and hard rules, [HABITAT](../../library/skills/HABITAT.md) three habitats, [PARAMS](../../library/skills/PARAMS.md) trust, [OPS](../../library/skills/OPS.md) steps 2 and 7 |
| One primary pack; compose only for a second concern | [FRAMEWORK](../../library/skills/FRAMEWORK.md) compose default, [RUNTIME](../../library/skills/RUNTIME.md) compose default, [OPS](../../library/skills/OPS.md) steps 4–5 and parent/child, [CATALOG](../../library/skills/CATALOG.md) compose-matrix intro |
| Bare adopt skips BUILD and O3 | [PLAN-HOOK](../../library/skills/PLAN-HOOK.md) dual path, [README](../../library/skills/README.md), [FRAMEWORK](../../library/skills/FRAMEWORK.md), [RUNTIME](../../library/skills/RUNTIME.md), [OPS](../../library/skills/OPS.md), [HABITAT](../../library/skills/HABITAT.md), [BUILD](../../library/skills/BUILD.md) resolution, [PLAN snippet](../../library/skills/examples/PLAN-agent-models-snippet.md) |
| Active models: absent, unset, or empty | [PLAN-HOOK](../../library/skills/PLAN-HOOK.md) field contract and [BUILD](../../library/skills/BUILD.md) resolution rules, plus the [snippet](../../library/skills/examples/PLAN-agent-models-snippet.md) comment |
| Overlays stay in-repo; citations are not law | [PLAN-HOOK](../../library/skills/PLAN-HOOK.md), [BUILD](../../library/skills/BUILD.md) fill rules, [PARAMS](../../library/skills/PARAMS.md) expertise, [OPS](../../library/skills/OPS.md) expertise, [FRAMEWORK](../../library/skills/FRAMEWORK.md) hard rules 7 and 12, [anti-patterns](../../library/skills/examples/anti-patterns.md) |
| Activation modes and size budgets | [PARAMS](../../library/skills/PARAMS.md) enums and [RUNTIME](../../library/skills/RUNTIME.md) activation and budgets; [FRAMEWORK](../../library/skills/FRAMEWORK.md) repeats the size table |
| O3 steps | Full text in [OPS](../../library/skills/OPS.md). Shortened again in [RUNTIME](../../library/skills/RUNTIME.md) matching guidance and [FRAMEWORK](../../library/skills/FRAMEWORK.md) hard rule 11 |
| Regen, new persona, durable vs this session | [OPS](../../library/skills/OPS.md) lifecycle and creating a persona, [PLAN-HOOK](../../library/skills/PLAN-HOOK.md) mid-project and durable vs session, [BUILD](../../library/skills/BUILD.md) regen triggers, [PARAMS](../../library/skills/PARAMS.md) user-instruction deltas |
| Anti-patterns | Short table in [OPS](../../library/skills/OPS.md); longer table in [anti-patterns](../../library/skills/examples/anti-patterns.md) covering the same failures |
| Pack shape and the doc index | [README](../../library/skills/README.md) pack-format note and [PARAMS](../../library/skills/PARAMS.md) pack-format doctrine. [README](../../library/skills/README.md) start-here and document index list the same files |

## Persona data, three copies

[CATALOG.md](../../library/skills/CATALOG.md) copies each seed's id, triggers, authority paths, compose list, and verify list. [templates/](../../library/skills/templates/) holds that same YAML plus the procedure. [generated-maintainer.sample.md](../../library/skills/examples/generated-maintainer.sample.md) is a third [maintainer](../../library/skills/templates/maintainer.md) pack. The [PLAN snippet](../../library/skills/examples/PLAN-agent-models-snippet.md) repeats the [PLAN-HOOK](../../library/skills/PLAN-HOOK.md) template.

The seven seeds are [plan-author](../../library/skills/templates/plan-author.md), [adopter](../../library/skills/templates/adopter.md), [maintainer](../../library/skills/templates/maintainer.md), [implementer](../../library/skills/templates/implementer.md), [docs-author](../../library/skills/templates/docs-author.md), [security](../../library/skills/templates/security.md), and [reviewer](../../library/skills/templates/reviewer.md). `generated/` has no live packs.

## Orchestrator

The four crew ids are listed in [CATALOG](../../library/skills/CATALOG.md), [orchestrator/README.md](../../library/skills/orchestrator/README.md), and [orchestrator/INSTALL.md](../../library/skills/orchestrator/INSTALL.md): [orchestrator-router](../../library/skills/orchestrator/router.md), [orchestrator-scout](../../library/skills/orchestrator/scout.md), [orchestrator-builder](../../library/skills/orchestrator/builder.md), and [orchestrator-reviewer](../../library/skills/orchestrator/reviewer.md). [orchestrator-reviewer](../../library/skills/orchestrator/reviewer.md) and the seed [reviewer](../../library/skills/templates/reviewer.md) are two review roles. The [router](../../library/skills/orchestrator/router.md) procedure repeats the [OPS](../../library/skills/OPS.md) smallest-set rule.

## Packs restate kit owners

| Pack | Owner it repeats |
|------|------------------|
| [maintainer](../../library/skills/templates/maintainer.md) | Commit messages, versioning, and the changelog sentence. It also cites Keep a Changelog, which this kit no longer uses |
| [implementer](../../library/skills/templates/implementer.md) | [contracts.md](../../kit/rules/contracts.md), [files.md](../../kit/rules/files.md), and completion |
| [docs-author](../../library/skills/templates/docs-author.md) | [MARKDOWN-STANDARD.md](../../kit/MARKDOWN-STANDARD.md) |
| [adopter](../../library/skills/templates/adopter.md) | [SETUP.md](../../kit/SETUP.md), [UPGRADE.md](../../kit/UPGRADE.md), and the kit baseline |
| [plan-author](../../library/skills/templates/plan-author.md) | [PLAN-HOOK](../../library/skills/PLAN-HOOK.md) and [docs/WORKBOARD.md](../WORKBOARD.md) |
| [security](../../library/skills/templates/security.md) | The old language inventory and Domain A/B gates. The live baseline is [docs/security.md](../security.md) |
| [reviewer](../../library/skills/templates/reviewer.md) | Completion, plus the other packs' checks |
| [HABITAT](../../library/skills/HABITAT.md) | [TEMPLATE-AGENTS.md](../../kit/templates/TEMPLATE-AGENTS.md) and the session order |

Current [kit/RULES.md](../../kit/RULES.md) is a short map. It has no language inventory, verification table, or progress tracker. The skills docs still point at those retired hub sections.

## Surfaces that are not copies

| Surface | Owns |
|---------|------|
| [PARAMS.md](../../library/skills/PARAMS.md) | AgentPack schema, enums, and validation |
| [BUILD.md](../../library/skills/BUILD.md) | Emit algorithm and source load order |
| [HABITAT.md](../../library/skills/HABITAT.md) | Host catalog and alias evidence |
| Orchestrator reporting contracts | What each crew pack returns to the parent |
