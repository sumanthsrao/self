# Validation and Change Detection

Status: Established

## Constraint

Claude Code is not a continuously running daemon. No mechanism can push a live notification into an idle ##Master session when a file changes. Detection of new, deleted, modified, or renamed requirements must therefore be **pull-based**, triggered by ##Master's own invocation — not push-based, regardless of how the process is described informally elsewhere.

## Layered Model

1. **Git pre-commit hook** — runs the validation script locally; blocks a commit that fails schema/duplicate-ID checks.
2. **CI** — runs the same script on push/PR as the enforcement gate before merge.
3. **##Master reconciliation** — on invocation, ##Master runs the script in diff mode against a stored last-known-good snapshot and surfaces new/changed/deleted IDs into its own context.

The same validation script is reused by all three; none of them are a separate implementation.

## What the Validation Script Should Check

- **Requirement integrity** — every requirement has an ID; ID has a valid, registered prefix; no duplicate IDs; no duplicate semantic records; no orphan requirements; every Change Request (`CHG` prefix) references a valid, existing requirement ID; Screen IDs are unique within their requirement.
- **Namespace integrity** — no Requirement ID, Screen ID, Change Request ID, or Discovery Session ID matches the reserved Discovery-dimension pattern `S\d{2}` (`docs/01-discovery/DISCOVERY-FRAMEWORK.md`, Namespace Note); every Discovery Session ID matches `DSC\d+` and is either `open` or has a `promoted_to`/`closed_reason` resolution — never left ambiguous.
- **Discovery Record integrity** — every `s01`–`s16` key present with `addressed` or `skipped`+`reason`; `s16` never `skipped`; `s15` has all four sub-lists present; `acceptance_criteria` has at least one entry; `open_items` key present; `peer_review_check.evaluated` is `true` — i.e., the full Discovery Complete Gate (`docs/01-discovery/DISCOVERY-RECORD-TEMPLATE.md`) is machine-checkable, not just self-certified.
- **Registry-as-index integrity** — a registry entry (`docs/01-discovery/registry/<ID>.yaml`) contains only its declared schema fields (`docs/01-discovery/REQUIREMENT-REGISTRY.md`) and never a `dimensions`, `acceptance_criteria`, or `open_items` key — those belong exclusively to the Discovery Record; a registry entry failing this check indicates content duplication, not just a schema typo.
- **Documentation integrity** — required documents exist; references are valid; no broken references; no unintended duplicate authoritative content.
- **Traceability** — Discovery Session → Discovery Record → Requirement (registry) → Plan → UI/UX → Architecture → Code → Test links are present where required, matching `docs/10-traceability/TRACEABILITY-MODEL.md`.

## Rename Detection

Not reliably automatable from a git diff of YAML content. Convention: a `renamed_from:` field on the registry entry, set explicitly when a rename occurs, checked by the validation script rather than inferred.

## Implementation Status

This document describes the established technical approach. The validation script, git hook, and CI wiring have **not** been implemented — that is Learnova 3.0 build work, out of scope for this documentation pass.
