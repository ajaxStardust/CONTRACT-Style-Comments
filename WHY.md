# WHY.md — The Reasoning (Teleology)

> **"A stale contract is worse than no contract because it creates false confidence in a failing system."**

## Purpose of This File

This file explains the **teleology** — the "why" — of the `contract-style-comments` framework. In a systems-thinking approach, a complex codebase is a set of interacting parts that tend toward entropy. To manage this, information is separated based on its **rate of change** and its **logical scope**.

By splitting the project's memory into three distinct artifacts (the Agentic Trivium), we create a stable feedback loop for AI agents and human collaborators alike.

---

## The Core Relationship (The Agentic Trivium)

The system is maintained through three primary artifacts:

1.  **[CONTRACT.md](CONTRACT.md) — The Law**: Owns the invariants. These are the system's hard boundaries — what it *is* and what must *never* break. This changes the least.
2.  **[QUICKSTART.md](QUICKSTART.md) — The Map**: Owns the operational truth. This is the empirical interface — how to run, how to verify, and where things live. This changes frequently as the system grows.
3.  **THIS FILE ([WHY.md](WHY.md)) — The Reasoning**: Owns the logic. It defines the relationship between the other two and the governance rules that keep them accurate. (Teleology here means the study of purpose or goals—why these docs exist and how they connect.)

---

## Required Reading Order

To prevent contextual drift — where an agent begins making confident guesses based on incomplete data — the following reading order is mandatory at the start of every session:

1.  **CONTRACT.md**: Establish the constraints. Know what must not break.
2.  **WHY.md**: Understand the governance. Know how to update the system's memory.
3.  **QUICKSTART.md**: Synchronize with the current state. Know how to prove the system works.

---

## The Narrowest-Scope Update Rule

Changes should have the minimal necessary impact on documentation. This rule prevents documentation bloat and ensures that every reader — human or agent — knows exactly where to find a specific type of truth.

- **Change to an invariant, route, or boundary?** → Update `CONTRACT.md`.
- **Change to a run command, key file, or verification check?** → Update `QUICKSTART.md`.
- **Change to the relationship between docs or the governance policy?** → Update `WHY.md`.

---

## Ownership & Governance

Within an active session, the AI agent is not merely a coder — it is a **Governance Steward**.

- **Authorization**: The agent is authorized to update these artifacts autonomously when it detects a change in the system's state.
- **Responsibility**: No code change is considered done until the corresponding update has been made to the narrowest owning artifact.
- **Missing Axioms**: If the agent discovers a hidden assumption that was not documented, it is expected to surface the axiom by adding it to `CONTRACT.md`.

---

## Last Reviewed & Trigger

- **LAST REVIEWED**: 2026-03-24
- **REVIEW TRIGGER**: Update this file when the relationship between artifacts or the governance ownership policy changes.

---

*Part of the `contract-style-comments` framework. Visit [WhatsOnYourBrain.com](https://whatsonyourbrain.com) for the full architectural manifesto.*
