<!--
═══════════════════════════════════════════════════════════════════
                        QUICKSTART.md
            The Map — Operational Truth Layer of CSC
═══════════════════════════════════════════════════════════════════

PROJECT CONTEXT:
────────────────
This file is the empirical interface for the CSC framework repo.
It owns operational truth: how to run, where things live, and how
to prove the system is functioning. It is the third file in the
mandatory reading order.

CRITICAL INVARIANTS — DO NOT BREAK THESE:
──────────────────────────────────────────

1. THIS FILE OWNS OPERATIONAL TRUTH ONLY.
   • Run commands, file paths, verification steps → this file.
   • Invariants and boundaries → CONTRACT.md.
   • Governance logic and artifact relationships → WHY.md.
   • DO NOT add architectural laws or planning items here.
   • BREAKING THIS scatters operational truth across artifacts.

2. THE SYSTEM MAP TABLE MUST REFLECT ACTUAL PROJECT FILES.
   • Generic stack examples below are scaffolding for adopters.
   • When this repo gains runnable components, update the table.
   • DO NOT leave placeholder paths as if they are real.
   • BREAKING THIS causes agents to probe non-existent entry points.

3. PROVEN CHECKS MUST BE EXECUTABLE, NOT ASPIRATIONAL.
   • Every check listed must be runnable against this repo as-is.
   • If a check cannot yet be run, mark it explicitly as PENDING.
   • DO NOT list checks that silently pass because nothing exists.
   • BREAKING THIS gives false confidence in a passing-but-empty loop.

KNOWN ISSUES:
─────────────
• System Map table currently contains generic scaffolding examples.
  This repo is a documentation-only framework; no runnable entry
  point exists yet. Table should be updated when one is introduced.
• Proven Checks are generic. No project-specific CI or test runner
  is configured at time of first stewardship pass (2026-04-30).

═══════════════════════════════════════════════════════════════════
-->

# QUICKSTART.md — The Map (Operational Truth)

> **"A map is not the territory, but without one, the traveler is lost. In an agentic system, the map is the interface between intent and execution."**

## 🏛️ Purpose of This Artifact

In the **contract-style-comments** (CSC) framework, `QUICKSTART.md` serves as the system's **Empirical Interface**. While `CONTRACT.md` defines the laws (invariants), `QUICKSTART.md` defines the reality—how the system actually runs, where the critical components live, and how to prove that the system is still functioning as intended.

For a stateless AI agent, this file is the "Onboarding Manual" that prevents wasteful exploration and ensures every change is verified against a known-good baseline.

---

## 🧩 Required Reading Order (The Synchronization)

To prevent "Contextual Drift" and ensure the agent understands the system's operational boundaries, this sequence is mandatory at the start of every session:

1.  **[CONTRACT.md](CONTRACT.md)**: Internalize the laws and invariants.
2.  **[WHY.md](WHY.md)**: Understand the governance and pedagogy.
3.  **[QUICKSTART.md](QUICKSTART.md)**: Synchronize with the operational map and verification steps.
4.  **[FUTURE.md](FUTURE.md)**: Optionally review roadmap intent after operational synchronization (standby, non-binding).

---

## 🗺️ The System Map (Key Components)

<!-- INVARIANT: This table reflects the CSC repo itself. It is a documentation-only
     framework. No runnable entry point exists yet. Update this table when one is
     introduced. Generic stack examples below are scaffolding for adopters only. -->

*This repo is a documentation framework. The table below is scaffolding for adopters — replace with your project's actual file paths.*

| Area | Canonical File(s) | Role / System Interaction |
|---|---|---|
| **Governance Law** | `CONTRACT.md` / `./contract/CONTRACT.md` | Invariants and architectural boundaries. |
| **Governance Reasoning** | `WHY.md` / `./contract/WHY.md` | Teleology, artifact relationships, narrowest-scope rule. |
| **Operational Map** | `QUICKSTART.md` / `./contract/QUICKSTART.md` | Run steps, key files, proven checks. |
| **Roadmap Queue** | `FUTURE.md` / `./contract/FUTURE.md` | Standby planned intent, non-binding. |
| **Public README** | `README.md` | Human/agent onboarding, AI integration prompts. |

### Common Stack Examples (scaffolding for adopters)

**For a Node.js/Express App:**
| Area | Canonical File(s) | Role / System Interaction |
|---|---|---|
| **Entry Point** | `server.js` | Starts the Express server and loads routes. |
| **Business Logic** | `src/controllers/` | Handles request logic and data processing. |
| **Data Layer** | `models/` | Defines database schemas and queries. |
| **API/Interface** | `routes/` | Exposes endpoints for client interactions. |

**For a Python/Django App:**
| Area | Canonical File(s) | Role / System Interaction |
|---|---|---|
| **Entry Point** | `manage.py` | Django's command-line utility for running the app. |
| **Business Logic** | `views.py` | Processes requests and returns responses. |
| **Data Layer** | `models.py` | Defines ORM models for the database. |
| **API/Interface** | `urls.py` | Maps URLs to views. |

**For a React App:**
| Area | Canonical File(s) | Role / System Interaction |
|---|---|---|
| **Entry Point** | `src/index.js` | Renders the root React component. |
| **Business Logic** | `src/components/` | Reusable UI components and logic. |
| **Data Layer** | `src/services/` | API calls and state management. |
| **API/Interface** | `public/` | Static assets served to users. |

---

## 🧪 Proven Checks (Verification Loop)

<!-- INVARIANT: Checks must be executable against this repo as-is.
     Checks that cannot yet run must be marked PENDING.
     Do not list checks that pass vacuously because nothing exists. -->

A system is only as reliable as its verification process. Every session must conclude with a "Proven Check" to ensure the `CONTRACT.md` remains intact.

1.  **Governance Check** *(active)*: Confirm all four Triumvirate files exist at `./contract/` and that each carries a valid `LAST REVIEWED` stamp with `SIGNATURE`.
2.  **Automated Tests** *(PENDING — no test runner configured)*: When a test suite is added, run it and verify 100% pass rate.
3.  **State Verification** *(PENDING — no runnable system)*: Verify that a specific input results in the expected output without violating any invariants.

### Falsifiability Checklist

For each high-impact contract statement, define:

1. **Claim**: the exact invariant/precondition/postcondition being asserted.
2. **Counterexample**: what evidence would prove the claim false.
3. **Check Method**: how to test it (test case, `curl` probe, linter/static check, runtime assertion).
4. **Owner Artifact**: where the claim is governed (`CONTRACT.md`) and where checks are runbooked (`QUICKSTART.md`).

**Active example for this repo:**
```
Claim: All four Triumvirate files carry a LAST REVIEWED stamp with SIGNATURE.
Counterexample: Any file missing the stamp or signature field.
Check: grep -r "LAST REVIEWED" ./contract/ | grep -v "SIGNATURE" → should return empty.
Owner: CONTRACT.md §Governance (Stamp Signature Rule); QUICKSTART.md (this section).
```

### First-Party Verification Preference

Before asking humans for browser screenshots or DevTools dumps, run first-party checks when possible (`curl`, endpoint probes, reproducible shell commands, code-path inspection). Ask for human-captured evidence only when the required signal is browser-only or account-specific.

---

## ⚖️ The Narrowest-Scope Rule (Operational)

In the CSC framework, this file owns **operational truth**.

- **Update this file** when a file is moved, a new script is added, or a new verification step is discovered.
- **Do NOT update this file** for architectural changes or laws—those belong in `CONTRACT.md`.
- **Do NOT update this file** for planning-only ideas—those belong in `FUTURE.md`.
- **Instruction**: "If you add a tool, register it in the Key Files table. If you find a new way to break the system, add it to the Proven Checks."

---

## 🤝 The Agentic Handshake (Proof of Work)

**The Verification Steward**: Within an active user session, the AI agent is authorized to update this map.

-   **Responsibility**: No code change is considered "Proven" until it has passed the checks listed here.
-   **Drift Prevention**: If an agent discovers that a listed check is obsolete, it is expected to update the check immediately to reflect the new system reality.

---

## 🕒 Last Reviewed & Trigger

- **LAST REVIEWED**: 2026-04-30-STEWARDSHIP  SIGNATURE: Kiro (Amazon Kiro)
- **REVIEW TRIGGER**: Update this file whenever the project structure changes, new tools are introduced, or a more effective verification method is developed.

---

*Part of the `contract-style-comments` framework. For the full architectural manifesto, visit [WhatsOnYourBrain.com](https://whatsonyourbrain.com).*
