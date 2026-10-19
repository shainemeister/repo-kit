---
title: "Index platform files"
description: "Add a file-to-function row for each intentional platform file the family index skips."
version: "1.0.0"
status: current
doc_type: other
last_updated: "2026-10-19"
---

# Index platform files

Add a file-to-function row for each intentional platform file the family index skips.

Do this after phase 3, so the rows match the tree that remains.

Known gaps before that retirement:

| Index | Missing from the table |
|-------|------------------------|
| `docs/library/platforms/README.md` | `CHANGELOG.md`, `LICENSE`, `examples/`, `TEMPLATE-CERTIFICATION-README.md` |
| `docs/library/platforms/program-language/python/README.md` | `pylintrc` |
| C and Rust family indexes | Confirm the tool config is a row, not only a prose mention |

Skip `scripts/check_sources.py`, `pyproject.toml`, and each `sources.yaml`. Phase 3 removes them. The cell says the role of that file in that folder. It does not copy the file's `description`.
