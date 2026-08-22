---
title: Markdown Documentation Standard
description: Cross-functional standard for consistent, professional markdown across any repository or project.
version: "1.3.1"
status: current
audience:
  - developers
  - technical-writers
  - analysts
  - security
doc_type: other
related:
  - ../README.md
  - RULES.md
  - rules/contracts.md
  - rules/authoring-and-style.md
  - templates/TEMPLATE-GENERIC.md
  - templates/TEMPLATE-README.md
  - templates/TEMPLATE-LANDING-README.md
last_updated: "2026-08-21"
---

# Markdown Documentation Standard

A repeatable standard for professional, consistent markdown in any repository—usable across packages, CLIs, methodologies, security notes, design concepts, and runbooks.

**Standard version:** 1.3.1  
**Location:** `kit/MARKDOWN-STANDARD.md`  
**Templates:** [`templates/`](./templates/)

**Related:** [README.md](../README.md) · [RULES.md](./RULES.md) · [contracts.md](./rules/contracts.md) · [authoring-and-style.md](./rules/authoring-and-style.md) · [templates/TEMPLATE-GENERIC.md](./templates/TEMPLATE-GENERIC.md) · [templates/TEMPLATE-README.md](./templates/TEMPLATE-README.md)

---

## Summary

This document defines **how we structure and write markdown** so docs stay scannable, professional, and easy to maintain. It is **product-agnostic**: the same rules apply to libraries, services, CLIs, data tools, monorepos, and docs-only projects.

Most **substantial** documents use **YAML frontmatter**, a clear **H1**, a short **lead**, a **status block**, then the **required core** for the type ([Density](#density-force-and-incorporation)). Copy-paste skeletons live in [`templates/`](./templates/).

**Exception:** the **repository root landing README** (and similar end-user entry pages) intentionally **omit frontmatter** and follow a lighter outline focused on summary and use cases—see [Landing / root README](#landing--root-readme-no-frontmatter).

---

## Contents

1. [When to use this standard](#when-to-use-this-standard)
2. [Landing / root README (no frontmatter)](#landing--root-readme-no-frontmatter)
3. [Canonical document order](#canonical-document-order)
4. [YAML frontmatter](#yaml-frontmatter)
5. [Headings and anchors](#headings-and-anchors)
6. [Writing conventions](#writing-conventions)
7. [Cross-linking form](#cross-linking-form)
8. [Density, force, and incorporation](#density-force-and-incorporation)
9. [Tables, code, and links](#tables-code-and-links)
10. [Platform-aware examples](#platform-aware-examples)
11. [Document types and body outlines](#document-types-and-body-outlines)
12. [Templates](#templates)
13. [Author checklist](#author-checklist)
14. [Anti-patterns](#anti-patterns)
15. [Document history](#document-history)

---

## When to use this standard

| Use for | Examples | Frontmatter |
|---------|----------|-------------|
| Product / package overview | Package `README.md` under `packages/…` or `my-service/` | **Yes** |
| CLI or API contract | `CLI-GUIDE.md`, `API.md` | **Yes** |
| How formulas or processes work | Methodology, design notes | **Yes** |
| Security / trust boundary | `SECURITY.md`, `ENTERPRISE-SECURITY.md` | **Yes** |
| Design concepts | Progressive design, multi-version concepts | **Yes** |
| Operational runbooks | Deploy, validate, recover | **Yes** |
| **Repo landing / root entry** | Root [README.md](../README.md) | **No** (by design) |

| Optional / lighter treatment | Examples |
|------------------------------|----------|
| Tiny sample folders | Short README without full frontmatter if under ~30 lines |
| Generated notes | Prefer linking to a curated doc instead of free-form dump |

---

## Landing / root README (no frontmatter)

**Required** for every adopting repository’s **root `README.md`**. Do not use this outline for package READMEs.

Two H2s, in this order: **`Overview`** then **`Operator prompts`**. Do not title the halves Human / AI. Skeleton: [TEMPLATE-LANDING-README.md](./templates/TEMPLATE-LANDING-README.md).

Goal: a professional first impression that is easy to scan—not a maintainer catalog, not a CLI contract, not a methodology dump.

### Purpose

| This page does | This page does not |
|----------------|--------------------|
| Explain what the **product / repo** is for | Replace package READMEs or CLI guides |
| Lead with **Overview** (use cases, quick start) | Open with RULES, catalogs, or template inventories |
| End with **Operator prompts** (session load path) | Become a second `kit/RULES.md` or a copy of `AGENTS.md` |
| Link to deep docs by need | Duplicate another document in full |

### Required order

| # | Block | Required? | Notes |
|---|--------|-----------|--------|
| 1 | **H1** | Yes | Product-facing title |
| 2 | **Lead** | Yes | One or two sentences under the H1—no frontmatter above it |
| 3 | **`## Overview`** | **Yes** | Landing body (blocks 4–11 live *under* this H2 as `###` or tables) |
| 4 | Summary | Yes | What it is, for whom, key constraints |
| 5 | Use cases | Yes | Table: goal · outcome · start path |
| 6 | What’s included | Recommended | Compact map—not every source file |
| 7 | Prerequisites | Yes if software is required | Short table only |
| 8 | Quick start | Yes | One realistic end-to-end example |
| 9 | Your data (or equivalent) | If a data or config contract exists | Schema vs rows |
| 10 | Where to go next | Yes | Links by need |
| 11 | For maintainers | Optional | End of Overview; keep thin |
| 12 | **`## Operator prompts`** | **Yes** | Last H2 — see below |

**Contents:** omit on the landing page (only two H2s).

**YAML frontmatter:** **omit**.

### Operator prompts (required)

Session **load path** for *this* repository. Not product API/CLI law.

| Include | Exclude |
|---------|---------|
| Open `kit/RULES.md` first (map, inventory, operator checklist) | Full `kit/rules/*` paste |
| Declared inventory only (empty ⇒ no language gates) | Invented tools or host folder trees |
| If a coding agent is used: `kit/agents/HABITAT.md` + root `AGENTS.md` (do not clobber) | HABITAT detect/alias essay |
| If Instruct: `kit/agents/OPS.md` | Pack bodies; spawn-tool names |
| If multi-phase: `docs/WORKBOARD.md` | Live phase tables |
| Optional project-specific session notes | Upstream repo-kit **adopt/upgrade fences** (those belong only on *this* kit’s README) |

`AGENTS.md` remains the host auto-load pointer ([HABITAT](./agents/HABITAT.md)). Operator prompts is the landing appendix.

### Tone and length

| Guidance | Detail |
|----------|--------|
| Voice | Professional, direct, second person (“you”) where natural |
| Jargon | Pair product terms with a plain phrase the first time |
| Length | Prefer roughly **under 120 lines** for the **Overview** (landing) body; an **Operator prompts** appendix may be longer |
| Tables | Use for use cases, prerequisites, and “start here” maps |
| Code | One primary workflow example; more examples live in package docs |

### Maintenance rules

1. When a package **entry point or recommended workflow** changes, update **Quick start** and **Use cases** in the **same change set**.  
2. When a new end-user capability ships, add a **use case row** or a **Where to go next** link—do not only update an inventory catalog.  
3. Keep **For maintainers** short; never move it above Summary / Use cases. **Operator prompts** is the last H2 on the **root** README.  
4. Do not list every path in the repo; inventory belongs in a catalog file if you maintain one.  
5. Relative links only from the file’s directory (root: `./packages/my-service/README.md`).

### Relationship to package READMEs

| Document | Pattern |
|----------|---------|
| **Root landing** (`/README.md`) | This section—**no** frontmatter; **Overview** then **Operator prompts** |
| **Package README** (`packages/my-service/README.md`, etc.) | Full standard + frontmatter + `doc_type: readme` · [TEMPLATE-README.md](./templates/TEMPLATE-README.md) |

Do not force the landing outline onto deep package docs, and do not force full frontmatter onto the root landing page.

---

## Canonical document order

Use this order unless a template of a specific `doc_type` omits an optional block.

| # | Block | Required? | Purpose |
|---|--------|-----------|---------|
| 1 | **YAML frontmatter** | Yes (for standard docs) | Machine-readable metadata |
| 2 | **H1 title** | Yes | Single document title |
| 3 | **Lead** | Yes | One or two sentences: what this doc is |
| 4 | **Status / identity block** | Recommended | Version, path; **Related** line **or** lead citations (3–7 peers; humans must see peers—not YAML-only) |
| 5 | **Summary** | Policy: decision table ≤ 5 Must rows; **omit** if body ≲ 60 lines. Procedure: omit-if | Orientation before navigation |
| 6 | **Contents** | Yes if ≥ 5 H2s **or** ≳ 150 lines. Never list Summary as item 1 | Jump navigation |
| 7 | **Body** | Yes | Required core for the type; extra outline items are omit-if |
| 8 | **Related files** | Optional | Paths and roles (omit if peers already in Related/lead) |
| 9 | **Out of scope** | Optional | Explicit non-goals |
| 10 | **Document history** | Required for standalone CLI, methodology, SECURITY. Kit-internal modules: frontmatter + kit CHANGELOG | Version / notes table |

### Why this order

1. **Frontmatter + title** establish identity for humans and tools.  
2. **Summary** (when required) answers “is this the right doc?” without a TOC.  
3. **Contents** only when the threshold is met—chrome, not a joint.  
4. **Body** is the required core for the type; extra outline items are omit-if ([Density](#density-force-and-incorporation)).  
5. **History** stays at the end on standalone contracts; kit-internal modules use frontmatter + kit CHANGELOG.

Separate major blocks with a horizontal rule (`---`) when it improves scanability (after Summary, after Contents, before History).

---

## YAML frontmatter

Place at the very top of the file, between `---` fences.

```yaml
---
title: "Human-readable title"
description: "One-line description of what this document covers."
version: "1.0.0"
status: current
audience:
  - developers
related:
  - README.md
  - CLI-GUIDE.md
doc_type: readme
last_updated: "2026-07-22"
---
```

### Field reference

| Field | Required | Allowed values / notes |
|-------|----------|-------------------------|
| `title` | **Yes** | Short title (may match H1 without decoration) |
| `description` | **Yes** | Single sentence; no marketing fluff |
| `version` | **Yes** | Semver or doc version string; keep in sync with status block |
| `status` | **Yes** | `draft` · `current` · `deprecated` |
| `audience` | **Yes** | YAML list, e.g. `users`, `developers`, `security`, `it`, `analysts`, `automation` |
| `related` | Substantial docs: **yes** (3–7) | Purpose-labeled peer paths (not the entire tree). Humans also see them via Related line or lead citations |
| `doc_type` | Recommended | See [Document types](#document-types-and-body-outlines) |
| `last_updated` | **Yes** | ISO date `YYYY-MM-DD` |

---

## Headings and anchors

| Rule | Guidance |
|------|----------|
| One H1 | Only the document title |
| H2 | Major sections (listed in Contents when present) |
| H3 | Subsections only when needed |
| Numbered H2 | Optional for long methodology/security (`## 1. Title`); README often unnumbered |
| Anchors | Prefer plain ASCII titles so GitHub-style anchors stay stable |
| Contents | Numbered `[Label](#anchor)` matching H2s; omit unless ≥ 5 H2s or ≳ 150 lines; never list Summary as item 1 |

### Contents pattern

```markdown
## Contents

1. [Section name](#section-name)
2. [Another section](#another-section)
```

Omit Contents unless the threshold in [Canonical document order](#canonical-document-order) is met. Never list Summary as item 1.

---

## Writing conventions

| Topic | Guidance |
|-------|----------|
| Voice | Complete sentences; direct and professional |
| Length | Prefer short paragraphs; put parallel facts in tables |
| Emphasis | **Bold** for critical terms and UI labels |
| Code | `` `inline` `` for paths, flags, identifiers, column names |
| Placeholders | `{{LIKE_THIS}}` in templates; `C:\path\to\...` or `/path/to/...` in examples |
| Dates | Prefer ISO in metadata; human dates OK in narrative |
| Versioning | Bump `version` + `last_updated` when behavior or contract changes |
| Cross-links | Prefer relative links: `./CLI-GUIDE.md`, `../README.md` — see [Cross-linking form](#cross-linking-form) |
| Platform | When examples are OS-specific, follow [Platform-aware examples](#platform-aware-examples) |

---

## Cross-linking form

How to wire documents so humans and AI agents can navigate without duplicating full contracts. **Policy** (when to co-update, what is a contract): [rules/contracts.md](./rules/contracts.md). **This section** is **form** only.

| Mechanism | Guidance |
|-----------|----------|
| Frontmatter **`related:`** | 3–7 purpose-labeled peer paths (not the entire tree) |
| Visible **Related:** line **or** lead citations | Same peers, human-scannable (not YAML-only) |
| Relative links | Always from *this file’s* directory |
| Deep anchors | Link a specific heading when citing a foreign rule |
| One sentence + link | Local consequence + deep link ([contracts](./rules/contracts.md#incorporation)); do not paste the owner’s full table |

Keep `related:` and the human peer list current when peers move. Floor/ceiling and last-cite: [Density](#density-force-and-incorporation). Policy: [contracts.md](./rules/contracts.md). Owners: [RULES.md](./RULES.md#authority-map).

---

## Density, force, and incorporation

How much chrome a file may carry, what force a sentence has, and how to cite an owner instead of reprinting it. **Form** of links: [Cross-linking form](#cross-linking-form). **When to co-update:** [contracts.md](./rules/contracts.md).

### Density classes

| Class | Chrome | Target |
|-------|--------|--------|
| **landing** | No frontmatter; Overview then Operator prompts | Overview ≪ 120 ([Landing](#landing--root-readme-no-frontmatter)) |
| **pointer** | Thin discovery (e.g. `AGENTS.md`) | ≪ 80 |
| **hub** | Map + short Must index | One line + link per row, not a reprint |
| **policy** | Frontmatter + lead + tight Summary | First unique rule by ~line 40; ~80–150 |
| **procedure** | Steps | No Must table required |
| **contract** | As long as the surface | CLI / methodology / SECURITY matrices stay |
| **working memory** | Thin `docs/` notes | Promote durable law to the owner |

Classes describe **shape**, not new `doc_type` values. Keep the existing type set.

### Over-documentation test

Any one of these is too much:

| Defect | Meaning |
|--------|---------|
| Second home | Full restatement of a rule another file owns |
| Standalone padding | Sections that exist only so the file “stands alone” |
| Inverse pair | A Must not that is only ¬Must |
| Chrome without navigation | Contents, peer dumps, or empty H2s that do not help a jump |
| Empty type fulfillment | Headings kept only to “keep the type” |

### Force layers

| Layer | Force | Required reading? |
|-------|-------|-------------------|
| **Normative** | Must / Must not / Should / May stated here | Yes |
| **Incorporated** | Foreign rule applied by citation | Yes — cite at point of use |
| **Informative** | Rationale, one example, mapping | No |
| **Historical** | Document history / CHANGELOG | No for kit-internal modules |
| **Dicta** | Asides, restated background | No |

### Required core vs omit-if

Do not add `doc_type` values. Extra outline items after the core are **omit-if**.

| Type | Required core |
|------|----------------|
| **landing** | What it is, use cases, one quick start, where next, Operator prompts |
| **readme** | Who it’s for, one workflow, links to contracts |
| **cli** | Invocation, verbs/flags, exits, stable output |
| **methodology** | Definitions, formulas, output columns |
| **security** | Trust boundary (privilege, network, secrets) |
| **concept** | Principles + current shape |
| **runbook** | When, steps, verify |
| **other** / policy | Unique Musts for this concern |

Landing requirements in [Landing / root README](#landing--root-readme-no-frontmatter) are unchanged. CLI / methodology / SECURITY **never** drop unique surface facts to hit a line count.

### Section recipe

Inside a body H2: **general rule → exceptions → special rules → relation to other law.** An exception is a narrower case. It is not a Must not that is only ¬Must.

### Compression operators (ordered)

**Replace, don’t erase.** Apply in this order:

1. **Owner** — one canonical statement; others cite.  
2. **Switch** — restated here only if this file owns that dual-path; else one local sentence + link.  
3. **Invert** — drop Must not rows that only negate a Must.  
4. **Chrome** — drop Contents, empty H2s, and triple identity unless they navigate.  
5. **Template** — extra sections labeled omit-if.  
6. **Budget** — if still over, **split or annex**; never delete unique law.

A reprint may go only if a one-sentence citation + deep link to the owner remains.

### Citation floor and ceiling

- YAML `related:` lists **3–7** purpose-labeled peers (co-update or open to apply this file)—not the whole tree.  
- **Hub exception:** `kit/RULES.md` `related:` may list the domain-module / config index (more than 7). That list is the **map**, not a peer dump. Other files stay 3–7.  
- Humans must see those peers: **Related line or lead citations** (not YAML-only).  
- Never zero peers on a substantial file. **Do not drop all Related / `related:`.**  
- Foreign rule at **point of use:** one sentence of local consequence + deep link.  
- Deleting the **last citation** of an owner is context loss ([contracts](./rules/contracts.md)).

### Living vs frozen incorporation

Default: **undated** relative cite (living). Copy owner text into this file only to **freeze**, and mark that copy **dated**. Prefer living cites.

### Budgets

| Class | Budget | Do not |
|-------|--------|--------|
| Policy | ~80–150 lines; first unique rule ~line 40 | Hide the unique Must behind chrome |
| CLI / methodology / SECURITY | Length of the unique surface | Shrink verbs, formulas, or columns to hit a count |
| Over budget | Split or annex | Delete unique law |

Hub Must index is a **map** (one line + link), not a second home.

### Informative vocabulary mapping

Kit law uses **Must / owner / cite / omit-if**. Other vocabularies appear **only** in this table.

| Foreign term | Kit term |
|--------------|----------|
| Black letter | Must / Must not |
| Comment | omit-if rationale |
| Illustration | One example |
| Reporter’s notes | `docs/` working memory |
| Citator | Inbound-link duty |
| Normative / informative | Force layers |
| shall / should / may | Must / Should / May |

---

## Tables, code, and links

### Tables

Use for enumerable facts (options, fields, audiences, exit codes).

```markdown
| Column A | Column B |
|----------|----------|
| Value | Description |
```

Keep cells short. Put long guidance in the Summary, a paragraph, or an “explanation” column—not multi-sentence cells when avoidable.

### Code fences

Always specify a language when possible:

| Language tag | Typical use |
|--------------|-------------|
| `bat` / `cmd` | Windows batch |
| `powershell` | PowerShell |
| `python` | Python |
| `json` | Config / sample JSON |
| `yaml` | Frontmatter examples |
| `text` | Architecture diagrams, plain trees |
| `markdown` | Nested examples of markdown itself |
| `bash` / `sh` | Unix shell |

### Architecture / trees

```text
product-folder/
  README.md
  module-or-package/
```

### Links

- Sibling: `[CLI Guide](./CLI-GUIDE.md)`  
- In-doc: `[Summary](#summary)`  
- Avoid bare URLs when a descriptive label is clearer  

---

## Platform-aware examples

Shell, path, and build examples must match how the project is actually developed and run. Do not assume a single OS unless the project declares one.

| Rule | Guidance |
|------|----------|
| **Primary platform** | When examples are OS-specific, state the primary platform in the status block, prerequisites, or a short note (Windows, Linux, macOS, or multi). |
| **Single-platform projects** | One shell fence is enough; keep paths and commands consistent with that OS. |
| **Multi-platform or unknown host** | Prefer **dual fences** (Windows + Linux/macOS) for invocation, quick start, and validation, **or** one primary fence plus a one-line alternate. |
| **Shell language tags** | Use `bat` / `cmd`, `powershell`, or `bash` / `sh` to match the example—not a generic fence. |
| **Paths** | Placeholders (`C:\path\to\...` and `/path/to/...`) plus one concrete repo-relative example when helpful. |
| **Product OS detection** | If scripts adapt by host (`sys.platform`, `$IsWindows`, `uname`), document that behavior in the CLI or security contract—not only in prose. |
| **Verification commands** | Fill [verification table](./rules/verification-and-ops.md#verification-before-ship) rows with the command(s) used on the team’s platform(s); list both when multi-OS. |

### Dual-path pattern (illustrative)

**Windows**

```bat
cd /d C:\path\to\{{FOLDER_NAME}}
{{QUICKSTART_COMMANDS}}
```

**Linux / macOS**

```bash
cd /path/to/{{FOLDER_NAME}}
{{QUICKSTART_COMMANDS}}
```

Templates for README, CLI, and security already show this pattern where shell matters. Drop the unused OS block only when the project is deliberately single-platform.

---

## Document types and body outlines

Set `doc_type` in frontmatter. After the **required core** for the type ([Density](#density-force-and-incorporation)), use the body flow below. Extra outline items are **omit-if**.

### `readme` — product or package overview

Use for **package** READMEs (with frontmatter). For the **repository root** landing page, use [Landing / root README](#landing--root-readme-no-frontmatter) instead—do not force this full outline on the root file.

1. Who should use what  
2. Recommended / quick start  
3. What it produces (or features)  
4. Prerequisites  
5. Data / configuration (if any)  
6. Layout and architecture  
7. How to consume (API / import)  
8. CLI quick reference (or link out)  
9. Validation / tests  
10. Security notes (short) or link  
11. Troubleshooting  
12. Out of scope  

### `cli` — command-line or automation contract

1. Architecture  
2. When CLI vs library  
3. Invocation  
4. Exit codes  
5. Global options  
6. Commands (one subsection per verb)  
7. Example use cases  
8. Data contract  
9. Constraints  
10. Troubleshooting  
11. Version policy  

### `methodology` — formulas and “how it works”

1. Purpose and scope  
2. Pipeline / overview  
3. Definitions and formulas  
4. Worked example  
5. Outputs / column contracts  
6. Validation  
7. Common false alarms  
8. Out of scope  
9. Document history  

### `security` — trust boundary / enterprise posture

1. Purpose of this document  
2. Trust boundary  
3. Unacceptable patterns (and status)  
4. Required allowances  
5. Runtime / policy restrictions  
6. Recommended validation  
7. Audit snapshot / decisions  
8. Statement for reviewers  
9. Related files  
10. Document history  

### `concept` — design concept (progressive or multi-version)

1. Overview  
2. Shared principles  
3. Version or phase sections (progressive complexity)  
4. Implementation notes  
5. Document control / history  

### `runbook` — operational procedure

1. When to use  
2. Preconditions  
3. Steps  
4. Verification  
5. Failure / recovery  
6. Escalation  

### `other` / generic

Use **Summary (if needed) → body**. Contents only if the threshold is met; History only if this file is a standalone contract. Prefer `TEMPLATE-GENERIC.md`.

---

## Templates

| Template | `doc_type` | Path |
|----------|------------|------|
| Root landing README | *(no frontmatter)* | [templates/TEMPLATE-LANDING-README.md](./templates/TEMPLATE-LANDING-README.md) |
| Product README | `readme` | [templates/TEMPLATE-README.md](./templates/TEMPLATE-README.md) |
| CLI reference | `cli` | [templates/TEMPLATE-CLI.md](./templates/TEMPLATE-CLI.md) |
| Methodology | `methodology` | [templates/TEMPLATE-METHODOLOGY.md](./templates/TEMPLATE-METHODOLOGY.md) |
| Security | `security` | [templates/TEMPLATE-SECURITY.md](./templates/TEMPLATE-SECURITY.md) |
| Concept / design | `concept` | [templates/TEMPLATE-CONCEPT.md](./templates/TEMPLATE-CONCEPT.md) |
| Minimal / any | `other` | [templates/TEMPLATE-GENERIC.md](./templates/TEMPLATE-GENERIC.md) |

There is no dedicated runbook file. For `runbook`, copy [TEMPLATE-GENERIC.md](./templates/TEMPLATE-GENERIC.md) and follow the [runbook body outline](#runbook--operational-procedure) (or freeform H2s that match When to use → Preconditions → Steps → Verification → Failure / recovery → Escalation).

### How to use a template

1. Copy the file into the target folder (e.g. `packages/my-service/README.md`).  
2. Replace all `{{PLACEHOLDERS}}`.  
3. Delete sections that do not apply; do not leave placeholder prose.  
4. Keep dual-path shell blocks when the project is multi-platform; drop the unused OS when primary platform is single and declared.  
5. Refresh **Contents** if present (threshold in [Canonical document order](#canonical-document-order)).  
6. Run through the [Author checklist](#author-checklist).  

### Common placeholders

| Token | Meaning |
|-------|---------|
| `{{PRODUCT_NAME}}` | Human product name |
| `{{FOLDER_NAME}}` | Directory name |
| `{{VERSION}}` | Version string |
| `{{ONE_LINE_PURPOSE}}` | Single-sentence purpose |
| `{{LAST_UPDATED}}` | `YYYY-MM-DD` |
| `{{RELATED_DOC}}` | Sibling doc filename |

Templates may use additional `{{TOKENS}}` beyond this table. Replace every token in the copied file—do not leave unresolved placeholders.

---

## Author checklist

Before merging or publishing a doc:

### All docs

- [ ] Single H1; Summary only when required (policy decision table ≤ 5 rows; omit if body ≲ 60 lines)  
- [ ] Relative links work from the file’s directory  
- [ ] Code fences have language tags  
- [ ] Shell/path examples match [platform-aware rules](#platform-aware-examples) (primary platform declared when OS-specific)  
- [ ] No unresolved `{{PLACEHOLDERS}}`  
- [ ] Tables render (header separator present)  
- [ ] “Out of scope” or “Not in this doc” used instead of silent omissions when helpful  

### Density (all substantial docs)

- [ ] First unique rule within ~40 lines of H1 (policy class)  
- [ ] No fact in frontmatter **and** lead **and** Summary **and** body  
- [ ] Contents omitted unless ≥ 5 H2s or ≳ 150 lines  
- [ ] Must table ≤ 5 rows on policy files  
- [ ] Last citation to each used owner remains  
- [ ] Empty template headings gone  
- [ ] Over budget ⇒ split or justify; never delete unique law  
- [ ] Dual-path restated only if this file owns that switch  

### Standard docs (frontmatter required)

- [ ] Frontmatter complete; `status` accurate  
- [ ] Contents links resolve and match H2 titles (if Contents present)  
- [ ] Version in frontmatter matches status block (if both exist)  
- [ ] `last_updated` set  

### Landing / root README (no frontmatter)

- [ ] No YAML frontmatter  
- [ ] Exactly two H2s, in order: `## Overview` then `## Operator prompts`  
- [ ] Summary and **Use cases** appear near the top of Overview  
- [ ] Quick start shows one end-to-end path  
- [ ] Does **not** open with maintainer-only inventory (RULES, catalog, templates)  
- [ ] Maintainer links (if any) stay at the end of Overview and stay short  
- [ ] Operator prompts is a session load path (not a second RULES tree, not package CLI/API)  
- [ ] Deep contracts linked, not pasted  

---

## Anti-patterns

| Avoid | Prefer |
|-------|--------|
| Long policy docs without a decision table | ≤ 5 Must rows, **or** omit Summary (body ≲ 60 lines) |
| Contents listed when under threshold; Summary as Contents item 1 | Contents only if ≥ 5 H2s or ≳ 150 lines; never list Summary first |
| Multiple H1s | One H1, then H2+ |
| Frontmatter `version` ≠ badge line | Keep them identical |
| TOC entries that don’t exist | Regenerate Contents after edits |
| Only absolute machine paths | Placeholders + one concrete example |
| Walls of prose for option lists | Tables |
| Emoji-heavy headings | Plain headings for stable anchors |
| Duplicating another doc in full; second home of an owned rule | Cite the owner (one sentence + deep link) |
| Deleting the last citation of an owner | Keep at least one citation; then drop the reprint |
| Empty headings to “keep the type” | Delete unused outline items (omit-if) |
| Must not that is only ¬Must | State the Must; drop the inverse row |
| Root README that is only a file dump | Overview + Operator prompts |
| Frontmatter on the root landing README | Omit frontmatter; H1 + lead + Overview |
| Root page that opens with RULES / catalog / templates | Overview first; Operator prompts last |
| Root README missing `## Operator prompts` | Required load-path H2 |
| Package README using Overview + Operator prompts | Package docs keep frontmatter + required core for `readme` |
| Pasting full CLI-GUIDE into the root README | One example + link |
| Windows-only examples in a multi-OS project | Dual fences or declared primary platform |
| Unresolved template tokens in shipped docs | Replace every `{{TOKEN}}` |

---

## Document history

| Version | Notes |
|---------|--------|
| 1.3.1 | Hub `related:` may be the module index (kit 2.8.1) |
| 1.3.0 | Density, force, incorporation, Contents threshold, citation cap (kit 2.7.0) |
| 1.2.1 | Landing checklist names both H2s; root landing removed from optional/lighter table (kit 2.6.3) |
| 1.2.0 | Root README **must** use Overview + Operator prompts; package READMEs unchanged (kit 2.6.2) |
| 1.1.1 | Landing may end with Operator prompts; Overview length budget (kit 2.6.1) |
| 1.1.0 | Cross-linking form section; kit 2.0 paths (`kit/`); links to contracts and verification modules |
| 1.0.1 | Platform-aware examples; runbook → GENERIC pointer; placeholder completeness note |
| 1.0.0 | Initial portable standard (generalized for multi-domain repos); root landing pattern; templates under `templates/` |
