#!/usr/bin/env python3
"""What proves the saved place. It reads the finished file and changes nothing."""
from tools.hlcode import fields_of, function_named, kind_named, minted_text
from tools.project import gv, guard
from tools.splice import where
from framework.parsed import HELD_BY
from framework.saveplace import (ADD_A_NUMBER, GET_A_NUMBER, IN_THE_LIST, IN_THE_READER,
                             IN_THE_WRITER, PLACE, READER, SCHEMA, WRITER, _generated,
                             the_place)


def check(bc):
    """The place exists, the two lists describe it, and the pair writes and reads it LAST."""
    at = _it_is_on_the_filed_thing(bc)
    _the_lists_take_it(bc)
    _the_writer_takes_it_last(bc, at)
    _the_reader_takes_it_last(bc, at)
    return 4


def _block(bc, fn, what, how_many):
    """The instructions that block put in, refused unless it went in at the size it says."""
    found = where(bc, what)
    guard(found, "`%s` never went in, so nothing of ours is in that function" % what)
    guard(found[1] == how_many,
          "`%s` put in %d instruction(s) and this reads %d" % (what, found[1], how_many))
    return found[0], list(fn.ops)[found[0]:found[0] + how_many]


def _it_is_on_the_filed_thing(bc):
    """Ours is a place on the filed thing and it is the last one of all."""
    at, _holds = the_place(bc)
    names, _fields = fields_of(bc, kind_named(bc, HELD_BY), HELD_BY)
    guard(names[-1] == PLACE,
          "`%s` sits at %d of %d on the filed thing, and the save reads the list in order"
          % (PLACE, names.index(PLACE), len(names)))
    guard(at == len(names) - 1, "`%s` answers to place %d and is listed at %d"
          % (PLACE, at, len(names) - 1))
    return at


def _the_lists_take_it(bc):
    """Our name and our kind go on the end of the two lists, after every one the game pushes."""
    fn = function_named(bc, "%s.%s" % (HELD_BY, SCHEMA))
    at, block = _block(bc, fn, IN_THE_LIST, 6)
    guard([o.op for o in block] == ["Field", "GetGlobal", "Call2", "Field", "GetGlobal", "Call2"],
          "the block describing `%s` is not the six instructions it was written as" % PLACE)
    minted = minted_text(bc, PLACE)
    guard(minted is not None and gv(block[1].df["global"]) == minted,
          "the name pushed onto the list is not the one this place is called")
    guard(gv(block[0].df["field"]) != gv(block[3].df["field"]),
          "our name and our kind are pushed onto one list, so the two are out of step")
    push = gv(block[2].df["fun"])
    guard(gv(block[5].df["fun"]) == push, "the two pushes do not go through one call")
    others = [i for i, o in enumerate(fn.ops)
              if o.op == "Call2" and gv(o.df["fun"]) == push and not at <= i < at + 6]
    guard(others and max(others) < at,
          "the game pushes onto those lists after ours, so ours is not the last pair")


def _the_writer_takes_it_last(bc, at):
    """The number goes in after every one the game writes, with nothing between it and the end."""
    name = _generated(WRITER)
    fn = function_named(bc, name)
    put, block = _block(bc, fn, IN_THE_WRITER, 2)
    guard([o.op for o in block] == ["Field", "Call2"],
          "the block writing `%s` is not the two instructions it was written as" % PLACE)
    guard(gv(block[0].df["field"]) == at, "the writer reads a place that is not ours")
    guard(gv(block[1].df["fun"]) == gv(function_named(bc, ADD_A_NUMBER).findex),
          "the writer does not put ours in the way the game puts a number in")
    guard(gv(block[1].df["arg1"]) == gv(block[0].df["dst"]),
          "the writer puts in something other than what it just read")
    guard(fn.ops[put + 2].op == "Ret", "%s does something after ours, so ours is not last" % name)


def _the_reader_takes_it_last(bc, at):
    """It comes back after every one the game takes, which is the order it went in."""
    name = _generated(READER)
    fn = function_named(bc, name)
    put, block = _block(bc, fn, IN_THE_READER, 2)
    guard([o.op for o in block] == ["Call1", "SetField"],
          "the block reading `%s` back is not the two instructions it was written as" % PLACE)
    guard(gv(block[0].df["fun"]) == gv(function_named(bc, GET_A_NUMBER).findex),
          "the reader does not take ours the way the game takes a number")
    guard(gv(block[1].df["field"]) == at, "the reader fills a place that is not ours")
    guard(gv(block[1].df["src"]) == gv(block[0].df["dst"]),
          "the reader fills our place with something other than what it just took")
    guard(fn.ops[put + 2].op == "Ret", "%s takes something after ours, so the two are out of "
                                       "step with what the writer put in" % name)
