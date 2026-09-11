# SDLC Flow

Status: Established

## Master Freedom

Master decides the process appropriate to each request and may simplify, combine, defer, or skip non-mandatory steps in the flow below, based on scope, impact, and risk. Mandatory controls (S16 consideration, user agreement for major decisions and Innovation promotion, the four-agent boundaries, traceability) always apply — see `claude/agents/master-discovery.md`. Live status for every active work item against this flow: `docs/10-traceability/MASTER-STATUS.md`.

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

## Business-Context / Vertical-Slice Delivery

Work is scoped and delivered by business context/domain, not isolated technical features. A Student-context change includes the complete Student context that's relevant; an Exam-context change includes what Exam needs, including related Student information. Product navigation, dashboards, and learning/content journeys expose not-yet-built related capabilities as **COMING SOON** rather than hiding them; Master revisits and activates these surfaces as the relevant business context becomes available. Tracked in `docs/10-traceability/MASTER-STATUS.md`.

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

Parallel execution is the established goal — avoid unnecessary sequential dependency. Whether to use a shared "Interface Contract" (screen/component list, data shape, states) to keep both sides in sync before they branch off is Master's discretionary call, not a mandated artifact.

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

Development never declares completion independently. There is no fixed numeric retry limit on FAIL cycles — Master exercises judgment on each cycle, and must involve the user once a repeated disagreement rises to a significant/architectural decision (`claude/agents/master-discovery.md`).

## Peer Review Integration Point

Before finalizing a high-impact decision, Master may invoke the external ChatGPT peer review capability. This is a capability Master calls, not a step every requirement passes through, and it must not unnecessarily block unrelated work. Governance policy (mandatory/discretionary/routine) and mode selection are defined in `claude/peer-review-process/peer-review-architecture.md` §4–5. See that document for the full flow; it is not duplicated here.

## Commands

`discover`, `design`, `build`, `validate`, `release` are reusable entry points, not mandatory workflow gates. Master decides whether a command is useful for a given request, whether to invoke it, or whether to handle the request directly. New commands are added when a recurring workflow justifies one — the set is not required to be fixed or finalized up front.
