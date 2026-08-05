# Repository Standards Kit

Portable standards for **consistent repositories and projects**—markdown structure, maintenance contracts, and copy-ready templates—plus a **pylint** config for PEP-8 Python product code and **Agent Instruct** (`kit/agents/`) for modular AI personas as views over law. The kit is structured so **AI agents can dynamically build reliable context** for any repository that adopts it.

All kit source lives under [`kit/`](./kit/) except this README, [LICENSE](./LICENSE), and [`.gitignore`](./.gitignore).

## Purpose

Use this `repo-kit` so AI can load authoritative maintainer files with precision instead of guessing repository structure and standards.

**Best results come from a good project plan.**  
Create a comprehensive `PLAN.md` for *your* target repository (goals, packages, platforms, constraints, desired outcomes) using an AI chat such as Grok, Gemini, ChatGPT, or others. The more specific the plan, the better the kit’s authority-map and templates can be applied.

**Agent Instruct** (`kit/agents/`): build modular agent packs from PLAN + authority map. When using agents, PLAN is **required** and must include an **Agent models** section ([kit/agents/PLAN-HOOK.md](./kit/agents/PLAN-HOOK.md)); run [BUILD](./kit/agents/BUILD.md) to emit thin packs under `kit/agents/generated/`. Packs are **views**—canonical law remains `kit/RULES.md` + `kit/rules/*`. Bare adopt without agents may omit PLAN. Index: [kit/agents/README.md](./kit/agents/README.md).

**Dependency:** `git`

### How to use (quick path)

There is **no traditional install step**. Prefer keeping this kit as a reference (remote link or separate clone) rather than copying the entire tree into an existing repository. Standards payload paths are under **`kit/`**.

#### New implementation

```text
Review PLAN.md (project plan) and kit/SETUP.md at https://github.com/shainemeister/repo-kit, then initiate the adoption checklist. Place standards under kit/ in the target repo; keep product code and project CHANGELOG outside kit/. Fill kit/RULES.md authority map with real product paths. Optional Agent Instruct: include kit/agents/, PLAN Agent models (kit/agents/PLAN-HOOK.md), run kit/agents/BUILD.md.
```

#### Existing repository (first adopt)

```text
This repository has no repo-kit Kit baseline yet. Follow kit/SETUP.md selective adoption / Existing repository (first adopt). Add a kit/ standards tree (do not flatten standards onto root). Map real product paths into the authority map; do not force a product directory rewrite. Record Kit baseline in kit/RULES.md; delete kit/SETUP.md. Later upgrades use kit/UPGRADE.md. Optional Agent Instruct: selective kit/agents/ + PLAN Agent models; do not force agents on bare adopt.
```

#### Alternative (local clone reference)

```text
git clone https://github.com/shainemeister/repo-kit ../repo-kit-reference
```

```text
Review PLAN.md and kit/SETUP.md from ../repo-kit-reference, then initiate the adoption checklist. Standards live under the target repo's kit/; product data stays outside kit/. Optional Agent Instruct: kit/agents/ + PLAN Agent models + BUILD when using agents.
```

#### Upgrade repo-kit

```text
Upgrade repo-kit for this repository (Kit baseline already present in kit/RULES.md, or root RULES.md if still on 1.x layout).

1. Read this project's Kit baseline (Adopted kit version, Kit source) in kit/RULES.md (or root RULES.md until migrated).
2. Open the kit at Kit source (canonical: https://github.com/shainemeister/repo-kit) and read kit/UPGRADE.md and kit/CHANGELOG.md under ## repo-kit.
3. If baseline is 1.x or standards still sit at project root, follow UPGRADE — Migrate from kit 1.x to 2.x layout; otherwise follow the routine upgrade procedure.
4. Merge only appropriate kit pieces into this project's kit/; preserve authority-map product paths and verification commands.
5. If Agent Instruct is in use: merge kit/agents/; preserve PLAN Agent models (active/disabled/overlays/tuning); re-run kit/agents/BUILD.md.
6. Update Kit baseline (version + date); keep Kit source unchanged unless this repo is a deliberate fork.
7. Add a short note to the project root CHANGELOG.md. Do not copy the full kit CHANGELOG history into the project CHANGELOG.
```

Then follow [kit/SETUP.md](./kit/SETUP.md) (first adopt) or [kit/UPGRADE.md](./kit/UPGRADE.md) (existing baseline).

`PLAN.md` is a **user-provided dependency**. The kit does not ship one. Without a clear plan the adoption still works, but results are less precise.

## Mandatory governance

Maintenance of any adopting repository follows **`kit/RULES.md`** (hub: authority map, kit baseline, Must / Must not). Domain detail is under **`kit/rules/`**. In *this* repo those files are at [`kit/RULES.md`](./kit/RULES.md) and [`kit/rules/`](./kit/rules/).

| Must (digest) | Must not (digest) |
|---------------|-------------------|
| Update **canonical** docs with behavior changes | Commit secrets or regenerable outputs |
| Keep **project root** `CHANGELOG.md` (project history) | Ship release-worthy changes without CHANGELOG |
| Keep standards under **`kit/`**; product outside | Flatten RULES / standards onto product root as default |
| Keep **Kit baseline** current in `kit/RULES.md` | Lose track of kit version after deleting SETUP |
| Run **declared** style + SAST gates before complete | Claim complete when a declared gate failed or was skipped |
| Fill authority map from project interest at start | Leave contracts empty until “docs later” |
| Treat Agent Instruct packs as **views** over `kit/RULES.md` + `kit/rules/*` when agents are used | Invent a second RULES tree in packs or embed full persona bodies in the RULES hub |

- **Contracts:** co-update and cross-link rules — [`kit/rules/contracts.md`](./kit/rules/contracts.md)  
- **Completion:** declared Domain A/B gates — [`kit/rules/verification-and-ops.md`](./kit/rules/verification-and-ops.md#completion-rule)  
- **First adopt:** [`kit/SETUP.md`](./kit/SETUP.md) (then delete)  
- **Upgrades:** [`kit/UPGRADE.md`](./kit/UPGRADE.md) (durable)  
- **Agent Instruct:** [`kit/agents/README.md`](./kit/agents/README.md) (optional; PLAN Agent models + BUILD)

## Summary

This kit is **domain-agnostic**. Use it for libraries, CLIs, services, data tools, monorepos, or docs-only work. It generalizes patterns proven in larger multi-package repos without baking in a single product or industry.

Copy what you need from `kit/`, **initiate from project interest** so formal docs guide development, and adapt shell/path examples to **Windows, Linux, or macOS**. Licensed under MIT—see [LICENSE](./LICENSE).

| Piece | Role |
|-------|------|
| [kit/SETUP.md](./kit/SETUP.md) | One-time adoption (greenfield + existing repo); then delete |
| [kit/UPGRADE.md](./kit/UPGRADE.md) | Durable upgrade + 1.x→2.0 migration |
| [kit/RULES.md](./kit/RULES.md) | Maintenance hub: authority map, kit baseline |
| [kit/rules/](./kit/rules/) | Domain modules (hygiene, style, architecture, contracts, security, versioning/git, verification) |
| [kit/agents/](./kit/agents/) | Agent Instruct — personas as views; PLAN Agent models + BUILD |
| [kit/MARKDOWN-STANDARD.md](./kit/MARKDOWN-STANDARD.md) | Structure, frontmatter, doc types, platform-aware examples |
| [kit/CHANGELOG.md](./kit/CHANGELOG.md) | Kit version history under `## repo-kit` |
| [kit/configs/pylintrc](./kit/configs/pylintrc) | PEP-8 style gate for Python product code |
| [kit/templates/](./kit/templates/) | Document skeletons |
| [kit/examples/](./kit/examples/) | Filled authority-map skeletons |

| You want to… | Start here |
|--------------|------------|
| Start a project from an interest | [kit/SETUP.md](./kit/SETUP.md) |
| Align an **existing** repo (first kit adopt) | [kit/SETUP.md — Existing repository](./kit/SETUP.md#existing-repository-first-adopt) |
| Upgrade repo-kit | [Upgrade repo-kit](#upgrade-repo-kit) · [kit/UPGRADE.md](./kit/UPGRADE.md) |
| Use Agent Instruct / agent packs | [kit/agents/README.md](./kit/agents/README.md) · [PLAN-HOOK](./kit/agents/PLAN-HOOK.md) · [BUILD](./kit/agents/BUILD.md) |
| See a filled authority map | [kit/examples/](./kit/examples/) |
| Scaffold docs for a new package | [kit/templates/](./kit/templates/) · [kit/MARKDOWN-STANDARD.md](./kit/MARKDOWN-STANDARD.md) |
| Set maintenance policy | [kit/RULES.md](./kit/RULES.md) |
| Contract co-updates / cross-links | [kit/rules/contracts.md](./kit/rules/contracts.md) |
| Gate Python style (PEP-8) | [kit/configs/pylintrc](./kit/configs/pylintrc) · [pylint](./kit/rules/authoring-and-style.md#python-style-gate-pylint) |
| Language inventory + SAST | [inventory](./kit/rules/security.md#language-surface-inventory) · [SAST](./kit/rules/security.md#security--sast-gates-required-when-declared) |
| Formal certificates | [Certification](./kit/rules/security.md#security-and-code-validation-certification) · [TEMPLATE-CERTIFICATION-README](./kit/templates/TEMPLATE-CERTIFICATION-README.md) |
| Write a root landing README | [Landing / root README](./kit/MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) |

## Use cases

| Use case | What you get | Start here |
|----------|--------------|------------|
| **New greenfield repo** | Same doc shape and git hygiene from day one | [kit/SETUP.md](./kit/SETUP.md) |
| **Align an existing repo** | Authority map + checklists without a rewrite | [kit/SETUP.md](./kit/SETUP.md) (selective) |
| **Upgrade repo-kit** | Merge kit deltas since baseline; keep project authority map | [kit/UPGRADE.md](./kit/UPGRADE.md) |
| **Migrate from kit 1.x** | Path migration + modular RULES | [kit/UPGRADE.md — 1.x→2.0](./kit/UPGRADE.md#migrate-from-kit-1x-to-20) |
| **Multi-package monorepo** | Shared standards; per-package README/CLI/security | Templates under each package |
| **Python product code** | pylint PEP-8 gate; Bandit when declared | `kit/configs/pylintrc` · [SAST](./kit/rules/security.md#security--sast-gates-required-when-declared) |
| **Docs-only design repo** | Frontmatter, Summary→Contents; empty language inventory | [kit/examples/docs-only.md](./kit/examples/docs-only.md) |
| **AI agent personas** | PLAN Agent models + generated packs as views over law | [kit/agents/README.md](./kit/agents/README.md) |
| **Pre-ship self-attestation** | Optional `certification/` JSON+TXT schema | [Certification](./kit/rules/security.md#security-and-code-validation-certification) |

## Quick start

Adopt via **[kit/SETUP.md](./kit/SETUP.md)** (adoption mode, platform, copy upstream standards **into the target repo’s `kit/`**, fill authority map, kit baseline, templates, pylint, delete SETUP). Prefer loading context from your project `PLAN.md` first ([How to use](#how-to-use-quick-path)).

### Suggested root layout after adopt (product repo)

Standards stay under **`kit/`** (same packaging as this repository). Repository-specific data stays **outside** `kit/`.

```text
your-repo/
  README.md                 # product landing (no frontmatter)
  LICENSE
  .gitignore
  CHANGELOG.md              # PROJECT history (required) — not kit release notes
  PLAN.md                   # project plan; required when using Agent Instruct
  kit/                      # standards from repo-kit (filled for this project)
    RULES.md                # hub: authority map + kit baseline
    rules/                  # domain modules from kit/rules/
    agents/                 # Agent Instruct (optional; PLAN Agent models + BUILD)
      generated/            # thin project packs (track recommended)
    MARKDOWN-STANDARD.md
    UPGRADE.md              # durable (or open from Kit source only)
    SETUP.md                # temporary — delete after initiation
    configs/                # optional local copy of pylintrc etc.
    templates/              # optional local skeletons
  packages/                 # or src/ / your product layout — repo-specific
    my-service/
      README.md
      CLI-GUIDE.md
      SECURITY.md
  certification/            # optional self-attestation
  .pylintrc                 # if Python; or package-local / kit/configs
```

**Separation:** do not put product code under `kit/`; do not dump standards onto the project root. Detail: [kit/rules/hygiene.md](./kit/rules/hygiene.md).

## How overlays work

| Layer | Contains |
|-------|----------|
| **Standards** (`kit/`) | Portable structure, formatting, git, pylint policy, templates, upgrade guide; project-filled authority map; optional Agent Instruct |
| **Project RULES hub** | `kit/RULES.md` — real paths (to product outside `kit/`), runtimes, verify commands, domain “must not” |
| **Agent packs** (optional) | `kit/agents/generated/` views + PLAN Agent models control surface — not a second RULES tree |
| **Package docs** | Outside `kit/`: CLI contracts, methodology, security matrices for that package |

Do not fork the whole standard for every product fact. Keep shared rules stable under `kit/`; put stack-specific paths and commands in the project authority map and verification table.

## Python style gate (pylint)

When a project ships **Python product code**:

| Item | Expectation |
|------|-------------|
| Tool | **pylint** with this kit’s PEP-8–aligned config |
| Pass | Exit code **0**, score **10.00/10** |
| Install | Developer tooling only—not required for end users of the product |
| Command | `python -m pylint <package_or_paths>` |
| Config | Copy [kit/configs/pylintrc](./kit/configs/pylintrc) as `.pylintrc` |

Details: [Python style gate](./kit/rules/authoring-and-style.md#python-style-gate-pylint). Other languages: [Non-Python style gates](./kit/rules/authoring-and-style.md#non-python-style-gates).

## Language inventory, SAST, and certification

When a project ships product code, fill the [language surface inventory](./kit/rules/security.md#language-surface-inventory) for languages that apply. Declared Domain B (style) and Domain A (SAST) gates are **required** before task completion. Optional formal certificates live under `certification/` ([schema](./kit/rules/security.md#security-and-code-validation-certification)). Docs-only repos keep an empty inventory.

## For maintainers of this kit

- **Kit version** is defined by dated sections under `## repo-kit` in [kit/CHANGELOG.md](./kit/CHANGELOG.md).  
- **Canonical source:** https://github.com/shainemeister/repo-kit  
- Edit standards under **`kit/`**; bump document `version` / `last_updated` when contracts change.  
- Keep [kit/UPGRADE.md](./kit/UPGRADE.md) in sync when upgrade steps or public paths change.  
- Adopters keep **project** history in their own root `CHANGELOG.md`; kit version goes only in Kit baseline (and, for this repo, under `## repo-kit`).  
- Templates must retain `{{PLACEHOLDERS}}`; finished project docs must not.  
- Prefer purpose directories under `kit/` (`templates/`, `configs/`, `examples/`, `rules/`, `agents/`); see [hygiene](./kit/rules/hygiene.md).

## Source files

All kit source lives under [`kit/`](./kit/) except this README, LICENSE, and `.gitignore`.

| Path | Role |
|------|------|
| [kit/SETUP.md](./kit/SETUP.md) | One-time adoption (delete after initiation) |
| [kit/UPGRADE.md](./kit/UPGRADE.md) | Durable upgrade and 1.x→2.0 migration |
| [kit/RULES.md](./kit/RULES.md) | Maintenance hub: authority map, kit baseline |
| [kit/agents/README.md](./kit/agents/README.md) | Agent Instruct index (FRAMEWORK, BUILD, PLAN-HOOK, …) |
| [kit/rules/hygiene.md](./kit/rules/hygiene.md) | Root hygiene; unified packaging (standards under kit/); SETUP/UPGRADE lifecycle |
| [kit/rules/authoring-and-style.md](./kit/rules/authoring-and-style.md) | Docs rules; pylint; non-Python style |
| [kit/rules/architecture.md](./kit/rules/architecture.md) | Architecture and boundaries |
| [kit/rules/contracts.md](./kit/rules/contracts.md) | Contract policy; co-updates; cross-links |
| [kit/rules/security.md](./kit/rules/security.md) | Inventory, SAST, certification |
| [kit/rules/versioning-and-git.md](./kit/rules/versioning-and-git.md) | Versioning, CHANGELOG rules, git, AI disclosure |
| [kit/rules/verification-and-ops.md](./kit/rules/verification-and-ops.md) | Verification, completion, checklist |
| [kit/MARKDOWN-STANDARD.md](./kit/MARKDOWN-STANDARD.md) | Authoring standard |
| [kit/CHANGELOG.md](./kit/CHANGELOG.md) | Kit version history (`## repo-kit`) |
| [kit/configs/pylintrc](./kit/configs/pylintrc) | Python pylint gate config |
| [kit/templates/](./kit/templates/) | Document skeletons |
| [kit/examples/](./kit/examples/) | Filled authority-map examples |
| [LICENSE](./LICENSE) | MIT |
| [`.gitignore`](./.gitignore) | Starter ignore list |
