# Traceability Model

Status: Established

## Chain

```text
Discovery Session → Discovery Record → Requirement (registry entry) → Plan
   → UI/UX → Architecture → Component → Code → Test → Validation
```

Illustrative example (not an actual requirement — no Learnova 3.0 requirements exist yet):

```text
S16 → Multi-Platform Availability → SU04 (Responsive Learning Experience)
   → PLAN.md → Responsive Application Shell → AppShell → AppShell implementation
   → Responsive tests → UI validation
```

## Peer Review in the Chain

```text
Requirement → Decision → Peer Review (GitHub) → ChatGPT Findings
   → Human Resolution → ##Master Decision → Implementation → Testing
```

Full mechanics: `claude/peer-review-process/peer-review-architecture.md`. The governance check that decides whether a review is requested is run as an explicit Discovery step (`claude/workflows/discovery-procedure.md`, step 8), logged in the requirement's Discovery Record (`peer_review_check`) even when the decision is not to request one. Resolved reviews are archived at `docs/10-traceability/peer-reviews/`.

## Change Requests in the Chain

```text
Requirement → [in progress or completed] → Change Request (CHG)
   → Updated UI/UX Spec → Development → Testing → Validation → Completed
```

A Change Request does not start a new chain — it re-enters the existing requirement's chain partway through. Full mechanics: `claude/workflows/sdlc-flow.md` (Change Requests). Records live at `docs/09-change-requests/`.

## Explicit vs. Derived

- **Explicit, stored on the requirement's registry record** (`docs/01-discovery/REQUIREMENT-REGISTRY.md`, Registry Record Schema): `id`, `name`, `category`, `business_context`, `status`, `refs.discovery_record`/`refs.plan`/`refs.ui_spec`, `depends_on`, `change_requests`, `peer_reviews`, `implementation.frontend`/`implementation.backend`, `tests`, `renamed_from`.
- **Explicit, stored on the requirement's Discovery Record** (`docs/01-discovery/DISCOVERY-RECORD-TEMPLATE.md`) — the authoritative source these registry fields never duplicate: the full `dimensions` block (S01–S16 status/notes), `acceptance_criteria`, `open_items`, `peer_review_check`, `discovery_approval`.
- **Derived (generated, not hand-maintained)**: full traceability matrices/reports, discovery-to-requirement rollups, coverage reports (requirements missing tests, orphans), overlap-detection reports.

The goal is a single authoritative record per concern — registry for identity/status/pointers, Discovery Record for discovery content and acceptance criteria, Plan for routing/sequencing — with everything else generated from them, never the same fact hand-maintained in multiple documents. The registry schema in `REQUIREMENT-REGISTRY.md` and the explicit-fields list above describe the same record; if they ever diverge, that is a defect to fix in one of the two documents, not a difference to preserve.

## Relationship to Master Status

The live `docs/10-traceability/MASTER-STATUS.md` (owned by `sumanthsrao/learnova30` — see `docs/10-traceability/MASTER-STATUS-TEMPLATE.md`) is the per-work-item operational view (current SDLC stage, owner, next action, blockers), including Discovery Sessions that don't have a Requirement ID yet. This document defines the traceability model and chain; it does not track live status, and status should not be duplicated here.
