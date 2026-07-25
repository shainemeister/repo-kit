# Setup — One-time adoption guide

> **One-time adoption guide — follow, then delete or archive.**

Use this file when starting or aligning a repository so **formal markdown guides development**, not only documents finished work. After you have filled the authority map, verification table, and first contracts, **delete or archive this file** so it does not accumulate as stale root noise.

Permanent standards stay in [README.md](./README.md), [RULES.md](./RULES.md), and [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md).

---

## Summary

1. Choose an [adoption mode](#adoption-modes).  
2. [State the interest](#1-state-the-interest) and [platform context](#2-set-platform-context).  
3. [Copy](#3-copy-kit-pieces) the pieces you need.  
4. [Fill the authority map](#4-fill-the-authority-map) (see [examples/](./examples/) for filled skeletons).  
5. [Pick templates](#5-pick-templates-by-interest), scaffold docs, and [verify](#8-first-verification-commands).  
6. [Delete or archive this file](#after-setup).

---

## Adoption modes

| Mode | When to use | What to do |
|------|-------------|------------|
| **Full copy** | New greenfield repo that wants the complete kit | Copy MARKDOWN-STANDARD, RULES, templates, and `configs/pylintrc` (if Python). Use this SETUP checklist end-to-end. |
| **Selective copy** | Existing repo; only need structure and policy | Pull MARKDOWN-STANDARD, RULES, needed templates, and pylintrc if relevant. Skip unused templates. |
| **Reference / submodule** | Want to track upstream kit changes without local copies | Link or submodule this kit; keep project-specific filled RULES (or a thin overlay) in the consuming repo. |

---

## 1. State the interest

One sentence: product type (library / CLI / service / data tool / docs-only / monorepo) and primary user outcome.

**Example:** “CLI that validates config files and exits non-zero on contract failures.”

---

## 2. Set platform context

Primary OS for examples and verify commands: **Windows**, **Linux**, **macOS**, or **multi**.

Follow [Platform-aware examples](./MARKDOWN-STANDARD.md#platform-aware-examples): declare primary platform when examples are OS-specific; use dual shell fences when the team is multi-OS.

---

## 3. Copy kit pieces

Into the target repository (or keep a reference per your adoption mode):

| Piece | Always? | Notes |
|-------|---------|--------|
| [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) | Yes (or link) | Authoring rules |
| [RULES.md](./RULES.md) | Yes | Fill authority map + verification |
| [templates/](./templates/) | As needed | Copy only the skeletons you will fill |
| [configs/pylintrc](./configs/pylintrc) | If Python product code | Copy as `.pylintrc` at package or repo root |
| This `SETUP.md` | Temporary | Follow, then delete or archive |

---

## 4. Fill the authority map

In [RULES.md — Authority map](./RULES.md#authority-map), replace placeholders with **real or planned** paths—even before code exists—so every concern has a canonical home.

Also fill [Verification before ship](./RULES.md#verification-before-ship) with commands the team will actually run on each primary platform.

**Filled examples (copy the pattern, not the product names):**

| Interest | Example file |
|----------|--------------|
| CLI / automation | [examples/cli-tool.md](./examples/cli-tool.md) |
| Python library | [examples/python-library.md](./examples/python-library.md) |
| Docs-only / standards | [examples/docs-only.md](./examples/docs-only.md) |

---

## 5. Pick templates by interest

| Project interest | Start with templates | First contracts to write |
|------------------|----------------------|---------------------------|
| Library / package API | README | Overview + consume example |
| CLI / automation | README + CLI | Invocation, exit codes, verbs |
| Service / long-running | README + SECURITY (+ CLI if any) | Trust boundary, run/verify |
| Methodology / scoring / formulas | README + METHODOLOGY | Pipeline, formulas, outputs |
| Security-sensitive tool | README + SECURITY | Trust boundary before features sprawl |
| Design / multi-phase concept | CONCEPT | Principles + phases; label implementation status |
| Docs-only / standards | GENERIC + root landing | Summary, use cases, history |
| Monorepo multi-package | Per-package README (+ CLI/SECURITY as needed) | Shared RULES; thin per-package overlays |

Templates live under [templates/](./templates/).

---

## 6. Scaffold docs first

Scaffold formal docs **before** or **in the same change set as** first code:

1. Copy the chosen template(s).  
2. Replace every `{{PLACEHOLDER}}`.  
3. Refresh Contents links.  
4. Leave frontmatter `status: draft` until the contract matches behavior.  
5. Root README: follow the [landing pattern](./MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) (no frontmatter; use cases first).

---

## 7. Use docs as the development guide

| Trigger | Action |
|---------|--------|
| New behavior | Update the **canonical** authority-map file in the same change set |
| New public surface | CLI/API or README section before the feature is “done” |
| Verification exists | Fill real commands in the verification table; run them before ship |

---

## 8. First verification commands

Fill and run the rows in [RULES.md — Verification before ship](./RULES.md#verification-before-ship). Until project-specific commands exist, use placeholders like:

**Docs only**

```text
# Relative links and structure — author checklist
# See MARKDOWN-STANDARD.md#author-checklist
```

**Python product code** (if applicable)

```text
python -m pylint <package_or_paths>
```

On Windows you may use `py -3.x -m pylint …`. Install pylint in the **developer** environment only—not as a product runtime dependency. Details: [RULES — Python style gate](./RULES.md#python-style-gate-pylint).

**Non-Python languages:** declare a style gate (tool + pass criteria) in RULES or a thin overlay—see [Non-Python style gates](./RULES.md#non-python-style-gates).

---

## 9. Optional next steps

- Maintain a `FILE-CATALOG.md` (or similar) and update it on path add/remove/rename.  
- Copy `configs/pylintrc` → `.pylintrc`, set `py-version`, point the verification table at the real package path.  
- Read [How overlays work](./README.md#how-overlays-work) so stack-specific rules stay in the project map, not a forked kit.

**Checklists:** [Author checklist](./MARKDOWN-STANDARD.md#author-checklist) · [Contributor checklist](./RULES.md#contributor-checklist)

---

## After setup

| Keep (permanent) | Remove or archive |
|------------------|-------------------|
| Root README, RULES, MARKDOWN-STANDARD | **This `SETUP.md`** |
| Filled package docs and templates you still use | Unfilled template copies you do not need |
| `.pylintrc` / style configs you adopted | — |
| Optional FILE-CATALOG, CHANGELOG | — |

Root hygiene (what belongs at the repository root): [RULES — Root hygiene](./RULES.md#root-hygiene).
