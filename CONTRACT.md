# CONTRACT.md — The Invariants (The Law)

> **"A system's boundaries define its identity. To change the system, you must first understand its constraints."**

## 🏛️ Purpose of This Artifact

In the **contract-style-comments** (CSC) framework, `CONTRACT.md` serves as the system's **Persistent Memory Layer**. It defines the "No-Fly Zones"—the critical invariants, architectural boundaries, and logical guarantees that must remain true across all development sessions.

While code changes rapidly, the **Contract** represents the stable laws of the system. For a stateless AI agent, this file is the "Pre-flight Checklist" that prevents hallucinations and architectural drift.

---

## 🧩 Required Reading Order (The Synchronization)

To ensure the agent is fully synchronized with the system's current state, the following sequence is mandatory at the start of every session:

1.  **[CONTRACT.md](CONTRACT.md)**: Establish the invariants and boundaries.
2.  **[WHY.md](WHY.md)**: Understand the relationship between artifacts and the governance rules.
3.  **[QUICKSTART.md](QUICKSTART.md)**: Verify the current operational state and key file map.

---

## ⚖️ System Invariants (The Law)

*Modify this section to define the "laws" of your specific project.*

### 1. Architectural Boundaries
- **Rule**: Define the "What" and the "Must."
- **Example**: "The frontend must communicate with the backend exclusively through the `/api/v1` namespace."
- **Invariant**: Do not introduce direct database calls from the view layer.

### 2. Data Integrity & State
- **Rule**: Define the shape and expectations of data.
- **Example**: "The `User` object must always contain a verified `uuid` before reaching the billing service."
- **Invariant**: Do not modify the `User` schema without updating the matching validation contract.

### 3. Critical Route/Logic Chains
- **Rule**: Identify the "Paths of Least Resistance" that must not be blocked.
- **Example**: "The `/health` check must return a `200 OK` even if the database is in read-only mode."
- **Invariant**: Do not add middleware to the health-check route that requires a database connection.

---

## 🤝 The Agentic Handshake (Governance)

**The Governance Steward**: Within an active user session, the AI agent is authorized—and expected—to act as the **Steward of the Contract**.

1.  **Authorization**: The agent may propose updates to this file when a new system invariant is discovered or an old one is intentionally retired.
2.  **Responsibility**: No scope-affecting code change is complete until the corresponding invariant is reflected here.
3.  **The Narrowest-Scope Rule**: Update this file only if the change affects an **Invariant, Route, or Boundary**. If the change is operational, use `QUICKSTART.md`.

---

## 🕒 Last Reviewed & Trigger

-   **LAST REVIEWED**: 2026-03-24
-   **REVIEW TRIGGER**: Update this file whenever a core system invariant, architectural boundary, or critical logic chain is modified.

---

*Part of the `contract-style-comments` framework. For the full architectural manifesto, visit [WhatsOnYourBrain.com](https://whatsonyourbrain.com).*```
