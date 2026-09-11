# Discovery Framework

Status: Partially established — see gap below

## Structure

A 16-point discovery framework, centrally registered:

```text
DISCOVERY-REGISTRY
│
├── S01 … S15  (existing Learnova discovery framework)
└── S16        Multi-Platform Availability
```

The registry is the authoritative source for discovery parameters. It should be extensible — S16 is an addition, not a hard ceiling on the framework.

## S01–S15

Defined by "the existing Learnova discovery framework," referenced but not reproduced or re-derived in this project's Claude Code sessions. **This content has not been provided and does not exist in this repository.** It must be supplied (or its source identified) before `docs/01-discovery/DISCOVERY-REGISTRY.yaml` can be populated. See `claude/OPEN-QUESTIONS.md` #10.

## S16 — Multi-Platform Availability

```text
S16 = Multi-Platform Availability
  Desktop
  Mobile
  Tablet
```

**Open question, not decided:** S16 is currently structured as a 16th subject, a sibling of S01–S15. Because platform availability is a dimension that can apply to many requirements simultaneously (unlike a subject a requirement "belongs to"), whether it should instead be modeled as a cross-cutting modifier/tag on any requirement was raised during review as a possible concern. It was explicitly **not** changed pending a decision that depends on precedent in the S01–S15 framework this project doesn't have visibility into. See `claude/OPEN-QUESTIONS.md` #2.

## Registry Location

`docs/01-discovery/DISCOVERY-REGISTRY.yaml` (not yet created — no Learnova 3.0 requirements exist yet).
