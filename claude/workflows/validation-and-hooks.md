# Validation and Change Detection

Status: Established

## Constraint

Claude Code is not a continuously running daemon. No mechanism can push a live notification into an idle Master session when a file changes. Detection of new, deleted, modified, or renamed requirements must therefore be **pull-based**, triggered by Master's own invocation — not push-based, regardless of how the process is described informally elsewhere.

## Layered Model

1. **Git pre-commit hook** — runs the validation script locally; blocks a commit that fails schema/duplicate-ID checks.
2. **CI** — runs the same script on push/PR as the enforcement gate before merge.
3. **Master reconciliation** — on invocation, Master runs the script in diff mode against a stored last-known-good snapshot and surfaces new/changed/deleted IDs into its own context.

The same validation script is reused by all three; none of them are a separate implementation.

## What the Validation Script Should Check

- **Requirement integrity** — every requirement has an ID; ID has a valid, registered prefix; no duplicate IDs; no duplicate semantic records; no orphan requirements.
- **Discovery integrity** — required discovery parameters exist; parameter definitions are valid; new parameters are recognized; S16 (Multi-Platform Availability) has been considered for relevant product/feature requirements — this one check is never skippable, independent of how much depth Master gives the other points.
- **Documentation integrity** — required documents exist; references are valid; no broken references; no unintended duplicate authoritative content.
- **Traceability** — Discovery → Requirement → Design → Architecture → Code → Test links are present where required.

## Rename Detection

Not reliably automatable from a git diff of YAML content. Convention: a `renamed_from:` field on the registry entry, set explicitly when a rename occurs, checked by the validation script rather than inferred.

## Implementation Status

This document describes the established technical approach. The validation script, git hook, and CI wiring have **not** been implemented — that is Learnova 3.0 build work, out of scope for this documentation pass.
