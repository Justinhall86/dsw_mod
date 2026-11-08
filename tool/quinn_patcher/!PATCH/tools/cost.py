#!/usr/bin/env python3
"""Per splice, the calls it adds once through and inside a loop of its own, off the built file."""
import io
import os

from tools.project import ROOT, gv, guard
from tools.splice import SPLICED_ON, distances_in, site_of, where

# the user's own list of splices whose looped calls they have accepted
ALLOWED = os.path.join(ROOT, "!PATCH", "allowed_loops.txt")


def allowed_to_loop():
    """Every splice name the user has accepted. A missing file allows nothing."""
    if not os.path.exists(ALLOWED):
        return set()
    return {ln.strip() for ln in io.open(ALLOWED, encoding="utf-8")
            if ln.strip() and not ln.startswith("#")}


def is_call(op):
    return op.op.startswith("Call")


def loops_in(block):
    """Every (start, end) of a loop our block closes on itself, found by its backward jump."""
    out = []
    for at, op in enumerate(block):
        for name in distances_in(op):
            lands = at + 1 + gv(op.df[name])
            if 0 <= lands <= at:
                out.append((lands, at))
    return out


def inside_a_loop(block):
    """Which positions of our block a loop of ours runs more than once."""
    covered = set()
    for start, end in loops_in(block):
        covered |= set(range(start, end + 1))
    return covered


def weigh(bc, fn, at, how_many):
    """One splice, as three counts: the game's own calls, ours, and ours inside a loop."""
    ours = list(fn.ops[at:at + how_many])
    theirs = list(fn.ops[:at]) + list(fn.ops[at + how_many:])
    looped = inside_a_loop(ours)
    return {"theirs": sum(1 for o in theirs if is_call(o)),
            "ours": sum(1 for i, o in enumerate(ours) if is_call(o) and i not in looped),
            "looped": sum(1 for i, o in enumerate(ours) if is_call(o) and i in looped)}


def each_splice(bc):
    """Every block this build spliced, with the function the splice WROTE DOWN for it."""
    made = getattr(bc, SPLICED_ON, None) or {}
    for what in sorted(made):
        at, how_many = where(bc, what)
        findex = site_of(bc, what)
        fn = next((f for f in bc.functions if gv(f.findex) == findex), None)
        guard(fn is not None, "`%s` says it went into f@%s, which is not in this file"
              % (what, findex))
        yield what, fn, at, how_many


def report(bc):
    """Count every splice, and REFUSE a looped call the user has not accepted by name."""
    ok = allowed_to_loop()
    rows, refused = [], []
    for what, fn, at, how_many in each_splice(bc):
        n = weigh(bc, fn, at, how_many)
        rows.append((what, n))
        if n["looped"] and what not in ok:
            refused.append("`%s` makes %d call(s) from inside a loop of its own, and the function "
                           "it sits in makes %d in total. A call in a loop is one per row walked, "
                           "not one" % (what, n["looped"], n["theirs"]))
    guard(not refused,
          "COST: " + "; ".join(refused)
          + " -- if that is meant, the USER adds the name to allowed_loops.txt")
    return ("COST: " + ", ".join(
        "`%s` +%d call(s)%s against %d" % (what, n["ours"] + n["looped"],
                                           " (%d looped)" % n["looped"] if n["looped"] else "",
                                           n["theirs"]) for what, n in rows) or "COST: none")
