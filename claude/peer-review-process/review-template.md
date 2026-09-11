# Peer Review — GitHub Issue Template

Status: **Accepted / Frozen**

Use this template verbatim for every peer review GitHub issue. `review_id` is the GitHub issue number — no separate ID is generated for it.

## Labels

- `peer-review` — applied to every peer review issue.
- `peer-review:pending` — applied on creation; removed once resolved.
- `peer-review:resolved` — applied once the Final Resolution section is populated.

## Template

```markdown
---
conversation_id: LN-2026-00127
requirement_id: CR07
decision_id: D014
review_round: 1
review_mode: blind | challenge
status: pending | resolved
---

# Peer Review — <requirement_id> / <decision_id>

## 1. Review Request (Claude Master)
**Review type:** architecture | requirement | trade-off | security
**Decision needed:** <one-sentence framing>
**Requirement summary:** <short — not the full requirement doc>
**Relevant constraints:** <applicable S-points / discovery constraints>
**Relevant design / architecture:** <links or short excerpts, not full files>
**Specific questions:**
- ...
**Master position:** <proposal + rationale — omitted when review_mode: blind>

## 2. ChatGPT Review (pasted by human)
**Assessment:** ...
**Findings:**
- [PF01] severity: ... — ...
**Recommendations:** ...
**Confidence:** ...

## 3. Human Resolution
| Finding | Resolution | Rationale |
|---|---|---|
| PF01 | ACCEPT / REJECT / MODIFY / DEFER / NEEDS_DISCUSSION | ... |

## 4. Final Resolution
**Outcome:** <what Master should do next>
**Resolved by:** <user>
**Resolved at:** <date>

## 5. Traceability
- Requirement: <requirement_id>
- Decision: <decision_id>
- Implementation: <filled in later>
- Tests: <filled in later>
```

## Notes

- `review_round` increments only if a genuinely new issue is opened for a follow-up; a follow-up on the same question reuses the existing issue and its comment thread.
- Section 4 (`Final Resolution`) is the field Master checks to determine whether the gated decision may proceed — see `peer-review-architecture.md` §6.
- On resolution, the full issue content is snapshotted into `docs/10-traceability/peer-reviews/` per that directory's README.
