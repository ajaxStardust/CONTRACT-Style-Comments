# WHY.md — The Reasoning (Teleology)

> **"A stale contract is worse than no contract because it creates false confidence in a failing system."**

## Purpose of This File

This file explains the **teleology** — the "why" — of the `contract-style-comments` framework. In a systems-thinking approach, a complex codebase is a set of interacting parts that tend toward entropy. To manage this, information is separated based on its **rate of change** and its **logical scope**.

By splitting project governance into distinct artifacts, we create a stable feedback loop for AI agents and human collaborators alike. Chronological memory remains in version control (`.git`).

---

## The Core Relationship (The Agentic Trivium + Supplements)

The system is governed by a Triumvirate, supported by a Visual Invariants supplement and a standby planning artifact:

1.  **[CONTRACT.md](CONTRACT.md) — The Law**: Owns the invariants. These are the system's hard boundaries — what it *is* and what must *never* break. This changes the least.
2.  **[QUICKSTART.md](QUICKSTART.md) — The Map**: Owns the operational truth. This is the empirical interface — how to run, how to verify, and where things live. This changes frequently as the system grows.
3.  **THIS FILE ([WHY.md](WHY.md)) — The Reasoning**: Owns the logic. It defines the relationship between the governing artifacts and the governance rules that keep them accurate. (Teleology here means the study of purpose or goals—why these docs exist and how they connect.)
4.  **[ASSETS.md](ASSETS.md) — The Visual Law**: Owns the presentation invariants (favicons, OGP cards, branding assets, host mappings) to eliminate Visual Silent Regressions (VSRs) and bridge stateless AI sensory blindness.
5.  **[FUTURE.md](FUTURE.md) — Planned Intent (Standby)**: Owns roadmap priorities, medium-term candidates, and deferred discussion items. It is deliberately not present-tense truth and not a governing artifact.

---

## Required Reading Order

To prevent contextual drift — where an agent begins making confident guesses based on incomplete data — the following reading order is mandatory at the start of every session:

1.  **CONTRACT.md**: Establish the constraints. Know what must not break.
2.  **WHY.md**: Understand the governance. Know how to update the system's law/operations docs correctly.
3.  **QUICKSTART.md**: Synchronize with the current state. Know how to prove the system works.
4.  **ASSETS.md**: Check presentation laws and brand identifiers if visual or styling parts are touched.
5.  **FUTURE.md**: Optionally inspect planned direction. Know what is proposed but not yet law.

---

## The Narrowest-Scope Update Rule

Changes should have the minimal necessary impact on documentation. This rule prevents documentation bloat and ensures that every reader — human or agent — knows exactly where to find a specific type of truth.

- **Change to an invariant, route, or boundary?** → Update `CONTRACT.md`.
- **Change to a run command, key file, or verification check?** → Update `QUICKSTART.md`.
- **Change to visual branding, design styling, OGP cards, or media assets?** → Update `ASSETS.md`.
- **Change to the relationship between docs or the governance policy?** → Update `WHY.md`.
- **Change to priorities, candidate ideas, or deferred plans?** → Update `FUTURE.md` (standby queue only).

---

## Transport-Layer Encoding (Practitioner Rule)

When updating any governance artifact through a string-fragile transport — an AI agent tool call, a JSON payload, a shell heredoc, or any channel that interprets `:` `"` `` ` `` `—` as syntax — encode the full new file content as base64 in the transport and decode on receipt. The file on disk is **always plain, readable Markdown**; encoding is a transport concern, not a content concern.

- INVARIANT: Governance artifacts on disk are plain Markdown. Base64 is a transport, never a storage format.
- INVARIANT: An agent that uses a string-fragile transport MUST encode the payload as base64 before transmission and decode on receipt.
- PROHIBITION: Do not commit base64-encoded governance artifacts. The artifact must be human-readable to a steward opening the file in any text editor.
- POSTCONDITION: After a base64-transport edit, the on-disk file passes a `cat`/`head`/`tail`/`grep`/text-editor read as plain prose. Any reader can verify the edit by decoding the transport payload and comparing to the file.

This rule prevents silent character corruption (em-dashes rendered as `â€"`, smart quotes stripped, backticks removed, colons misinterpreted) without altering what the artifact looks like once written. Recommended, not required: tools that handle Unicode and Markdown cleanly may skip it.

---

## Enforceability & Falsifiability Boundary

CSC is a governance methodology first. Its strength is semantic constraint and recoverable intent; its risk is unenforced prose. To keep contracts operational:

- **Falsifiability rule**: every strong contract claim should be testable or disprovable by evidence.
- **Operational semantics**: define what constitutes a violation for critical claims (what failed, where, under which conditions).
- **Granularity discipline**: keep claims narrow (function/module/system scopes should be explicit).
- **Execution pathway**: when feasible, bind claims to checks (tests, linters, probes, CI gates, reproducible scripts).

If a claim cannot be tested at all, mark it as guidance, not law.

---

## Ownership & Governance

Within an active session, the AI agent is not merely a coder — it is a **Governance Steward**.

- **Authorization**: The agent is authorized to update these artifacts autonomously when it detects a change in the system's state.
- **Responsibility**: No code change is considered done until the corresponding update has been made to the narrowest owning artifact.
- **Missing Axioms**: If the agent discovers a hidden assumption that was not documented, it is expected to surface the axiom by adding it to `CONTRACT.md`.
- **Stewardship Escalation Pattern**: If a human grants explicit governance authority mid-session, the agent should formalize ownership boundaries and cross-link discoverability in the same change so future sessions inherit the policy.

---

## Persona Sets as Governance Mnemonics

Complex multi-agent workflows introduce a coordination cost that is not purely technical. Stateless agents must repeatedly infer their role, scope, and relationship to other agents from the same present-tense governance documents. A stable **persona set** — a small, named cast of recurring worker archetypes plus an adjudicator — functions as a lightweight mnemonic layer that reinforces the Conductor-Worker boundary without altering the formal governance structure.

Personae are not replacements for `DELEGATION.md`, `CONTRACT.md`, or the Conductor role. They are **social coordination artifacts**: stable, human-readable handles that reduce cold-start ambiguity and make cross-agent responsibilities memorable across sessions. When a persona set is accompanied by visual assets, those assets become governed resources under `ASSETS.md` with the same rigor as logos, OGP cards, or model weights.

### Example binding

A Spec-Driven Development workflow may bind four worker personae and one adjudicator to canonical CSC responsibilities:

| Persona | CSC Responsibility | Scope |
|---|---|---|
| **Stores-It** | Archivist / memory keeper | Maintains context, records, and governance state |
| **Solves-It** | Auditor / investigator | Verifies claims, checks cross-references, hunts drift |
| **Builder** | Implementer | Executes changes within delegated scope |
| **Rescues-It** | Repair agent | Handles recovery, incident response, and contract repair |
| **Cue** | Adjudicator / Orchestrator | Resolves scope disputes and finalizes judgment; not a Worker |

The mapping itself is an invariant of the teaching interface: if a persona is reassigned to a different responsibility, both the persona documentation and any visual assets must be updated together to prevent semantic drift.

---

## Multi-Agent Governance and the Orchestrator Role

Stateless AI agents operating in parallel introduce a coordination problem that is not solved by better prompts. When multiple agents share a codebase, each agent loads the repository with no memory of what the others are doing. Without a control plane, parallel execution produces **agent collision**: overlapping file writes, contradictory invariants, and silent overwrites of shared state.

CSC addresses this with a strict separation between the **execution plane** and the **control plane**:

- **Workers** are stateless implementers. Each Worker owns a narrowly scoped **silo** recorded in `DELEGATION.md`. Workers may read governance files, propose changes, generate evidence, and write `.suggested` edits, but they do not approve their own work or modify files outside their silo.
- **The Orchestrator** is the control plane. It does not perform implementation work on the same ticket it is adjudicating. It owns scope resolution, conflict arbitration, and final approval of cross-cutting changes.

In the example persona set above, the Orchestrator is labeled **Cue**. This label is a mnemonic handle for the control-plane role; the role itself is defined by authority and responsibility, not by the label.

### The Verification vs. Judgment Boundary

Workers are responsible for **verification**: they run checks, produce diffs, capture logs, and marshal reproducible evidence. The Orchestrator is responsible for **judgment**: it decides whether the evidence is sufficient, whether a scope extension is justified, and whether conflicting Delta proposals can be safely merged.

This boundary is non-negotiable. A Worker that self-adjudicates ceases to be a Worker; an Orchestrator that implements while adjudicating ceases to be an objective control plane.

### Binding authority of the Orchestrator

The Orchestrator is the only role authorized to:

1. Modify Triumvirate governance artifacts (`CONTRACT.md`, `WHY.md`, `QUICKSTART.md`).
2. Grant scope extensions outside a Worker's delegated silo.
3. Resolve conflicts between two or more Workers' evidence or proposed edits.
4. Approve the promotion of a `.suggested` edit to the live source file.

All Orchestrator decisions should be recorded in `DELTALOG.md` with a timestamp and signature. This creates an audit trail that future sessions can read, dispute, and reconcile.

### Falsifiability requirement

The Orchestrator rejects any claim that cannot be challenged by evidence. A Delta proposal without a corresponding `evidence/pow.json`, test output, diff, or reproducible probe is not ready for adjudication. This keeps the control plane from becoming a bottleneck of subjective approvals and ensures that judgment is applied to facts rather than confidence.

---

## Last Reviewed & Trigger

- **LAST REVIEWED**: 2026-06-13-ORCHESTRATOR-GOVERNANCE  SIGNATURE: Cue (claude-sonnet-4-6)
- **REVIEW TRIGGER**: Update this file when the relationship between artifacts, the governance ownership policy, the persona-to-role binding, or the Orchestrator's authority boundary changes.

---

*Part of the `contract-style-comments` framework. Visit [WhatsOnYourBrain.com](https://whatsonyourbrain.com) for the full architectural manifesto.*
