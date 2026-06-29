# ctxd_client — Game Wiki Schema

You are the wiki maintainer for this game project. Build and maintain a persistent knowledge base in `wiki/`. Read from `raw/` but never modify it.

## Project

- **Engine**: Unity 6.5 (6000.5.1f1) — URP 17.5, 2D toolchain
- **Project root**: one level up from this `.wiki/` directory
- **Created**: 2026-06-27

## Directory structure

```
.wiki/
├── CLAUDE.md       # This file
├── raw/            # Immutable sources
│   ├── gdd/
│   ├── meetings/
│   ├── references/
│   ├── feedback/
│   ├── technical/
│   └── assets/
└── wiki/           # LLM-owned
    ├── index.md
    ├── log.md
    ├── overview.md
    ├── claims.md           # Cross-page facts with citations (provenance)
    ├── contradictions.md   # Conflicting claims, kept until resolved
    ├── open-questions.md   # Unanswered design/tech questions
    ├── sources/            # One summary page per ingested source
    ├── systems/
    ├── entities/
    ├── world/
    ├── art/
    ├── technical/
    ├── decisions/
    ├── bugs/
    └── analysis/
```

## Provenance ledger

The four meta files (`claims.md`, `contradictions.md`, `open-questions.md`, `sources/`) form the provenance layer. **Always cite a source for cross-page facts.** When a GDD revision or playtest disputes an existing claim, append to `contradictions.md` instead of overwriting silently — design history matters for balance discussions.

## Page conventions

Every page has YAML frontmatter:
```yaml
---
title: Page Title
category: systems | entities | world | art | technical | decisions | bugs | analysis | meta | sources | overview | index | log
tags: [relevant, tags]
sources: [raw/gdd/file.md]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

> **Exception — source-summary pages** (`category: sources`): use `source_path: raw/<dir>/<file>` instead of the `sources:` list, since each such page describes exactly one source. LINT treats this as equivalent.

### Wikilinks — ALWAYS with category path

- `[[systems/combat-system]]` ✓
- `[[combat-system]]` ✗ (requires Glob to resolve)

Typed relationships:
- `[[systems/x]] (depends on)`
- `[[systems/y]] (contradicts)` — use with `> [!warning]`
- `[[systems/z]] (supersedes)`
- `[[systems/w]] (see also)`

### Backlinks section

Every page ends with:
```markdown
---
## Backlinks
- [[entities/player]] — uses this system
- [[decisions/combat-balance]] — references this
```
Maintained on ingest/lint.

### Callouts

```markdown
> [!warning] Contradiction
> [!question] Open Question
> [!info] Design Intent
> [!bug] Known Issue
> [!tip] Optimization Note
```

## Decision template

```markdown
## [Decision Title]
**Date**: YYYY-MM-DD
**Decided by**: [who]
**Status**: active | superseded | under review

### Context
[Why this came up]

### Options considered
1. **Option A** — pros / cons
2. **Option B** — pros / cons

### Decision
[Chosen option and rationale]

### Consequences
[Trade-offs accepted, follow-up needed]
```

## Index format

```markdown
- [[systems/combat-system]] — Turn-based combat with elemental weaknesses (3 sources, 5 backlinks)
```

## Log format

```markdown
## [YYYY-MM-DD] operation | Subject
- What was done
- Pages created: [[...]]
- Pages updated: [[...]]
```

## Principles

1. **Sources are sacred** — never modify `raw/`
2. **Link aggressively** — every concept with a page gets linked
3. **Flag uncertainty** — callouts, not assertions
4. **Compound, don't repeat** — update existing pages
5. **Game context first** — frame tech decisions in gameplay impact
6. **Engine-specific notes go in `technical/`** — not scattered

## This project's custom rules

<!-- Add project-specific conventions below as you learn them. -->
- Asset-driven battle game: sprite/data assets live under `Assets/Resources/` (e.g. `sprite/army/att|def/<unitId>/<action>/<frame>.png`). When documenting entities, cite the resource path.
- Asset folder names use Chinese-origin slugs (e.g. `WuShenFuTi` 武神附体, `wujiangjuexing` 武将觉醒, `warFeatAnger` 怒气). Record the literal slug AND its meaning in the relevant page.
- Custom gameplay C# is not yet present (only TextMesh Pro example scripts ship in `Assets/`). Until game scripts exist, document systems from assets + any ingested GDD, and flag the code gap with `> [!question]`.
- Unity-specific notes (URP, Input System, 2D Animation/Aseprite import) go in `technical/`.

### Working agreement (set by project owner, 2026-06-29) — MANDATORY
1. **Record everything in the wiki** — whatever is done, document it here in `.wiki/`.
2. **Do it yourself, autonomously** — do almost the entire build yourself. Hard Unity tasks → Unity MCP; when a tool can't finish, run the tool then do the remaining manual steps yourself (click/press).
3. **Self-compile & self-verify** — compile the project yourself and check the running game against the owner's requirements before claiming done.
4. **Always re-check the GDD** ([[GDD]]) before/while doing anything.
5. **If context is thin, re-read the GDD and wiki** instead of guessing.

> Build target & decisions: follow [[decisions/game-version-scope]] (somo-era). Battle/geometry: [[systems/battle-system]]. Architecture: [[technical/client-server-architecture]] (server-authoritative).
> Unity MCP (v9.7.3) needs the Editor open + MCP connected to compile/run/drive; if disconnected, request reconnection before claiming compile/run results.
