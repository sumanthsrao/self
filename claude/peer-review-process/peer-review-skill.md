# Peer Review Skill — Procedure Specification

Status: **Accepted / Frozen** (specification only — not yet implemented as an executable Claude Code Skill)

This document specifies the procedure Claude Master follows to invoke and later reconcile a ChatGPT peer review. It is process documentation, consistent with how `claude/ui-ux-process/` and `claude/testing-process/` document procedures without themselves being executable. Implementing this as a runnable Skill is a separate, later step.

## Purpose

Give Master a repeatable, minimal procedure for constructing and posting a peer review request, and for later detecting and acting on its resolution — without requiring a dedicated MCP (see `peer-review-architecture.md` §8).

## Procedure

1. **Classify** the decision against the governance policy in `peer-review-architecture.md` §4 — mandatory, discretionary, or routine.
2. If mandatory, proceed to invoke. If discretionary, Master judges based on confidence and impact. If routine, log "peer review intentionally not requested" with a reason and continue.
3. **Choose review mode** — `blind` (default when confidence is low or multiple approaches are open) or `challenge` (default otherwise). See `peer-review-architecture.md` §5.
4. **Construct the review request** using `review-template.md`, drawing content only from the relevant registry entry and its linked documentation — never raw source code, secrets, credentials, or unrelated requirement content.
5. **Run the redaction checklist** before posting:
   - No secrets, credentials, or connection strings present.
   - No PII present.
   - No full source code present.
   - No content unrelated to the requirement/decision under review present.
6. **Post** a new GitHub issue with the completed template, labeled `peer-review` and `peer-review:pending`.
7. **Mark the decision "pending peer review"** in the relevant registry/traceability entry. Continue other, unrelated work — do not block the session on this review.
8. On a **later invocation**, check open `peer-review:pending` issues linked to in-flight requirements:
   - If `Final Resolution` is populated: snapshot the issue content into `docs/10-traceability/peer-reviews/` (per that directory's README), update the registry, relabel the issue `peer-review:resolved`, and resume the gated decision.
   - If not populated: leave the decision pending and continue.

## Inputs

- Registry entry for the requirement/decision.
- Linked documentation (discovery constraints, design, architecture) relevant to the decision.
- Master's current position (`challenge` mode only).

## Outputs

- A GitHub issue following `review-template.md`.
- On resolution: a snapshot file under `docs/10-traceability/peer-reviews/`.
- An updated registry entry reflecting the review outcome.

## Explicitly Out of Scope

- Any automated parsing of ChatGPT's findings.
- Any automatic action taken on Master's behalf without a recorded human resolution.
- Any direct ChatGPT-to-GitHub or ChatGPT-to-Claude integration (human-mediated only in v1 — see `peer-review-architecture.md` §2).
