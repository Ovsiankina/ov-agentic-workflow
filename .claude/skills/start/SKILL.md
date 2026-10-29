---
name: start
description: Open a cycle session. Reads workflows/cycle/ROADMAP.md, says which module is at which step, asks the mode for any module that has none. Use at session start or on /start.
---

# start

1. Read `workflows/cycle/ROADMAP.md`. If it is missing, say so and stop:
   this project has not adopted the workflow yet.
2. Say which module is at which step. Then list only what blocks the
   current step, one line each. Nothing else.
3. For every row whose mode is unset and whose step is 4 or 5, invoke
   the `mode` skill for that module. One module at a time.
4. Before step 5, if no plan file `docs/plans/<module>.md` exists for
   this module and profile isn't `toy`, run `superpowers:writing-plans`
   first; don't ask.
5. Stop. Do not start building. Wait for the user to pick a module.

Rules:

- Rows whose owner is `mine` are reported but never proposed for a loop.
- If the table is empty, propose step 1 and offer
  `superpowers:brainstorming`.
- If the next module is at step 3, offer `superpowers:writing-plans`.
- If the next module is at step 6, offer
  `superpowers:requesting-code-review` with `QA.md` as the checklist.
