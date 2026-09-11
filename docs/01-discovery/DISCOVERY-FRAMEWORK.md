# Discovery Framework

Status: S16 established and mandatory; S01–S15 content still missing (see gap below)

## Structure

A 16-point discovery framework, centrally registered:

```text
DISCOVERY-REGISTRY
│
├── S01 … S15  (existing Learnova discovery framework)
└── S16        Multi-Platform Availability — MANDATORY
```

The registry is the authoritative source for discovery parameters. All 16 points are defined/documented; not every request needs deep treatment on every point — see Master's Discretion below.

## S01–S15

Defined by "the existing Learnova discovery framework," referenced but not reproduced or re-derived in this project's Claude Code sessions. **This content has not been provided and does not exist in this repository.** It must be supplied (or its source identified) before `docs/01-discovery/DISCOVERY-REGISTRY.yaml` can be populated for points other than S16. See `claude/OPEN-QUESTIONS.md`.

## S16 — Multi-Platform Availability (Mandatory)

```text
S16 = Multi-Platform Availability — MANDATORY
  Desktop
  Mobile
  Tablet
```

S16 remains a discovery point alongside S01–S15 — its structure is unchanged. Its **consideration is mandatory**: Desktop, Mobile, and Tablet must always be evaluated for relevant product/feature discovery, even when Master exercises discretion over depth elsewhere. This is the one discovery point Master cannot skip regardless of scope/impact/risk judgment.

## Master's Discretion Over Depth

Master decides which of the 16 points require depth for a given request (`claude/agents/master-discovery.md`). S16 is the exception: its applicability must always be considered, though the depth of that consideration (e.g. how much platform-specific detail is captured) is still Master's call.

## Registry Location

`docs/01-discovery/DISCOVERY-REGISTRY.yaml` (not yet created — no Learnova 3.0 requirements exist yet).
