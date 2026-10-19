# Repository Standards Kit

`repo-kit` is an agent-centric, language-agnostic kit. It keeps a repository consistent, gives an agent a clear map for building context files, and stays maintainable no matter which harness or AI / SI model is used.

## User prompts for AI

### Adopt

A repository that **does not** have the kit.

```markdown
# Agent Instruct 

Adopt `repo-kit` from URL: `https://github.com/shainemeister/repo-kit`

1. Identify in `AGENTS.md`.
2. Stop. Ask for confirmation before continuing.
3. Follow `ADOPTER.md`.
```

### Upgrade

A repository that already has the kit.

```markdown
# Agent Instruct 

Upgrade `repo-kit` from URL: `https://github.com/shainemeister/repo-kit`

1. Identify in `AGENTS.md`.
2. Stop. Ask for confirmation before continuing.
3. Follow `kit/UPGRADE.md`.
```

## Use cases

| Goal | Start |
|------|-------|
| Install the kit | [ADOPTER.md](ADOPTER.md) |
| Upgrade a kit already in use | [kit/UPGRADE.md](kit/UPGRADE.md) |
| Name a file or avoid a duplicate | [kit/rules/path-pattern.md](kit/rules/path-pattern.md) |
| Write a commit | [kit/rules/git-commit.md](kit/rules/git-commit.md) |
| Multi-phase work | [WORKBOARD.md](WORKBOARD.md) |

### Authority map

There is no package install. The dependency is git. Follow [ADOPTER.md](ADOPTER.md).

```text
repo-kit
├── kit/
│   ├── RULES.md                 hub. one owner per concern
│   ├── rules/                   paths, contracts, commits, versions
│   ├── MARKDOWN-STANDARD.md     README shape and frontmatter
│   ├── UPGRADE.md               upgrade
│   └── skills/                  repeated verbs. open one when the task matches
├── ADOPTER.md                   one-time adopt
├── AGENTS.md                    session order for a coding agent
├── MEMORY.md                    agent notepad
├── WORKBOARD.md                 multi-phase checklist
└── docs/
    ├── README.md                working notes for this repository
    └── library/                 platform packs, the archive, and the adopt shelf

product code and project history stay outside kit/
```

## Operator prompts

Law stays in [kit/RULES.md](kit/RULES.md). The session order stays in [AGENTS.md](AGENTS.md). [ADOPTER.md](ADOPTER.md) deploys the adopt shelf. [kit/UPGRADE.md](kit/UPGRADE.md) deploys the upgrade shelf at the Kit source.

1. Open `kit/RULES.md`.
2. For a new install, follow `ADOPTER.md`.
3. Check existing files before creating one (`kit/rules/path-pattern.md`).
4. Do not claim the work done if a check this repository declares was skipped.

Kit version is the latest dated section under `## repo-kit` in [kit/CHANGELOG.md](kit/CHANGELOG.md). Source: https://github.com/shainemeister/repo-kit. Licensed under MIT — [LICENSE](LICENSE).
