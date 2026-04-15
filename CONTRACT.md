# CONTRACT.md — The Invariants (The Law)

> **"A system's boundaries define its identity. To change the system, you must first understand its constraints."**

## Purpose of This Artifact

In the **contract-style-comments** (CSC) framework, `CONTRACT.md` serves as the system's **Law Layer**. It defines the critical invariants, architectural boundaries, preconditions, and postconditions that must remain true across development sessions.

While code changes rapidly, the **Contract** represents the stable laws of the system. Project chronology and historical memory live in **version control** (`.git`), not in this law artifact.

---

## Required Reading Order

To ensure the agent is fully synchronized with the system's current state, the following sequence is mandatory at the start of every session:

1.  **[CONTRACT.md](CONTRACT.md)**: Establish the invariants and boundaries.
2.  **[WHY.md](WHY.md)**: Understand the relationship between artifacts and the governance rules.
3.  **[QUICKSTART.md](QUICKSTART.md)**: Verify the current operational state and key file map.
4.  **[FUTURE.md](FUTURE.md)**: Optionally review planned intent after governing synchronization (non-binding queue).

---

## System Invariants (The Law)

> **Modify this section to define the laws of your specific project.**

### Contract Statement Forms (recommended)
- **INVARIANT**: A condition that must always hold while the system operates.
- **PRECONDITION**: A required condition before a function, route, or process may execute.
- **POSTCONDITION**: A guaranteed condition after successful execution.
- **PROHIBITION**: A forbidden action or architecture pattern.

Use explicit labels where possible so claims are easy to test, audit, and dispute.

### 1. Architectural Boundaries
- **Rule**: Define the "What" and the "Must."
- **Example**: "The frontend must communicate with the backend exclusively through the `/api/v1` namespace."
- **Invariant**: Do not introduce direct database calls from the view layer.
- **Customization Tip**: For a web app, add: "User authentication must use JWT tokens; no session-based auth."

### 2. Data Integrity & State
- **Rule**: Define the shape and expectations of data.
- **Example**: "The `User` object must always contain a verified `uuid` before reaching the billing service."
- **Invariant**: Do not modify the `User` schema without updating the matching validation contract.
- **Customization Tip**: For an e-commerce site, add: "Product prices must be stored in cents (integer) to avoid floating-point errors."

### 3. Critical Route/Logic Chains
- **Rule**: Identify the paths that must not be blocked.
- **Example**: "The `/health` check must return a `200 OK` even if the database is in read-only mode."
- **Invariant**: Do not add middleware to the health-check route that requires a database connection.
- **Customization Tip**: For a CMS, add: "Admin login must remain accessible even during maintenance mode."

---

## Governance

**The Governance Steward**: Within an active session, the AI agent is authorized — and expected — to act as the steward of this file.

1.  **Authorization**: The agent may propose updates when a new system invariant is discovered or an old one is intentionally retired.
2.  **Responsibility**: No scope-affecting code change is complete until the corresponding invariant is reflected here.
3.  **The Narrowest-Scope Rule**: Update this file only if the change affects an invariant, route, or boundary. If the change is operational, use `QUICKSTART.md`.
4.  **Planning Boundary**: Planned ideas and non-implemented direction belong in `FUTURE.md`, not in this law artifact.
5.  **Authority Boundary**: Governance authority remains with the Triumvirate (`CONTRACT.md`, `WHY.md`, `QUICKSTART.md`); `FUTURE.md` does not override law or runbook.
6.  **Verification Efficiency Rule**: Before asking maintainers for browser screenshots or DevTools/network captures, the agent should attempt first-party verification (`curl`, endpoint probes, config/code-path checks, reproducible shell evidence). Ask humans for browser-captured artifacts only when direct verification is genuinely unavailable (e.g., account-specific UI state, manual consent screens, or browser-only behavior).

**Enforcement Boundary (explicit):** This contract is governance law, not an auto-enforcing runtime. If a claim cannot be challenged by evidence (tests, probes, logs, reproducible checks), it risks becoming non-binding prose.

---

## Last Reviewed & Trigger

- **LAST REVIEWED**: 2026-04-15
- **REVIEW TRIGGER**: Update this file whenever a core system invariant, architectural boundary, or critical logic chain is modified.

---

*Part of the `contract-style-comments` framework. For the full architectural manifesto, visit [WhatsOnYourBrain.com](https://whatsonyourbrain.com).*
