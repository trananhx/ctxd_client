---
title: Open Questions
category: meta
created: 2026-06-27
updated: 2026-06-27
---

# Open Questions

Game design / tech questions the wiki cannot answer yet. Move entries out when resolved (link to the page that answered it).

## Format

```markdown
### q-YYYYMMDD-NN — <question>
- **Why it matters**: gameplay/tech impact
- **Where it surfaced**: [[systems/x]] / `raw/meetings/2025-01-15.md`
- **Candidates / partial info**: optional
- **Status**: open | answered → [[decisions/...]] | obsolete
```

## Open

### q-20260627-01 — What is the core combat loop (turn structure, targeting, win condition)?
- **Why it matters**: Defines every downstream system (skills, formations, rage). Nothing in the repo yet documents rules — only art assets exist.
- **Where it surfaced**: Initial asset survey; no GDD ingested yet.
- **Candidates / partial info**: Asset folders imply a turn/phase battle with attack vs defense states, generals, skills, formations, and a rage/anger meter (`warFeatAnger`).
- **Status**: open — needs a GDD in `raw/gdd/`

### q-20260627-02 — Where will runtime gameplay code live, and is there a server component?
- **Why it matters**: Project is named `ctxd_client`, implying a client/server split, but no networking or game C# is present (only TextMesh Pro examples).
- **Where it surfaced**: `Assets/` script survey; `manifest.json` has `unitywebrequest` modules but no dedicated netcode package.
- **Candidates / partial info**: "_client" suffix suggests an authoritative backend the client talks to (likely via UnityWebRequest/HTTP or a custom socket layer).
- **Status**: open

### q-20260627-03 — What do the numeric unit IDs (2, 10, 31, 33, 43, 67, 102, 1001) map to?
- **Why it matters**: Needed to build the [[entities]] roster (which general/troop each sprite set represents).
- **Where it surfaced**: `Assets/Resources/sprite/army/{att,def}/`.
- **Candidates / partial info**: Likely general/troop config IDs that a data table (not yet in repo) resolves to names and stats.
- **Status**: open

## Answered
