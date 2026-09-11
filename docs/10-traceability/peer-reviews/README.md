# Peer Reviews — Permanent Record

Status: **Accepted / Frozen**

This directory is the permanent, committed system of record for resolved ChatGPT peer reviews. The corresponding GitHub issue is the **live** working surface for a review while it is open; this directory is the **permanent** archive once a review reaches Final Resolution — GitHub content remains editable/deletable by anyone with repo access and is not treated as the authoritative long-term record. See `claude/peer-review-process/peer-review-architecture.md` §9.

## When a File Is Created

A snapshot file is written here only after a peer review's GitHub issue reaches `Final Resolution` (per `claude/peer-review-process/review-template.md`), as the last step of the Peer Review Skill procedure (`claude/peer-review-process/peer-review-skill.md`, step 8).

## Naming Convention

```text
<decision_id>-<review_id>.md
```

`review_id` is the source GitHub issue number. Example: `D014-482.md`.

## Minimum Metadata Per Snapshot

Each snapshot file must retain, at minimum:

- `review_id` (GitHub issue number)
- `conversation_id`
- `requirement_id`
- `decision_id`
- `review_round`
- `review_mode` (blind | challenge)
- Reviewer identity, including model/version (e.g. which ChatGPT model produced the findings)
- Timestamp of Final Resolution
- The full content of the source GitHub issue at resolution time (Review Request, ChatGPT Review, Human Resolution, Final Resolution, Traceability sections)
- Link to the resulting implementation/tests, once available

## Relationship to the Registry

Each snapshot's `requirement_id` and `decision_id` should be reflected in the corresponding requirement's registry entry, so traceability queries can resolve from a requirement to every peer review that touched it.
