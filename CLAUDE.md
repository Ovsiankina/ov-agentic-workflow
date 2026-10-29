# Shared rules

Read `workflows/<name>/ROADMAP.md` first. It says which workflow this
project runs, which module is at which step, who owns it and in which
mode. Then read `workflows/<name>/PROCEDURE.md` for the step you are on,
and `workflows/<name>/QA.md` before any PR.

The **oracle** is the set of mechanical checks in `QA.md` tagged
`[oracle]`: tests, clippy, pub diff. "Green" means all of them pass.

## Agent decision policy

**Allowed, never ask:** any internal choice that keeps the oracle green.
Algorithm, private helper, error text, local naming, test data,
iteration order, private struct. Mark each one where it happens:

    // DECISION: <one line: what was chosen and why>

**Forbidden, defer instead:**

- anything `pub`: signature, visibility, new item, re-export, trait impl
  on a pub type
- data layout: `#[repr]`, field order, field types, enum discriminants,
  anything a `size_of` test pins
- dependencies: adding, removing, bumping, feature flags
- `unsafe`, anywhere
- any module whose ROADMAP row says owner `mine`

When a task hits one of these:

1. Write it to `docs/deferred.md`: module, step, what was needed, why it
   is forbidden, the smallest change that would unblock.
2. Mark the blocked test `#[ignore = "deferred"]`.
3. Continue with the rest of the task.

After 3 deferrals on one module: stop that module, set its ROADMAP
status to `needs contract rework`, move to the next module.

## Soft rule: modules marked "mine"

Do not edit files of a module whose owner is `mine` unless the task
cannot be done otherwise. If you do, list those files first in your
summary, before anything else, with one line on why.
