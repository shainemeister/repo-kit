# P5b unique-rule ledger

Parent snapshot **2026-08-21**. Do not slim style-gate command catalogs, verify table, or security inventory/SAST tables.

## kit/rules/authoring-and-style.md (1.2.0)

**ANCHORS:** `#summary` `#documentation-rules` `#formatting-and-style` `#python-style-gate-pylint` `#rust-style-gate-rustfmt--clippy` `#c--c-style-gate-clang-format--clang-tidy` `#other-language-style-gates` `#document-history`

**UNIQUE (keep command strings, pass criteria, adopt steps):**
- Follow MARKDOWN-STANDARD required core; landing exception
- Cite don’t reprint; last citation
- Declared style gates only; not product runtime deps
- Python pylint: 10.00/10, pylintrc, command, when to run
- Rust rustfmt+clippy commands and pass (exit 0, not 10.00)
- C/C++ clang-format+clang-tidy; compile_commands.json required
- Other languages: declare one primary gate
- Inventory is the on/off switch

**CITES:** density, contracts, security inventory, verification table

## kit/rules/verification-and-ops.md (1.7.0)

**ANCHORS:** `#summary` `#verification-before-ship` `#completion-rule` `#before-marking-work-complete` `#maintenance-cadence` `#anti-patterns` `#contributor-checklist` `#document-history`

**UNIQUE (keep verify table rows and contributor checklist):**
- Do not mark complete if declared Domain A/B skipped/failed
- Docs-only: author checklist + links + last citations
- Completion rule; missing tools = fail
- Before-complete ordered steps
- Cadence table
- Contributor checklist including density items added in 1.7.0

**CITES:** security inventory, authoring commands, contracts, workboard, MARKDOWN-STANDARD

## kit/rules/security.md (1.1.0)

**ANCHORS:** `#summary` `#security-baseline` `#security-documentation-modularity` `#language-surface-inventory` `#security--sast-gates-required-when-declared` `#security-and-code-validation-certification` (and any `#certificate-shape-illustrative`)

**UNIQUE (do not slim inventory or SAST catalog tables):**
- Privilege / network / secrets / deps / host policy baseline
- SECURITY.md modularity: omit when no execution/network/privilege/secrets
- Language surface inventory catalog (all rows are the catalog)
- Domain A gates table (Bandit, pip-audit, cargo-audit, cppcheck, etc.)
- Certification single-folder, gitignore outputs, not a product launcher

**CITES:** authoring Domain B detail, verification completion, contracts
