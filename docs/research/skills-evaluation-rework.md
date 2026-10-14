---
title: "Skills evaluation rework"
description: "Maps duplicated rules, triple-stored personas, and kit-owner restatements in library/skills. Not kit law."
version: "1.0.0"
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
| Each seed persona is stored three times | `CATALOG.md`, `templates/<id>.md`, and the maintainer sample |
| The crew is indexed three times | `CATALOG.md`, `orchestrator/README.md`, `orchestrator/INSTALL.md` |
| Seed packs restate kit owners | Commit law, contracts, markdown, install, workboard, completion |
| Four surfaces are not a second copy | `PARAMS` schema, `BUILD` emit steps, `HABITAT` host catalog, orchestrator reporting contracts |

## Same rule, several files

| Rule | Copies |
|------|--------|
| L0–L4, and L4 wins | [README](../../library/skills/README.md) layers, [FRAMEWORK](../../library/skills/FRAMEWORK.md) layers and hard rules, [HABITAT](../../library/skills/HABITAT.md) three habitats, [PARAMS](../../library/skills/PARAMS.md) trust, [OPS](../../library/skills/OPS.md) steps 2 and 7 |
| One primary pack; compose only for a second concern | [FRAMEWORK](../../library/skills/FRAMEWORK.md) compose default, [RUNTIME](../../library/skills/RUNTIME.md) compose default, [OPS](../../library/skills/OPS.md) steps 4–5 and parent/child, [CATALOG](../../library/skills/CATALOG.md) compose-matrix intro |
| Bare adopt skips BUILD and O3 | [PLAN-HOOK](../../library/skills/PLAN-HOOK.md) dual path, README, FRAMEWORK, RUNTIME, OPS, HABITAT, [BUILD](../../library/skills/BUILD.md) resolution, [PLAN snippet](../../library/skills/examples/PLAN-agent-models-snippet.md) |
| Active models: absent, unset, or empty | PLAN-HOOK field contract and BUILD resolution rules, plus the snippet comment |
| Overlays stay in-repo; citations are not law | PLAN-HOOK, BUILD fill rules, PARAMS expertise, OPS expertise, FRAMEWORK hard rules 7 and 12, [anti-patterns](../../library/skills/examples/anti-patterns.md) |
| Activation modes and size budgets | PARAMS enums and RUNTIME activation and budgets; FRAMEWORK repeats the size table |
| O3 steps | Full text in OPS. Shortened again in RUNTIME matching guidance and FRAMEWORK hard rule 11 |
| Regen, new persona, durable vs this session | OPS lifecycle and creating a persona, PLAN-HOOK mid-project and durable vs session, BUILD regen triggers, PARAMS user-instruction deltas |
| Anti-patterns | Short table in OPS; longer table in `examples/anti-patterns.md` covering the same failures |
| Pack shape and the doc index | README pack-format note and PARAMS pack-format doctrine. README start-here and document index list the same files |

## Persona data, three copies

`CATALOG.md` copies each seed's id, triggers, authority paths, compose list, and verify list. `templates/<id>.md` holds that same YAML plus the procedure. [generated-maintainer.sample.md](../../library/skills/examples/generated-maintainer.sample.md) is a third maintainer pack. The PLAN snippet repeats the PLAN-HOOK template.

The seven seeds are `plan-author`, `adopter`, `maintainer`, `implementer`, `docs-author`, `security`, and `reviewer`. `generated/` has no live packs.

## Orchestrator

The four crew ids are listed in CATALOG, [orchestrator/README.md](../../library/skills/orchestrator/README.md), and [orchestrator/INSTALL.md](../../library/skills/orchestrator/INSTALL.md). `orchestrator-reviewer` and the seed `reviewer` are two review roles. The router procedure repeats the OPS smallest-set rule.

## Packs restate kit owners

| Pack | Owner it repeats |
|------|------------------|
| maintainer | Commit messages, versioning, and the changelog sentence. It also cites Keep a Changelog, which this kit no longer uses |
| implementer | [contracts.md](../../kit/rules/contracts.md), [files.md](../../kit/rules/files.md), and completion |
| docs-author | [MARKDOWN-STANDARD.md](../../kit/MARKDOWN-STANDARD.md) |
| adopter | [SETUP.md](../../kit/SETUP.md), [UPGRADE.md](../../kit/UPGRADE.md), and the kit baseline |
| plan-author | PLAN-HOOK and [docs/WORKBOARD.md](../WORKBOARD.md) |
| security | The old language inventory and Domain A/B gates. The live baseline is [docs/security.md](../security.md) |
| reviewer | Completion, plus the other packs' checks |
| HABITAT | [TEMPLATE-AGENTS.md](../../kit/templates/TEMPLATE-AGENTS.md) and the session order |

Current [kit/RULES.md](../../kit/RULES.md) is a short map. It has no language inventory, verification table, or progress tracker. The skills docs still point at those retired hub sections.

## Surfaces that are not copies

| Surface | Owns |
|---------|------|
| [PARAMS.md](../../library/skills/PARAMS.md) | AgentPack schema, enums, and validation |
| [BUILD.md](../../library/skills/BUILD.md) | Emit algorithm and source load order |
| [HABITAT.md](../../library/skills/HABITAT.md) | Host catalog and alias evidence |
| Orchestrator reporting contracts | What each crew pack returns to the parent |
