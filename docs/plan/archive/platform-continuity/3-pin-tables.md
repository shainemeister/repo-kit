---
title: "Replace source pins"
description: "Replace each family's sources.yaml with a pin table and remove the checker."
version: "1.0.0"
status: current
doc_type: other
last_updated: "2026-10-19"
---

# Replace source pins

Replace each family's `sources.yaml` with a pin table and remove the checker.

One table per family, on that family's index. Columns: source, pin, the pack that owns the rule, and the date the pin was read. Copy the current pin. Do not fetch the page. `kit/RULES.md` does not cite this tree.

Remove in the same change:

- `docs/library/platforms/scripts/check_sources.py`
- `docs/library/platforms/pyproject.toml`
- each `sources.yaml`
- checker instructions in `scripts/README.md` and `docs/library/platforms/style-gates.md`

If `scripts/` has no intentional file left, remove that directory and its row. The platforms index drops `pyproject.toml` and the checker. It keeps the pin tables.
