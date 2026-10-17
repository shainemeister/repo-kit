# Repository Standards Kit

A short, language-agnostic kit for keeping a repository honest. Copy `kit/` into a target repository. Product code and project history stay outside it.

## Overview

There is no package install. The dependency is git. Follow [ADOPTER.md](ADOPTER.md). While that adopt runs, map the target repository on [WORKBOARD.md](WORKBOARD.md).

| Piece | Role |
|-------|------|
| [kit/RULES.md](kit/RULES.md) | Hub. One owner per concern |
| [kit/rules/](kit/rules/) | Paths, contracts, commits, and versions |
| [kit/MARKDOWN-STANDARD.md](kit/MARKDOWN-STANDARD.md) | README shape and minimum frontmatter |
| [ADOPTER.md](ADOPTER.md) · [kit/UPGRADE.md](kit/UPGRADE.md) | One-time adopt, and upgrade for this kit |
| [AGENTS.md](AGENTS.md) | Session order for a coding agent |
| [MEMORY.md](MEMORY.md) | Agent notepad |
| [WORKBOARD.md](WORKBOARD.md) | Multi-phase checklist |
| [docs/](docs/README.md) | Working notes for this repository |
| [docs/library/](docs/library/README.md) | Platform packs, the archive, and the adopt shelf |
| [kit/skills/](kit/skills/README.md) | Repeated verbs. Open one when the task matches |

### Use cases

| Goal | Start |
|------|--------|
| Install the kit | [ADOPTER.md](ADOPTER.md) |
| Upgrade a kit already in use | [kit/UPGRADE.md](kit/UPGRADE.md) |
| Name a file or avoid a duplicate | [kit/rules/files.md](kit/rules/files.md) |
| Write a commit | [kit/rules/git-commit.md](kit/rules/git-commit.md) |
| Multi-phase work | [WORKBOARD.md](WORKBOARD.md) |

### Quick start

Copy the kit core into the target `kit/`, fill the authority map with paths that exist, and write the target's own README in its own words. [ADOPTER.md](ADOPTER.md) is the procedure.

Standards live in `kit/`. The project lives outside it.

Kit version is the latest dated section under `## repo-kit` in [kit/CHANGELOG.md](kit/CHANGELOG.md). Source: https://github.com/shainemeister/repo-kit. Licensed under MIT — [LICENSE](LICENSE).

## Operator prompts

Law stays in [kit/RULES.md](kit/RULES.md). The session order stays in [AGENTS.md](AGENTS.md).

1. Open `kit/RULES.md`.
2. For a new install, follow `ADOPTER.md` and map the repository on `WORKBOARD.md`.
3. Check existing files before creating one (`kit/rules/files.md`).
4. Do not claim the work done if a check this repository declares was skipped.
