# Folder Structure

Status: Established

This structure is the template the Learnova 3.0 **product repository** (`sumanthsrao/learnova30`) follows once implementation starts. `sumanthsrao/self` (this repository) hosts the CLBestPratice process/documentation baseline itself, not the product — see `CLAUDE.md`.

**Ownership rule:** for any `docs/` path both repositories share (e.g. `docs/01-discovery/`, `docs/10-traceability/`), `self` holds only the process definition and `*-TEMPLATE.md` files at that path; `learnova30` holds every real, per-requirement instance at the same relative path (registry entries, Discovery Records, Plans, UI specs, Change Requests, the live status file). `self` never contains real requirement data; `learnova30` never redefines the process.

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
| `01-discovery/` | Discovery framework, requirement naming/registry, Discovery Record/Session/Plan templates; real registry entries (`registry/<ID>.yaml`) live in `learnova30`. | Populated in `self` — all 16 discovery points defined, naming scheme and templates established; no real requirement entries exist yet (those belong in `learnova30`). |
| `02-requirements/` | Per-requirement Discovery Records and Plans (`<ID>/DISCOVERY-RECORD.md`, `<ID>/PLAN.md`) and pre-ID Discovery Sessions (`_sessions/<DSC-ID>.md`) — real instances only, all in `learnova30`. | Empty in `self` by design (templates live under `01-discovery/`); empty in `learnova30` — no requirements authored yet. |
| `03-database-api/` | Data model, API contracts, integration definitions. | Empty. |
| `04-ui-ux/` | UX/UI specs, Stitch references, design system, responsive specs. | Template only (`UI-SPEC-TEMPLATE.md`) in `self` — no real requirements exist yet; real specs live in `learnova30`. |
| `05-testing/` | Test strategy, scenarios, regression, release validation. | Empty. |
| `06-data-cleanup/` | Duplicate/orphan/invalid-data rules, cleanup procedures. | Empty. |
| `07-migration/` | Schema/data/version migration, rollback strategy. | Empty. |
| `08-innovation-roadmap/` | Future ideas, kept out of production scope. | Empty. |
| `09-change-requests/` | Change request records, linked to the original requirement. | Template only (`CHANGE-REQUEST-TEMPLATE.md`) in `self`; real records live in `learnova30`. |
| `10-traceability/` | Traceability model; live-status template; generated matrices; peer-review archive. | Populated in `self` (`TRACEABILITY-MODEL.md`, `MASTER-STATUS-TEMPLATE.md`) — template only. The live `MASTER-STATUS.md` and `peer-reviews/` archive are real instances and live in `learnova30`. |

## `claude/` Subdirectories

| Subdirectory | Purpose | Status |
|---|---|---|
| `commands/` | Per-command documentation (purpose, inputs, agent, output, validation, next step), for commands ##Master finds useful. | Not authored — commands are discretionary entry points (`claude/workflows/sdlc-flow.md`), documented only as recurring workflows justify one. |
| `agents/` | The four agent definitions. | Populated. |
| `claude-md/` | Maintenance rules for root `CLAUDE.md`. | Populated. |
| `ui-ux-process/` | Detailed Stitch/responsive/component/handoff process docs. | Anticipated by the architecture, not yet authored. Guiding principle (##Master decides depth; document principles, not bureaucracy) captured in `claude/agents/ui.md`. |
| `testing-process/` | Test strategy, unit/integration testing, regression, release validation process docs. | Anticipated, not yet authored. Guiding principle captured in `claude/agents/development.md`. |
| `workflows/` | End-to-end SDLC flow, Discovery procedure, validation/hooks. | Populated (`sdlc-flow.md`, `discovery-procedure.md`, `validation-and-hooks.md`). |
| `peer-review-process/` | ChatGPT peer review architecture, template, skill spec. | Populated. |
| `OPEN-QUESTIONS.md` | Decisions still genuinely undecided (most were resolved by the ##Master Freedom principle). | Populated — short list. |
