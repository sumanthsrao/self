# Traceability Model

Status: Established

## Chain

```text
Discovery → Requirement → UI/UX → Architecture → Component → Code → Test → Validation
```

Illustrative example (not an actual requirement — no Learnova 3.0 requirements exist yet):

```text
S16 → Multi-Platform Availability → Responsive Learning Experience
   → Responsive Application Shell → AppShell → AppShell implementation
   → Responsive tests → UI validation
```

## Peer Review in the Chain

```text
Requirement → Decision → Peer Review (GitHub) → ChatGPT Findings
   → Human Resolution → ##Master Decision → Implementation → Testing
```

Full mechanics: `claude/peer-review-process/peer-review-architecture.md`. Resolved reviews are archived at `docs/10-traceability/peer-reviews/`.

## Change Requests in the Chain

```text
Requirement → [in progress or completed] → Change Request (CHG)
   → Updated UI/UX Spec → Development → Testing → Validation → Completed
```

A Change Request does not start a new chain — it re-enters the existing requirement's chain partway through. Full mechanics: `claude/workflows/sdlc-flow.md` (Change Requests). Records live at `docs/09-change-requests/`.

## Explicit vs. Derived

- **Explicit (stored on the requirement record)**: `depends_on`, `implementation.frontend`/`implementation.backend`, `tests`, applicable discovery points, parent/child or supersede relationships.
- **Derived (generated, not hand-maintained)**: full traceability matrices/reports, discovery-to-requirement rollups, coverage reports (requirements missing tests, orphans), overlap-detection reports.

The goal is a single authoritative record per requirement with everything else generated from it — not the same fact maintained by hand in multiple documents.

## Relationship to Master Status

`docs/10-traceability/MASTER-STATUS.md` is the live, per-work-item operational view (current SDLC stage, owner, next action, blockers). This document defines the traceability model and chain; it does not track live status, and status should not be duplicated here.
