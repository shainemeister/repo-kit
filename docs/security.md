---
title: "Security baseline"
description: "Privilege, network, secrets, and when an adopted repository needs a SECURITY.md. Language checks live in the platform packs."
version: "1.2.0"
status: current
audience:
  - developers
  - security
doc_type: other
related:
  - README.md
  - ../kit/rules/contracts.md
  - ../kit/skills/kit-apply-security/template/security.md
last_updated: "2026-10-17"
---

# Security baseline

Privilege, network, secrets, and when an adopted repository needs a `SECURITY.md`.

**Related:** [docs workspace](README.md) · [contracts](../kit/rules/contracts.md) · [security blank](../kit/skills/kit-apply-security/template/security.md)

## Baseline

| Rule | Meaning |
|------|---------|
| Privilege | Prefer the current user. Document any elevation. |
| Network | Document whether the product may reach the network or a package index. |
| Secrets | Do not commit secrets. If one leaks, rotate it. History cleanup is an incident. |
| Dependencies | Follow the dependency policy the repository declares. No silent download-and-run. |

A package `SECURITY.md` is required when that package executes, uses the network, elevates privilege, or handles secrets. A docs-only repository omits it. Trust detail stays in that file.

Repo-wide secret and multi-language scans, such as Gitleaks, belong with this baseline. They are not a programming language. Language checks and tool commands live in [platform packs](library/platforms/README.md).

An adopted repository writes its own `SECURITY.md` when the trigger applies. [security.md](../kit/skills/kit-apply-security/template/security.md) is the blank for that file.
