#!/usr/bin/env python3
"""What proves `tools/splice.py` keeps every block's place when two go into one function."""
from copy import deepcopy
from types import SimpleNamespace

from tools.hlcode import template
from tools.project import guard
from tools.splice import insert, where


def check(bc):
    """Four blocks into two scratch functions of our own; the game's file is never touched."""
    ours = SimpleNamespace()
    one = _scratch(bc, 1)
    other = _scratch(bc, 2)
    insert(ours, one, 2, _labels(bc, 2), "first", "a case")
    insert(ours, one, 1, _labels(bc, 3), "ahead of it", "a case")
    insert(ours, one, 7, _labels(bc, 1), "behind it", "a case")
    insert(ours, other, 0, _labels(bc, 4), "elsewhere", "a case")
    insert(ours, one, 6, _labels(bc, 2), "inside it", "a case")
    for name, want in (("first", (5, 4)), ("ahead of it", (1, 3)), ("behind it", (9, 1)),
                       ("elsewhere", (0, 4)), ("inside it", (6, 2))):
        guard(tuple(where(ours, name)) == want,
              "`%s` is recorded at %s and sits at %s" % (name, where(ours, name), want))
    first, length = where(ours, "first")
    guard(all(op.op == "Label" for op in one.ops[first:first + length]),
          "the place recorded for `first` does not hold a block")
    return "5 blocks in 2 functions, each recorded where it sits"


def _scratch(bc, number):
    return SimpleNamespace(ops=_labels(bc, 3) + [deepcopy(template(bc, "Ret"))], findex=-number)


def _labels(bc, how_many):
    return [deepcopy(template(bc, "Label")) for _ in range(how_many)]
