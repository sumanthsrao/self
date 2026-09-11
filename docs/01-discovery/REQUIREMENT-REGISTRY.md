# Requirement Naming and Registry

Status: Established

## Naming Convention

Structured alphanumeric IDs whose prefix communicates the structural category:

```text
SU01, SU02, ...   Subject
CR01, CR02, ...   Creation (e.g. CR02 = Upload Content)
VW01, VW02, ...   View
CHG01, CHG02, ... Change Request (e.g. CHG01 changes CR07) — distinct from CR (Creation)
```

**Reserved, exclusive to Discovery:** the pattern `S` followed by exactly two digits (`S01`–`S16`) is reserved for Discovery dimensions only (`docs/01-discovery/DISCOVERY-FRAMEWORK.md`) and must never be assigned as a Requirement ID prefix or matched by one. This is why Subject uses `SU`, not bare `S` — `SU\d+` is structurally distinct from `S\d{2}` and cannot collide, by construction, regardless of how many digits a Subject ID grows to.

Also reserved, non-collidable with the above: **Discovery Session IDs** (`DSC01`, `DSC02`, ...) — a pre-classification durability handle used before enough is known to assign a real Requirement ID. See `docs/01-discovery/DISCOVERY-SESSION-TEMPLATE.md`. A Discovery Session ID is never itself used as a Requirement ID; it is retired (`promoted_to: <Requirement ID>`) once classification happens.

A multi-screen requirement is addressed as `<Requirement ID>-<Screen ID>` (e.g. `CR07-SC02`); Screen IDs are scoped within the requirement and don't need their own registry entry — see `claude/agents/ui.md`.

The prefix registry is centrally maintained and governed by ##Master, who may extend it when genuinely needed. Existing prefixes remain stable — changing an established prefix's meaning is an explicit decision, not a routine edit. Agents must not independently invent a new prefix for an existing concept, and no new prefix may ever be a bare `S` + two digits.

Deleted requirement IDs are retired permanently and never reused, to avoid ambiguous historical references.

## Registry Is an Index, Not a Duplicate Requirement Document

The registry entry is a lightweight index/reference layer — it identifies a requirement, its category, its status, and pointers to the documents that are actually authoritative. It never duplicates discovery content, acceptance criteria, or S-dimension notes. Those live exclusively in the requirement's Discovery Record (`docs/01-discovery/DISCOVERY-RECORD-TEMPLATE.md`), which the registry entry references via `refs.discovery_record`.

## Registry Record Schema

One file per requirement: `docs/01-discovery/registry/<Requirement ID>.yaml`, created in the product repository (`sumanthsrao/learnova30`).

```yaml
id: CR02
name: Upload Content
category: Creation
business_context: Student
status: discovery              # discovery | approved | in_development | validation | completed

refs:
  discovery_record: docs/02-requirements/CR02/DISCOVERY-RECORD.md
  plan: docs/02-requirements/CR02/PLAN.md
  ui_spec: docs/04-ui-ux/CR02.md    # omit key entirely if not UI-relevant

depends_on:
  - SU01

change_requests: []
peer_reviews: []

implementation:
  frontend:
    - ContentUpload
  backend:
    - content_upload

tests:
  - test_content_upload

renamed_from: null
```

This schema is deliberately identical in field set to what `docs/10-traceability/TRACEABILITY-MODEL.md` (Explicit vs. Derived) declares as the requirement's explicitly-stored fields — the two documents describe the same record, not two different ones.

The registry entry must exist before any downstream artifact (UI spec, Change Request, code) references its ID — ##Master creates the registry stub the moment a request is classified (`claude/workflows/discovery-procedure.md`, step 4), even before its Discovery Record reaches `status: complete`.

## Registry Location and Granularity

`docs/01-discovery/registry/<Requirement ID>.yaml` — one file per requirement, generated index available but not hand-maintained (`docs/10-traceability/TRACEABILITY-MODEL.md`, Explicit vs. Derived). This resolves the granularity question previously left open: one-file-per-requirement was chosen over a single flat file to reduce git-conflict risk under the parallel UI/Development work this process expects (`claude/workflows/sdlc-flow.md`, Parallel UI + Development). No requirements exist yet, so no registry files have been created.
