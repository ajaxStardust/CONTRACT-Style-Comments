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

---

## 🗺️ The System Map (Key Components)

*Modify this table to reflect the specific architecture of your project.*

| Area | Canonical File(s) | Role / System Interaction |
|---|---|---|
| **Entry Point** | `index.php` / `main.py` | The primary bootstrap for the system state. |
| **Business Logic** | `src/Model/` | Where the core transformations and invariants are implemented. |
| **Data Layer** | `schema.sql` / `config.json` | The persistent state that the system must respect. |
| **API/Interface** | `src/API/` | The boundary through which the system interacts with external agents. |

### Common Stacks Examples

To get started, here are pre-filled examples for popular frameworks. Replace with your project's details.

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

A system is only as reliable as its verification process. Every session must conclude with a "Proven Check" to ensure the `CONTRACT.md` remains intact.

1.  **Automated Tests**: Run `npm test` or `pytest` and verify 100% pass rate.
2.  **State Verification**: Verify that a specific input (e.g., `X`) results in the expected output (e.g., `Y`) without violating any invariants.
3.  **Governance Check**: Ensure that if a scope-affecting change was made, the matching documentation artifact has been updated.

---

## ⚖️ The Narrowest-Scope Rule (Operational)

In the CSC framework, this file owns **operational truth**.

- **Update this file** when a file is moved, a new script is added, or a new verification step is discovered.
- **Do NOT update this file** for architectural changes or laws—those belong in `CONTRACT.md`.
- **Instruction**: "If you add a tool, register it in the Key Files table. If you find a new way to break the system, add it to the Proven Checks."

---

## 🤝 The Agentic Handshake (Proof of Work)

**The Verification Steward**: Within an active user session, the AI agent is authorized to update this map. 

-   **Responsibility**: No code change is considered "Proven" until it has passed the checks listed here.
-   **Drift Prevention**: If an agent discovers that a listed check is obsolete, it is expected to update the check immediately to reflect the new system reality.

---

## 🕒 Last Reviewed & Trigger

-   **LAST REVIEWED**: 2026-03-24
-   **REVIEW TRIGGER**: Update this file whenever the project structure changes, new tools are introduced, or a more effective verification method is developed.

---

*Part of the `contract-style-comments` framework. For the full architectural manifesto, visit [WhatsOnYourBrain.com](https://whatsonyourbrain.com).*
