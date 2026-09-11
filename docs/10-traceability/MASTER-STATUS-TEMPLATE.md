# Master Status Template

Status: Established — template only, not a live tracker

This file defines the structure of the live operational status view. **The live `MASTER-STATUS.md` is owned and maintained in `sumanthsrao/learnova30`** (the product repository), instantiated from this template the first time real product work begins. `self` does not maintain a live status table — this resolves the cross-repo ownership question that was previously open here.

`MASTER-STATUS.md` (live, in `learnova30`) is ##Master's operational control view: where each active work item — including a Discovery Session that doesn't have a Requirement ID yet — sits in the SDLC. It is **not** a duplicate of detailed requirements, designs, architecture, or decisions — those documents remain the source of truth. It only points to them via the Traceability column.

It also anchors context continuity: the first place ##Master checks when resuming work in a new session or after a context window boundary — including recovering an in-progress Discovery Session (`docs/01-discovery/DISCOVERY-SESSION-TEMPLATE.md`). ##Master persists other meaningful work-in-progress state (objective, decisions, progress, pending actions, blockers, references) outside the conversation as needed; this file covers the operational status, deeper state lives in the relevant project document, referenced from here.

## Cross-Repo Ownership

- **`self`** owns this template, the SDLC stage definitions, and the maintenance rules below.
- **`learnova30`** owns the live `docs/10-traceability/MASTER-STATUS.md` instance and every row in it. Its own `CLAUDE.md` states this ownership explicitly.
- A work item's Work ID column holds either a Discovery Session ID (`DSC0N`, pre-classification) or a Requirement ID (`SU0N`/`CR0N`/`VW0N`/`CHG0N`, once classified) — never both, and the row is updated in place (not duplicated) the moment a session is promoted to a Requirement ID.

## SDLC Stages

```text
Discovery (Session → Record → Discovery Complete → Discovery Approval)
  → Plan (→ Plan Approval)
  → UI Design (Stitch, when applicable) / Architecture / Technical Design
  → Development → Testing → Validation → Release → Completed
```

##Master decides which stages apply to a given work item, and how much depth each gets (`##Master Freedom` — `CLAUDE.md`). Plan is never skipped as a stage, though its depth may be minimal for a trivial change. S16 consideration within Discovery is never skipped. UI Design is kept separate from Architecture/Technical Design because meaningful UI work may depend on Stitch and can proceed on a different cadence.

## In Progress

| Business Context | Work ID | Stage | Status | Owner/Agent | Next Action | Blocker/Decision Required | Traceability |
|---|---|---|---|---|---|---|---|
| _none yet_ | | | | | | | |

A Discovery Session appears here (Work ID = `DSC0N`, Stage = Discovery) from the moment its session file is created — not deferred until a Requirement ID exists.

## Coming Soon

Planned/future capabilities ##Master can activate once the relevant business context is ready. Not necessarily active development work — see `claude/workflows/sdlc-flow.md` (Business-Context / Vertical-Slice Delivery) and `claude/agents/ui.md` (Product Surface Visibility). These are the same capabilities exposed as "Coming Soon" in the product's own navigation/dashboards once that surface exists.

| Business Context | Capability | Depends On | Activation Trigger |
|---|---|---|---|
| _none yet_ | | | |

## Blocked

| Business Context | Work ID | Stage | Blocker/Decision Required | Owner/Agent |
|---|---|---|---|---|
| _none yet_ | | | | |

## Completed

| Business Context | Work ID | Stage Reached | Completed | Traceability |
|---|---|---|---|---|
| _none yet_ | | | | |

## Maintenance

##Master updates the live file as work items move between stages, change status, or a Coming Soon capability is activated — including immediately when a mid-flight change occurs (a variant swap, a pivot, a Change Request, a Discovery Session's promotion to a Requirement ID). Don't wait for a clean SDLC stage transition to reflect it. Keep it lightweight — detail belongs in the Discovery Session, Discovery Record, Plan, registry entry, design spec, architecture doc, or decision/peer-review record, referenced from the Traceability column, never copied here.
