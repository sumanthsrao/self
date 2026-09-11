# Discovery Session Template

Status: Established

A Discovery Session is the pre-classification durability handle for discovery work that hasn't yet produced a Requirement ID. It exists so that discovery notes survive a context window boundary or a new session even before ##Master knows enough to classify the request (`docs/01-discovery/REQUIREMENT-REGISTRY.md` naming convention) and mint an ID.

## When Created

The instant ##Master begins real discovery work on a user request — not deferred until scope is clear. One file per session: `docs/02-requirements/_sessions/<DSC-ID>.md`, created in the product repository (`sumanthsrao/learnova30`).

## When It Ends

Once the request can be classified, ##Master:
1. Mints the Requirement ID.
2. Creates `docs/02-requirements/<Requirement ID>/DISCOVERY-RECORD.md` from `DISCOVERY-RECORD-TEMPLATE.md`.
3. Migrates this session's notes into the Discovery Record's `dimensions` fields.
4. Marks this session file `promoted_to: <Requirement ID>` — it is not deleted; it remains the audit trail of the request's pre-ID origin.

A session that never gets classified (abandoned, superseded, folded into another request) is marked `promoted_to: null` with a one-line `closed_reason`, not deleted.

## Schema

```yaml
discovery_session_id: DSC03
status: open                          # open | promoted | closed
promoted_to: null                     # Requirement ID once promoted
closed_reason: null                   # if status: closed without promotion
created: 2026-09-11
last_updated: 2026-09-11

raw_notes:
  s01: "..."                          # freeform; not yet schema-validated
  s02: "..."
  # ... any dimensions already touched, in whatever shape they were captured
```

## Recovery Rule

`docs/10-traceability/MASTER-STATUS.md` (the live file, owned by `learnova30` — see `CLAUDE.md`, Documentation Split) carries a row for every open Discovery Session, keyed by its `DSC-ID`, from the moment the session file is created — not deferred until a Requirement ID exists. On a new session or after context compaction, ##Master's recovery path is: read `MASTER-STATUS.md` → for any row still in the Discovery stage, open the linked Discovery Session or Discovery Record → resume from the first dimension not yet marked `addressed`/`skipped`. See `claude/workflows/discovery-procedure.md`.
