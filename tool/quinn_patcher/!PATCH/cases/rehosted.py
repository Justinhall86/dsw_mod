#!/usr/bin/env python3
"""What proves `framework/rehosted.py`. It reads the SPLICED road, and changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import function_named, kind_named
from tools.splice import where
from framework.oneshot import ASK, MAP, TELL
from framework.rehosted import ALREADY, CARRIERS, slot
from framework.storewalk import Site, scopes_with_roads, splice_name
from framework.tray import ARRAY_OF_ENTRIES, PUSH


def check(bc):
    """Both places exist and hold what they say, and a two-holder road both fills and walks."""
    _the_places_hold_what_they_say(bc)

    from framework.names import vocabulary
    from framework.storewalk import OWNER_BY, ITSELF, _declared
    words = vocabulary()
    walked = 0
    for spelling in scopes_with_roads(words):
        site = Site(bc, spelling, words)
        spliced = where(bc, splice_name(spelling))
        guard(spliced, "the `%s` rules never went in" % spelling)
        at, how_many = spliced
        block = site.fn.ops[at:at + how_many]
        if _declared(spelling, OWNER_BY, words) == ITSELF:
            _no_carrier_work(bc, spelling, block)
        else:
            _fills_and_walks(bc, spelling, block)
            walked += 1
    guard(walked, "no road reads a second holder, so no carrier would ever be walked")
    return "%d road(s) remember a carrier and walk one" % walked


def _the_list_is_made_the_way_the_game_makes_one(bc, spelling, block, holds):
    """A list our code pushes to is ALLOCATED, never just `New`ed, which leaves no backing."""
    made = [i for i, o in enumerate(block)
            if o.op == "New" and gv(o.df.get("dst", -1)) in holds]
    guard(not made,
          "the `%s` rules make the carriers' list with a bare `New` at %s -- a list made that "
          "way has no backing array and the game's own push writes through one"
          % (spelling, ", ".join(str(i) for i in made)))
    filled = [i for i, o in enumerate(block)
              if o.op.startswith("Call") and gv(o.df.get("dst", -1)) in holds]
    guard(filled, "the `%s` rules never make the carriers' list at all" % spelling)


def _the_places_hold_what_they_say(bc):
    made, known = slot(bc, CARRIERS), slot(bc, ALREADY)
    guard(made is not None, "there is no place called `%s` in this file" % CARRIERS)
    guard(known is not None, "there is no place called `%s` in this file" % ALREADY)
    guard(gv(bc.global_types[made]) == kind_named(bc, ARRAY_OF_ENTRIES),
          "`%s` holds a t@%s, and a list of carriers wants a %s"
          % (CARRIERS, gv(bc.global_types[made]), ARRAY_OF_ENTRIES))
    guard(gv(bc.global_types[known]) == kind_named(bc, MAP),
          "`%s` holds a t@%s, and what is already in the list wants a %s"
          % (ALREADY, gv(bc.global_types[known]), MAP))


def _calls(block, findex):
    return [i for i, o in enumerate(block)
            if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == findex]


def _reaches(bc, block, which):
    """Every place the named list or map of this file was read into."""
    made = slot(bc, which)
    return {gv(o.df["dst"]) for o in block
            if o.op == "GetGlobal" and gv(o.df.get("global", -1)) == made}


def _fills_and_walks(bc, spelling, block):
    """A road with two holders asks before it pushes, and pushes into its own list."""
    holds = _reaches(bc, block, CARRIERS)
    known = _reaches(bc, block, ALREADY)
    guard(holds, "the `%s` rules never reach the carriers' list" % spelling)
    guard(known, "the `%s` rules never reach what is already in it" % spelling)
    pushing = [i for i in _calls(block, gv(function_named(bc, PUSH).findex))
               if gv(block[i].df["arg0"]) in holds]
    asking = [i for i in _calls(block, gv(function_named(bc, ASK).findex))
              if gv(block[i].df["arg0"]) in known]
    telling = [i for i in _calls(block, gv(function_named(bc, TELL).findex))
               if gv(block[i].df["arg0"]) in known]
    # ONE PUSH PER STORE THE ROAD FINDS A ROW ON: the thing's own, and a HOST road's host's
    from framework.storewalk import HOST_BY, vocabulary, _declared
    stores = 1 + (1 if _declared(spelling, HOST_BY, vocabulary(), None) is not None else 0)
    guard(len(pushing) == stores,
          "the `%s` rules push a carrier %d time(s), and that road finds rows on %d store(s)"
          % (spelling, len(pushing), stores))
    guard(telling, "the `%s` rules never record a carrier as known, so the asking above always "
                   "answers no" % spelling)
    # ⛔ EVERY push is asked first, or the list grows every tick a carrier lives
    for at in pushing:
        before = [i for i in asking if i < at]
        guard(before,
              "the `%s` rules push a carrier at %d without asking first whether it is already in "
              "the list, so the list would grow every tick" % (spelling, at))
    _the_list_is_made_the_way_the_game_makes_one(bc, spelling, block, holds)


def _no_carrier_work(bc, spelling, block):
    """A road whose holder is its own reader has no second holder, so it carries none of this."""
    guard(not _reaches(bc, block, CARRIERS),
          "the `%s` rules reach the carriers' list, and that road reads one holder -- a carrier "
          "pass there would walk a thing the road was never about" % spelling)
