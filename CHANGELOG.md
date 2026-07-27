# Changelog

History of the **Repository Standards Kit**. **Kit version** is defined by dated release sections (`### [X.Y.Z] - YYYY-MM-DD`) under `## repo-kit`. Upstream: https://github.com/shainemeister/repo-kit.

This file is the history of the Repository Standards Kit itself.  
**Adopting projects** maintain their own root `CHANGELOG.md` for *project/package* history (behavior, contracts, releases, kit adoption/upgrade notes).  
They record the adopted kit version in the **Kit baseline** table inside `RULES.md` (see [RULES — Kit baseline](./RULES.md#kit-baseline) and [Mandatory project CHANGELOG](./RULES.md#mandatory-project-changelog)).

Versioned standards also record per-document history in YAML frontmatter and document-history tables (`RULES.md`, `MARKDOWN-STANDARD.md`). Those document versions are independent of kit and product versions—see [RULES — Versioning](./RULES.md#versioning-and-change-control).

**Structure:** `## <Repository Name>` (integrated repository) → `### [X.Y.Z] - YYYY-MM-DD` (version change/update) → `#### Added` / `#### Changed` / … (categories). Categories follow [Keep a Changelog](https://keepachangelog.com/). Dates are ISO 8601. There is no Unreleased section—record each change under the version section that ships it.

---

## [Repository Name]

### [X.Y.Z] - YYYY-MM-DD

#### Added

- *(project/package history for this repository — not kit release notes)*

---

## repo-kit

### [1.1.7] - 2026-07-26

#### Changed

- Root README Purpose: fixed typo (“percision” → “precision”) and tightened the sentence while preserving instructional voice.

### [1.1.6] - 2026-07-26

#### Added

- Root README **Upgrading an existing adoption** pointer (with copy-pasteable AI upgrade prompt) and navigation rows in “You want to…”, Use cases, and Where to go next.
- Explicit CHANGELOG discipline sentence in RULES.md upgrade procedure: read only kit CHANGELOG entries since the current Adopted kit version; merge only what you need; never copy the full kit history into the project CHANGELOG.
- Cross-link from RULES upgrade section to the README AI upgrade prompt.

#### Changed

- RULES.md document version 1.3.0 → **1.3.1** (upgrade-path clarity only).

#### Removed

- Completed root `PLAN.md` for the upgrade-instructions / existing-adopters cycle (enhancement fully executed).

### [1.1.5] - 2026-07-26

#### Added

- Security documentation modularity in RULES.md: omit `SECURITY.md` when a package has no execution surface, network access, elevated privilege, or secrets handling.
- Advisory multi-language **Security / SAST gates** in RULES.md, keyed by language/surface (Bandit, pip-audit, PSScriptAnalyzer, npm audit, govulncheck, cargo-audit, ShellCheck, Gitleaks, optional Semgrep)—declare only languages the repo ships.
- Optional verification-table row for language-specific security / SAST commands.
- Brief “delete if not applicable” guidance on key sections of `templates/TEMPLATE-SECURITY.md`.
- SETUP pointers for optional security docs and language-scoped SAST gates.
- Explicit modularity notes in `examples/docs-only.md`, `examples/python-library.md`, and `examples/cli-tool.md`.

#### Changed

- RULES.md document version 1.2.2 → **1.3.0** (security modularity + SAST section; anti-pattern updates).

#### Removed

- Completed root `PLAN.md` for the modular security documentation & multi-language SAST gates cycle (enhancement fully executed).

### [1.1.4] - 2026-07-26

#### Changed

- Root README How-to section: fixed typo, added explicit “no traditional install” sentence, and smoothed agent prompts for cleaner copy-paste use.

### [1.1.3] - 2026-07-26

#### Added

- Root README **Purpose** and **How to use (quick path)** blocks: human consistency + AI-agent context efficiency; recommend a user-supplied project `PLAN.md`; copy-pasteable clone and agent-context prompts.

#### Changed

- Root README Quick start: primary 9-step checklist deferred to [SETUP.md](./SETUP.md); suggested layout notes recommended project `PLAN.md`.
- Root README lead and maintainers section: surface AI-context differentiator.

#### Removed

- Completed root `PLAN.md` for the README purpose / AI-context cycle (enhancement fully executed).

### [1.1.2] - 2026-07-25

#### Added

- Required AI-assisted commit disclosure footers in RULES.md Git rules: `Assisted-by` (AI make/model per commit), `Compliance: RULES.md`, `Instructed-by` (from `git config user.name`).

#### Changed

- RULES.md document version 1.2.1 → 1.2.2; strengthened pre-commit and contributor checklists for AI transparency.

### [1.1.1] - 2026-07-25

#### Changed

- Hierarchical CHANGELOG structure: repository H2 → version H3 → category H4; Unreleased workflow removed.
- Clarified kit vs project history distinction in this file’s header and in root README.
- Strengthened anti-pattern guidance in RULES.md against putting kit release history into a project CHANGELOG.
- Aligned `RULES.md`, `README.md`, `SETUP.md`, and `examples/` with the hierarchical structure (RULES document version **1.2.1**).

### [1.1.0] - 2026-07-25

#### Added

- Ephemeral `SETUP.md` for one-time project initiation (adoption modes, authority-map fill, template pick).
- `examples/` with filled authority-map and verification skeletons (CLI, Python library, docs-only).
- `CHANGELOG.md` for kit-level history (canonical **kit version** authority).
- Non-Python style-gate guidance table in `RULES.md`.
- Stronger commit-message guidance in `RULES.md` (modularity, scopes, body, examples, optional footers).
- Root hygiene rules in `RULES.md`.
- **Mandatory project CHANGELOG** policy in `RULES.md` (Keep a Changelog; required for all adopters, including docs-only).
- **Kit baseline** block in `RULES.md` (adopted kit version, date, source) so upgrades remain trackable after SETUP is removed.
- Kit upgrade procedure pointing at https://github.com/shainemeister/repo-kit.
- SETUP step to record kit baseline and ensure root CHANGELOG before delete.
- Sample kit baseline + required CHANGELOG rows in `examples/`.

#### Changed

- Root `README.md`: initiation checklist moved to `SETUP.md`; landing page kept light.
- `RULES.md` **Versioning and change control**: three surfaces (kit / project-package / document); CHANGELOG required; consistency rules strengthened (document version **1.2.0**).
- Root hygiene: `CHANGELOG.md` required (was recommended); SETUP lifecycle note for kit shippers and adopters.
- `configs/pylintrc`: louder adopter guidance that `py-version` **must** be set (3.13 remains starter default only).
- `.gitignore`: richer starter set (Python caches/build, venvs, coverage, light `node_modules/`) with adopter header comment.
- README maintainers section: kit version = CHANGELOG releases; canonical source URL; SETUP lifecycle.

#### Removed

- Completed prior-cycle `PLAN.md` (improvement plan fully executed).

### [1.0.1] - 2026-07-22

#### Changed

- Initiation-from-interest guidance and platform-aware verify/examples in `RULES.md` and related docs.
- Pylintrc path wording aligned (copy as `.pylintrc` or pass `--rcfile`).

### [1.0.0] - 2026-07-22

#### Added

- Initial portable kit: `MARKDOWN-STANDARD.md`, `RULES.md`, `templates/`, `configs/pylintrc`.
- Root landing README pattern (no frontmatter; use cases first).
- MIT license.
