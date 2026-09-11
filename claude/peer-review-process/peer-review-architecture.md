# ChatGPT Peer Review — Architecture (Accepted)

Status: **Accepted / Frozen**
Applies to: Learnova 3.0 Claude Code operating model
Scope: Governs when and how an external independent review (ChatGPT) is used to challenge a Claude Master decision, and how that review is reconciled and traced.

This document captures the finalized architecture as agreed. It is not a proposal and should not be re-derived or redesigned without a new decision record.

## 1. Roles

| Role | Responsibility |
|---|---|
| **Claude Master** | Orchestrates the SDLC, decides whether peer review is required, constructs the review request, and is the sole actor that resumes work after a review — but only once a human resolution is recorded. Master never treats ChatGPT's output as binding on its own. |
| **ChatGPT** | External, independent peer reviewer. Challenges assumptions, identifies missing requirements, risks, contradictions, dependencies, edge cases, and trade-offs; proposes alternatives. Produces a review only — never modifies the project, registry, Git history, or routes work. Has no automatic path back into Claude. |
| **User** | Reconciliation authority. Reads ChatGPT's findings and Master's position, and records the resolution for each finding (`ACCEPT` / `REJECT` / `MODIFY` / `DEFER` / `NEEDS_DISCUSSION`) with rationale. Only after this is recorded does Master act on the review. |
| **GitHub** | The shared, live collaboration workspace for a peer review. Holds the review request, the pasted ChatGPT findings, and the human resolution as a single issue thread. |
| **Project Docs (`docs/`)** | The permanent system of record. Once a review is resolved, its content is snapshotted into `docs/10-traceability/peer-reviews/` — GitHub is the live surface, not the archive. |
| **Peer Review Skill** | The documented procedure Master follows to classify, construct, post, and later reconcile a peer review. See `claude/peer-review-process/peer-review-skill.md`. |
| **MCP** | **Not used in v1.** No dedicated Peer Review MCP is built. Master uses its existing GitHub access directly. MCP remains a future option only — see §8. |

## 2. Flow

Human-mediated; no automatic ChatGPT → Claude callback exists.

```text
CLAUDE MASTER
     │  constructs review request (Peer Review Skill)
     ▼
   GITHUB  ──────────────────  issue created, labeled peer-review:pending
     │
     │  human copies request content into ChatGPT
     ▼
  CHATGPT  ──────────────────  independent review (blind or challenge mode)
     │
     │  human pastes ChatGPT's findings back into the issue
     ▼
   GITHUB
     │
     ▼
    USER   ──────────────────  records resolution per finding + rationale
     │
     ▼
   GITHUB  ──────────────────  Final Resolution section populated,
     │                          relabeled peer-review:resolved
     │  Master reads resolution on next invocation
     ▼
CLAUDE MASTER  ─────────────  snapshots issue into docs/10-traceability/peer-reviews/,
                               updates registry, resumes work
```

Master never receives ChatGPT's output directly or automatically. It only ever reads a human-recorded resolution.

## 3. Identifiers

| Identifier | Source | Notes |
|---|---|---|
| `conversation_id` | Master-assigned, per logical work thread | e.g. `LN-2026-00127` |
| `requirement_id` | Existing registry ID | e.g. `CR07` |
| `decision_id` | Master-assigned, per architecture/design decision | e.g. `D014` |
| `review_id` | **The GitHub issue number itself** | No separate counter is maintained — avoids two identifiers drifting out of sync for the same review. |
| `review_round` | Implicit in the issue's comment thread order | A follow-up round reuses the same issue; a new `review_id` is only created if a genuinely new review is opened. |

## 4. Governance — When Peer Review Is Required

**Mandatory** (Master must invoke before proceeding):
- Security- or privacy-sensitive architectural decisions (auth, data handling, PII).
- Effectively irreversible or costly-to-reverse decisions (schema/data-model changes affecting existing data, published API contracts, external integrations).
- Explicit user request.
- Reconsideration or reversal of a previously frozen major architecture decision.

**Discretionary** (Master's judgment):
- Major architecture decisions with multiple valid approaches.
- Significant requirement ambiguity.
- Cross-module dependencies spanning several requirements.
- Significant responsive/UI architecture decisions (S16-scoped).
- Low Master confidence.
- Significant technical trade-offs not otherwise covered above.

**Routine — peer review normally skipped**: simple CRUD, minor CSS/styling, straightforward bug fixes, formatting, documentation-only changes, mechanical refactoring, established/previously-reviewed patterns.

For every applicable decision, Master logs one of:
```text
Peer review requested
```
or
```text
Peer review intentionally not requested
Reason: ...
```
so the absence of a review is as traceable as its presence.

## 5. Review Modes

- **Blind** — Master's position (`master_position`) is omitted from the request; ChatGPT reviews the problem independently. Default when Master's confidence is low or multiple approaches are genuinely open.
- **Challenge** — Master's position is included and ChatGPT is explicitly asked to challenge it. Default otherwise, for targeted stress-testing of a fairly settled proposal.

Mode selection is Master's judgment at invocation time, guided by the same confidence signal used in the governance policy above — not a separately tracked decision.

## 6. Pending-Review Behavior

A decision with an open (`peer-review:pending`) review blocks **only that decision/requirement thread**. Master:
- does not treat the decision as resolved,
- does not proceed past it without an observed, populated `Final Resolution` section,
- continues unrelated work in parallel rather than blocking the whole session.

## 7. Security and Redaction Rules

- **Claude (Master)**: constructs the review request from the registry entry and linked documentation only — never full source code, secrets, credentials, connection strings, PII, or unrelated requirement content. Runs a manual redaction checklist (Peer Review Skill, step 4) before posting, since no automated scanner exists in v1.
- **GitHub permissions**: repo/issue visibility is the primary control on who and what can ever see review content — scope access accordingly.
- **ChatGPT**: treated as an untrusted destination for content once pasted; retention/logging is governed by the provider's own policies, outside this architecture's control.
- **Human**: the load-bearing checkpoint on both sides of the boundary — reviews the request before pasting into ChatGPT, and reviews the findings before acting on them.
- Because interaction is human-mediated (§2), ChatGPT never holds a GitHub credential or direct repo access in v1.

## 8. MCP Status

No Peer Review MCP is part of v1. Master's existing GitHub access plus the Peer Review Skill are sufficient for the responsibilities identified (posting requests, reading resolutions, correlation via GitHub's own issue numbers). A dedicated MCP remains a **future option only**, to be revisited if a concrete capability emerges that the Skill cannot provide (for example, a native ChatGPT-side GitHub connector, or automated redaction scanning).

## 9. Traceability

```text
Requirement → Decision → Peer Review (GitHub, live) → ChatGPT Findings
    → Human Resolution → Master Decision → Implementation → Testing
```

- **GitHub issue** = live working surface for one review.
- **`docs/10-traceability/peer-reviews/`** = permanent, committed record, written once a review reaches `Final Resolution`. See `docs/10-traceability/peer-reviews/README.md`.

## 10. CLBestPratice Alignment

- No new agent introduced; the four-agent model (Master, Innovation, UI, Development) is unchanged.
- Requirement-scoped, decision-scoped context only — no full-repository reads.
- Reusable capability implemented as a Skill, not new infrastructure.
- Git/GitHub-based traceability reinforced, not duplicated.
- Human control preserved structurally: no automated path from ChatGPT's output to Master's decision.
- Follow-up review rounds reuse the existing GitHub thread rather than retransmitting full context, preserving token efficiency.
