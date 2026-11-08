#!/usr/bin/env python3
"""The game's own map keyed by any object: four names every per-application store borrows."""
from tools.project import gv, guard
from tools.hlcode import argument_kind, function_named, kind_named

# the game's own map, keyed by any object at all
MAP = "haxe.ds.ObjectMap"
MAKE = "haxe.ds.$ObjectMap.__constructor__"
ASK = "haxe.ds.ObjectMap.exists"
TELL = "haxe.ds.ObjectMap.set"


def map_kind(bc):
    """The kind of map we keep, resolved by name -- a class, so the name picks exactly one."""
    return kind_named(bc, MAP)


def check_what_we_borrow(bc):
    """Every borrowed function takes what we are about to hand it, or the build stops."""
    kind = map_kind(bc)
    for what in (ASK, TELL, MAKE):
        guard(gv(list(function_named(bc, what).regs)[0]) == kind,
              "%s does not take one of our maps first" % what)
    # both take any key (so an application can BE one); argument ZERO is the map itself
    guard(argument_kind(bc, ASK) == argument_kind(bc, TELL),
          "%s and %s disagree about what a key is" % (ASK, TELL))
