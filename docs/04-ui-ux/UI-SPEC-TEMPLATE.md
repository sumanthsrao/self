# UI/UX Specification Template

Status: Established

One file per requirement: `docs/04-ui-ux/<Requirement ID>.md`. This is the authoritative UI/UX spec Development builds against — produced by UI Agent Mode A (`claude/agents/ui.md`), and updated through the Change Request flow (`claude/workflows/sdlc-flow.md`) rather than edited silently in place.

## Structure

A single-screen requirement is one spec. A multi-screen requirement has one section per screen, keyed by Screen ID.

```yaml
requirement_id: CR07
screen_id: SC02              # omit for single-screen requirements
screen_name: Diagnostic Deep-Dive

source: Direct Body           # or the exact variant name that was selected
selected_by: user              # or "##Master" for a small change handled directly
selection_rationale: >
  Short note on why this became the spec — especially if a variant or a
  merge was chosen over the Direct Body.

discovery_refs:
  s09: [relevant UI/UX notes]
  s16: [desktop/mobile/tablet-specific notes]

design_system:
  tokens: [...]
  components: [...]

stitch_reference: <artboard name or link>
```

## Example (illustrative — not a real registry entry)

```yaml
requirement_id: CR07
screen_id: SC02
screen_name: Diagnostic Deep-Dive

source: "Variant 2: Diagnostic Dossier & Radial Metrics"
selected_by: user
selection_rationale: >
  Radial metrics read faster for a parent scanning multiple subjects at
  once than Variant 1's command-matrix layout; Variant 1's color-coded
  mastery bands were merged into the radial chart.

discovery_refs:
  s09: ["Reduce cognitive load for a first-time parent user"]
  s16: ["Radial chart collapses to a stacked list under 480px (Mobile)"]

design_system:
  tokens: [color.mastery.band, spacing.card.md]
  components: [RadialMetric, MasteryBand]

stitch_reference: "Learnova 3.0 — S16: Parent Portal (Variant 2: Diagnostic Dossier & Radial Metrics)"
```
