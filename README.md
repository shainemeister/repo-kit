# Repository Standards Kit

Portable standards for **consistent repositories and projects**: how to write markdown, how to maintain a repo, and copy-ready templates—plus a **pylint** config for PEP-8 Python product code.

## Summary

This kit is **domain-agnostic**. Use it for libraries, CLIs, services, data tools, monorepos, or docs-only work. It generalizes patterns proven in larger multi-package repos without baking in a single product or industry.

Copy what you need, **initiate from project interest** so formal docs guide development, and adapt shell/path examples to **Windows, Linux, or macOS**. Licensed under MIT—see [LICENSE](./LICENSE).

| Piece | Role |
|-------|------|
| [SETUP.md](./SETUP.md) | One-time adoption guide (follow, then delete or archive) |
| [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) | Structure, frontmatter, doc types, platform-aware examples, author checklist |
| [RULES.md](./RULES.md) | Authority map, contracts, versioning, CHANGELOG, kit baseline, git, verification, style gates |
| [CHANGELOG.md](./CHANGELOG.md) | Kit version history (canonical kit releases) |
| [configs/pylintrc](./configs/pylintrc) | PEP-8 style gate for Python product code (developer tooling) |
| [templates/](./templates/) | Starting skeletons for README, CLI, methodology, security, concept, generic |
| [examples/](./examples/) | Filled authority-map skeletons (CLI, library, docs-only) |

| You want to… | Start here |
|--------------|------------|
| Start a project from an interest | [SETUP.md](./SETUP.md) |
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
| `CHANGELOG.md` | Kit history |
| `configs/pylintrc` | Portable pylint config (copy as `.pylintrc`) |
| `templates/` | Copy-ready document skeletons |
| `examples/` | Filled authority-map + verification skeletons |
| `LICENSE` | MIT license for this kit |

## Quick start

Adopt this kit in a target repository:

1. **Initiate from interest** — follow the full checklist in [SETUP.md](./SETUP.md) (adoption mode, platform, templates, authority map).  
2. **Copy** into the target repository (or link this kit as a reference):
   - `MARKDOWN-STANDARD.md`
   - `RULES.md`
   - `templates/` (as needed)
   - `configs/pylintrc` if the project has Python product code  
3. **Fill** the [authority map](./RULES.md#authority-map) and [verification before ship](./RULES.md#verification-before-ship) tables with real (or planned) paths and commands for your platform(s). Use [examples/](./examples/) as patterns.  
4. **Root README:** follow the [landing pattern](./MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) (no frontmatter; use cases first).  
5. **Package docs:** copy a template, replace all `{{PLACEHOLDERS}}`, keep or drop OS blocks per [platform-aware rules](./MARKDOWN-STANDARD.md#platform-aware-examples), refresh Contents.  
6. **Python:** copy `configs/pylintrc` to `.pylintrc` at package or repo root, **set `py-version` to your supported Python**, run `python -m pylint <package>`. Install pylint in the **developer** environment only.  
7. **CHANGELOG + kit baseline:** keep root `CHANGELOG.md` (required). Record [Adopted kit version](./RULES.md#kit-baseline) and date; kit source is always https://github.com/shainemeister/repo-kit.  
8. **Optional inventory:** maintain a `FILE-CATALOG.md` (or similar) and update it on path add/remove/rename.  
9. **After setup:** delete or archive `SETUP.md` so the root stays permanent contracts only (README, RULES, MARKDOWN-STANDARD, CHANGELOG).

### Suggested root layout after adopt

```text
your-repo/
  README.md                 # landing (no frontmatter)
  RULES.md                  # maintenance (filled authority map + kit baseline)
  MARKDOWN-STANDARD.md      # or link to this kit
  CHANGELOG.md              # required — project history
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
| Upstream kit (adopt / upgrade) | https://github.com/shainemeister/repo-kit |
| Versioning, CHANGELOG, kit baseline | [RULES — Versioning](./RULES.md#versioning-and-change-control) |
| Start a package README | [templates/TEMPLATE-README.md](./templates/TEMPLATE-README.md) |
| Start a CLI guide | [templates/TEMPLATE-CLI.md](./templates/TEMPLATE-CLI.md) |
| License terms | [LICENSE](./LICENSE) |

## For maintainers of this kit

- **Kit version** is defined by dated sections in [CHANGELOG.md](./CHANGELOG.md). Cutting a release = add `## [X.Y.Z] - YYYY-MM-DD` and treat that semver as the kit version adopters record.  
- **Canonical source:** https://github.com/shainemeister/repo-kit — adopters always point [Kit baseline](./RULES.md#kit-baseline) here for upgrades.  
- Edit standards in place; bump `version` and `last_updated` on [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) and [RULES.md](./RULES.md) when contracts change.  
- Record kit-level history under `[Unreleased]` until the next kit release.  
- `SETUP.md` is intentionally shipped for first-time adopters; adopters delete it after initiation. Future major releases may move or remove root SETUP; permanent contracts remain README / RULES / MARKDOWN-STANDARD / CHANGELOG.  
- Keep examples domain-neutral (`my-service`, `my-cli`, `my_library`).  
- Templates must retain `{{PLACEHOLDERS}}`; finished project docs must not.  
- Dual-path shell blocks in templates stay until a project declares a single primary platform and drops the unused OS.  
- Prefer purpose directories (`templates/`, `configs/`, `examples/`) over extra root files; see [Root hygiene](./RULES.md#root-hygiene).
