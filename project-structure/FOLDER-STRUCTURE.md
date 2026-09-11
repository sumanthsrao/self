# Folder Structure

Status: Established

This structure is the template the Learnova 3.0 **product repository** (`sumanthsrao/learnova30`) follows once implementation starts. `sumanthsrao/self` (this repository) hosts the CLBestPratice process/documentation baseline itself, not the product — see `CLAUDE.md`.

## Top Level

| Folder | Purpose | Status |
|---|---|---|
| `src/` | Product code (frontend, backend, services). | Not started. |
| `tests/` | Automated tests. | Not started. |
| `scripts/` | Validation/automation (the registry validation script belongs here). | Not started — see `claude/workflows/validation-and-hooks.md`. |
| `docs/` | Learnova product knowledge — what it should do, how it's designed. | Partially populated (process/structure docs only; no product content yet). |
| `claude/` | Claude operating model — how Claude works on Learnova. | Populated. |
| `project-structure/` | This file. | Populated. |
| `CLAUDE.md` | Claude entry point / global rules. | Populated. |
| `README.md` | Human entry point. | Minimal placeholder. |

`src/`, `docs/`, and `claude/` must not be mixed — product code, product knowledge, and Claude process knowledge are three distinct concerns.

## `docs/` Categories

| Category | Purpose | Status |
|---|---|---|
| `01-discovery/` | Discovery framework, requirement naming/registry. | Populated — all 16 discovery points defined; no requirement entries exist yet. |
| `02-requirements/` | Functional/non-functional requirements, acceptance criteria. | Empty — no requirements authored yet. |
| `03-database-api/` | Data model, API contracts, integration definitions. | Empty. |
| `04-ui-ux/` | UX/UI specs, Stitch references, design system, responsive specs. | Template only (`UI-SPEC-TEMPLATE.md`) — no real requirements exist yet. |
| `05-testing/` | Test strategy, scenarios, regression, release validation. | Empty. |
| `06-data-cleanup/` | Duplicate/orphan/invalid-data rules, cleanup procedures. | Empty. |
| `07-migration/` | Schema/data/version migration, rollback strategy. | Empty. |
| `08-innovation-roadmap/` | Future ideas, kept out of production scope. | Empty. |
| `09-change-requests/` | Change request records, linked to the original requirement. | Template only (`CHANGE-REQUEST-TEMPLATE.md`). |
| `10-traceability/` | Traceability model and generated matrices; peer-review archive; live Master Status view. | Populated (`TRACEABILITY-MODEL.md`, `MASTER-STATUS.md`, `peer-reviews/`). |

## `claude/` Subdirectories

| Subdirectory | Purpose | Status |
|---|---|---|
| `commands/` | Per-command documentation (purpose, inputs, agent, output, validation, next step), for commands Master finds useful. | Not authored — commands are discretionary entry points (`claude/workflows/sdlc-flow.md`), documented only as recurring workflows justify one. |
| `agents/` | The four agent definitions. | Populated. |
| `claude-md/` | Maintenance rules for root `CLAUDE.md`. | Populated. |
| `ui-ux-process/` | Detailed Stitch/responsive/component/handoff process docs. | Anticipated by the architecture, not yet authored. Guiding principle (Master decides depth; document principles, not bureaucracy) captured in `claude/agents/ui.md`. |
| `testing-process/` | Test strategy, unit/integration testing, regression, release validation process docs. | Anticipated, not yet authored. Guiding principle captured in `claude/agents/development.md`. |
| `workflows/` | End-to-end SDLC flow, validation/hooks. | Populated. |
| `peer-review-process/` | ChatGPT peer review architecture, template, skill spec. | Populated. |
| `OPEN-QUESTIONS.md` | Decisions still genuinely undecided (most were resolved by the Master Freedom principle). | Populated — short list. |
