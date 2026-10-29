---
name: close
description: End of a cycle step. Checks the exit test, updates the module's ROADMAP row, appends deferrals to docs/deferred.md, adds one line to docs/learnings.md. Use on /close <module> <step>.
---

# close

Input: module name and the step just finished. Ask for either if not
given.

1. Verify the exit test for that step in `workflows/cycle/PROCEDURE.md`
   is met. If not, say which part fails and stop. Never close a step on
   a promise.
2. Update the row in `workflows/cycle/ROADMAP.md`:
   - `step` → the next step, or `needs contract rework` after 3 open
     deferrals on this module
   - `last oracle run` → today's date and green/red, if the oracle ran
   - `branch` → the current branch name, if the column is empty
3. Append to `docs/deferred.md` every deferral raised during the step
   that is not already there. One row each, status `open`.
   Tick the tasks in `docs/plans/<module>.md` whose IDs appear in
   commits since the last close.
4. Append one line to `docs/learnings.md`: date, module, step, one
   sentence on what to do differently next time. One line, not a
   paragraph. If there is nothing to learn, write `nothing new`.
5. Print the updated row and the learnings line. Nothing else.

Rules:

- Never edit another module's row.
- Never remove a deferral. Set status `done` with the date instead.
- Closing step 6: invoke `superpowers:requesting-code-review` with
  `workflows/cycle/QA.md` before point 1.
- Closing step 7: confirm the squash commit is on main before point 2.
