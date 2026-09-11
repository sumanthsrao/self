# Open Questions

Status: Living document. Most former open items were resolved by the ##Master Freedom principle (##Master decides process depth for a given request; a short list of mandatory controls always applies — see `CLAUDE.md` and `claude/agents/master-discovery.md`) and the specific decisions recorded there. The S01–S16 discovery framework is now fully defined (`docs/01-discovery/DISCOVERY-FRAMEWORK.md`) and is no longer open. What remains here are items still genuinely undecided, and none of them block starting work — ##Master can decide each when the actual need arises. Do not resolve one by assumption; update this file only when the user actually decides it.

1. **Requirement registry file granularity.** Single flat `DISCOVERY-REGISTRY.yaml` vs. one-file-per-requirement plus a generated index (the latter was recommended during review to reduce git-conflict risk under parallel work). Not confirmed either way. See `docs/01-discovery/REQUIREMENT-REGISTRY.md`.

2. **UI validation automation mechanism.** Rendered-output-only validation is established, and depth-per-request is ##Master's call (`claude/agents/ui.md`), but the specific mechanism — automated screenshot capture, which breakpoints, how DOM/accessibility-tree inspection is scoped — has not been specified.

3. **GitHub repo/issue visibility for peer-review content.** Needs an explicit decision (private vs. public, access scope) given proprietary content crosses to a third party during peer review. Never set — see `claude/peer-review-process/peer-review-architecture.md` §7.
