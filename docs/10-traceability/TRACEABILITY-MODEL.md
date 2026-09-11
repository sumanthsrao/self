# Traceability Model

Status: Established

## Chain

```text
Discovery → Requirement → UI/UX → Architecture → Component → Code → Test → Validation
```

Illustrative example (not an actual requirement — S16's own structural status is itself open, see `docs/01-discovery/DISCOVERY-FRAMEWORK.md`):

```text
S16 → Multi-Platform Availability → Responsive Learning Experience
   → Responsive Application Shell → AppShell → AppShell implementation
   → Responsive tests → UI validation
```

## Peer Review in the Chain

```text
Requirement → Decision → Peer Review (GitHub) → ChatGPT Findings
   → Human Resolution → Master Decision → Implementation → Testing
```

Full mechanics: `claude/peer-review-process/peer-review-architecture.md`. Resolved reviews are archived at `docs/10-traceability/peer-reviews/`.

## Explicit vs. Derived

- **Explicit (stored on the requirement record)**: `depends_on`, `implementation.frontend`/`implementation.backend`, `tests`, applicable discovery points, parent/child or supersede relationships.
- **Derived (generated, not hand-maintained)**: full traceability matrices/reports, discovery-to-requirement rollups, coverage reports (requirements missing tests, orphans), overlap-detection reports.

The goal is a single authoritative record per requirement with everything else generated from it — not the same fact maintained by hand in multiple documents.
