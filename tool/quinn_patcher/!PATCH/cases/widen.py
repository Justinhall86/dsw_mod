#!/usr/bin/env python3
"""What proves `framework/widen.py`. It reads the WIDENED types and changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import fields_of, kind_named
from framework.saveplace import PLACE as SAVED
from framework.widen import HOLDS, PLACE, THE_FILED_THING, places_on, the_registration


def check(bc):
    """Each carrier has the new place, ours are LAST, and every old one is where it was."""
    holds = kind_named(bc, HOLDS)
    for kind, what, was, ours in ((kind_named(bc, THE_FILED_THING), THE_FILED_THING,
                                   ("uid", "kind", "val", "target", "target2"),
                                   (PLACE, SAVED)),
                                  (the_registration(bc), "the registration",
                                   ("ref", "scope", "target", "target2", "val"), (PLACE,))):
        _it_is_last(bc, kind, what, holds, ours)
        _the_old_ones_did_not_move(bc, kind, what, was, ours)
    return 2


def _it_is_last(bc, kind, what, holds, ours):
    """Ours went on the END, which is the whole of why nothing already compiled breaks."""
    own = places_on(bc, kind).fields
    named = [f.name.resolve(bc) for f in own]
    for one in ours:
        guard(named.count(one) == 1,
              "%s carries `%s` %d time(s)" % (what, one, named.count(one)))
    guard(tuple(named[-len(ours):]) == tuple(ours),
          "%s ends on %s and ours are %s, in that order"
          % (what, ", ".join(named[-len(ours):]), ", ".join(ours)))
    guard(gv(own[named.index(PLACE)].type) == holds,
          "the new place on %s holds the wrong kind of thing" % what)
    guard(gv(places_on(bc, kind).nfields) == len(own),
          "%s says it has %d place(s) and declares %d"
          % (what, gv(places_on(bc, kind).nfields), len(own)))


def _the_old_ones_did_not_move(bc, kind, what, was, ours):
    """Every place the game itself reads by number is still at the number it was compiled with."""
    names, _fields = fields_of(bc, kind, what)
    guard(tuple(names[-len(ours):]) == tuple(ours),
          "the flattened list of %s does not end on ours" % what)
    for one in was:
        guard(one in names, "%s lost its `%s`" % (what, one))
    # and ours are the ONLY things past where the game's own places end
    guard(names.index(PLACE) == len(names) - len(ours),
          "something sits between the game's own places and ours on %s" % what)
