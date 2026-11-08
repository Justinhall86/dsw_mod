#!/usr/bin/env python3
"""What proves `tools/splice.py`. Nothing here goes into the game."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import replace_body, template, written
from tools.splice import insert

# where the block goes in the body below, and how many instructions go in
AT, HOW_MANY = 2, 2
# which of the six instructions below are jumps, and so have a place to be measured against
JUMPS = (0, 1, 4, 5)


# a kind of this file's own: these blocks go into a COPY and never reach the game
from framework.traps import FOR_A_CASE as MINE


def check(bc):
    """The cases: the four ways a jump can sit around the point, and the two refusals."""
    from cases.pipeline import refused

    fn = _a_body(bc)
    # only the four jumps have somewhere to go; the two in the middle are the point itself
    before = {i: _target(fn, i) for i in JUMPS}
    went_in = insert(bc, fn, AT, [_label(bc), _label(bc)], "the cases' own block", MINE)
    guard(went_in == HOW_MANY, "%d instruction(s) went in" % went_in)

    # ONTO THE POINT, FORWARDS: unmoved itself, and the point is now the block
    guard(_target(fn, 0) == AT, "the forward jump onto the point lands at %d" % _target(fn, 0))
    # ACROSS THE POINT: stretched, so it still lands on the instruction it always did
    guard(_target(fn, 1) == before[1] + HOW_MANY,
          "the jump across the point lands at %d" % _target(fn, 1))
    # ONTO THE POINT, BACKWARDS: shortened, because it moved and the point did not
    guard(_target(fn, 4 + HOW_MANY) == AT,
          "the backward jump onto the point lands at %d" % _target(fn, 4 + HOW_MANY))
    # WHOLLY AFTER THE POINT: both ends moved together, so nothing changes at all
    guard(_target(fn, 5 + HOW_MANY) == before[5] + HOW_MANY,
          "the jump after the point lands at %d" % _target(fn, 5 + HOW_MANY))
    # and every instruction still has exactly one line to blame
    marks = getattr(getattr(fn, "debuginfo", None), "value", None)
    guard(not marks or len(marks) == len(fn.ops),
          "%d instruction(s) and %d line(s) to blame" % (len(fn.ops), len(marks or [])))

    _nothing_reaching_it_refuses(bc, refused)
    refused(lambda: insert(bc, _a_body(bc), AT, [], "an empty block", MINE),
            "an empty block was spliced in", saying="splicing nothing in is not a change")
    refused(lambda: insert(bc, _a_body(bc), 99, [_label(bc)], "a block off the end", MINE),
            "a block was spliced past the end of the function", saying="and the function has")
    return went_in


def _nothing_reaching_it_refuses(bc, refused):
    """THE DEFECT THAT MADE THREE OF v1'S BUILDS DO NOTHING: a block no path arrives at."""
    fn = _a_body(bc)
    # a body whose point sits straight after a return, with no jump landing there
    replace_body(fn, [written(template(bc, "Ret"), ret=0), _label(bc)])
    refused(lambda: insert(bc, fn, 1, [_label(bc)], "an unreachable block", MINE),
            "a block nothing reaches was spliced in", saying="NOTHING REACHES THE BLOCK")
    # AND THE ENTRY IS REACHED, BY THE CALL: nothing sits in front of the first instruction
    entry = _a_body(bc)
    replace_body(entry, [written(template(bc, "Ret"), ret=0)])
    guard(insert(bc, entry, 0, [_label(bc)], "a block at the entry", MINE) == 1,
          "a block at the very entry was refused, and calling the function is what reaches it")


def _a_body(bc):
    """A copy of a real function carrying a body we wrote, so every jump's meaning is known."""
    real = [f for f in bc.functions if getattr(f, "nregs", None) is not None and f.ops]
    fn = deepcopy(min(real, key=lambda f: len(f.ops)))
    # 0->2 onto the point; 1->5 across it; 2 THE POINT; 4->2 onto it from after; 5->4 wholly after
    replace_body(fn, [_jump(bc, 1),
                      _jump(bc, 3),
                      _label(bc),
                      _label(bc),
                      _jump(bc, -3),
                      _jump(bc, -2)])
    return fn


def _jump(bc, distance):
    return written(template(bc, "JAlways"), offset=distance)


def _label(bc):
    return written(template(bc, "Label"))


def _target(fn, at):
    # where the jump at that position sends control, as a position in the function
    return at + 1 + gv(fn.ops[at].df["offset"])
