#!/usr/bin/env python3
"""What proves `framework/running.py`. It reads the SPLICED road, and changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import function_named, kind_named
from tools.splice import where
from framework.acts.gain_ttrait_stacks import COUNT, GRANT
from framework.oneshot import MAP
from framework.running import GET, PER_RECEIVER, SET, SLOT, slot
from framework.storewalk import Site, scopes_with_roads, splice_name


def check(bc):
    """The place is there, every road empties it, and the trait act totals through it."""
    made = slot(bc)
    guard(made is not None, "there is no place called `%s` in this file" % SLOT)
    guard(gv(bc.global_types[made]) == kind_named(bc, MAP),
          "`%s` holds a t@%s, and a total per receiver wants a %s"
          % (SLOT, gv(bc.global_types[made]), MAP))

    from framework.names import vocabulary
    words = vocabulary()
    roads = scopes_with_roads(words)
    guard(roads, "no scope says where its rules run, so no total is ever kept")
    for spelling in roads:
        site = Site(bc, spelling, words)
        spliced = where(bc, splice_name(spelling))
        guard(spliced, "the `%s` rules never went in" % spelling)
        at, how_many = spliced
        block = site.fn.ops[at:at + how_many]
        _emptied_once_before_any_row(bc, spelling, block)
        _totalled_before_it_grants(bc, spelling, block)
    return "%d road(s) empty the totals and grant through them" % len(roads)


def _calls(bc, block, name):
    findex = gv(function_named(bc, name).findex)
    return [i for i, o in enumerate(block)
            if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == findex]


def _emptied_once_before_any_row(bc, spelling, block):
    """A pass starts with nothing counted by owning its OWN map, out of a nested walk's reach."""
    from framework.oneshot import MAKE
    made = slot(bc)
    took = [i for i, o in enumerate(block)
            if o.op == "SetGlobal" and gv(o.df.get("global", -1)) == made]
    kept = [i for i, o in enumerate(block)
            if o.op == "GetGlobal" and gv(o.df.get("global", -1)) == made]
    granting = _calls(bc, block, GRANT)
    guard(len(took) == 2,
          "the `%s` rules write the totals slot %d time(s); a pass TAKES it once and GIVES IT "
          "BACK once, and any other number means a nested pass keeps somebody else's map"
          % (spelling, len(took)))
    guard(kept, "the `%s` rules never remember what was in the totals slot, so the outer pass "
                "would not get its own map back" % spelling)
    guard(min(kept) < min(took),
          "the `%s` rules take the totals slot at %d before remembering what was in it at %d"
          % (spelling, min(took), min(kept)))
    guard(_calls(bc, block, MAKE),
          "the `%s` rules never make a map, so a pass has nothing of its own to count into"
          % spelling)
    if granting:
        guard(min(took) < min(granting),
              "the `%s` rules first take the totals slot at %d and first grant at %d -- a pass "
              "has to own its totals before anything is counted into them"
              % (spelling, min(took), min(granting)))
        guard(max(took) > max(granting),
              "the `%s` rules give the totals slot back at %d and still grant at %d -- the "
              "restore belongs past every row, where the road counts itself out"
              % (spelling, max(took), max(granting)))


def _totalled_before_it_grants(bc, spelling, block):
    """The trait act reads the total and writes it back before it grants: the engine reconciles."""
    granting = _calls(bc, block, GRANT)
    if not granting:
        return
    got = _calls(bc, block, GET)
    put = _calls(bc, block, SET)
    guard(got, "the `%s` rules grant a trait without reading what is already totalled for this "
               "receiver, so several rows would overwrite each other" % spelling)
    guard(put, "the `%s` rules never write a total back, so the second row of a pass would read "
               "nothing and seed again" % spelling)
    guard(min(got) < max(granting),
          "the `%s` rules read a total at %d and grant last at %d -- the read has to come first"
          % (spelling, min(got), max(granting)))
    guard(min(put) < max(granting),
          "the `%s` rules write a total at %d and grant last at %d -- the write has to come "
          "first, or the next row reads a total this one never put back"
          % (spelling, min(put), max(granting)))
    # and the engine's own counting is still there for a row an event fired
    guard(_calls(bc, block, COUNT),
          "the `%s` rules do not ask the engine what our bucket holds, so a row fired by an "
          "event has nothing to pay on top of" % spelling)
