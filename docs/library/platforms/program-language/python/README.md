---
title: "Python development policy packs"
description: Modular language, ecosystem, and OS policy maps for Python. Security and trusted libraries over feature sprawl. Compose packs; do not merge them.
version: "1.0.3"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - python-language-policy.md
  - python-ecosystem-policy.md
  - python-os-policy.md
last_updated: "2026-10-19"
---

# Python development policy packs

Modular language, ecosystem, and OS policy maps for Python. Curated
maps of **what each layer actually checks**. Not tutorials. Not product
law for any one application.

Three axes. Compose packs; do not merge them. Language and ecosystem
are **OS-agnostic**. OS tools and ship formats live in **carve-outs**
(Debian, Arch, macOS, Windows). Same shape as
[rust](../rust/README.md) and [c](../c/README.md).

```text
                 LANGUAGE                         ECOSYSTEM                        OS
                 (what the code is)               (how the project lives)          (how it lives on a system)
Python           python-language-policy.md        python-ecosystem-policy.md       python-os-policy.md
                                                                                   Debian | Arch | macOS | Windows
```

**Role:** working memory for humans and agents. Cite official manuals;
do not treat this folder as a substitute for the Python docs, PEPs,
PyPI policy, or an OS packaging guide.

Python's library universe is large. This map **prefers security and
a trusted dependency set over available features**. A new third-party
import is a supply-chain decision, not a convenience. Stdlib first.
Hash-pin and audit everything else. Do **not** treat this folder as
an allowlist of named PyPI projects — those rot. The **bar** lives
here; the **names** live in each product's lockfile.

Last verified against docs.python.org, PEPs, PyPA, PyPI, and OS
installer docs as of 2026-08-29.

------------------------------------------------------------------------
How to compose
------------------------------------------------------------------------

Always take **Language**. Add **Ecosystem** when there is a
`pyproject.toml`, a lockfile, or a PyPI identity. Add **OS (shared
half)** whenever an interpreter must actually run. Add **exactly one
OS carve-out** per ship format.

| Deliverable | Language | Ecosystem | OS |
|-------------|----------|-----------|-----|
| Hosted library or app (any dev OS) | yes | yes | shared + developer host |
| Same project, unpublished | yes | yes (skip PyPI publish) | shared + developer host |
| Debian `.deb` | yes | yes | Debian |
| Arch `.pkg.tar.zst` | yes | yes | Arch |
| macOS app / Homebrew formula | yes | yes | macOS |
| Windows `.exe` / MSI / Store | yes | yes | Windows |

Do **not** apply the Debian carve-out to an MSI. Do **not** `pip
install` into a distro-managed interpreter (PEP 668). Do **not**
apply `ruff` to `debian/rules` as if it were Debian Policy.

Hosted libraries and applications only. MicroPython, embedded, and
free-threaded-only (no GIL) products are out of scope until a later
revision. Free-threaded 3.14 is an official *supported build*, not
this pack's default interpreter.

------------------------------------------------------------------------
Conflict resolution
------------------------------------------------------------------------

| Object | Who owns contents | Who owns placement | Who owns the queue |
|--------|-------------------|--------------------|--------------------|
| Source text, types, `eval` | Language | — | CI / code review |
| Ruff / PEP 8 / typing | Language | CI / `[tool.ruff]` | CI |
| `pyproject.toml` identity, requires-python | — | Ecosystem | PyPI or the git host |
| Lockfile / hashes | — | Ecosystem | CI (`pip-audit`, install `--require-hashes`) |
| Third-party import | Language (how you call it) | Ecosystem (**trust bar**) | PyPI + advisory DBs |
| License | — | Ecosystem (SPDX in pyproject) | OS carve-out |
| Advisories | — | Ecosystem (`pip-audit`) | OS tracker if any |
| Interpreter install | — | OS | OS package manager |
| Distro Python lag | — | OS carve-out | OS suite |
| venv vs distro site-packages | — | OS (PEP 668) | OS |
| `/usr` vs Homebrew vs Program Files | — | OS carve-out | OS packager |

Hard rules:

1. One `requires-python` per project. Do not mix 3.9 and 3.14 in one
   package without extras that are actually tested.
2. Ruff's default rule set is a **linter extra** that implements
   PEP 8 and bugbear-style checks. PEP 8 is the style convention.
   A house `select = ["ALL"]` is Clippy-restriction: do not.
3. Language and ecosystem packs do **not** require apt, pacman,
   Homebrew, or the python.org Windows installer.
4. Distro Python lag is the OS pack. It is not a reason to freeze
   `requires-python` without recording it.
5. One payload OS per artifact. Do not import Debian NEW into
   pacman, Homebrew, or MSI.
6. **Stdlib first.** A third-party library is allowed only after it
   passes the Ecosystem **trust bar**. Features you could get from
   PyPI do not outrank that bar.
7. Every installed artifact is **hash-pinned** in a lockfile. Unpinned
   `pip install foo` is not a ship path.
8. `pip-audit` (or equivalent OSV) is the advisory gate. A known
   unfixed vuln in a direct or transitive dep is a stall.
9. Extra package indexes are denied unless named, hashed, and
   documented. Typosquat risk lives on PyPI; a second index is worse
   unless you control it.
10. Do not copy PyPI yank into apt/pacman. Do not copy an OS
    generative-AI rule into `twine upload`.

------------------------------------------------------------------------
Official map vs audit extra vs trust bar
------------------------------------------------------------------------

Python has **PEPs and PyPA tools**, not a single Debian Policy.

- **Official map** — Language Reference, PEPs, PyPA packaging
  guides, PyPI policies, pip hash-checking, PEP 668.
- **Trust bar** (this repo's security-over-features rule, labeled) —
  stdlib first; new deps documented; hashes; `pip-audit`; no extra
  indexes by default; prefer attested / trusted-publishing uploads
  when *you* publish.
- **Audit extra** — Ruff `--select ALL`, bandit, pip-audit extras,
  SBOM, OpenSSF Scorecard, uv/poetry as lock *tools* (the lock
  *contract* is Ecosystem).

A later agent must not turn Ruff `ALL` into a PEP, or `pip-audit`
into Debian Policy.

------------------------------------------------------------------------
What each pack is
------------------------------------------------------------------------

[python-language-policy.md](python-language-policy.md)

What Python requires of the *code*: version dialect, stdlib security
APIs, typing, PEP 8, tests. Not PyPI. Not apt.

[python-ecosystem-policy.md](python-ecosystem-policy.md)

How a project *lives*: `pyproject.toml`, lockfiles and hashes, PyPI,
the **trusted-library bar**, `pip-audit`. uv/poetry labeled as tools.

[python-os-policy.md](python-os-policy.md)

How an interpreter exists on a system. Shared: venv, PEP 668.
Carve-outs: Debian, Arch, macOS, Windows.

------------------------------------------------------------------------
Adding another language
------------------------------------------------------------------------

Do not fold Rust or C into these files. Those families live at
[../rust](../rust/README.md) and [../c](../c/README.md). Add a new
language as a new directory under [program-language/](../). Debian
Policy and the HIG live in [os/linux](../../os/linux/README.md).
To add Fedora or NixOS as a *Python* carve-out, add a section to
the OS pack.

## Files

| File | Function |
|------|----------|
| [pylintrc](pylintrc) | Starter pylint config an adopter copies into a Python package |

------------------------------------------------------------------------
Pins
------------------------------------------------------------------------

Official manuals remain the authority. This table records the pin that was read. It does not fetch.

| Source | Pin | Pack | Read |
|--------|-----|------|------|
| [Status of Python versions](https://devguide.python.org/versions/) | `3.14` | [python-language-policy.md](python-language-policy.md), [python-os-policy.md](python-os-policy.md), [README.md](README.md) | 2026-08-29 |
| [PEP 790 Python 3.15 release schedule](https://peps.python.org/pep-0790/) | `2026-10-01` | [python-language-policy.md](python-language-policy.md), [README.md](README.md) | 2026-08-29 |
| [PEP 8](https://peps.python.org/pep-0008/) | `Style Guide for Python Code` | [python-language-policy.md](python-language-policy.md) | 2026-08-29 |
| [PEP 668 externally managed environments](https://peps.python.org/pep-0668/) | `EXTERNALLY-MANAGED` | [python-os-policy.md](python-os-policy.md), [python-ecosystem-policy.md](python-ecosystem-policy.md) | 2026-08-29 |
| [PEP 621 project metadata](https://peps.python.org/pep-0621/) | `pyproject.toml` | [python-ecosystem-policy.md](python-ecosystem-policy.md) | 2026-08-29 |
| [PEP 751 pylock.toml](https://peps.python.org/pep-0751/) | `pylock.toml` | [python-ecosystem-policy.md](python-ecosystem-policy.md) | 2026-08-29 |
| [pip secure installs (hash-checking)](https://pip.pypa.io/en/stable/topics/secure-installs/) | `require-hashes` | [python-ecosystem-policy.md](python-ecosystem-policy.md) | 2026-08-29 |
| [PyPI trusted publishing](https://docs.pypi.org/trusted-publishers/) | `Trusted Publishing` | [python-ecosystem-policy.md](python-ecosystem-policy.md) | 2026-08-29 |
| [PyPI attestations](https://docs.pypi.org/attestations/) | `attestations` | [python-ecosystem-policy.md](python-ecosystem-policy.md) | 2026-08-29 |
| [pip-audit](https://github.com/pypa/pip-audit) | `pip-audit` | [python-ecosystem-policy.md](python-ecosystem-policy.md) | 2026-08-29 |
| [PyPA packaging guide](https://packaging.python.org/en/latest/) | `Python Packaging User Guide` | [python-ecosystem-policy.md](python-ecosystem-policy.md) | 2026-08-29 |
| [ssl — TLS/SSL wrapper](https://docs.python.org/3/library/ssl.html) | `create_default_context` | [python-language-policy.md](python-language-policy.md) | 2026-08-29 |
| [Debian Python Policy](https://www.debian.org/doc/packaging-manuals/python-policy/) | `Python` | [python-os-policy.md](python-os-policy.md) | 2026-08-29 |
| [ArchWiki Python](https://wiki.archlinux.org/title/Python) | `python-pip` | [python-os-policy.md](python-os-policy.md) | 2026-08-29 |
| [PEP 773 Python Installation Manager for Windows](https://peps.python.org/pep-0773/) | `Python Installation Manager` | [python-os-policy.md](python-os-policy.md) | 2026-08-29 |
| [Using Python on Windows](https://docs.python.org/3/using/windows.html) | `Python install manager` | [python-os-policy.md](python-os-policy.md) | 2026-08-29 |
------------------------------------------------------------------------
Document history
------------------------------------------------------------------------

| Version | Notes |
|---------|--------|
| 1.0.3 | The index names pylintrc. |
| 1.0.2 | Pin table replaces sources.yaml. |
| 1.0.0 | Initial three-pack split. Security-over-features: trusted-library bar, hash pins, pip-audit. OS carve-outs Debian/Arch/macOS/Windows. |
