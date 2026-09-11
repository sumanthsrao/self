# Discovery Framework

Status: Established — all 16 points defined

## Structure

A 16-point discovery framework, centrally registered and authoritative for Learnova 3.0.

| Point | Name | Covers |
|---|---|---|
| S01 | Business / Purpose | Why the capability is needed — business objective, problem being solved, expected value, desired outcome. |
| S02 | Users / Personas | Who will use or be affected — roles, needs, expectations, relevant user characteristics. |
| S03 | Scope / Capabilities | What's in/out of scope, major capabilities involved, boundaries of the work. |
| S04 | User Journeys / Workflows | End-to-end journeys, workflows, interactions, states, major user/system flows. |
| S05 | Functional Requirements | What the system must do — functional behavior, rules, actions, conditions, expected outcomes. |
| S06 | Data / Content | Data, content, entities, relationships, sources, ownership, lifecycle, quality, information requirements. |
| S07 | Integration / External Systems | External systems, APIs, services, platforms, MCPs, third-party dependencies, data exchanges, integration requirements. |
| S08 | AI / Intelligence | AI, automation, enrichment, recommendation, generation, reasoning, or intelligent behavior required. |
| S09 | UI / UX | User experience, interaction design, navigation, information architecture, visual design, accessibility, usability. |
| S10 | Architecture / Technology | Relevant application architecture, technology, components, services, technical patterns, scalability, implementation approach. |
| S11 | Security / Privacy | Authentication, authorization, privacy, sensitive information, security controls, compliance, security risks. |
| S12 | Performance / Quality | Performance, scalability, reliability, availability, usability, maintainability, other quality attributes. |
| S13 | Testing / Acceptance | How the capability will be verified — test expectations, acceptance criteria, validation approach, definition of done. |
| S14 | Operations / Lifecycle | Deployment, monitoring, support, maintenance, configuration, versioning, operational ownership, future lifecycle needs. |
| S15 | Dependencies / Constraints / Risks | Dependencies, assumptions, constraints, risks, external factors, unresolved decisions, potential impacts. |
| S16 | Multi-Platform Availability — **MANDATORY** | Desktop, Mobile, Tablet — see below. |

## S16 — Mandatory, Not Skippable

Every relevant product/feature discovery must consider Desktop, Mobile, and Tablet. Master decides the appropriate design/implementation for each platform based on business context and capability — but all three must be considered. This is the one point Master cannot skip, even when every other point gets only lightweight treatment.

## Master's Discretion Over Depth

S01–S16 is a discovery framework, not a rigid checklist requiring identical depth every time. Master decides which points require detailed exploration and which need only lightweight consideration, based on the request's scope, impact, and risk (`claude/agents/master-discovery.md`). S16 is the sole exception to depth discretion — its *applicability* must always be considered, even though how much depth that consideration gets remains Master's call.

## Namespace Note

`S01`–`S16` names **discovery dimensions** only. They do not collide with, and never need to be reconciled against, a product's own implementation-level naming — screen identifiers (`SC01`, `SC02`, ... per `claude/agents/ui.md`) or component/file names a codebase happens to use (e.g. an existing `S1_CockpitDashboard.jsx`). These are three distinct namespaces used in three different contexts (discovery documentation, UI spec addressing, and source code) and are never cross-referenced by number alone. A visual coincidence between a discovery point and a product's own naming is not a conflict requiring either side to be renamed.

## Registry Location

`docs/01-discovery/DISCOVERY-REGISTRY.yaml` (not yet created — no Learnova 3.0 requirements exist yet).
