# WHY.md — The Systems-Thinking Pedagogy

> **"A stale contract is worse than no contract because it creates false confidence in a failing system."**

## 🏛️ The Purpose of the Split

This file explains the **Teleology** (the "Why") of the `contract-style-comments` framework. In a systems-thinking approach, we recognize that a complex codebase is a set of interacting parts that tend toward entropy. To manage this, we separate information based on its **rate of change** and its **logical scope**.

By splitting our project's "memory" into three distinct artifacts (The Trivium), we create a stable feedback loop for AI agents and human collaborators.

---

## 🧩 The Core Relationship (The Triumvirate)

The system is maintained through three primary inputs:

1.  **[CONTRACT.md](CONTRACT.md) (The Invariants)**: Owns the "Law." These are the system's hard boundaries—what it *is* and what must *never* break. This changes the least.
2.  **[QUICKSTART.md](QUICKSTART.md) (The Operational Truth)**: Owns the "Map." This is the empirical interface—how to run, how to verify, and where things live. This changes frequently as the system grows.
3.  **THIS FILE ([WHY.md](WHY.md)) (The Reasoning)**: Owns the "Logic." It defines the relationship between the other two and the governance rules that keep them accurate.

---

## 🛰️ Required Reading Order (The Synchronization)

To prevent "Contextual Drift" (where an AI agent begins making confident guesses based on incomplete data), the following reading order is **Mandatory** at the start of every session:

1.  **CONTRACT.md**: Establish the constraints. Know the "No-Fly Zones."
2.  **WHY.md**: Understand the governance. Know how to update the system's memory.
3.  **QUICKSTART.md**: Synchronize with the current state. Know how to prove the system works.

---

## ⚖️ The Narrowest-Scope Update Rule

In a healthy system, changes should have the **minimal necessary impact** on the documentation. This rule prevents "Documentation Bloat" and ensures that the agent always knows exactly where to look for a specific type of truth.

*   **Change to an Invariant, Route, or Boundary?** -> Update `CONTRACT.md`.
*   **Change to a Run Command, Key-File, or Verification Check?** -> Update `QUICKSTART.md`.
*   **Change to the Relationship between docs or the Governance Policy?** -> Update `WHY.md`.

---

## 🤝 Ownership & Governance

**The Agentic Handshake**: Within an active user session, the AI agent is not merely a "coder"—it is a **Governance Steward**. 

*   **Authorization**: The agent is authorized to update these artifacts autonomously when it detects a change in the system's state.
*   **Responsibility**: No code change is considered "Done" until the corresponding update has been made to the narrowest owning artifact.
*   **Missing Axioms**: If the agent discovers a hidden assumption that wasn't documented, it is expected to "surface the axiom" by adding it to the `CONTRACT.md`.

---

## 🕒 Last Reviewed & Trigger

*   **LAST REVIEWED**: 2026-03-24
*   **REVIEW TRIGGER**: Update this file when the relationship between artifacts or the governance ownership policy changes.

---

*Part of the `contract-style-comments` framework. Visit [WhatsOnYourBrain.com](https://whatsonyourbrain.com) for the full architectural manifesto.*
