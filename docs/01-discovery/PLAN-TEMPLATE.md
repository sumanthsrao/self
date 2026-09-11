# Plan Template

Status: Established

Plan is a distinct SDLC stage between Discovery Approval and Execution (`claude/workflows/sdlc-flow.md`). One file per requirement, co-located with its Discovery Record: `docs/02-requirements/<Requirement ID>/PLAN.md`, created in the product repository (`sumanthsrao/learnova30`).

A Plan translates an approved Discovery Record into routing, sequencing, and acceptance-verification mapping. It does not restate or duplicate discovery content, acceptance criteria text, or S-dimension notes — it references them by ID. The Discovery Record remains the single source of truth for what those criteria actually say (`docs/01-discovery/DISCOVERY-RECORD-TEMPLATE.md`).

## Schema

```yaml
requirement_id: SU01
based_on: docs/02-requirements/SU01/DISCOVERY-RECORD.md

routing:
  ui_required: true
  development_subagents: single        # single | multiple
  parallel_execution: true

sequence:
  - step: "UI Agent produces spec (Mode A)"
    owner: UI Agent
  - step: "Development implements backend upload endpoint"
    owner: Development Agent

acceptance_criteria_mapping:           # references AC IDs only — not the criterion text itself
  AC01: "Verified via test_content_upload + manual upload check"
  AC02: "Verified via responsive UI validation (S16)"

risks_addressed:                       # references discovery_record's s15.risks by summary, not full text
  - "..."

plan_approval:
  requested_by: user
  agreed: true
  date: 2026-09-11
  approved_at: "2026-09-11T19:32:52+05:30"
```

## Field Notes

- **`date`/`approved_at`** — see `DISCOVERY-RECORD-TEMPLATE.md`'s Field Notes: `date` is the human-readable day, `approved_at` is the canonical exact ISO-8601 timestamp with timezone. Both are required together on `plan_approval`, same as `discovery_approval`. Recording/correcting `approved_at` is a metadata fix, not a re-approval.
- **`based_on`** — the Discovery Record this plan was built from. Plan is invalid if the referenced Discovery Record's `status` is not `complete` and its `discovery_approval.agreed` is not `true`.
- **`acceptance_criteria_mapping`** — keyed by the AC IDs defined in the Discovery Record. This is a verification-method mapping, not a copy of the criteria; a reader needing the actual criterion text follows `based_on` to the Discovery Record.
- **`plan_approval`** — a second, distinct structured approval gate from `discovery_approval` (same shape as `docs/09-change-requests/CHANGE-REQUEST-TEMPLATE.md`'s `user_agreement` block). For a trivial change, ##Master may obtain both approvals in the same user exchange, but both fields are still recorded separately — see `claude/workflows/discovery-procedure.md`.

## Gate

Execution (UI Agent Mode A / Development Agent) may not begin until `plan_approval.agreed` is `true`.
