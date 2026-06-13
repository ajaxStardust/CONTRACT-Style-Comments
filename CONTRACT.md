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
4.  **[ASSETS.md](ASSETS.md)**: Establish presentation and visual boundaries to resolve VSRs and stateless sensory blindness.
5.  **[FUTURE.md](FUTURE.md)**: Optionally review planned intent after governing synchronization (non-binding queue).

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

### 4. Multi-Agent Orchestration Invariants
- **Rule**: Define the control-plane and execution-plane boundaries when more than one stateless agent operates on the repository.
- **INVARIANT**: Only the Orchestrator (Conductor) may modify Triumvirate governance artifacts (`CONTRACT.md`, `WHY.md`, `QUICKSTART.md`). Workers are prohibited from editing these files.
- **INVARIANT**: A Worker may only modify files within its assigned silo as recorded in `DELEGATION.md`. Cross-silo edits require an explicit scope extension granted by the Orchestrator.
- **INVARIANT**: No two active Workers shall be assigned overlapping write scopes simultaneously.
- **INVARIANT**: Source-touching edits produced by Workers must be written as `.suggested` copies under `evidence/edited/` for Orchestrator or human review. They must not be applied directly to live source files at execute time.
- **INVARIANT**: The Orchestrator must reject or escalate any Delta proposal that lacks reproducible evidence (e.g., `evidence/pow.json`, test output, diff, or probe result).
- **PROHIBITION**: Workers must not self-adjudicate conflicts. A Worker that discovers a conflict with another Worker's output must raise the conflict to the Orchestrator rather than overwrite the conflicting evidence.
- **PROHIBITION**: The Orchestrator must not simultaneously act as a Worker on the same ticket. The control plane and execution plane must remain separate for the duration of an orchestrated task.
- **Customization Tip**: For a project using the example persona set, label the Orchestrator as "Cue" and the Worker roles as "Stores-It", "Solves-It", "Builder", and "Rescues-It". The labels are mnemonic handles; the authority model is defined by the invariants above.

---

## Governance

**The Governance Steward**: Within an active session, the AI agent is authorized — and expected — to act as the steward of this file.

1.  **Authorization**: The agent may propose updates when a new system invariant is discovered or an old one is intentionally retired.
2.  **Responsibility**: No scope-affecting code change is complete until the corresponding invariant is reflected here.
3.  **The Narrowest-Scope Rule**: Update this file only if the change affects an invariant, route, or boundary. If the change is operational, use `QUICKSTART.md`. If it affects visual branding or media assets, use `ASSETS.md`.
4.  **Planning Boundary**: Planned ideas and non-implemented direction belong in `FUTURE.md`, not in this law artifact.
5.  **Authority Boundary**: Governance authority remains with the Triumvirate (`CONTRACT.md`, `WHY.md`, `QUICKSTART.md`), supported by `ASSETS.md` for the presentation plane; `FUTURE.md` does not override law or runbook.
6.  **Verification Efficiency Rule**: Before asking maintainers for browser screenshots or DevTools/network captures, the agent should attempt first-party verification (`curl`, endpoint probes, config/code-path checks, reproducible shell evidence). Ask humans for browser-captured artifacts only when direct verification is genuinely unavailable (e.g., account-specific UI state, manual consent screens, or browser-only behavior).

**Enforcement Boundary (explicit):** This contract is governance law, not an auto-enforcing runtime. If a claim cannot be challenged by evidence (tests, probes, logs, reproducible checks), it risks becoming non-binding prose.

---

## Last Reviewed & Trigger

- **LAST REVIEWED**: 2026-06-13-ORCHESTRATOR-GOVERNANCE  SIGNATURE: Cue (claude-sonnet-4-6)
- **REVIEW TRIGGER**: Update this file whenever a core system invariant, architectural boundary, critical logic chain, or multi-agent orchestration rule is modified.

**REVIEW TRIGGER Structure Example:**
```
REVIEW TRIGGER: Changing #chordmode, #degree, or #tonic IDs;
  changing note object shape ({degree, relSemitones, semitones, note});
  changing entry point (index.html); …
```

This shows the REVIEW TRIGGER is a **scanable list of touch-points**, not prose. Each item names what must be checked when that artifact changes.

**Stamp Signature Rule (mandatory):** Every `LAST REVIEWED` and `LAST UPDATED` line must end with `SIGNATURE: <agent-or-human identity>`. For LLM edits/reviews, include both tool identity and model when known (example: `SIGNATURE: GitHub Copilot (GPT-5.3-Codex)`). For direct human-only edits/reviews, use `SIGNATURE: Human maintainer`.

**Incident Naming Convention:** When documenting governance corrections or incident responses, use the stamp format `YYYY-MM-DD-INCIDENT-NAME` (example: `2026-04-07-STACK-NPM`). This creates a searchable, timestamped reference that maps to git history.

---

*Part of the `contract-style-comments` framework. For the full architectural manifesto, visit [WhatsOnYourBrain.com](https://whatsonyourbrain.com).*
