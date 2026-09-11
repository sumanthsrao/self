# SDLC Flow

Status: Established

## ##Master Freedom

##Master decides the process appropriate to each request and may simplify, combine, defer, or skip non-mandatory steps in the flow below, based on scope, impact, and risk. Mandatory controls (S16 consideration, acceptance criteria, the Discovery Complete gate, Discovery/Plan approval, user agreement for major decisions and Innovation promotion, the four-agent boundaries, traceability) always apply — see `claude/agents/master-discovery.md`. Live status for every active work item against this flow: the live `MASTER-STATUS.md` (owned by `sumanthsrao/learnova30` — see `docs/10-traceability/MASTER-STATUS-TEMPLATE.md`).

## Routing

```text
USER
  │
  ▼
##MASTER — Intake
  │
  ▼
DISCOVERY  (Session → S01–S16 → Requirement ID → Discovery Record →
            Discovery Complete Gate → Discovery Approval)
  │
  ▼
PLAN  (routing, sequencing, acceptance-criteria mapping → Plan Approval)
  │
  ├── Current requirement ──► Development Agent
  ├── UI work ──────────────► UI Agent
  └── Future / speculative ─► Innovation Agent  (routed at Intake, bypasses Discovery/Plan)
```

Full Discovery and Plan mechanics: `claude/workflows/discovery-procedure.md`. ##Master must prevent speculative ideas from automatically entering the production backlog — those route to Innovation at Intake, before Discovery.

## Business-Context / Vertical-Slice Delivery

Work is scoped and delivered by business context/domain, not isolated technical features. A Student-context change includes the complete Student context that's relevant; an Exam-context change includes what Exam needs, including related Student information. Avoid building disconnected technical fragments when the business context can be built coherently — this principle extends to requirements, UI, data, APIs, AI, and testing, not just implementation.

Product navigation, dashboards, and learning/content journeys expose not-yet-built related capabilities as **COMING SOON** rather than hiding them. As major contexts (e.g. Content, Exam, Assessment) become available, ##Master revisits the relevant product surfaces and activates the applicable COMING SOON capabilities. Tracked in the live `MASTER-STATUS.md`.

## Parallel UI + Development

```text
                     ##MASTER
                        │
              Approved, Planned Requirement
              (Discovery Approval + Plan Approval both recorded)
                        │
          ┌─────────────┴─────────────┐
          ▼                           ▼
       UI AGENT              DEVELOPMENT AGENT
     Stitch / UX                  Build
   UI Specification            Code / Tests
          │                           │
          └─────────────┬─────────────┘
                        ▼
                  ##MASTER REVIEW
                        │
                        ▼
                  UI VALIDATION
```

Parallel execution is the established goal — avoid unnecessary sequential dependency. Whether to use a shared "Interface Contract" (screen/component list, data shape, states) to keep both sides in sync before they branch off is ##Master's discretionary call, not a mandated artifact.

## Closed-Loop Handback

```text
Development Agent
       │
Completion Package
       │
       ▼
##Master
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

Development never declares completion independently. There is no fixed numeric retry limit on FAIL cycles — ##Master exercises judgment on each cycle, and must involve the user once a repeated disagreement rises to a significant/architectural decision (`claude/agents/master-discovery.md`).

## Peer Review Integration Point

Peer review is evaluated in two places: (1) mandatorily, as an explicit Discovery step logged in the requirement's Discovery Record (`claude/workflows/discovery-procedure.md`, step 8), and (2) discretionarily, at any later high-impact decision point during Plan or Execution. In both cases this is a capability ##Master calls, not a step every requirement passes through beyond the mandatory Discovery-stage check, and it must not unnecessarily block unrelated work. Governance policy (mandatory/discretionary/routine) and mode selection are defined in `claude/peer-review-process/peer-review-architecture.md` §4–5. See that document for the full flow; it is not duplicated here.

## Change Requests

Applies when a decision changes an already in-progress or already-completed requirement — most commonly, choosing or merging a UI variant after Development has started or finished (`claude/agents/ui.md`, Variant Convergence). It is not a new requirement and does not get a new Requirement ID.

```text
User invokes a variant/change
        │
        ▼
##Master logs a Change Request (CHG-ID, linked to the original Requirement ID)
        │
Impact assessment: in-progress rework vs. already-completed change
        │
Mandatory user agreement (already satisfied — the user is the one requesting it)
        │
        ▼
   UI Agent — variant convergence, updated spec
        │
        ▼
Development — applies the change, referencing the CHG-ID
        │
        ▼
   Testing → Validation → back to Completed
```

The live `MASTER-STATUS.md` is updated the moment the Change Request is raised, not deferred to the next checkpoint — reflecting the work item moving back to whatever stage the change actually needs, with the Change Request named in Blocker/Next Action and Traceability, never silently overwriting the original row's history. Record structure and location: `docs/09-change-requests/CHANGE-REQUEST-TEMPLATE.md`. The `CHG` prefix is distinct from `CR` (Creation) — see `docs/01-discovery/REQUIREMENT-REGISTRY.md`.

## Commands

`discover`, `design`, `build`, `validate`, `release` are reusable entry points, not mandatory workflow gates. ##Master decides whether a command is useful for a given request, whether to invoke it, or whether to handle the request directly. `discover` corresponds to `claude/workflows/discovery-procedure.md`. New commands are added when a recurring workflow justifies one — the set is not required to be fixed or finalized up front.
