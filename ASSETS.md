# ASSETS.md — The Visual & Binary Plane (Presentation Invariants)

> **"A system's code defines what it does; its assets define who it is. Code correctness is hollow if the presentation layer decays."**

## Purpose of This Artifact

In the **contract-style-comments** (CSC) framework, `ASSETS.md` serves as the system's **Presentation Law**. It bridges the logic-presentation gap by governing the visual, brand, and media assets of the system. 

It explicitly solves two critical system failure modes:
1. **Visual Silent Regressions (VSRs):** Incidents where the codebase compiles perfectly and routes return `200 OK`, but visual primitives (logos, color palettes, sizing parameters, SVG viewboxes) break silently, diluting or fracturing the brand.
2. **Sensory Deficit of Stateless Development:** The absolute inability of a stateless AI coding agent to "see" or verify visual layout correctness, causing it to confidently hallucinate asset paths, dimensions, or styling attributes.

---

## Required Reading Order

`ASSETS.md` is a **Supplemental Invariant File**. If the current task touches branding, UI assets, favicons, stylesheets, or OGP preview cards, this file must be synchronized alongside the core Triumvirate:

1.  **[CONTRACT.md](CONTRACT.md)** (The Law)
2.  **[WHY.md](WHY.md)** (The Reasoning)
3.  **[QUICKSTART.md](QUICKSTART.md)** (The Map)
4.  **[ASSETS.md](ASSETS.md)** (The Visual Law)
5.  **[FUTURE.md](FUTURE.md)** (The Roadmap - Non-binding)

---

## Presentation Invariants (The Visual Law)

> **Modify this section to define the exact visual constraints of your specific project.**

### 1. Canonical Asset Registry
- **Rule:** Every active visual asset used for brand representation, favicon arrays, or social share cards MUST be explicitly registered here.
- **Prohibition:** Do not use dynamic or untracked local images for core identity unless registered in the approved assets list below.
- **Example Approved Asset List:**
  - `/assets/images/brand-logo-2026-05-17-PRIMARY.svg` — Primary high-contrast SVG wordmark.
  - `/assets/images/brand-ogp-2026-05-17-DARK.png` — Landscape OGP social preview card (`1200x630`).

### 2. OGP & Social Share Constraints
- **Invariant (Sizing):** Default OGP assets MUST remain landscape, ideally rendered at exactly `1200x630` pixels to fit major scrapers.
- **Invariant (Size Limit):** Social card assets MUST remain below `300KB` to survive aggressive scraper timeout limits.
- **Postcondition:** `twitter:image` tags in the document head MUST perfectly mirror the effective `og:image` URL.

### 3. Multi-Tenant Identity Mappings
- **Rule:** If the application resolves multiple hostnames or domains, the mapping of brand identities to hostnames must be explicitly declared.
- **Prohibition:** A fallback brand identity (e.g. logo, primary colors) must never bleed into a secondary tenant's domain rendering under any client state.

### 4. Date-Based Identifier Rules
- **Rule:** All newly introduced design/visual variants involving dates must use the exact shape `YYYY-MM-DD-QUALIFIER` (e.g., `2026-05-17-PRIMARY`) to prevent LLM agents from assuming file paths are auto-incrementing integers.

---

## Governance

1. **Stewardship:** The active AI agent is the steward of this file and must update the registry before completing any task that adds, removes, or alters a visual primitive.
2. **Narrowest-Scope:** If you modify route parameters or database tables, go to `CONTRACT.md`. If you modify an OGP card, a logo, or a style token, update `ASSETS.md`.

---

## Last Reviewed & Trigger

- **LAST REVIEWED:** YYYY-MM-DD-QUALIFIER
- **REVIEW TRIGGER:** Update this file whenever a favicon, logo, OGP card, visual branding asset, or tenant color schema is modified or introduced.

---

*Part of the `contract-style-comments` framework. For the full systems-thinking architectural manifesto, visit [WhatsOnYourBrain.com](https://whatsonyourbrain.com).*
