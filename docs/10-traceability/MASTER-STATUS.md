# Master Status

Status: Live operational view — owned and kept current by ##Master

This is ##Master's operational control view: where each active work item sits in the SDLC. It is **not** a duplicate of detailed requirements, designs, architecture, or decisions — those documents remain the source of truth. This file only points to them via the Traceability column.

It also anchors context continuity: the first place to check when resuming work in a new session or after a context window boundary. ##Master persists other meaningful work-in-progress state (objective, decisions, progress, pending actions, blockers, references) outside the conversation as needed — this file covers the operational status; deeper state lives in the relevant project document, referenced from here.

## Cross-Repo Scope — Open

This file assumes live status tracking happens here, in `self`. Once real product work happens in a separate product repository (e.g. `sumanthsrao/learnova30`), whether that work's status is tracked centrally here or instantiated as its own `MASTER-STATUS.md` in the product repo is not yet decided. Do not assume either answer — resolve it before relying on this file for cross-repo work; see the product repo's `CLAUDE.md` for the current flag.

## SDLC Stages

```text
Discovery → Requirement → UI Design (Stitch, when applicable) → Architecture / Technical Design
  → Development → Testing → Validation → Release → Completed
```

##Master decides which stages apply to a given work item. UI Design is kept separate from Architecture/Technical Design because meaningful UI work may depend on Stitch and can proceed on a different cadence.

## In Progress

| Business Context | Requirement/Work ID | Stage | Status | Owner/Agent | Next Action | Blocker/Decision Required | Traceability |
|---|---|---|---|---|---|---|---|
| _none yet_ | | | | | | | |

## Coming Soon

Planned/future capabilities ##Master can activate once the relevant business context is ready. Not necessarily active development work — see `claude/workflows/sdlc-flow.md` (Business-Context / Vertical-Slice Delivery) and `claude/agents/ui.md` (Product Surface Visibility). These are the same capabilities exposed as "Coming Soon" in the product's own navigation/dashboards once that surface exists.

| Business Context | Capability | Depends On | Activation Trigger |
|---|---|---|---|
| _none yet_ | | | |

## Blocked

| Business Context | Requirement/Work ID | Stage | Blocker/Decision Required | Owner/Agent |
|---|---|---|---|---|
| _none yet_ | | | | |

## Completed

| Business Context | Requirement/Work ID | Stage Reached | Completed | Traceability |
|---|---|---|---|---|
| _none yet_ | | | | |

## Maintenance

##Master updates this file as work items move between stages, change status, or a Coming Soon capability is activated — including immediately when a mid-flight change occurs (a variant swap, a pivot, a Change Request). Don't wait for a clean SDLC stage transition to reflect it. Keep it lightweight — detail belongs in the requirement's registry entry, design spec, architecture doc, or decision/peer-review record, referenced from the Traceability column, never copied here.
