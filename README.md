# Repository Standards Kit

A short, language-agnostic kit for keeping a repository honest. Copy `kit/` into a target repository. Product code and project history stay outside it.

## Overview

There is no package install. The dependency is git. Follow [kit/SETUP.md](kit/SETUP.md). While that install runs, map the target repository on [docs/WORKBOARD.md](docs/WORKBOARD.md).

| Piece | Role |
|-------|------|
| [kit/RULES.md](kit/RULES.md) | Hub. One owner per concern |
| [kit/rules/](kit/rules/) | Paths, contracts, commits, and versions |
| [kit/MARKDOWN-STANDARD.md](kit/MARKDOWN-STANDARD.md) | README shape and minimum frontmatter |
| [kit/SETUP.md](kit/SETUP.md) · [kit/UPGRADE.md](kit/UPGRADE.md) | Install and upgrade for this kit |
| [AGENTS.md](AGENTS.md) | Session order for a coding agent |
| [docs/](docs/README.md) | Working notes for this repository |
| [library/](library/README.md) | Platform packs and skill packs. Open one when the work needs it |

### Use cases

| Goal | Start |
|------|--------|
| Install the kit | [kit/SETUP.md](kit/SETUP.md) |
| Upgrade a kit already in use | [kit/UPGRADE.md](kit/UPGRADE.md) |
| Name a file or avoid a duplicate | [kit/rules/files.md](kit/rules/files.md) |
| Write a commit | [kit/rules/git-commit.md](kit/rules/git-commit.md) |
| Multi-phase work | [docs/WORKBOARD.md](docs/WORKBOARD.md) |

### Quick start

Copy the kit core into the target `kit/`, fill the authority map with paths that exist, and write the target's own README in its own words. [kit/SETUP.md](kit/SETUP.md) is the procedure.

Standards live in `kit/`. The project lives outside it.

Kit version is the latest dated section under `## repo-kit` in [kit/CHANGELOG.md](kit/CHANGELOG.md). Source: https://github.com/shainemeister/repo-kit. Licensed under MIT — [LICENSE](LICENSE).

## Operator prompts

Law stays in [kit/RULES.md](kit/RULES.md). The session order stays in [AGENTS.md](AGENTS.md).

1. Open `kit/RULES.md`.
2. For a new install, follow `kit/SETUP.md` and map the repository on `docs/WORKBOARD.md`.
3. Check existing files before creating one (`kit/rules/files.md`).
4. Do not claim the work done if a check this repository declares was skipped.
