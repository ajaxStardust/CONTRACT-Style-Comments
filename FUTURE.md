# FUTURE.md

WRITTEN FOR: human maintainers + AI agents planning follow-up sessions  
LAST REVIEWED: 2026-03-23  
REVIEW TRIGGER: Update when roadmap priorities are completed, dropped, or reordered.  

## Purpose

Track forward-looking work without polluting CONTRACT.md invariants.

CONTRACT.md is present-tense law.
FUTURE.md is planned intent.

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
