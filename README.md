# Repository Standards Kit

Portable standards for **consistent repositories and projects**: how to write markdown, how to maintain a repo, and copy-ready templates—plus a **pylint** config for PEP-8 Python product code.

## Summary

This kit is **domain-agnostic**. Use it for libraries, CLIs, services, data tools, monorepos, or docs-only work. It generalizes patterns proven in larger multi-package repos without baking in a single product or industry.

| Piece | Role |
|-------|------|
| [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) | Structure, frontmatter, doc types, voice, author checklist |
| [RULES.md](./RULES.md) | Authority map, contracts, git, verification, pylint gate |
| [configs/pylintrc](./configs/pylintrc) | PEP-8 style gate for Python product code (developer tooling) |
| [templates/](./templates/) | Starting skeletons for README, CLI, methodology, security, concept, generic |

Copy what you need into a new or existing repo, fill the authority map and verification table, and keep product-specific details in a thin local overlay when the shared rules are not enough.

| You want to… | Start here |
|--------------|------------|
| Scaffold docs for a new package | [templates/](./templates/) · [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) |
| Set maintenance policy | [RULES.md](./RULES.md) |
| Gate Python style (PEP-8) | [configs/pylintrc](./configs/pylintrc) · [RULES — pylint](./RULES.md#python-style-gate-pylint) |
| Write a root landing README | [Landing / root README](./MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) |

## Use cases

| Use case | What you get | Start here |
|----------|--------------|------------|
| **New greenfield repo** | Same doc shape and git hygiene from day one | [How to adopt](#how-to-adopt) |
| **Align an existing repo** | Authority map + checklists without a rewrite | Copy RULES + MARKDOWN; fill paths |
| **Multi-package monorepo** | Shared standards; per-package README/CLI/security | Templates under each package |
| **Python product code** | pylint PEP-8 gate, score 10.00, not a runtime dep | `configs/pylintrc` |
| **Docs-only design repo** | Frontmatter, Summary→Contents, concept/methodology templates | MARKDOWN-STANDARD + templates |

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

## How to adopt

1. **Copy** into the target repository (or link this kit as a reference):
   - `MARKDOWN-STANDARD.md`
   - `RULES.md`
   - `templates/` (as needed)
   - `configs/pylintrc` if the project has Python product code  
2. **Fill** the [authority map](./RULES.md#authority-map) and [verification before ship](./RULES.md#verification-before-ship) tables with real paths and commands.  
3. **Root README:** follow the [landing pattern](./MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) (no frontmatter; use cases first).  
4. **Package docs:** copy a template, replace all `{{PLACEHOLDERS}}`, refresh Contents.  
5. **Python:** copy `configs/pylintrc` to `.pylintrc`, set `py-version`, run `python -m pylint <package>`. Install pylint in the **developer** environment only.  
6. **Optional inventory:** maintain a `FILE-CATALOG.md` (or similar) and update it on path add/remove/rename.

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

## How overlays work

| Layer | Contains |
|-------|----------|
| **This kit** | Portable structure, formatting, git, pylint policy, templates |
| **Project RULES** | Real paths, runtimes, dependency policy, verify commands, domain “must not” |
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
| Frontmatter, Summary→Contents, doc types | [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) |
| Commits, contracts, checklists, pylint | [RULES.md](./RULES.md) |
| Start a package README | [templates/TEMPLATE-README.md](./templates/TEMPLATE-README.md) |
| Start a CLI guide | [templates/TEMPLATE-CLI.md](./templates/TEMPLATE-CLI.md) |

## For maintainers of this kit

- Edit standards in place; bump `version` and `last_updated` on [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) and [RULES.md](./RULES.md) when contracts change.  
- Keep examples domain-neutral (`my-service`, `packages/cli`).  
- Templates must retain `{{PLACEHOLDERS}}`; finished project docs must not.
