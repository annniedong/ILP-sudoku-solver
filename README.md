# Sudoku Solver with Inductive Logic Programming (Popper)

This solves Sudoku by learning the puzzle's "peer" rule with
[Popper](https://github.com/logic-and-learning-lab/Popper) instead of
hand-writing it, then using that learned rule in a Prolog backtracking
solver. Popper only learns the rule — it does not solve puzzles itself.

## Files

- `bias.pl` — the language bias given to Popper (allowed predicates and types)
- `bk.pl` — background knowledge: which row/column/box each of the 81 cells belongs to
- `exs.pl` — positive and negative examples of the `peer/2` relation
- `gen_data.py` — generates `bk.pl` and `exs.pl`
- `learned.pl` — the rule Popper learned, pasted in after running it
- `solver.pl` — backtracking Sudoku solver built on the learned rule

## Running it

1. Install [SWI-Prolog](https://www.swi-prolog.org/) (9.1.12+) and
   [Popper](https://github.com/logic-and-learning-lab/Popper).
2. Generate the data files: `python3 gen_data.py`
3. Learn the rule: `python popper.py /path/to/this/folder`
4. Copy Popper's output into `learned.pl`.
5. Solve the example puzzle: `swipl -g main -t halt solver.pl`

## What Popper learned

```prolog
peer(V0,V1) :- col(V0,V2), col(V1,V2).
peer(V0,V1) :- box(V0,V2), box(V1,V2).
peer(V0,V1) :- row(V0,V2), row(V1,V2).
```

Precision 1.00, recall 1.00 on the generated examples (80 positive, 80 negative).

## Notes

Written with help from an LLM (Claude).
