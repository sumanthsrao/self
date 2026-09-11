# Requirement Naming and Registry

Status: Established, with open implementation-detail questions noted below

## Naming Convention

Structured alphanumeric IDs whose prefix communicates the structural category:

```text
S01, S02, ...     Subject
CR01, CR02, ...   Creation (e.g. CR02 = Upload Content)
VW01, VW02, ...   View
CHG01, CHG02, ... Change Request (e.g. CHG01 changes CR07) — distinct from CR (Creation)
```

A multi-screen requirement is addressed as `<Requirement ID>-<Screen ID>` (e.g. `CR07-SC02`); Screen IDs are scoped within the requirement and don't need their own registry entry — see `claude/agents/ui.md`.

The prefix registry is centrally maintained and governed by ##Master, who may extend it when genuinely needed. Existing prefixes remain stable — changing an established prefix's meaning is an explicit decision, not a routine edit. Agents must not independently invent a new prefix for an existing concept.

Deleted requirement IDs are retired permanently and never reused, to avoid ambiguous historical references.

## Registry Record Schema (example)

```yaml
id: CR02
name: Upload Content
category: Creation

owner:
  agent: master-discovery

inputs:
  - uploaded_file

outputs:
  - curated_content

depends_on:
  - S01

implementation:
  frontend:
    - ContentUpload
  backend:
    - content_upload

tests:
  - test_content_upload
```

The registry is the authoritative source for a requirement — other documentation references it rather than duplicating its fields. The entry must exist before any downstream artifact (UI spec, Change Request, code) references its ID — ##Master creates it the moment meaningful work starts, even if the work began in Stitch or conversation rather than a formal discovery pass (`claude/agents/master-discovery.md`).

## Registry Location and Granularity

Proposed location: `docs/01-discovery/DISCOVERY-REGISTRY.yaml` (single file) or an equivalent structured format. A one-file-per-requirement layout (`docs/01-discovery/registry/<ID>.yaml` plus a generated index) was recommended during review to reduce git-conflict risk under parallel UI/Development work, but this was **not confirmed** — see `claude/OPEN-QUESTIONS.md`. No requirements exist yet, so no registry file has been created under either layout.
