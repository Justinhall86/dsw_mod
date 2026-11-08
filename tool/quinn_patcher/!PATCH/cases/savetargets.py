#!/usr/bin/env python3
"""What proves the saved columns. It reads the finished file and changes nothing."""
from tools.hlcode import enum_case, function_named, minted_text
from tools.project import gv, guard
from tools.splice import where
from framework import saveplace, widen
from framework.parsed import HELD_BY
from framework.saveplace import READER, SCHEMA, WRITER, _generated
from framework.savetargets import (A_LIST_OF, ADD_TEXT, COLUMNS, DESCRIBED_AS, GET_TEXT,
                               IN_THE_LIST, IN_THE_READER, IN_THE_WRITER, REACH)


def check(bc):
    """Each of the three takes ours after the game's own and just ahead of the saved place."""
    _described(bc)
    _written(bc)
    _read_back(bc)
    return 3


def _ours_then_the_place(bc, fn, ours, theirs):
    """Our block, refused unless the saved place's block starts exactly where ours ends."""
    mine, place = where(bc, ours), where(bc, theirs)
    guard(mine and place, "`%s` or `%s` never went in" % (ours, theirs))
    guard(mine[0] + mine[1] == place[0],
          "`%s` ends at %d and the saved place starts at %d, so something sits between them"
          % (ours, mine[0] + mine[1], place[0]))
    return list(fn.ops)[mine[0]:mine[0] + mine[1]]


def _calls(block):
    """Which functions a block calls, by the game's own number for each."""
    return {gv(o.df["fun"]) for o in block if o.op.startswith("Call")}


def _described(bc):
    """Both names go on the list in order, the columns described as a list of texts."""
    fn = function_named(bc, "%s.%s" % (HELD_BY, SCHEMA))
    block = _ours_then_the_place(bc, fn, IN_THE_LIST, saveplace.IN_THE_LIST)
    named = [gv(o.df["global"]) for o in block if o.op == "GetGlobal"]
    wanted = [minted_text(bc, COLUMNS), minted_text(bc, REACH)]
    guard(None not in wanted and [n for n in named if n in wanted] == wanted,
          "the two names are not pushed, or not in the order the writer puts them in")
    made = [o for o in block if o.op == "MakeEnum"]
    guard(len(made) == 1 and gv(made[0].df["construct"]) == enum_case(bc, DESCRIBED_AS,
                                                                        A_LIST_OF),
          "the columns are not described as a list")


def _written(bc):
    """The writer puts the texts in the way the game puts a text in."""
    fn = function_named(bc, _generated(WRITER))
    block = _ours_then_the_place(bc, fn, IN_THE_WRITER, saveplace.IN_THE_WRITER)
    guard(gv(function_named(bc, ADD_TEXT).findex) in _calls(block),
          "the writer never puts a text in")


def _read_back(bc):
    """The reader takes the texts back and hands the row the list it made."""
    fn = function_named(bc, _generated(READER))
    block = _ours_then_the_place(bc, fn, IN_THE_READER, saveplace.IN_THE_READER)
    guard(gv(function_named(bc, GET_TEXT).findex) in _calls(block),
          "the reader never takes a text back")
    at, _holds = widen.on_the_filed_thing(bc)
    guard([o for o in block if o.op == "SetField" and gv(o.df["obj"]) == 1
           and gv(o.df["field"]) == at],
          "the reader never hands the row the list it made")
