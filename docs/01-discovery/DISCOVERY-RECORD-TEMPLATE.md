# Discovery Record Template

Status: Established

One authoritative Discovery Record per requirement: `docs/02-requirements/<Requirement ID>/DISCOVERY-RECORD.md`, created in the product repository (`sumanthsrao/learnova30`). This file — not the registry entry — is the single source of truth for a requirement's discovery output, acceptance criteria, dependencies/constraints/risks/assumptions, and open items. The registry entry (`docs/01-discovery/REQUIREMENT-REGISTRY.md`) only references this file; it never duplicates its content.

## Lifecycle

A Discovery Record starts life as a Discovery Session (`docs/01-discovery/DISCOVERY-SESSION-TEMPLATE.md`) before a Requirement ID can be assigned. Once the request is classified, ##Master mints the Requirement ID, creates this file, migrates the session's notes into it, and marks the originating session `promoted_to: <Requirement ID>`. See `claude/workflows/discovery-procedure.md`.

## Schema

```yaml
requirement_id: SU01
discovery_session_id: DSC03          # the originating session; null if unknown/not applicable
status: in_progress                  # in_progress | complete — see Discovery Complete Gate
business_context: Student
category: Subject                    # Subject | Creation | View | ...
created: 2026-09-11
last_updated: 2026-09-11

dimensions:
  s01: { status: addressed, notes: "..." }   # addressed | skipped
  s02: { status: addressed, notes: "..." }
  s03: { status: addressed, notes: "..." }
  s04: { status: addressed, notes: "..." }
  s05: { status: addressed, notes: "..." }
  s06: { status: skipped, reason: "..." }    # skipped entries must give a reason, not just the status
  s07: { status: addressed, notes: "..." }
  s08: { status: skipped, reason: "..." }
  s09: { status: addressed, notes: "..." }   # cross-referenced by the UI spec's discovery_refs.s09
  s10: { status: addressed, notes: "..." }
  s11: { status: addressed, notes: "..." }
  s12: { status: skipped, reason: "..." }
  s13: { status: addressed, notes: "..." }
  s14: { status: skipped, reason: "..." }
  s15:
    dependencies: ["..."]              # or ["none identified"]
    constraints: ["..."]
    risks: ["..."]
    assumptions: ["..."]
  s16: { status: addressed, notes: "..." }   # never "skipped" — see DISCOVERY-FRAMEWORK.md

acceptance_criteria:                   # mandatory, at least one entry
  - id: AC01
    criterion: "..."
    verification: "..."

open_items:                            # requirement-level; present even if empty
  - id: OI01
    question: "..."
    raised: 2026-09-11
    status: open                       # open | resolved
    resolution: null

peer_review_check:                     # explicit Discovery step — see peer-review-architecture.md §4
  evaluated: true
  governance_result: routine           # mandatory | discretionary | routine
  decision: not_requested              # requested | not_requested
  reason: "..."

discovery_approval:
  requested_by: user
  agreed: true
  date: 2026-09-11
```

## Field Notes

- **`dimensions`** — every key `s01`–`s16` must be present. `status: skipped` requires a `reason`; there is no bare "skip" with no explanation. `s16` may never be `skipped`.
- **`s15`** — four sub-lists (dependencies, constraints, risks, assumptions), each explicit even when empty (`["none identified"]`, never an omitted key).
- **`acceptance_criteria`** — mandatory. Even a trivial change gets at least one entry; depth (not existence) is ##Master's discretion.
- **`open_items`** — the key always exists (`[]` if nothing open). Distinct from `claude/OPEN-QUESTIONS.md`, which tracks process-level, repo-wide opens, not per-requirement ones.
- **`peer_review_check`** — always evaluated and logged, even when the result is "routine / not requested." This makes the check auditable instead of implicit.
- **`discovery_approval`** — structured, same shape as a Change Request's `user_agreement` block (`docs/09-change-requests/CHANGE-REQUEST-TEMPLATE.md`). See `plan_approval` in `PLAN-TEMPLATE.md` for the second, distinct approval gate.

## Discovery Complete Gate

`status` may only be set to `complete` when all of the following hold — see `claude/workflows/discovery-procedure.md` for the full procedure:

1. `requirement_id` is assigned and the registry entry exists, pointing to this file.
2. Every `s01`–`s16` key has an explicit `addressed` or `skipped` (with `reason`) — none blank.
3. `s16.status` is `addressed`.
4. `s15` has all four sub-lists present and non-omitted.
5. `acceptance_criteria` has at least one entry.
6. `open_items` key exists (may be empty).
7. `peer_review_check.evaluated` is `true`, with `governance_result` and `decision` recorded.
