# CLAUDE.md Maintenance Guide

Status: Established

Rules for what belongs in the root `CLAUDE.md` versus detailed Claude process documentation, so the entry point stays concise as the project grows.

## Belongs in CLAUDE.md

- Project identity and the governing principle.
- The four-agent roster and a one-line "owns" statement each, with pointers to full definitions.
- Global rules: single entry point, no fifth agent, no unauthorized new prefixes, don't build a peer-review MCP without revisiting the decision.
- Pointers to: agent definitions, workflow docs, documentation split, requirement identity docs, peer-review architecture, live status, open questions.
- The context-loading rule (one paragraph).
- The ##Master Freedom principle and the short list of always-mandatory controls (one paragraph).

## Does Not Belong in CLAUDE.md

- Full agent boundary/responsibility text — lives in `claude/agents/*.md`.
- Discovery framework content (S01–S16 definitions) — lives in `docs/01-discovery/`.
- Peer review mechanics, template, governance thresholds — lives in `claude/peer-review-process/`.
- Validation/hook implementation detail — lives in `claude/workflows/validation-and-hooks.md`.
- Anything still undecided — lives in `claude/OPEN-QUESTIONS.md`, referenced, not duplicated.
- Live work-item status — lives in `docs/10-traceability/MASTER-STATUS.md`, referenced, not duplicated.

## Update Rule

Update `CLAUDE.md` only for durable structural changes (a new agent boundary, a new top-level documentation category, a changed entry-point rule). Day-to-day decisions, individual requirement changes, and process refinements update the relevant subdocument instead — never fork the same fact into both places.
