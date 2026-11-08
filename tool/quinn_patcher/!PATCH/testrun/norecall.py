#!/usr/bin/env python3
"""Stop the stress switch typing `rec all`: the call in `cmdsfile`'s step picked by its word."""
from tools.project import gv, guard
from tools.hlcode import calls, function_named, make_nop
from testrun import cmdsfile

# what the game types, and the only thing this file knows about it
WORD = "rec all"


def word_global(bc, word):
    """The place the game already keeps that word in, found BY THE WORD."""
    spelled = [i for i, s in enumerate(bc.strings.value) if s == word]
    guard(len(spelled) == 1,
          "the file spells %r %d times, and this reads the one" % (word, len(spelled)))
    wanted = spelled[0]
    found = []
    for c in getattr(bc, "constants", None) or []:
        at = next((getattr(c, a) for a in ("gloabl", "global_", "_global", "globl")
                   if hasattr(c, a)), None)
        if at is None or not c.fields:
            continue
        if gv(c.fields[0]) == wanted:
            found.append(gv(at))
    guard(len(found) == 1,
          "%d places hold %r, and this reads the one" % (len(found), word))
    return found[0]


def install(bc):
    """Make that one call a do-nothing. Every other line the step types is untouched."""
    step = cmdsfile.the_step(bc)
    runner = function_named(bc, cmdsfile.RUNNER)
    held = word_global(bc, WORD)

    ours = []
    for i, op in enumerate(step.ops):
        if not calls(op, runner):
            continue
        # what put the text in place -- a call of ours reads it out of the file's lines instead
        wrote = cmdsfile.what_wrote(step, gv(op.df["arg1"]), i)
        if wrote.op == "GetGlobal" and gv(wrote.df["global"]) == held:
            ours.append(i)

    guard(len(ours) == 1,
          "the step types %r %d times, and this expects one" % (WORD, len(ours)))
    make_nop(step.ops[ours[0]])
    return "REC ALL: the game's own console line is gone -- the step types nothing of its own"
