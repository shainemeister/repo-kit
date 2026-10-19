---
title: "Align pack leads"
description: "Make the lead under each current platform title the first sentence of that file's description."
version: "1.0.0"
status: current
doc_type: other
last_updated: "2026-10-19"
---

# Align pack leads

Make the lead under each current platform title the first sentence of that file's description.

The author checklist is the gate. Archive copies under `os/linux/archive/` and `program-language/rust/archive/` stay as they are.

Current files whose lead and description disagree:

| Family | Files |
|--------|-------|
| macOS | `README.md`, `app-store-application-policy.md`, `app-store-os-policy.md`, `direct-application-policy.md`, `direct-os-policy.md` |
| Linux | `README.md`, `debian-application-policy.md`, `debian-os-policy.md`, `gnome-application-policy.md`, `gnome-os-policy.md` |
| C/C++ | `README.md`, `c-ecosystem-policy.md`, `c-language-policy.md`, `c-os-policy.md` |
| Rust | `README.md`, `rust-ecosystem-policy.md`, `rust-language-policy.md`, `rust-os-policy.md` |
| Node | `README.md`, `node-ecosystem-policy.md`, `node-language-policy.md`, `node-os-policy.md` |
| Python | `README.md`, `python-ecosystem-policy.md`, `python-language-policy.md`, `python-os-policy.md` |

Paths are under `docs/library/platforms/os/` and `docs/library/platforms/program-language/`. Keep each file's owned facts. Change the lead or the description so the first sentence is the same. Bump `version` and `last_updated` on each file this edit changes.
