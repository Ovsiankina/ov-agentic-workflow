# Workflow: poc

Stub. Only this file exists for now.

## What it is

A fully autonomous proof of concept. Input: a short brief, a paragraph
to a page, in `docs/brief.md`. Output: a running POC and a report. No
questions in between. The agent decides everything the brief leaves
open and writes each decision down.

This is the opposite of `cycle`. `cycle` protects the pub surface, data
layout and dependencies. `poc` may break all three, because nothing
from a POC is kept as code. What is kept is the report.

## Run

1. I write `docs/brief.md`: the problem, inputs and outputs, the one
   number that says it worked, the time box.
2. The agent runs `/goal` with the oracle "the brief's number is met and
   `cargo test` is green". No `/mode`, no deferrals: a POC agent decides.
3. The agent writes `docs/poc-report.md`.
4. I read the report, not the code. Keepers become requirements in
   `docs/srs.md`, and the project enters `cycle` at step 1 or 2.

## The report

Headings, in this order:

1. **Algorithms and maths used.** Each with the reference it came from,
   its complexity, and the alternative that was rejected and why.
2. **Architecture proposed.** C1/C2 in words or DSL. Which parts carried
   load in the POC and which were scaffolding.
3. **Data structures and why.** Each hot struct: fields, size, why this
   layout, what breaks if it changes.
4. **What to keep for the beta.** Three lists: keep as is, keep the idea
   but rewrite under contract, drop.
5. **Decisions.** Every choice the brief left open, one line each.
6. **Numbers.** The brief's success metric, measured, and how.

## Not yet

`ROADMAP.md`, `PROCEDURE.md`, `QA.md` and skills for this workflow.
When they exist, `CLAUDE.md`'s "read `workflows/<name>/ROADMAP.md`
first" applies here too.
