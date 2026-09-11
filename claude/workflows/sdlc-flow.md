# SDLC Flow

Status: Established

## Routing

```text
USER
  │
  ▼
MASTER DISCOVERY AGENT
  │
  ├── Current requirement ──► Development Agent
  ├── UI work ──────────────► UI Agent
  └── Future / speculative ─► Innovation Agent
```

Master must prevent speculative ideas from automatically entering the production backlog.

## Parallel UI + Development

```text
                     MASTER
                        │
                 Approved Requirement
                        │
          ┌─────────────┴─────────────┐
          ▼                           ▼
       UI AGENT              DEVELOPMENT AGENT
     Stitch / UX                  Build
   UI Specification            Code / Tests
          │                           │
          └─────────────┬─────────────┘
                        ▼
                  MASTER REVIEW
                        │
                        ▼
                  UI VALIDATION
```

Parallel execution is the established goal — avoid unnecessary sequential dependency. Whether a shared "Interface Contract" artifact (screen/component list, data shape, states) is required to keep both sides in sync before they branch off was recommended during review but not confirmed — see `claude/OPEN-QUESTIONS.md` #8. Until resolved, parallel work proceeds without a mandated shared contract, at the acknowledged risk of rework if UI structure changes after Development has built against it.

## Closed-Loop Handback

```text
Development Agent
       │
Completion Package
       │
       ▼
Master Discovery Agent
       │
Requirement Review
       │
       ▼
    UI Agent
       │
Design Validation
       │
   ┌───┴───┐
   ▼       ▼
 FAIL     PASS
   │       │
   ▼       ▼
Development  COMPLETE
```

Development never declares completion independently. A numeric retry/escalation limit on repeated FAIL cycles was flagged as necessary but never set — see `claude/OPEN-QUESTIONS.md` #1.

## Peer Review Integration Point

Before finalizing a high-impact decision, Master may invoke the external ChatGPT peer review capability. This is a capability Master calls, not a step every requirement passes through — governance policy (mandatory/discretionary/routine) is defined in `claude/peer-review-process/peer-review-architecture.md` §4. See that document for the full flow; it is not duplicated here.

## Proposed Commands

`discover`, `design`, `build`, `validate`, `release` were proposed as the command set invoking this workflow. The original architecture explicitly states this set should be reviewed before implementation — it has not been. Treat these as working names only; see `claude/OPEN-QUESTIONS.md` #9.
