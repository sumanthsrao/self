# Open Questions

Status: Living document — every item here was explicitly raised during architecture review and deliberately left for a human decision, not guessed. Do not resolve one of these by assumption; update this file (removing the item) only when the user actually decides it.

1. **FAIL-loop retry/escalation limit.** The Master ↔ UI closed-loop handback (`claude/workflows/sdlc-flow.md`) needs a bound on repeated FAIL cycles before escalating to a human, but no number was ever set. A control (not a specific N) was agreed to be necessary.

2. **S16 structural treatment.** Currently a 16th sibling discovery subject alongside S01–S15. Whether it should instead be a cross-cutting platform tag applicable to any requirement was flagged as a possible concern, not decided — see `docs/01-discovery/DISCOVERY-FRAMEWORK.md`.

3. **Master fast-path policy.** Whether trivial/low-risk requests (e.g. a copy fix) must go through full discovery intake, or whether Master needs an explicit lightweight classification to avoid process overhead on tiny changes.

4. **Prefix registry governance.** Who is authorized to add a new ID prefix beyond the established S/CR/VW set, and under what criteria.

5. **Innovation → Production promotion criteria.** A promotion *step* (Innovation proposes, Master approves, a new registry ID is created) was recommended during review; the actual criteria for what qualifies an idea for promotion were never defined.

6. **Requirement registry file granularity.** Single flat `DISCOVERY-REGISTRY.yaml` (as originally proposed) vs. one-file-per-requirement plus a generated index (recommended during review to reduce git-conflict risk under parallel work). Not confirmed either way.

7. **UI validation tooling specifics.** Rendered-output-only validation follows from the UI Agent's boundary (it doesn't own implementation), but the exact mechanism — automated screenshot capture, which breakpoints, how DOM/accessibility-tree inspection is scoped — is not finalized.

8. **Interface Contract for parallel UI/Development.** Recommended during review as a lightweight shared artifact (screen/component list, data shape, states) to prevent rework when UI structure changes after Development has built against assumptions. Not confirmed as an adopted artifact; parallel work currently proceeds without one.

9. **Command set.** `discover`, `design`, `build`, `validate`, `release` are proposed names only. The original architecture explicitly states the exact set should be reviewed before implementation — that review has not happened.

10. **S01–S15 discovery point definitions.** The architecture defers these to "the existing Learnova discovery framework." That framework's content has not been supplied in this project. This is a missing input, not a design decision — it blocks populating the discovery registry.

11. **`claude/ui-ux-process/` and `claude/testing-process/` detailed content.** Anticipated by the architecture (Stitch process, responsive design process, test strategy, etc.) but never authored beyond the high-level lifecycle diagrams already captured in the relevant agent docs.

12. **Peer review timeout/fallback policy.** How long Master waits on an unresolved GitHub peer-review thread, or an unavailable reviewer, before proceeding without the review (`claude/peer-review-process/peer-review-architecture.md` §6 states the *rule* — decision blocks only itself — but not a wait threshold).

13. **Blind vs. Challenge peer-review mode selection rule.** A sensible default was proposed (blind when confidence is low or approaches are genuinely open; challenge otherwise), but whether this needs to be a formal rule or can remain Master's per-instance judgment was left open.

14. **GitHub repo/issue visibility for peer-review content.** Flagged as needing an explicit decision (private vs. public, access scope) given proprietary content crosses to a third party during peer review. Never set.
