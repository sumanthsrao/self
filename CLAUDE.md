# Learnova 3.0 — Claude Entry Point

This repository currently holds the **established Claude Code development process** for Learnova 3.0. Product implementation (`src/`) has not started. Read this file first; it points to detail rather than containing it.

## Governing Principle

Few agents, clear boundaries, centralized knowledge, automated synchronization, closed-loop validation.

## The Four Agents

All requests enter through **Master Discovery**. There is no fifth agent — a capability that doesn't need end-to-end lifecycle ownership becomes a skill, command, or hook instead, not a new agent.

| Agent | Owns | Definition |
|---|---|---|
| Master Discovery | What are we building, is it in scope, and is it done | `claude/agents/master-discovery.md` |
| Innovation / Vision | What could we build in the future | `claude/agents/innovation-vision.md` |
| UI | How it should look/behave/respond, and design conformance | `claude/agents/ui.md` |
| Development | How we build, test, version-control, and deliver it | `claude/agents/development.md` |

End-to-end flow: `claude/workflows/sdlc-flow.md`. Automated validation/hooks: `claude/workflows/validation-and-hooks.md`.

## Documentation Split

- `src/`, `tests/`, `scripts/` — product code (not started).
- `docs/` — Learnova product knowledge (what/how it's designed).
- `claude/` — how Claude works on Learnova (this split must not be mixed).
- `project-structure/FOLDER-STRUCTURE.md` — authoritative folder-by-folder definition.

## Requirement Identity

Semantic alphanumeric IDs (`S01`, `CR02`, `VW01`, ...), prefix = structural category. Central registry and naming rules: `docs/01-discovery/REQUIREMENT-REGISTRY.md`. Discovery framework (S01–S16): `docs/01-discovery/DISCOVERY-FRAMEWORK.md`. Traceability model: `docs/10-traceability/TRACEABILITY-MODEL.md`.

## External Peer Review

Master may invoke an independent ChatGPT review for high-impact decisions, mediated through GitHub with the user as the reconciliation authority. Accepted architecture: `claude/peer-review-process/peer-review-architecture.md`. No dedicated MCP in v1.

## Context-Loading Rule

Agents load registry entry → linked documentation → relevant code. Never re-read the entire repository to find a task. Each agent's allowed-context rule is stated in its own definition file.

## Before Assuming a Policy Value

A number of decisions were deliberately left open during architecture review rather than guessed. Check `claude/OPEN-QUESTIONS.md` before assuming a retry limit, governance threshold, or process detail not stated explicitly in an agent/workflow doc.

## Maintenance

Rules for what belongs in this file versus elsewhere: `claude/claude-md/CLAUDE-MD-GUIDE.md`.
