<!--
═══════════════════════════════════════════════════════════════════
                         FUTURE.md
              Standby Planned Intent — Non-Governing
═══════════════════════════════════════════════════════════════════

PROJECT CONTEXT:
────────────────
This file is the roadmap queue for the CSC framework repo. It is
deliberately NOT governing authority. Items here are candidates
and deferred intent only — not present-tense law.

CRITICAL INVARIANTS — DO NOT BREAK THESE:
──────────────────────────────────────────

1. THIS FILE IS NOT GOVERNING AUTHORITY.
   • DO NOT reference items here as law or operational truth.
   • DO NOT promote items to CONTRACT.md without explicit human
     authorization and a narrowest-scope update.
   • BREAKING THIS corrupts the Triumvirate's authority boundary.

2. ITEMS MUST BE CSC-REPO-RELEVANT.
   • DO NOT carry over roadmap items from other projects.
   • If an item no longer applies, remove or date-stamp it as dropped.
   • BREAKING THIS causes agents to act on stale foreign intent.

3. COMPLETED ITEMS MUST BE REMOVED OR STAMPED RESOLVED.
   • When an item is executed, update the narrowest owning artifact,
     then remove or mark the item here as resolved with a date stamp.
   • BREAKING THIS leaves a misleading backlog that agents may re-execute.

KNOWN ISSUES:
─────────────
• Prior Near-Term Priorities (pre-2026-04-30) referenced a WinterCMS
  web app, not this repo. Those items have been removed as stale/foreign.
  See governance correction stamp at bottom of this file.

═══════════════════════════════════════════════════════════════════
-->

# FUTURE.md

WRITTEN FOR: human maintainers + AI agents planning follow-up sessions
LAST REVIEWED: 2026-04-30-STEWARDSHIP  SIGNATURE: Kiro (Amazon Kiro)
REVIEW TRIGGER: Update when roadmap priorities are completed, dropped, or reordered.

## Purpose

Track forward-looking work without polluting Triumvirate governance artifacts.

The Triumvirate (`CONTRACT.md`, `WHY.md`, `QUICKSTART.md`) is governing authority.
`FUTURE.md` is standby planned intent.

## Theory Note: Why this artifact exists

In mature agentic workflows, governance authority is often granted mid-session after trust is established. When that happens, the agent needs a place to capture forward direction without corrupting present-tense truth. `FUTURE.md` is that place.

Use this artifact to preserve intent discovered during collaboration until implementation is chosen and validated.

---

## Near-Term Priorities

1. **System Map — real entry point**
   - When a runnable component is added to this repo, update the System Map table in `QUICKSTART.md` with actual file paths.
   - Remove the "documentation-only" caveat from the Proven Checks section at that time.

2. **Test runner configuration**
   - Add a minimal test suite (e.g., a shell script or CI check) that verifies all four Triumvirate files carry valid `LAST REVIEWED` + `SIGNATURE` stamps.
   - Register the check in `QUICKSTART.md` Proven Checks and remove the PENDING markers.

3. **README AI Integration Prompts — Prompt 6 generalization**
   - Prompt 6 currently names a specific user. Consider a generalized variant for public adopters while keeping the personal version in `./contract/` for this session context.

---

## Medium-Term Candidates

1. **Scoped contract addenda**
   - Consider `AGENTS.CONTRACT.md` if agent-specific invariants (tool permissions, escalation rules) grow too dense for the root contract.

2. **Adopter validation checklist**
   - A short checklist (markdown or CI) that adopters can run to confirm their CSC setup is compliant with the framework's own invariants.

3. **Versioning policy**
   - Define a version stamp convention for the CSC spec itself so adopters can pin to a known-good release.

---

## Deferred / Discussion Items

1. **Date convention enforcement**
   - Decide whether a linter or pre-commit hook should enforce the `YYYY-MM-DD-QUALIFIER` stamp shape to prevent future-date drift by LLMs.

2. **Trust paradox — technical gate**
   - Decide whether a CI gate (e.g., protected branch + required review) should be added to prevent an agent from self-authorizing CONTRACT.md changes without human review.

---

## Operating Rule

When a future item is executed, update the narrowest owning artifact:

- Invariants changed → CONTRACT.md
- Reading-order/ownership changed → WHY.md
- Run steps/proven checks changed → QUICKSTART.md
- Plan/prospective work changed → FUTURE.md

---

## Open Questions (Unresolved Governance Risks)

### 1. The trust paradox
**Raised:** 2026-04-15
**Status:** Open
**The question:** Is human git diff review the only real enforcement preventing an agent from updating CONTRACT.md to legalize its own unauthorized changes?
**Governance risk:** Without a technical gate, CSC relies on social contract — human review is the only safeguard against contract drift via agent.

---

## Governance Corrections (Stamp Format)

**Governance correction (2026-04-30-STALE-PRIORITIES):** FUTURE.md Near-Term Priorities section contained roadmap items belonging to a separate WinterCMS web app project (template consolidation, UI/asset checks, external link handling, utility function robustness). These were not relevant to the CSC framework repo and have been removed. Replaced with CSC-repo-relevant priorities. Prior content was carried over from an earlier project context without being pruned.
