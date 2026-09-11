# Change Request Template

Status: Established

One file per change request: `docs/09-change-requests/<CHG-ID>.md`. `CHG` is a prefix distinct from `CR` (Creation) — see `docs/01-discovery/REQUIREMENT-REGISTRY.md`. Applies when a decision changes an already in-progress or already-completed requirement — see "Change Requests" in `claude/workflows/sdlc-flow.md`.

## Structure

```yaml
id: CHG01
requirement_id: CR07          # the original requirement this changes
screen_id: SC02                # if the change is screen-specific

reason: >
  Why the change is happening.

impact:
  development_state: in_progress   # or: completed
  rework: >
    What was already built that this affects.

user_agreement:
  requested_by: user
  agreed: true
  date: ...
  approved_at: ...               # exact ISO-8601 timestamp with timezone, e.g. "2026-09-11T19:32:52+05:30" — see Field Notes

resolution: >
  What was decided — chosen variant, merge, or other direction.

updated_spec: docs/04-ui-ux/CR07.md#sc02

implementation:
  status: pending                # in_progress | completed
  reference: <git commit / PR>

validation:
  status: pending                # passed | failed
```

## Example (illustrative — not a real change request)

```yaml
id: CHG01
requirement_id: CR07
screen_id: SC02

reason: >
  After seeing Variant 1 and Variant 2 of the Diagnostic Deep-Dive screen,
  the user preferred Variant 2's radial metrics but wanted Variant 1's
  color-coded mastery bands merged in.

impact:
  development_state: in_progress
  rework: >
    The Diagnostic Deep-Dive screen's chart component needs rebuilding;
    other screens (SC01, SC03) are unaffected.

user_agreement:
  requested_by: user
  agreed: true
  date: 2026-09-11
  approved_at: "2026-09-11T19:32:52+05:30"

resolution: >
  Use Variant 2 as the base; merge Variant 1's mastery-band color coding
  into the radial chart.

updated_spec: docs/04-ui-ux/CR07.md#sc02

implementation:
  status: pending
  reference: null

validation:
  status: pending
```

## Field Notes

- **`date`/`approved_at`** — same convention as `DISCOVERY-RECORD-TEMPLATE.md`'s and `PLAN-TEMPLATE.md`'s approval blocks: `date` is the human-readable day, `approved_at` is the canonical exact ISO-8601 timestamp with an explicit timezone offset. Both required together on `user_agreement`. Recording/correcting `approved_at` is a metadata fix, not a re-approval, and must not be treated as reopening the decision.
