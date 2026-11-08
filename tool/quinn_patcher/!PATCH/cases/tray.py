#!/usr/bin/env python3
"""What proves `framework/tray.py`. It reads the game and changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import field_by_name, function_named, kind_named
from framework.tray import (ALREADY, AMOUNT_ON, ARRAY_OF_ENTRIES, DRAW, ENTRIES,
                        ONE_PER_RESOURCE, POINT_ARGUMENT, RESOURCE_ON, WHERE,
                        recipe, slots)


def check(bc):
    """The recipe resolves off the game's own draw, and nothing of it is written down here."""
    made = recipe(bc)
    _it_found_real_things(bc, made)
    _the_entry_is_read_by_name(bc, made)
    _the_places_are_real(bc)
    return "the draw, the wrap, the allocation, the point, and an entry kind t@%s" % made["entry"]


def _it_found_real_things(bc, made):
    """Every findex the walk lifted is something this file can still call; NATIVES COUNT."""
    known = ({gv(f.findex) for f in bc.functions}
             | {gv(n.findex) for n in getattr(bc, "natives", [])})
    for what in ("draw", "wrap", "alloc", "point"):
        guard(made[what] in known,
              "the recipe's `%s` is neither a function nor a native in this file" % what)
    guard(made["draw"] == gv(function_named(bc, DRAW).findex),
          "the call the recipe was lifted from is not the game's own loot draw")
    guard(made["entry"] < len(bc.types), "the entry kind is not a type in this file")
    # two coordinates, and they cannot be the same one -- a point built from x twice is not a point
    guard(len(made["across"]) == 2 and len(set(made["across"])) == 2,
          "the point is built from %s, and it needs two different fields" % (made["across"],))


def _the_entry_is_read_by_name(bc, made):
    """An entry's two fields come off its own type BY NAME, and an unknown name refuses."""
    for name, at in ((AMOUNT_ON, made["amount"]), (RESOURCE_ON, made["resource"])):
        found, _holds = field_by_name(bc, made["entry"], name, "a loot entry")
        guard(found == at, "`%s` resolves to %d and the recipe kept %d" % (name, found, at))
    guard(made["amount"] != made["resource"],
          "the amount and the resource are the same field of an entry")
    try:
        field_by_name(bc, made["entry"], "nothing is called this", "a loot entry")
    except Exception:
        return
    guard(False, "an entry answered to a field name it does not have, so the lookup proves nothing")


def _the_places_are_real(bc):
    """All three places were made, each is its own, and each holds the kind it is meant to."""
    have = slots(bc)
    for name in (ENTRIES, WHERE, ALREADY):
        guard(have[name] is not None, "there is no place for `%s`" % name)
    guard(len(set(have.values())) == 3, "two of the tray's three places are the same place")
    wants = {ENTRIES: kind_named(bc, ARRAY_OF_ENTRIES),
             ALREADY: kind_named(bc, ONE_PER_RESOURCE),
             WHERE: gv(list(function_named(bc, DRAW).regs)[POINT_ARGUMENT])}
    for name, wanted in wants.items():
        guard(gv(bc.global_types[have[name]]) == wanted,
              "`%s` holds a t@%s and it should hold a t@%s"
              % (name, gv(bc.global_types[have[name]]), wanted))
