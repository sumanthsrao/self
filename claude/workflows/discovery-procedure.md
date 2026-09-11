# Discovery Procedure

Status: Established

This document is the executable procedure behind `claude/agents/master-discovery.md`'s Discovery responsibilities. `docs/01-discovery/DISCOVERY-FRAMEWORK.md` defines *what* S01–S16 mean; this document defines *how* ##Master runs Discovery, records it, knows it's complete, and hands it off.

## 1. Intake

On any user request, ##Master restates it in one paragraph (business context/domain, what's being asked) and confirms understanding with the user before assuming scope. If the request involves any real discovery work (more than a trivial, already-understood change), proceed to step 2 before anything else — including before deciding whether a Requirement ID can be assigned yet.

## 2. Open a Discovery Session

Mint a Discovery Session ID (`DSC0N`, next unused number) and create `docs/02-requirements/_sessions/DSC0N.md` from `docs/01-discovery/DISCOVERY-SESSION-TEMPLATE.md` **immediately** — before classification, before a Requirement ID exists. Add a row to the live `MASTER-STATUS.md` (in `learnova30`) keyed by the Discovery Session ID, Stage = Discovery. This is what makes in-progress Discovery recoverable across a context window boundary or a new session (`docs/01-discovery/DISCOVERY-SESSION-TEMPLATE.md`, Recovery Rule).

## 3. Dimension Pass (S01–S16)

For each dimension, ##Master either addresses it or explicitly skips it with a reason — recorded in the session's `raw_notes` initially, then migrated into the Discovery Record's `dimensions` block on promotion (step 5). Depth is ##Master's discretion (`##Master Freedom`), scaled to the request's scope, impact, and risk — except:

- **S16 (Multi-Platform Availability) may never be skipped.** Depth may be minimal, but applicability must always be considered and recorded.
- **S15 (Dependencies / Constraints / Risks / Assumptions)** is recorded as four explicit sub-lists, not one freeform note — each populated or explicitly `["none identified"]`.

There is no fixed question script per dimension — ##Master uses the topic description in `DISCOVERY-FRAMEWORK.md` to judge what's relevant and asks the user directly for anything it cannot determine from the request itself or existing product knowledge.

## 4. Requirement Classification

Once enough is known to classify the request into a structural category (Subject/Creation/View/...), ##Master mints the Requirement ID per `docs/01-discovery/REQUIREMENT-REGISTRY.md`'s naming convention and creates the registry entry (index-only — `docs/01-discovery/REQUIREMENT-REGISTRY.md`, Registry Record Schema) pointing to the not-yet-complete Discovery Record.

## 5. Promote the Discovery Session

Create `docs/02-requirements/<Requirement ID>/DISCOVERY-RECORD.md` from `docs/01-discovery/DISCOVERY-RECORD-TEMPLATE.md`, migrate the session's `raw_notes` into the schema's `dimensions` block, and mark the session file `promoted_to: <Requirement ID>`. Update the `MASTER-STATUS.md` row's Work ID from the Discovery Session ID to the Requirement ID in place — never a duplicate row, never a gap where the item is in neither.

## 6. Acceptance Criteria

Draft at least one `acceptance_criteria` entry in the Discovery Record before Discovery can be marked complete (`DISCOVERY-RECORD-TEMPLATE.md`). Depth scales with the change's significance; existence does not.

## 7. Open Items

Log any unresolved question as an `open_items` entry in the Discovery Record, with a stable `OI0N` ID — never left implicit in conversation. This is distinct from `claude/OPEN-QUESTIONS.md`, which tracks process-level, repo-wide opens, not per-requirement ones. The `open_items` key must exist even when empty.

## 8. Peer-Review Governance Check

Before Discovery can be marked complete, ##Master explicitly evaluates the governance table in `claude/peer-review-process/peer-review-architecture.md` §4 against what Discovery has surfaced so far (architecture decisions, security/privacy exposure, irreversibility, requirement ambiguity) and records the result in the Discovery Record's `peer_review_check` block — `governance_result` (mandatory/discretionary/routine) and `decision` (requested/not_requested), with a reason either way. If a review is requested, follow `claude/peer-review-process/peer-review-skill.md`; Discovery does not block on peer review completing (`peer-review-architecture.md` §6) but does block on the decision being logged.

## 9. Discovery Complete Gate

Set the Discovery Record's `status` to `complete` only when all seven conditions in `DISCOVERY-RECORD-TEMPLATE.md` (Discovery Complete Gate) hold. This is a self-certified checklist ##Master evaluates directly against the file's own content — not a separate judgment call.

## 10. Discovery Approval Gate

Once Discovery is complete, present the Discovery Record's summary to the user and obtain explicit agreement, recorded in the `discovery_approval` block. This gate confirms scope and direction before Plan effort is spent. For a trivial change, this may happen in the same exchange as intake — but the field is still populated, never left blank.

## 11. Plan Stage

Create `docs/02-requirements/<Requirement ID>/PLAN.md` from `docs/01-discovery/PLAN-TEMPLATE.md`, referencing the completed, approved Discovery Record via `based_on`. The Plan defines routing (UI required? single or multiple Development subagents? parallel execution?), a sequence of steps by owner, and an `acceptance_criteria_mapping` that references the Discovery Record's AC IDs (never copies their text — the Discovery Record remains the single source of truth for what a criterion says).

## 12. Plan Approval Gate

Obtain the user's explicit agreement to the Plan, recorded in `PLAN.md`'s `plan_approval` block — a second, distinct gate from Discovery Approval (step 10), even when both are obtained in the same conversational exchange for a trivial change.

## 13. Assemble the Discovery Handoff Package

Once Plan Approval passes, assemble and route the following to UI Agent and/or Development Agent (`claude/agents/master-discovery.md`, Handoff Rules):

```
requirement_id
registry_entry_ref            (docs/01-discovery/registry/<ID>.yaml)
discovery_record_ref          (docs/02-requirements/<ID>/DISCOVERY-RECORD.md)
plan_ref                      (docs/02-requirements/<ID>/PLAN.md)
acceptance_criteria_ref       (pointer + AC IDs/summary only — NOT the authoritative
                                criterion text, which stays in the Discovery Record)
applicable_dimensions         (which S0x matter for the receiving agent —
                                e.g. UI gets s09/s16 flagged; Development gets
                                s05-s08/s10-s14)
open_items                    (flagged blocking vs. non-blocking)
```

The Discovery Record is never duplicated into the handoff package as authoritative content — each agent follows the refs and reads what it needs, consistent with each agent's Allowed Context rule (`claude/agents/ui.md`, `claude/agents/development.md`).

## 14. Recovery After Context Compaction / New Session

Read the live `MASTER-STATUS.md` first. For any row still in the Discovery stage (Work ID is a `DSC0N` or a Requirement ID whose Discovery Record `status` is `in_progress`), open the linked Discovery Session or Discovery Record and resume from the first dimension not yet marked `addressed`/`skipped`, or the first unresolved `open_items` entry. State is always file-driven, never re-derived from memory.
