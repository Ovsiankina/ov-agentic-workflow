# Contributing

Solo repo. These rules bind me and any agent editing it.

## Hard rule

Nothing in this repo executes. No scripts, no hooks, no CI, no CLI, no
Makefile, no `justfile`, no `build.rs`. Only prompts, markdown and
Cargo/clippy config. If a change would need a file to run, stop and ask
before writing it.

## What goes where

- `CLAUDE.md`: rules shared by every workflow. Change it only when the
  rule applies to all of them.
- `workflows/<name>/`: one directory per workflow. A workflow is
  complete when it has `ROADMAP.md`, `PROCEDURE.md`, `QA.md` and `docs/`
  templates. Until then it is a stub with a `README.md` only.
- `.claude/skills/<name>/SKILL.md`: one skill per directory. Prompts
  only, under 40 lines including frontmatter. A skill tells an agent
  what to do; it contains no code to run. Skills may call Superpowers
  skills by name.
- `workflows/cycle/Cargo.toml.snippet` and `clippy.toml`: config to
  paste. A new lint comes with a one-line comment naming the `QA.md`
  item it serves.

## How changes arrive

Improvements come from projects that use a copy of a workflow.

1. Change the copy in the project. Use it for at least one module.
2. Write one line in that project's `docs/learnings.md`.
3. Port the change here by hand. No submodules, no symlinks, no sync.
4. Bump the workflow version in the commit message.

## Commits

- One commit per coherent change. Message `ov-agentic-workflow:
  <workflow> v<n>` for a version bump, `<path>: <what>` for a fix.
- No AI co-author trailer.
- Templates stay templates: no project names, no real module names, no
  filled tables. Placeholders use `<angle brackets>`.

## Before a commit

- [ ] No file executes. The tree holds only `.md`, `.dsl`, `.toml`,
      `.snippet` and `.gitkeep`.
- [ ] Every skill is under 40 lines.
- [ ] Every path a skill or `CLAUDE.md` names exists in the template or
      is created by a step of the procedure.
- [ ] The layout table in `README.md` matches the tree.
