# ov-agentic-workflow

Templates for running solo Rust projects with Claude Code: a 9-step
module cycle, a review checklist, lint config, and four skills.

**Hard rule: nothing in this repo executes.** No scripts, no hooks, no
CI, no CLI. Only prompts, markdown and Cargo/clippy config. If a file
would need to run to be useful, it does not belong here.

## Layout

| Path | What |
|---|---|
| `CLAUDE.md` | shared soft rules: decision policy, deferrals, "mine" modules |
| `CONTRIBUTING.md` | rules for changing this repo: what goes where, how changes flow back, commits |
| `workflows/cycle/` | the 9-step cycle. Complete. |
| `workflows/poc/` | autonomous fast POC. Description only. |
| `.claude/skills/` | `start`, `contract`, `close`, `mode` |

## Copy a workflow into a project

1. Copy `CLAUDE.md` to the project root, or merge it into the existing one.
2. Copy `workflows/<name>/` to `workflows/<name>/` in the project.
   `ROADMAP.md`, `PROCEDURE.md` and `QA.md` stay there.
3. Move `workflows/<name>/docs/` to the project's `docs/`. Skills and
   `CLAUDE.md` refer to `docs/srs.md`, `docs/deferred.md` and so on at
   the project root.
4. Copy `.claude/skills/` to the project's `.claude/skills/`.
5. Paste `workflows/cycle/Cargo.toml.snippet` into `Cargo.toml` and put
   `workflows/cycle/clippy.toml` next to it.
6. Fill the status table in `workflows/cycle/ROADMAP.md`. Run `/start`.

Each project keeps its own copy. Improvements flow back here by hand.

## Workflows

- **cycle**: new module runs steps 1→9, a change (bug, small feature,
  refactor) runs 4→7. Per module, the owner decides who builds it
  (mine / delegated) and how (draft / pair / loop).
- **poc**: short brief in, running POC and a report out, no questions
  in between. Stub: only its README exists.
