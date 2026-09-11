# Learnova 3.0 — Claude Entry Point

This repository holds the **established CLBestPratice development process/documentation baseline** for Learnova 3.0. The Learnova 3.0 **product repository is `sumanthsrao/learnova30`** — implementation and product-specific `docs/` content belong there, not here. Read this file first; it points to detail rather than containing it.

## Governing Principle

Few agents, clear boundaries, centralized knowledge, automated synchronization, closed-loop validation — and **##Master discretion within guardrails, not bureaucracy**. The framework provides guardrails; ##Master decides how much process a given request actually needs. Mandatory controls (below) always apply.

## ##Master Freedom

##Master is the single decision/orchestration authority and may simplify, combine, defer, or skip any non-mandatory step — for code, documentation, UI/UX, architecture, testing, or traceability — based on scope, impact, risk, and context. Full definition: `claude/agents/master-discovery.md`.

**Always mandatory, regardless of discretion:**
- S16 (Multi-Platform Availability) must always be considered for relevant product/feature discovery.
- Every requirement gets a Discovery Record with at least one acceptance criterion, passes the Discovery Complete gate, and receives structured Discovery Approval and Plan Approval before Execution begins (`claude/workflows/discovery-procedure.md`).
- Architecture, major design, or significant product decisions require the user's involvement and agreement before ##Master proceeds.
- Promoting an Innovation idea into production requires the user's agreement before promotion begins.
- The four-agent boundaries, requirement identity, and traceability recording are never skippable.

## The Four Agents

All requests enter through **##Master**. There is no fifth agent — a capability that doesn't need end-to-end lifecycle ownership becomes a skill, command, or hook instead, not a new agent.

| Agent | Owns | Definition |
|---|---|---|
| ##Master | What are we building, is it in scope, and is it done | `claude/agents/master-discovery.md` |
| Innovation / Vision | What could we build in the future | `claude/agents/innovation-vision.md` |
| UI | How it should look/behave/respond, and design conformance | `claude/agents/ui.md` |
| Development | How we build, test, version-control, and deliver it | `claude/agents/development.md` |

Development may run as one agent or additional subagents (complexity/parallelism/specialization) at ##Master's discretion — this is internal scaling, not a fifth agent.

End-to-end flow: `claude/workflows/sdlc-flow.md`. Discovery and Plan procedure: `claude/workflows/discovery-procedure.md`. Automated validation/hooks: `claude/workflows/validation-and-hooks.md`.

## Development Approach

Build by business context/domain (vertical slice), not isolated technical features — e.g. work on Student includes the complete relevant Student context; work on Exam includes what Exam needs, including related Student information. Capabilities not yet built are exposed in product surfaces as **COMING SOON** rather than hidden, and activated as their context becomes available. Detail: `claude/workflows/sdlc-flow.md`.

## Documentation Split

- `src/`, `tests/`, `scripts/` — product code (not started).
- `docs/` — Learnova product knowledge (what/how it's designed).
- `claude/` — how Claude works on Learnova (this split must not be mixed).
- `project-structure/FOLDER-STRUCTURE.md` — authoritative folder-by-folder definition (the template the product repository follows).

**Repository:** this documentation baseline lives in `sumanthsrao/self`. The Learnova 3.0 product repository is `sumanthsrao/learnova30` — do not treat `sumanthsrao/self` as the product repository.

**Cross-repo ownership rule:** `self` owns every CLBestPratice process definition and `*-TEMPLATE.md` file — agents, workflows, the discovery framework, ID naming rules, schemas. `learnova30` owns every real product artifact instantiated from those templates — registry entries, Discovery Records, Plans, UI specs, Change Requests, source code, and the live `MASTER-STATUS.md`. Neither repository duplicates the other's role; see `project-structure/FOLDER-STRUCTURE.md` (Ownership rule) and `docs/10-traceability/MASTER-STATUS-TEMPLATE.md`.

Documentation itself follows ##Master's discretion: not every change requires a new document — ##Master decides whether to create, update, reference, or leave documentation unchanged based on the change's significance and impact.

## Requirement Identity

Semantic alphanumeric IDs (`SU01`, `CR02`, `VW01`, `CHG01`, ...), prefix = structural category. `S` followed by exactly two digits (`S01`–`S16`) is reserved exclusively for Discovery dimensions and is never a Requirement ID prefix. Central registry and naming rules: `docs/01-discovery/REQUIREMENT-REGISTRY.md`. Discovery framework (S01–S16, S16 mandatory) and the executable Discovery/Plan procedure: `docs/01-discovery/DISCOVERY-FRAMEWORK.md`, `claude/workflows/discovery-procedure.md`. Discovery Record (the authoritative per-requirement record — discovery output, acceptance criteria, dependencies/constraints/risks/assumptions, open items): `docs/01-discovery/DISCOVERY-RECORD-TEMPLATE.md`. Plan (routing/sequencing, between Discovery and Execution): `docs/01-discovery/PLAN-TEMPLATE.md`. Traceability model: `docs/10-traceability/TRACEABILITY-MODEL.md`.

## External Peer Review

##Master decides whether peer review is needed and which mode, for high-impact decisions, mediated through GitHub with the user as the reconciliation authority. Must not unnecessarily block unrelated work. Accepted architecture: `claude/peer-review-process/peer-review-architecture.md`. No dedicated MCP in v1.

## UI / Stitch

##Master decides whether a change needs Stitch. Small UI changes (labels, minor adjustments) are handled directly; meaningful UI/design work uses Stitch as the established design authority via the existing Stitch MCP. When meaningful UI/design work begins, ##Master establishes/verifies the Stitch MCP connection before routing to it — this does not block non-UI work and is not an open question. Detail: `claude/agents/ui.md`.

## Live Status

Current status of every active work item by SDLC stage, including pre-ID Discovery Sessions and COMING SOON capabilities: the live `MASTER-STATUS.md`, owned and kept current by ##Master **in `sumanthsrao/learnova30`** — `self` owns only the template (`docs/10-traceability/MASTER-STATUS-TEMPLATE.md`) and never a live instance. This file is not duplicated anywhere else. It also anchors context continuity — ##Master persists meaningful work-in-progress state (objective, decisions, progress, blockers) outside the conversation so work survives across context windows, including recovering an in-progress Discovery Session (`claude/workflows/discovery-procedure.md`, step 14), deciding when state beyond this file needs saving.

## Context-Loading Rule

Agents load registry entry → its referenced Discovery Record/Plan → linked documentation → relevant code. Never re-read the entire repository to find a task. Each agent's allowed-context rule is stated in its own definition file.

## Before Assuming a Policy Value

A small number of items remain genuinely undecided (UI validation automation mechanism, peer-review repo visibility) — none of them block starting work. Check `claude/OPEN-QUESTIONS.md` before assuming an answer — everything else is either stated explicitly in an agent/workflow doc or left to ##Master's discretion under ##Master Freedom.

## Maintenance

Rules for what belongs in this file versus elsewhere: `claude/claude-md/CLAUDE-MD-GUIDE.md`.
