# Requirement Naming and Registry

Status: Established, with open implementation-detail questions noted below

## Naming Convention

Structured alphanumeric IDs whose prefix communicates the structural category:

```text
S01, S02, ...     Subject
CR01, CR02, ...   Creation (e.g. CR02 = Upload Content)
VW01, VW02, ...   View
```

The prefix registry is centrally maintained. Agents must not independently invent a new prefix for an existing concept. **Governance of who is authorized to add a new prefix, and under what criteria, is not decided** — see `claude/OPEN-QUESTIONS.md` #4.

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

The registry is the authoritative source for a requirement — other documentation references it rather than duplicating its fields.

## Registry Location and Granularity

Proposed location: `docs/01-discovery/DISCOVERY-REGISTRY.yaml` (single file) or an equivalent structured format. A one-file-per-requirement layout (`docs/01-discovery/registry/<ID>.yaml` plus a generated index) was recommended during review to reduce git-conflict risk under parallel UI/Development work, but this was **not confirmed** — see `claude/OPEN-QUESTIONS.md` #6. No requirements exist yet, so no registry file has been created under either layout.
