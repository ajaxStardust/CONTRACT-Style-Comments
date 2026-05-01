# FUTURE.md

WRITTEN FOR: human maintainers + AI agents planning follow-up sessions  
LAST REVIEWED: 2026-03-23  
REVIEW TRIGGER: Update when roadmap priorities are completed, dropped, or reordered.  

## Purpose

Track forward-looking work without polluting Triumvirate governance artifacts.

The Triumvirate (`CONTRACT.md`, `WHY.md`, `QUICKSTART.md`) is governing authority.
`FUTURE.md` is standby planned intent.

## Theory Note: Why this artifact exists

In mature agentic workflows, governance authority is often granted mid-session after trust is established. When that happens, the agent needs a place to capture forward direction without corrupting present-tense truth. `FUTURE.md` is that place.

Use this artifact to preserve intent discovered during collaboration (for example, "show moderated update times when they differ from submission times") until implementation is chosen and validated.

## Near-Term Priorities

1. Template consolidation report (read-only first)
- Produce orphan map for public/doctype and public/content variants.
- Keep current canonical template chain intact.

2. UI/Asset Consistency Checks
- Keep nav/header look stable in CSS frameworks (e.g., Tachyons or Tailwind).
- Remove only dead duplicate override blocks after explicit verification.

3. External Link Handling
- Add a cache window or stored refresh timestamp for remote metadata fetches to avoid unnecessary repeat requests.
- Refine external link styling now that preview images and visit counts are first-class.

4. Utility Function Robustness
- Keep core utility route as canonical.
- Optionally split large utility content areas into scoped partials.

## Medium-Term Candidates

1. Scoped contract addenda
- Consider adding ASSETS.CONTRACT.md if asset invariants become dense.
- Consider adding UI.CONTRACT.md if UI-specific invariants outgrow root contract.

2. Baseline Behavior Tests
- Add characterization tests for core logic output shapes before deep refactors.

3. Performance and UX Evaluations
- Evaluate rendering performance on large datasets.
- Document expected limits once measured.

## Deferred / Discussion Items

1. Default external data policy
- Decide whether built-in fallback entries should remain hardcoded or move fully into config.

2. Remote Fetch Resilience
- Decide whether remote metadata fetch failures should be cached, retried, or surfaced more explicitly in the UI.

## Operating Rule

When a future item is executed, update the narrowest owning artifact:

- Invariants changed -> CONTRACT.md
- Reading-order/ownership changed -> WHY.md
- Run steps/proven checks changed -> QUICKSTART.md
- Plan/prospective work changed -> FUTURE.md

---

## Open Questions (Unresolved Governance Risks)

Surface governance risks here without resolving them. This is a "parking lot" for paradoxes, enforcement gaps, or decisions that require human judgment. Each question should be named and dated so future sessions can track whether it has been resolved.

**Format:**
```
### N. [Short title]
**Raised:** YYYY-MM-DD
**Status:** Open | Resolved (see YYYY-MM-DD-QUALIFIER)
**The question:** [What is uncertain or unguarded?]
**Governance risk:** [What could go wrong if this is not resolved?]
```

**Example:**
```
### 1. The trust paradox
**Raised:** 2026-04-15
**Status:** Open
**The question:** Is human git diff review the only real enforcement preventing an agent from updating CONTRACT.md to legalize its own unauthorized changes?
**Governance risk:** Without a technical gate, CSC relies on social contract — human review is the only safeguard against contract drift via agent.
```

---

## Governance Corrections (Stamp Format)

When a governance artifact is corrected (not a feature change, but a fix to the governance itself), record it with the incident naming convention:

```
**Governance correction (YYYY-MM-DD-QUALIFIER):** [What was wrong in the governance docs and what was corrected.]
```

**Example:**
```
**Governance correction (2026-04-07-STACK-NPM):** CONTRACT.md §AI-assisted development hardened to prohibit node_modules introduction without explicit maintainer authorization. Prior policy was implicit.
```
