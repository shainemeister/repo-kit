---
title: Security and Code Validation Certification Plan
description: Historical product-oriented concept; superseded by portable policy in RULES.md.
version: "0.2.0"
status: deprecated
audience:
  - developers
  - security
doc_type: other
related:
  - RULES.md
  - CHANGELOG.md
  - templates/TEMPLATE-CERTIFICATION-README.md
last_updated: "2026-07-28"
---

# Security and Code Validation Certification Plan

> **Superseded.** The portable security and code-validation certification framework now lives in **[RULES.md](./RULES.md)**:
>
> - [Language surface inventory](./RULES.md#language-surface-inventory)  
> - [Security / SAST gates (required when declared)](./RULES.md#security--sast-gates-required-when-declared)  
> - [Security and code-validation certification](./RULES.md#security-and-code-validation-certification)  
> - [Completion rule](./RULES.md#completion-rule) · [Before marking work complete](./RULES.md#before-marking-work-complete)  
>
> Operator README skeleton: [templates/TEMPLATE-CERTIFICATION-README.md](./templates/TEMPLATE-CERTIFICATION-README.md).  
> **Do not** treat this file as an alternate implementation authority.

**Document version:** 0.2.0  
**Status:** deprecated — concept absorbed into RULES 1.4.0+  

---

## Summary

| Item | Status |
|------|--------|
| Original concept | Developer self-attestation (JSON + TXT) for security **and** code validation under a single `certification/` folder |
| Kit authority | **RULES.md** (portable, language-inventory–driven) |
| Runnable harness | Still **deferred** (optional future kit or project runner) |
| Product-specific paths | Not part of the kit (e.g. monorepo package names were illustrations only) |

---

## What was absorbed

| Principle from this plan | Where it lives now |
|--------------------------|--------------------|
| Dual domains (Security + Code validation) | RULES — Certification domains |
| Single `certification/` folder; one cert pair | RULES — Single-folder rule |
| Git-bound self-attestation; not third-party audit | RULES — Certification summary |
| Developer-only tooling; no product CLI gate | RULES — SAST + certification |
| OverallPass = critical checks + no missing required tools | RULES — Domains and OverallPass |
| Language-scoped tools (not one product stack) | RULES — Language surface inventory (full catalog) |
| Declared gates before complete | RULES — Completion rule |

---

## Document history

| Version | Notes |
|---------|--------|
| 0.2.0 | Deprecated; pointer to RULES 1.4.0 portable framework; product-specific deferred harness notes removed as authority |
| 0.1.0 | Initial principle concept (product-oriented draft; implementation deferred) |
