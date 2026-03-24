# WHY.md

WRITTEN FOR: human onboarding + AI agent onboarding
LAST REVIEWED: 2026-03-23
REVIEW TRIGGER: Update when artifact ownership boundaries or required reading order changes.

## Purpose

This file ties CONTRACT.md and QUICKSTART.md together so the next editor (human or agent) knows where to update truth.

## Core Relationship

1. [CONTRACT.md](CONTRACT.md) owns invariants and boundaries.
2. [QUICKSTART.md](QUICKSTART.md) owns run instructions, proven checks, and the practical file map.
3. This file owns the relationship and reading order between those artifacts.

## Reading Order Is Scope

Use this order at session start:

1. [CONTRACT.md](CONTRACT.md)
2. [WHY.md](WHY.md)
3. [QUICKSTART.md](QUICKSTART.md)
4. Then target files.

Reason:

- First establish what cannot break.
- Then establish why documentation is split.
- Then establish how to run and verify current behavior.

## Narrowest-Scope Update Rule

When something changes, update the narrowest artifact that fully contains the change.

- Invariants or route/boundary contracts -> CONTRACT.md
- Run commands, key-file table, verification checks -> QUICKSTART.md
- Relationship between docs, ownership policy, reading order -> WHY.md

If uncertain, ask a clarifying question instead of guessing.

## Ownership Policy

Within an active user session, the coding agent is authorized and expected to update the owning artifact when scope-affecting changes occur.

No scope-affecting change should be merged mentally without a matching artifact update.

## Drift Warning

A stale contract is worse than no contract because it creates false confidence.

Keep LAST REVIEWED and REVIEW TRIGGER fields current in all three artifact files.
