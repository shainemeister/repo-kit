# Changelog

History of the **Repository Standards Kit**. Versioned standards also record history in YAML frontmatter and document-history tables (`RULES.md`, `MARKDOWN-STANDARD.md`).

The format is based on [Keep a Changelog](https://keepachangelog.com/). Dates are ISO 8601.

---

## [Unreleased]

### Added

- Ephemeral `SETUP.md` for one-time project initiation (adoption modes, authority-map fill, template pick).
- `examples/` with filled authority-map and verification skeletons (CLI, Python library, docs-only).
- `CHANGELOG.md` for kit-level history.
- Non-Python style-gate guidance table in `RULES.md`.
- Stronger commit-message guidance in `RULES.md` (modularity, scopes, body, examples, optional footers).
- Root hygiene rules in `RULES.md`.

### Changed

- Root `README.md`: initiation checklist moved to `SETUP.md`; landing page kept light.

### Removed

- Completed `PLAN.md` (improvement plan fully executed).

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
