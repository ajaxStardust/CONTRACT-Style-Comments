# ASSETS.md — The Presentation & Binary Invariants (The Resource & Asset Plane)

> **"Code defines the execution flow; resources define the boundary state. A system compiling with perfect type-safety is still broken if its static assets or binary dependencies are corrupted."**

## Purpose of This Artifact

In the **contract-style-comments** (CSC) framework, `ASSETS.md` serves as the system's **Resource Layer**. It bridges the logic-resource gap by governing the visual media, static binaries, model weights, local resource databases, design styling, and other non-executable dependencies of the system.

It is designed as a universal tool for **all coding developers**—from web and mobile applications to embedded firmware systems, ML pipelines, and game development environments. It explicitly resolves two core systemic failure modes:

1. **Presentation & Binary Silent Regressions (PBSRs):** Incidents where the codebase compiles perfectly, database schemas pass validation, and test runners exit `0`, but the system's static dependencies (UI media, customized graphic assets, compiled static libraries, ML model files, or local hardware registry assets) break silently or fall out of alignment.
2. **Sensory Deficit of Stateless Development:** The absolute inability of stateless AI coding agents to visually, aurally, or physically verify assets, causing them to confidently fabricate asset paths, byte offsets, binary resolutions, or visual attributes when working outside of raw text and code parameters.

---

## Required Reading Order

`ASSETS.md` is a **Supplemental Invariant File**. If the current task modifies visual layouts, static binaries, localization resources, ML weight references, or dynamic assets, this file must be synchronized alongside the core Triumvirate:

1.  **[CONTRACT.md](CONTRACT.md)** (The Law)
2.  **[WHY.md](WHY.md)** (The Reasoning)
3.  **[QUICKSTART.md](QUICKSTART.md)** (The Map)
4.  **[ASSETS.md](ASSETS.md)** (The Resource Law)
5.  **[FUTURE.md](FUTURE.md)** (The Roadmap - Non-binding)

---

## Resource Invariants (Boilerplate Scaffolding)

> **Modify this section to define the exact resource constraints of your specific domain.**

### 🛠️ Domain Example A: App & Web Development (Visual Assets)
* **Canonical Asset Registry:** Every active graphic brand mark, OGP social preview card, and favicon variant must be explicitly registered below.
* **Aspect Ratio & Boundary:** Social media preview assets MUST be strictly `1200x630` pixels and under `300KB`.
* **Multi-Tenant Mappings:** Define the hostname-to-brand mapping strictly (e.g., Domain X resolves exclusively to Asset Y).

### 🤖 Domain Example B: Machine Learning & Systems (Data & Model Resources)
* **Model Weights Path:** The inference engine MUST read weights exclusively from `/models/v1/2026-05-17-STABLE.onnx`.
* **Prohibition:** Do not swap, overwrite, or mutate the active model binary without updating the matching SHA-256 hash verified in the contract.
* **Local Databases:** Governing localization files (`locale-en_US.json`) and raw layout templates.

### 🔌 Domain Example C: Embedded & Systems Engineering (Binary Blobs & Firmware Primitives)
* **Static Libraries:** The compiler must link to statically registered binary targets under `/lib/arch64/`.
* **Hardware Register Map:** Explicitly map physical visual register layouts or custom vector graphics stored in EEPROM space.

### 📚 Domain Example D: Pedagogical & Multi-Agent Persona Assets
* **Canonical Asset Registry:** Every persona portrait, cast card, and workflow diagram used to teach or coordinate multi-agent roles must be registered below.
* **Role Binding Invariant:** Visual persona assets must map unambiguously to documented CSC roles (e.g., Worker, Conductor, Adjudicator) and must not introduce conflicting role names in governance files.
* **Source Preservation:** Vector or editable raster sources for persona sets must be retained alongside rendered outputs so that future revisions preserve the visual identity without re-fabrication.
* **Example cast:** A four-worker persona set (Stores-It, Solves-It, Builder, Rescues-It) plus an adjudicator persona (Cue) used to teach the Conductor-Worker pattern in a Spec-Driven Development context.

---

## Date-Based Identifier Rules (Universal)

* **Rule:** All newly introduced visual variant assets, resource folders, or binary variants involving dates must use the exact shape `YYYY-MM-DD-QUALIFIER` (e.g., `2026-05-17-PRIMARY`) to prevent LLM agents from assuming file paths are auto-incrementing integers.

---

## Governance

1. **Stewardship:** The active AI agent is the steward of this file and must update the registry before completing any task that adds, removes, or alters a static resource, visual layout, or binary variant.
2. **Narrowest-Scope:** If you modify execution flow or code boundaries, use `CONTRACT.md`. If you modify a visual card, style token, model weight path, or compiled static target, update `ASSETS.md`.

---

## Last Reviewed & Trigger

- **LAST REVIEWED:** YYYY-MM-DD-QUALIFIER
- **REVIEW TRIGGER:** Update this file whenever a static asset, binary target, UI layout, localization file, or graphic resource is introduced, replaced, or retired.

---

*Part of the `contract-style-comments` framework. For the full systems-thinking architectural manifesto, visit [WhatsOnYourBrain.com](https://whatsonyourbrain.com).*
