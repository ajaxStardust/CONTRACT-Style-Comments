<!--
═══════════════════════════════════════════════════════════════════
                        CONTRACT.md
              The Invariants — The Law Layer of CSC
═══════════════════════════════════════════════════════════════════

PROJECT CONTEXT:
────────────────
This file IS the law artifact for the contract-style-comments (CSC)
framework repo itself. It governs the governance system.

CRITICAL INVARIANTS — DO NOT BREAK THESE:
──────────────────────────────────────────

1. THE TRIUMVIRATE IS THE GOVERNING AUTHORITY.
   • CONTRACT.md, WHY.md, and QUICKSTART.md are the three governing
     artifacts. FUTURE.md is standby/non-binding.
   • DO NOT promote FUTURE.md items to law without explicit human
     authorization and a narrowest-scope update.
   • BREAKING THIS conflates planned intent with present-tense law.

2. THE CONTRACT IS NOT A PROSE COPY OF GIT HISTORY.
   • .git holds chronology. CONTRACT.md holds invariants.
   • DO NOT add change-log entries or session narratives here.
   • DO NOT timestamp every edit — use LAST REVIEWED stamps only.
   • BREAKING THIS causes contract bloat and contextual drift.

3. EVERY LAST REVIEWED LINE MUST CARRY A SIGNATURE.
   • Format: LAST REVIEWED: YYYY-MM-DD-QUALIFIER  SIGNATURE: <identity>
   • For LLM edits: include tool name and model when known.
   • NEVER use future dates unless the reason is explicitly documented.
   • BREAKING THIS makes authorship and review history unverifiable.

4. NARROWEST-SCOPE RULE IS MANDATORY.
   • Invariant/boundary change → this file only.
   • Operational/run-step change → QUICKSTART.md only.
   • Governance/relationship change → WHY.md only.
   • Roadmap/candidate change → FUTURE.md only.
   • DO NOT scatter a single concern across multiple artifacts.

KNOWN ISSUES & TECHNICAL DEBT:
───────────────────────────────
• System Invariants section below contains generic template examples.
  They are intentional scaffolding for adopters — do not remove them,
  but do not treat them as active law for this repo.

═══════════════════════════════════════════════════════════════════
-->

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

> **Scaffolding below is intentional template guidance for adopters. It is not active law for this repo.**

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

- **LAST REVIEWED**: 2026-04-30-STEWARDSHIP  SIGNATURE: Kiro (Amazon Kiro)
- **REVIEW TRIGGER**: Update this file whenever a core system invariant, architectural boundary, or critical logic chain is modified.

**REVIEW TRIGGER touch-points (scannable):**
```
REVIEW TRIGGER: Adding or retiring a Triumvirate artifact;
  changing the Narrowest-Scope Rule ownership mapping;
  changing the Stamp Signature Rule or date convention;
  changing the Enforcement Boundary definition.
```

**Stamp Signature Rule (mandatory):** Every `LAST REVIEWED` and `LAST UPDATED` line must end with `SIGNATURE: <agent-or-human identity>`. For LLM edits/reviews, include both tool identity and model when known (example: `SIGNATURE: GitHub Copilot (GPT-5.3-Codex)`). For direct human-only edits/reviews, use `SIGNATURE: Human maintainer`.

**Date Convention (mandatory):** Identifiers follow `YYYY-MM-DD-QUALIFIER` shape. Multiple notations may share the same date. NEVER use future dates unless the reason is explicitly documented inline.

**Incident Naming Convention:** When documenting governance corrections or incident responses, use the stamp format `YYYY-MM-DD-INCIDENT-NAME` (example: `2026-04-07-STACK-NPM`). This creates a searchable, timestamped reference that maps to git history.

---

*Part of the `contract-style-comments` framework. For the full architectural manifesto, visit [WhatsOnYourBrain.com](https://whatsonyourbrain.com).*
