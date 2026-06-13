# DELEGATION.md — The Agency Registry

> **"Ambiguity in ownership is the primary driver of agent collision. The Registry defines the current state of agency."**

## Purpose
This artifact tracks the active assignment of responsibility across the multi-agent swarm. It prevents two agents from attempting to modify the same logic simultaneously and provides the Conductor with a real-time map of the system's operational focus.

---

## Role Definitions

### Orchestrator (Conductor)
The control-plane role. The Orchestrator does not perform implementation work on the same ticket it is adjudicating. It owns:
- Scope adjudication and conflict resolution.
- Approval of cross-silo modifications.
- Modification of Triumvirate governance artifacts (`CONTRACT.md`, `WHY.md`, `QUICKSTART.md`).
- Final judgment on whether a Worker's evidence justifies a merge.

In the example persona set used by this framework, the Orchestrator is labeled **Cue**. The label is a mnemonic; the role is defined by the authority above.

### Workers
Stateless implementers bound to a narrowly scoped **silo**. Workers:
- Read governance files and operate within their delegated scope.
- Propose changes, generate reproducible evidence, and write `.suggested` edits.
- Must request a scope extension from the Orchestrator before touching files outside their silo.
- Must not self-adjudicate conflicts with other Workers.

In the example persona set, Worker roles are labeled **Stores-It**, **Solves-It**, **Builder**, and **Rescues-It**.

---

## Current Assignments

| Agent Identity | Responsibility | File Scope / Silo | Timestamp (UTC) | Status |
|---|---|---|---|---|
| `CONDUCTOR-01` | Governance & Validation | `./contract/*`, `./posts/Draft/BOOK_*`, `sandbox/echo_bot/*` | 2026-06-10 | ACTIVE |
| `WORKER-APP` | Flask Application Logic | `app/`, `wsgi.py`, `gunicorn_conf.py` | 2026-06-10 | ACTIVE |
| `WORKER-BOOK` | Manuscript Content | `./posts/`, `./posts/Draft/` | 2026-06-10 | ACTIVE |
| `WORKER-DIA` | Diagram & Asset Pipeline | `./dia/`, `contract/ASSETS.md` | 2026-06-10 | ACTIVE |
| `WORKER-DESIGNER` | Sandbox Architecture | `sandbox/echo_bot/CONTRACT.md` | 2026-06-10 | ACTIVE |
| `WORKER-CODER` | Sandbox Implementation | `sandbox/echo_bot/echo.py` | 2026-06-10 | ACTIVE |
| `WORKER-QA` | Sandbox Verification | `sandbox/echo_bot/test_echo.py` | 2026-06-10 | ACTIVE |
| `WORKER-VOICE` | Voice Audit (Scout) | `./posts/Draft/` | 2026-06-10 | ACTIVE |
| `WORKER-CRITIC` | Voice Verification (Skeptic) | `Sourced from WORKER-VOICE` | 2026-06-10 | ACTIVE |

---

## Governance Rules for Delegation

1. **Exclusive Lock**: Once a Worker is assigned a file scope, that scope is "locked." No other agent may modify those files without the Conductor's explicit release of the lock.
2. **Scope Extensions**: If a Worker discovers that a task requires modifying files outside their assigned silo, they must request a scope extension in `DELTALOG.md` or directly via the Conductor.
3. **Handover**: A lock is only released once a "Proof of Work" has been verified and the changes have been merged into the main branch.

---

## Last Updated
- **LAST UPDATED**: 2026-06-13-ORCHESTRATOR-GOVERNANCE  SIGNATURE: Cue (claude-sonnet-4-6)
