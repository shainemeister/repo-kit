# Repository Standards Kit

Portable standards for **consistent repositories and projects**—markdown structure, maintenance contracts, and copy-ready templates—plus a **pylint** config for PEP-8 Python product code. The kit is also structured so **AI agents can dynamically build reliable context** for any repository that adopts it.

## Purpose

Use this `repo-kit` so AI can load authoritative maintainer files with precision instead of guessing repository structure and standards.

**Best results come from a good project plan.**  
Create a comprehensive `PLAN.md` for *your* target repository (goals, packages, platforms, constraints, desired outcomes) using an AI chat such as Grok, Gemini, ChatGPT, or others. The more specific the plan, the better the kit’s authority-map and templates can be applied. A dedicated prompt persona for generating high-quality PLAN.md files is planned for a future release.

**Dependency:** `git`

### How to use (quick path)

There is **no traditional install step**. Prefer keeping this kit as a reference (remote link or separate clone) rather than copying the entire tree into an existing repository.

**New implementation**

```text
Review PLAN.md (project plan) and SETUP.md at https://github.com/shainemeister/repo-kit, then initiate the adoption checklist. Preserve existing project but integrate `repo-kit` as per RULES.md.
```

**Alternative (local clone reference)**

```text
git clone https://github.com/shainemeister/repo-kit ../repo-kit-reference
```

```text
Review PLAN.md (project plan) and SETUP.md from ../repo-kit-reference, then initiate the adoption checklist. Preserve existing project but integrate `repo-kit` as per RULES.md.
```

**Upgrade** (repository already has a Kit baseline in RULES.md)

```text
Read the `repo-kit` CHANGELOG.md at https://github.com/shainemeister/repo-kit then identify current repo version and changes.
Build a comprehensive PLAN.md for only appropriate files per RULES policy sections, MARKDOWN-STANDARD, templates, configs/pylintrc, etc. while preserving current repo project-specific authority map and verification commands.
Then update the Kit baseline (version + date) and add a short note to the project CHANGELOG.md. 
Do not copy the full kit CHANGELOG history into the project CHANGELOG.
```

Then follow the full procedure in [SETUP.md](./SETUP.md) (new adoption) or [Upgrading the kit](./RULES.md#upgrading-the-kit-post-initiation) (existing adoption).

`PLAN.md` is a **user-provided dependency**. The kit does not ship one. Without a clear plan the adoption still works, but results are less precise.

## Summary

This kit is **domain-agnostic**. Use it for libraries, CLIs, services, data tools, monorepos, or docs-only work. It generalizes patterns proven in larger multi-package repos without baking in a single product or industry.

Copy what you need, **initiate from project interest** so formal docs guide development, and adapt shell/path examples to **Windows, Linux, or macOS**. Licensed under MIT—see [LICENSE](./LICENSE).

| Piece | Role |
|-------|------|
| [SETUP.md](./SETUP.md) | One-time adoption guide (follow, then delete or archive) |
| [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) | Structure, frontmatter, doc types, platform-aware examples, author checklist |
| [RULES.md](./RULES.md) | Authority map, contracts, versioning, CHANGELOG, kit baseline, git, verification, style gates |
| [CHANGELOG.md](./CHANGELOG.md) | Kit version history (this repo) · **Required project history** for every adopter |
| [configs/pylintrc](./configs/pylintrc) | PEP-8 style gate for Python product code (developer tooling) |
| [templates/](./templates/) | Starting skeletons for README, CLI, methodology, security, concept, generic |
| [examples/](./examples/) | Filled authority-map skeletons (CLI, library, docs-only) |

| You want to… | Start here |
|--------------|------------|
| Start a project from an interest | [SETUP.md](./SETUP.md) |
| Upgrade an existing kit adoption | [How to use (quick path)](#how-to-use-quick-path) · [RULES — Upgrading the kit](./RULES.md#upgrading-the-kit-post-initiation) |
| See a filled authority map | [examples/](./examples/) |
| Scaffold docs for a new package | [templates/](./templates/) · [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) |
| Set maintenance policy | [RULES.md](./RULES.md) |
| Gate Python style (PEP-8) | [configs/pylintrc](./configs/pylintrc) · [RULES — pylint](./RULES.md#python-style-gate-pylint) |
| Write a root landing README | [Landing / root README](./MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) |

## Use cases

| Use case | What you get | Start here |
|----------|--------------|------------|
| **New greenfield repo** | Same doc shape and git hygiene from day one | [SETUP.md](./SETUP.md) |
| **Align an existing repo** | Authority map + checklists without a rewrite | [SETUP.md](./SETUP.md) (selective copy) |
| **Upgrade existing kit adoption** | Merge kit deltas since baseline; keep project authority map | [How to use (quick path)](#how-to-use-quick-path) |
| **Multi-package monorepo** | Shared standards; per-package README/CLI/security | Templates under each package |
| **Python product code** | pylint PEP-8 gate, score 10.00, not a runtime dep | `configs/pylintrc` |
| **Docs-only design repo** | Frontmatter, Summary→Contents, concept/methodology templates | [examples/docs-only.md](./examples/docs-only.md) |
| **Multi-OS team** | Dual-path examples and per-platform verify commands | [Platform-aware examples](./MARKDOWN-STANDARD.md#platform-aware-examples) |

## What’s included

| Path | Role |
|------|------|
| `SETUP.md` | One-time initiation checklist (ephemeral) |
| `MARKDOWN-STANDARD.md` | How to structure and write markdown |
| `RULES.md` | How to maintain the repository |
| `CHANGELOG.md` | Kit history (this repo) · required project history for adopters |
| `configs/pylintrc` | Portable pylint config (copy as `.pylintrc`) |
| `templates/` | Copy-ready document skeletons |
| `examples/` | Filled authority-map + verification skeletons |
| `LICENSE` | MIT license for this kit |

## Quick start

Adopt this kit via the full one-time checklist in **[SETUP.md](./SETUP.md)** (adoption mode, platform, copy, authority map, kit baseline, templates, pylint, and deleting SETUP after initiation). Use the [How to use](#how-to-use-quick-path) path above to load context from your project `PLAN.md` first.

### Suggested root layout after adopt

```text
your-repo/
  README.md                 # landing (no frontmatter)
  RULES.md                  # maintenance (filled authority map + kit baseline)
  MARKDOWN-STANDARD.md      # or link to this kit
  CHANGELOG.md              # required — project history
  PLAN.md                   # your project plan (recommended; not shipped by the kit)
  SETUP.md                  # temporary — delete after initiation
  .pylintrc                 # if Python product code
  FILE-CATALOG.md           # optional
  templates/                # optional local copies
  packages/                 # or your layout
    my-service/
      README.md
      CLI-GUIDE.md
      SECURITY.md
```

## Initiate a project (by interest)

Use formal markdown to **guide development**, not only document finished work. The full one-time checklist—adoption modes, platform declaration, template pick by interest, authority-map fill, and first verification—lives in **[SETUP.md](./SETUP.md)**.

After initiation, delete or archive `SETUP.md`. Ongoing policy stays in [RULES.md](./RULES.md); authoring rules stay in [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md).

**Checklists:** [Author checklist](./MARKDOWN-STANDARD.md#author-checklist) · [Contributor checklist](./RULES.md#contributor-checklist) · [How overlays work](#how-overlays-work)

## How overlays work

| Layer | Contains |
|-------|----------|
| **This kit** | Portable structure, formatting, git, pylint policy, templates |
| **Project RULES** | Real paths, runtimes, platform verify commands, dependency policy, domain “must not” |
| **Package docs** | CLI contracts, methodology, security matrices for that package |

Do not fork the whole standard for every product fact. Keep shared rules stable; put stack-specific rules in the project authority map and verification table.

## Python style gate (pylint)

When a project ships **Python product code**:

| Item | Expectation |
|------|-------------|
| Tool | **pylint** with this kit’s PEP-8–aligned config |
| Pass | Exit code **0**, score **10.00/10** |
| Install | Developer tooling only—not required for end users of the product |
| Command | `python -m pylint <package_or_paths>` |

Details: [RULES.md — Python style gate](./RULES.md#python-style-gate-pylint). For other languages: [Non-Python style gates](./RULES.md#non-python-style-gates).

## Where to go next

| Need | Document |
|------|----------|
| One-time adoption / initiation | [SETUP.md](./SETUP.md) |
| Filled authority-map examples | [examples/](./examples/) |
| Frontmatter, Summary→Contents, platform examples, doc types | [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) |
| Commits, contracts, checklists, style gates | [RULES.md](./RULES.md) |
| Kit history / kit version | [CHANGELOG.md](./CHANGELOG.md) |
| Upgrade an existing adoption | [How to use (quick path)](#how-to-use-quick-path) · [RULES — Upgrading the kit](./RULES.md#upgrading-the-kit-post-initiation) |
| Upstream kit (source) | https://github.com/shainemeister/repo-kit |
| Versioning, CHANGELOG, kit baseline | [RULES — Versioning](./RULES.md#versioning-and-change-control) |
| Start a package README | [templates/TEMPLATE-README.md](./templates/TEMPLATE-README.md) |
| Start a CLI guide | [templates/TEMPLATE-CLI.md](./templates/TEMPLATE-CLI.md) |
| License terms | [LICENSE](./LICENSE) |

## For maintainers of this kit

- **Kit version** is defined by dated sections under `## repo-kit` in [CHANGELOG.md](./CHANGELOG.md). Cutting a release = add `### [X.Y.Z] - YYYY-MM-DD` (with `####` categories) under `## repo-kit` and treat that semver as the kit version adopters record.  
- **Canonical source:** https://github.com/shainemeister/repo-kit — adopters always point [Kit baseline](./RULES.md#kit-baseline) here for upgrades.  
- Adopters keep **project** history in their own `CHANGELOG.md` under `## <Repository Name>`; they do **not** copy kit release sections—kit version goes only in Kit baseline.  
- Edit standards in place; bump `version` and `last_updated` on [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) and [RULES.md](./RULES.md) when contracts change.  
- Record kit-level history under the `### [X.Y.Z]` version section that ships the change (no Unreleased section).  
- `SETUP.md` is intentionally shipped for first-time adopters; adopters delete it after initiation. Future major releases may move or remove root SETUP; permanent contracts remain README / RULES / MARKDOWN-STANDARD / CHANGELOG.  
- Keep examples domain-neutral (`my-service`, `my-cli`, `my_library`).  
- Templates must retain `{{PLACEHOLDERS}}`; finished project docs must not.  
- Dual-path shell blocks in templates stay until a project declares a single primary platform and drops the unused OS.  
- Prefer purpose directories (`templates/`, `configs/`, `examples/`) over extra root files; see [Root hygiene](./RULES.md#root-hygiene).
