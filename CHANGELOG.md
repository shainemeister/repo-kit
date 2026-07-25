# Changelog

History of the **Repository Standards Kit**. **Kit version** is defined by the dated release sections below (`## [X.Y.Z] - YYYY-MM-DD`). Upstream: https://github.com/shainemeister/repo-kit.

This file is the history of the Repository Standards Kit itself.  
**Adopting projects** maintain their own root `CHANGELOG.md` for *project/package* history (behavior, contracts, releases, kit adoption/upgrade notes).  
They record the adopted kit version in the **Kit baseline** table inside `RULES.md` (see [RULES — Kit baseline](./RULES.md#kit-baseline) and [Mandatory project CHANGELOG](./RULES.md#mandatory-project-changelog)).

Versioned standards also record per-document history in YAML frontmatter and document-history tables (`RULES.md`, `MARKDOWN-STANDARD.md`). Those document versions are independent of kit and product versions—see [RULES — Versioning](./RULES.md#versioning-and-change-control).

The format is based on [Keep a Changelog](https://keepachangelog.com/). Dates are ISO 8601.

---

## [Unreleased]

### Changed

- Clarified kit vs project history distinction in this file’s header and in root README.
- Strengthened anti-pattern guidance in RULES.md against putting kit release history into a project CHANGELOG.

---

## [1.1.0] - 2026-07-25

### Added

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

### Changed

- Root `README.md`: initiation checklist moved to `SETUP.md`; landing page kept light.
- `RULES.md` **Versioning and change control**: three surfaces (kit / project-package / document); CHANGELOG required; consistency rules strengthened (document version **1.2.0**).
- Root hygiene: `CHANGELOG.md` required (was recommended); SETUP lifecycle note for kit shippers and adopters.
- `configs/pylintrc`: louder adopter guidance that `py-version` **must** be set (3.13 remains starter default only).
- `.gitignore`: richer starter set (Python caches/build, venvs, coverage, light `node_modules/`) with adopter header comment.
- README maintainers section: kit version = CHANGELOG releases; canonical source URL; SETUP lifecycle.

### Removed

- Completed prior-cycle `PLAN.md` (improvement plan fully executed).

---

## [1.0.1] - 2026-07-22

### Changed

- Initiation-from-interest guidance and platform-aware verify/examples in `RULES.md` and related docs.
- Pylintrc path wording aligned (copy as `.pylintrc` or pass `--rcfile`).

---

## [1.0.0] - 2026-07-22

### Added

- Initial portable kit: `MARKDOWN-STANDARD.md`, `RULES.md`, `templates/`, `configs/pylintrc`.
- Root landing README pattern (no frontmatter; use cases first).
- MIT license.
