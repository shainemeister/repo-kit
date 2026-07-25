# Plan — Kit Hardening (Versioning, Gitignore, Pylint, Consistency)

> Working plan for the next improvement cycle of **repo-kit**.  
> Follow the items in order. Each section contains the problem statement, target outcome, concrete tasks, files to touch, and acceptance criteria so an AI (or human) can execute and verify.

**Status:** open  
**Created:** 2026-07-25  
**Primary goal:** Harden versioning / CHANGELOG guidance for adopting repositories (item 1). Secondary: improve starter hygiene and consistency.

---

## Summary of agreed scope

| # | Area | Decision |
|---|------|----------|
| 1 | Versioning / CHANGELOG hardening in `RULES.md` | **Primary focus** — **mandatory** project CHANGELOG; three version surfaces; **kit baseline** + upgrade path via https://github.com/shainemeister/repo-kit |
| 2 | `.gitignore` | Enrich the default (or add clear adopter guidance) |
| 3 | `configs/pylintrc` | Generalize `py-version`; keep strong PEP-8 / pylint emphasis |
| 4 | Light automation (CI, pre-commit, validate-docs scripts) | **Out of scope** — leave as-is |
| 5 | Discoverability (GitHub description, topics) | **Out of scope** — leave as-is |
| 6 | Small consistency nits | Fix relative-link style + future-proof SETUP.md note |

### Refinements (execution)

1. Project `CHANGELOG.md` is a **must** (enforced in RULES: authority map, versioning, checklist, anti-patterns)—not optional.  
2. Kit has a durable self-version (CHANGELOG releases + Adopted kit version in RULES) so repos can upgrade after SETUP is gone.  
3. **Kit source** is always **https://github.com/shainemeister/repo-kit**.

---

## 1. Primary — Versioning & CHANGELOG hardening (RULES.md)

### Problem
The kit itself has slightly divergent version numbers (`RULES.md` 1.1.0, `MARKDOWN-STANDARD.md` 1.0.1, CHANGELOG 1.0.0/1.0.1/Unreleased). More importantly, when this kit is **adopted into other repositories**, there is not yet a clear, hardened contract telling the adopting project how to version its own documents, how to maintain a CHANGELOG, and how kit versions relate to project versions.

### Target outcome
`RULES.md` gains an explicit, copy-ready section (or expanded existing “Versioning and change control” section) that:

- Tells adopting repositories exactly what they must version and where.
- Clarifies the relationship between **kit version**, **project / package version**, and **document version**.
- Makes CHANGELOG **mandatory** (when to write entries, Keep a Changelog style, Unreleased section, etc.).
- Requires a durable **Kit baseline** (version, date, source = https://github.com/shainemeister/repo-kit) and an upgrade procedure.
- Requires that document frontmatter `version` + `last_updated` stay aligned with the project’s change-control practice.
- Is written so an adopter can fill kit baseline + authority-map rows without inventing policy.

### Tasks for AI / implementer

1. Read the current “Versioning and change control” section in `RULES.md`.
2. Design and insert a hardened subsection (suggested title: **Versioning & CHANGELOG for adopting repositories** or expand the existing section).
3. Cover at minimum:
   - Which documents must carry frontmatter `version` + `last_updated`.
   - When a project CHANGELOG entry is required vs optional.
   - Recommended Keep a Changelog structure (Added / Changed / Deprecated / Removed / Fixed / Security + Unreleased).
   - How to record adoption of a new kit version (e.g. note in project CHANGELOG or RULES document history).
   - Distinction: kit version (this repo) vs product/package version (the adopting repo).
   - Rule that behavior/contract changes and their canonical docs must share the same change set **and** the version bump must be consistent.
4. Update the authority map if a new canonical source appears (e.g. project CHANGELOG).
5. Add or adjust one row in the Contributor checklist and/or Anti-patterns table.
6. Bump `RULES.md` frontmatter `version` and `last_updated`; add a Document history row.
7. Add a corresponding entry under `[Unreleased]` in `CHANGELOG.md`.

### Acceptance criteria
- [x] A reader of an adopting repo can answer “What versioning rules do I follow?” from `RULES.md` alone.
- [x] Kit vs project vs document version distinction is unambiguous.
- [x] CHANGELOG is mandatory and expectations are concrete.
- [x] Kit baseline + upgrade path (source fixed to GitHub) survive SETUP removal.
- [x] No unresolved placeholders left in the new policy text (adopter fill-ins use the kit’s existing `{{…}}` pattern).
- [x] `RULES.md` version and history updated; kit `CHANGELOG.md` notes the change.

### Files
- `RULES.md` (primary)
- `CHANGELOG.md`

---

## 2. Enrich `.gitignore`

### Problem
Current `.gitignore` is minimal (OS, editors, `.env`, basic Python). For a kit that encourages adoption, a slightly richer starter set reduces friction and accidental commits of common regenerable or sensitive artifacts.

### Target outcome
A practical, still-lightweight `.gitignore` that covers common cases without becoming a kitchen-sink file. Optionally add a short comment block at the top explaining that adopters should extend it for their stack.

### Tasks
1. Expand `.gitignore` with commonly useful entries while staying conservative:
   - Python: `__pycache__/`, `*.py[cod]`, `*.egg-info/`, `.pytest_cache/`, `.mypy_cache/`, `.ruff_cache/`, `dist/`, `build/`, `*.egg`
   - Virtual environments: `.venv/`, `venv/`, `env/`
   - Node (light, for mixed repos): `node_modules/`
   - Coverage / test artifacts: `.coverage`, `htmlcov/`, `.tox/`
   - OS / editor (already present — keep)
   - Secrets (already present — keep)
2. Add a brief header comment: “Starter ignore list for adopters of repo-kit. Extend for your language/tooling.”
3. Do **not** add language-specific noise that would surprise a pure-docs or non-Python adopter.

### Acceptance criteria
- [x] No secrets or regenerable build/test artifacts are likely to be committed by accident under common workflows.
- [x] File remains short and readable.
- [x] Header comment present.

### Files
- `.gitignore`

---

## 3. Generalize `configs/pylintrc` (py-version + PEP-8 emphasis)

### Problem
`py-version = 3.13` is a concrete default. While a comment already exists, the version feels more locked than necessary. The importance of a PEP-8-aligned gate for consistent Python product code should remain prominent.

### Target outcome
- `py-version` is clearly presented as **adopter-controlled**.
- Comments emphasize that the gate exists for consistent PEP-8 Python product code and is developer tooling only.
- Default can stay at a recent version or be softened (e.g. comment-only guidance) — prefer keeping a sensible default but making the “you must set this” instruction impossible to miss.

### Tasks
1. Strengthen the header comments in `configs/pylintrc`:
   - Explicitly state that `py-version` **must** be set to the project’s supported Python version(s).
   - Reiterate: pylint is developer tooling only; never a product runtime dependency.
   - Keep the enable list focused on PEP-8 / style / basic correctness (do not expand into design metrics).
2. Optionally change the default `py-version` line to a more neutral comment + example, or keep `3.13` with a louder “CHANGE ME” style note. Prefer clarity over cleverness.
3. Confirm that `RULES.md` Python style-gate section still points correctly at the config and the 10.00 / exit-0 pass criteria.

### Acceptance criteria
- [x] An adopter cannot miss that they must set `py-version`.
- [x] PEP-8 / consistent-style purpose remains clear.
- [x] No change to the enable/disable philosophy (style gate, not design gate).

### Files
- `configs/pylintrc`
- `RULES.md` (only if cross-references need a one-line tweak)

---

## 4. Out of scope (do not implement)

- CI workflows, pre-commit hooks, or “validate docs” scripts.
- GitHub repository description, topics, or marketing discoverability work.

---

## 5. Consistency nits

### 5a. Relative-link style

**Problem:** Some internal links use `./file.md`, others omit the `./`. Both work on GitHub, but the standard itself prefers relative links and consistency improves scanability.

**Tasks:**
1. Audit all markdown files in the kit for internal links.
2. Normalize to the style already preferred in `MARKDOWN-STANDARD.md` (relative, with `./` for same-directory siblings where it improves clarity, or the dominant existing style — pick one and apply uniformly).
3. Prefer the form that matches the majority of current correct links so the diff stays small.

**Acceptance:** No mixed styles for the same class of link (sibling vs parent). *(Pre-audit: dominant style already `./` / `../`; no mass reformat required.)*

### 5b. Future-proof note for SETUP.md

**Problem:** `SETUP.md` is correctly ephemeral, yet the kit ships it at root. After a future major release an adopter may wonder whether SETUP is still expected at root.

**Tasks:**
1. Add a short, durable note (in `RULES.md` Root hygiene or in `SETUP.md` itself, and/or a one-line mention in README “For maintainers”) that:
   - SETUP.md is intentionally present in this kit for first-time adopters.
   - Adopting projects should delete or archive it after initiation.
   - Future major kit releases may move or remove the root SETUP.md; the permanent contracts remain README / RULES / MARKDOWN-STANDARD.
2. Keep the note brief — do not turn it into a migration guide yet.

**Acceptance:** A future reader understands the intentional lifecycle of SETUP.md. *(Done: SETUP header, RULES root hygiene, README maintainers.)*

### Files
- All `.md` files that contain internal links (audit)
- `RULES.md` and/or `SETUP.md` and/or `README.md` (for the SETUP lifecycle note)

---

## Execution order (recommended for AI)

1. **Item 1** (versioning / CHANGELOG hardening in `RULES.md`) — highest value.
2. **Item 3** (pylintrc generalization) — small, self-contained.
3. **Item 2** (`.gitignore` enrichment).
4. **Item 5** (consistency nits + SETUP note).
5. Final pass: update kit `CHANGELOG.md` under `[Unreleased]`, bump any document versions/history tables touched, run a quick relative-link sanity check.

---

## Definition of done for this plan

- [x] All acceptance criteria above are met.
- [x] No new unresolved `{{PLACEHOLDERS}}` beyond intentional adopter fill-ins (authority map / kit baseline).
- [x] Kit still follows its own MARKDOWN-STANDARD and RULES (frontmatter, Summary, history, etc.).
- [x] `CHANGELOG.md` records the work under Unreleased (or a new version section if releasing).
- [ ] This `PLAN.md` can be archived or deleted once the work is complete (same pattern as the previous completed plan) — **await user confirmation**.

---

## Notes for the implementer

- Stay inside the agreed scope. Do not invent CI, pre-commit, or discoverability work.
- Prefer small, focused commits following the kit’s own Conventional Commits guidance (`docs(rules): …`, `chore: …`, etc.).
- When editing `RULES.md`, keep the authority-map and verification-table philosophy intact — the new versioning text should feel native to the existing document.
- After changes, the kit’s own root layout and documentation rules must still pass the author checklist in `MARKDOWN-STANDARD.md`.
