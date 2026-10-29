---
name: start
description: Open a cycle session. Reads workflows/cycle/ROADMAP.md, says which module is at which step, asks the mode for any module that has none. Use at session start or on /start.
---

# start

1. Read `workflows/cycle/ROADMAP.md`. If it is missing, say so and stop:
   this project has not adopted the workflow yet.
2. Read the status table. One line per row:
   `<module> · owner <mine|delegated> · mode <mode|unset> · step <n> · <branch> · oracle <last run>`
   Rows with `needs contract rework` come first.
3. Say which module is next, using the dependency rule in ROADMAP: a
   module enters step 4 only when all its dependencies are at step 4 or
   later. Name the blocker if a module is waiting.
4. For every row whose mode is unset and whose step is 4 or 5, invoke
   the `mode` skill for that module. One module at a time.
5. Read `workflows/cycle/PROCEDURE.md` for the next module's step and
   state its exit test in one line.
6. Stop. Do not start building. Wait for the user to pick a module.

Rules:

- Rows whose owner is `mine` are reported but never proposed for a loop.
- If the table is empty, propose step 1 and offer
  `superpowers:brainstorming`.
- If the next module is at step 3, offer `superpowers:writing-plans`.
- If the next module is at step 6, offer
  `superpowers:requesting-code-review` with `QA.md` as the checklist.
