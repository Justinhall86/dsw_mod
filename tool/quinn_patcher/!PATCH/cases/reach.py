#!/usr/bin/env python3
"""What proves `framework/reach.py`, finding our reads by column name; it changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import enum_case, function_named, text_object
from framework import columns, parsed, pipeline, reach, scopematch
from framework.atload import ROUTES, SITE, site
from framework.rowreader import reader_for
from framework.sayonce import COMPLAIN

# how far past a read the rest of its own block sits, narrower than the next route's read
REACHES = 120


def check(bc):
    """Every route reads the reach off its own raw row and says exactly one of the two words."""
    fn = site(bc)
    _both_words_are_in_the_file(bc)
    ours = _every_read_of_the_column(bc, fn)
    guard(len(ours) == ROUTES,
          "the reach is read %d time(s) in %s, and there is one authoring route each for %d"
          % (len(ours), SITE, ROUTES))
    reader = reader_for(bc)
    for n, at in enumerate(ours):
        off = gv(fn.ops[at].df["arg0"])
        guard(gv(list(fn.regs)[off]) == reader.row_kind,
              "a reach is read off something that is not the untyped row a column lives on")
        held = _counted_from_one(fn, at)
        _one_word_on_each_path(bc, fn, at, held, ours[n + 1] if n + 1 < len(ours) else None)
    _the_list_is_there(bc)
    _a_road_can_read_it(bc)
    _the_round_trip_is_observable(bc)
    _the_case_is_found_by_name(bc)
    _the_gate_is_told_the_reach(bc)
    return "%d route(s), each reading the reach off its own raw row and keeping it" % len(ours)


def _counted_from_one(fn, at):
    """The answer becomes a number raised by one, so blank alone is zero; returns where it lands."""
    window = range(at + 1, min(at + 1 + REACHES, len(fn.ops)))
    cast = [i for i in window if fn.ops[i].op == "SafeCast"]
    guard(cast, "nothing after a reach read turns what the column answered into a number")
    held = gv(fn.ops[cast[0]].df["dst"])
    raised = [i for i in window
              if i > cast[0] and fn.ops[i].op == "Incr" and gv(fn.ops[i].df["dst"]) == held]
    guard(raised,
          "the reach is kept as the column's own number, so a blank row and a local one would "
          "both be read as nothing")
    return held


def _the_list_is_there(bc):
    """⛔ THE REACH HAS NO LIST: it rides the row's own column list onto the application."""
    guard(reach.WHICH_REACH not in columns.EVERY_LIST,
          "`%s` is a list the load keeps again, so the reach is being searched for rather than "
          "carried" % reach.WHICH_REACH)


def _a_road_can_read_it(bc):
    """The road reads the reach off the row itself, so no copy is kept under the application."""
    guard(reach.NAMED not in parsed.NAMES,
          "the reach is kept under the application, a copy nothing writes and the road overwrites")


def _the_case_is_found_by_name(bc):
    """A re-host compares against the game's enum case, by name, counted from one as the load."""
    at = enum_case(bc, reach.ENUM, reach.FACTION)
    guard(isinstance(at, int) and at >= 0,
          "`%s` is not a case of `%s`" % (reach.FACTION, reach.ENUM))
    guard(reach.case_value(bc, reach.FACTION) == at + 1,
          "the value a re-host compares against is not the one the load keeps, which is the "
          "case counted from one")
    guard(reach.case_value(bc, reach.FACTION) != reach.BLANK_IS,
          "a written reach and a column left alone would compare the same")


def _the_gate_is_told_the_reach(bc):
    """The scope gate reads the kept reach, so a re-hosted row is judged on the new holder."""
    guard(columns.REACH_NAMED in pipeline.stage_reads(scopematch.GATE),
          "the scope gate does not read the kept reach, so it judges a re-hosted row by the "
          "road it was found on rather than by the holder it now has")


def _the_round_trip_is_observable(bc):
    """A third word, said at the bake when a kept reach comes back: the far end speaks too."""
    if not reach.saying():
        return "the reach's own words are switched off, so none is asked for"
    guard(text_object(bc, reach.CAME_BACK) is not None,
          "`%s` is not in this file, so nothing at the bake could say a reach came back"
          % reach.CAME_BACK)
    guard(reach.CAME_BACK not in reach.words(),
          "the bake's word is one of the load's, so a count could not tell the two ends apart")


def _both_words_are_in_the_file(bc):
    """Neither word may be minted at the moment it is said -- the step puts both in first."""
    for word in reach.words():
        guard(text_object(bc, word) is not None,
              "`%s` is not in this file, so the load could not say it" % word)


def _every_read_of_the_column(bc, fn):
    """Each place the game's one-column reader is handed the reach column's own name."""
    reader = reader_for(bc)
    wanted = text_object(bc, reach.COLUMN)
    out = []
    for i, o in enumerate(fn.ops):
        if o.op != "Call2" or gv(o.df["fun"]) != gv(reader.reading.findex):
            continue
        named = _what_filled(fn, i, gv(o.df["arg1"]))
        if named is not None and named.op == "GetGlobal" and gv(named.df["global"]) == wanted:
            out.append(i)
    return out


def _what_filled(fn, at, place):
    """The last instruction before `at` that left anything in `place`."""
    for i in range(at - 1, -1, -1):
        o = fn.ops[i]
        if o.df.get("dst") is not None and gv(o.df["dst"]) == place:
            return o
    return None


def _one_word_on_each_path(bc, fn, at, held, upto=None):
    """After the number: ⚠ a test of the NUMBER, then two words with a jump between them."""
    complain = function_named(bc, COMPLAIN)
    # up to the next route's own read, so a gate of any size between the words cannot hide one
    window = range(at + 1, upto if upto is not None else min(at + 1 + REACHES, len(fn.ops)))
    tested = [i for i in window if _jumps_on(fn.ops[i], held)]
    guard(tested, "nothing after a reach read tests the number it was turned into")
    # ⛔ THE WORDS ARE SWITCHED AND THE TEST IS NOT: only the count of words is skipped
    if not reach.saying():
        return
    said = [i for i in window
            if fn.ops[i].op == "Call1" and gv(fn.ops[i].df["fun"]) == gv(complain.findex)]
    guard(len(said) >= 2,
          "a reach read is followed by %d word(s), and it says one per branch" % len(said))
    guard([i for i in window if said[0] < i < said[1] and fn.ops[i].op == "JAlways"],
          "the blank path never jumps past the other word, so a blank row would say both")


def _jumps_on(o, place):
    """Whether this instruction is a jump reading `place` -- whichever kind of jump it is."""
    if not o.op or not o.op.startswith("J"):
        return False
    return any(o.df.get(name) is not None and gv(o.df[name]) == place
               for name in ("reg", "a", "b", "cond"))
