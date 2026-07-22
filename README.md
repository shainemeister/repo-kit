# Repository Standards Kit

Portable standards for **consistent repositories and projects**: how to write markdown, how to maintain a repo, and copy-ready templates—plus a **pylint** config for PEP-8 Python product code.

## Summary

This kit is **domain-agnostic**. Use it for libraries, CLIs, services, data tools, monorepos, or docs-only work. It generalizes patterns proven in larger multi-package repos without baking in a single product or industry.

Copy what you need, **initiate from project interest** so formal docs guide development, and adapt shell/path examples to **Windows, Linux, or macOS**. Licensed under MIT—see [LICENSE](./LICENSE).

| Piece | Role |
|-------|------|
| [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) | Structure, frontmatter, doc types, platform-aware examples, author checklist |
| [RULES.md](./RULES.md) | Authority map, contracts, git, verification, pylint gate |
| [configs/pylintrc](./configs/pylintrc) | PEP-8 style gate for Python product code (developer tooling) |
| [templates/](./templates/) | Starting skeletons for README, CLI, methodology, security, concept, generic |

| You want to… | Start here |
|--------------|------------|
| Start a project from an interest | [Initiate a project](#initiate-a-project-by-interest) |
| Scaffold docs for a new package | [templates/](./templates/) · [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) |
| Set maintenance policy | [RULES.md](./RULES.md) |
| Gate Python style (PEP-8) | [configs/pylintrc](./configs/pylintrc) · [RULES — pylint](./RULES.md#python-style-gate-pylint) |
| Write a root landing README | [Landing / root README](./MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) |

## Use cases

| Use case | What you get | Start here |
|----------|--------------|------------|
| **New greenfield repo** | Same doc shape and git hygiene from day one | [Initiate a project](#initiate-a-project-by-interest) |
| **Align an existing repo** | Authority map + checklists without a rewrite | Copy RULES + MARKDOWN; fill paths |
| **Multi-package monorepo** | Shared standards; per-package README/CLI/security | Templates under each package |
| **Python product code** | pylint PEP-8 gate, score 10.00, not a runtime dep | `configs/pylintrc` |
| **Docs-only design repo** | Frontmatter, Summary→Contents, concept/methodology templates | MARKDOWN-STANDARD + templates |
| **Multi-OS team** | Dual-path examples and per-platform verify commands | [Platform-aware examples](./MARKDOWN-STANDARD.md#platform-aware-examples) |

## What’s included

| Path | Role |
|------|------|
| `MARKDOWN-STANDARD.md` | How to structure and write markdown |
| `RULES.md` | How to maintain the repository |
| `configs/pylintrc` | Portable pylint config (copy as `.pylintrc`) |
| `templates/TEMPLATE-README.md` | Package overview (`doc_type: readme`) |
| `templates/TEMPLATE-CLI.md` | CLI / automation contract |
| `templates/TEMPLATE-METHODOLOGY.md` | Formulas and “how it works” |
| `templates/TEMPLATE-SECURITY.md` | Trust boundary and execution notes |
| `templates/TEMPLATE-CONCEPT.md` | Progressive design / multi-version concepts |
| `templates/TEMPLATE-GENERIC.md` | Minimal substantial doc |
| `LICENSE` | MIT license for this kit |

## Quick start

Adopt this kit in a target repository:

1. **Initiate from interest** — follow [Initiate a project](#initiate-a-project-by-interest) (platform, templates, authority map).  
2. **Copy** into the target repository (or link this kit as a reference):
   - `MARKDOWN-STANDARD.md`
   - `RULES.md`
   - `templates/` (as needed)
   - `configs/pylintrc` if the project has Python product code  
3. **Fill** the [authority map](./RULES.md#authority-map) and [verification before ship](./RULES.md#verification-before-ship) tables with real (or planned) paths and commands for your platform(s).  
4. **Root README:** follow the [landing pattern](./MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) (no frontmatter; use cases first).  
5. **Package docs:** copy a template, replace all `{{PLACEHOLDERS}}`, keep or drop OS blocks per [platform-aware rules](./MARKDOWN-STANDARD.md#platform-aware-examples), refresh Contents.  
6. **Python:** copy `configs/pylintrc` to `.pylintrc` at package or repo root, set `py-version`, run `python -m pylint <package>`. Install pylint in the **developer** environment only.  
7. **Optional inventory:** maintain a `FILE-CATALOG.md` (or similar) and update it on path add/remove/rename.

### Suggested root layout after adopt

```text
your-repo/
  README.md                 # landing (no frontmatter)
  RULES.md                  # maintenance (filled authority map)
  MARKDOWN-STANDARD.md      # or link to this kit
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

Use this when starting or aligning a repo so **formal markdown guides development**, not only documents finished work.

1. **State the interest** — one sentence: product type (library / CLI / service / data tool / docs-only / monorepo) and primary user outcome.  
2. **Set platform context** — primary OS for examples and verify commands: Windows, Linux, macOS, or multi. Follow [Platform-aware examples](./MARKDOWN-STANDARD.md#platform-aware-examples).  
3. **Copy** the kit pieces you need (see [Quick start](#quick-start)).  
4. **Fill the authority map** in [RULES.md](./RULES.md#authority-map) with real or **planned** paths—even before code exists—so every concern has a canonical home.  
5. **Pick templates by interest:**

| Project interest | Start with templates | First contracts to write |
|------------------|----------------------|---------------------------|
| Library / package API | README | Overview + consume example |
| CLI / automation | README + CLI | Invocation, exit codes, verbs |
| Service / long-running | README + SECURITY (+ CLI if any) | Trust boundary, run/verify |
| Methodology / scoring / formulas | README + METHODOLOGY | Pipeline, formulas, outputs |
| Security-sensitive tool | README + SECURITY | Trust boundary before features sprawl |
| Design / multi-phase concept | CONCEPT | Principles + phases; label implementation status |
| Docs-only / standards | GENERIC + root landing | Summary, use cases, history |
| Monorepo multi-package | Per-package README (+ CLI/SECURITY as needed) | Shared RULES; thin per-package overlays |

6. **Scaffold docs first** (or in the same change set as first code) — replace placeholders; refresh Contents; leave `status: draft` until the contract matches behavior.  
7. **Use docs as the development guide:**  
   - New behavior → update the **canonical** authority-map file in the same change set.  
   - New public surface → CLI/API or README section before the feature is “done.”  
   - Verification table → fill real commands as soon as they exist; run them before ship.  
8. **Optional:** inventory file; pylint gate if Python product code.

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

Details: [RULES.md — Python style gate](./RULES.md#python-style-gate-pylint).

## Where to go next

| Need | Document |
|------|----------|
| Frontmatter, Summary→Contents, platform examples, doc types | [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) |
| Commits, contracts, checklists, pylint | [RULES.md](./RULES.md) |
| Start a package README | [templates/TEMPLATE-README.md](./templates/TEMPLATE-README.md) |
| Start a CLI guide | [templates/TEMPLATE-CLI.md](./templates/TEMPLATE-CLI.md) |
| License terms | [LICENSE](./LICENSE) |

## For maintainers of this kit

- Edit standards in place; bump `version` and `last_updated` on [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) and [RULES.md](./RULES.md) when contracts change.  
- Keep examples domain-neutral (`my-service`, `packages/cli`).  
- Templates must retain `{{PLACEHOLDERS}}`; finished project docs must not.  
- Dual-path shell blocks in templates stay until a project declares a single primary platform and drops the unused OS.
