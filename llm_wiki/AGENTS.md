# LLM Wiki Maintainer Protocol

Use this project-local wiki as edited long-term AI memory.
All paths below are relative to this `llm_wiki/` directory unless stated otherwise.

## Layers

- `raw/sources/`: immutable source documents. Do not edit or overwrite.
- `raw/assets/`: immutable media/assets unless the user asks.
- `wiki/`: edited knowledge pages with citations and internal links.
- `templates/`: page shapes for new wiki pages.
- `workflows/`: local operating procedures.
- `tools/`: helper commands.

## Rules

- Read `wiki/index.md` before answering or updating the wiki.
- Use wikilinks like `[[page-slug]]` for pages in `wiki/`.
- Use normal Markdown links or code paths for raw files and project files.
- Do not invent unsupported facts. Mark reasoning as `Inference:` when needed.
- Do not delete old claims just because new claims arrive. Mark them `disputed` or `superseded`, or record the issue in `wiki/contradictions.md`.
- After meaningful ingest or wiki updates, update `wiki/index.md` and append `wiki/log.md`.
