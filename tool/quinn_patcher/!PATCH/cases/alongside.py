#!/usr/bin/env python3
"""What proves `framework/alongside.py`. It reads the SPLICED sites and changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import function_named
from tools.splice import distances_in, site_of, where
from framework.alongside import OURS, PER_FILTERED, REFILTERS, slot, spliced_names


def check(bc):
    """Both halves are in, each in the function it names, and every jump lands inside."""
    guard(slot(bc, OURS) is not None, "there is no place for our own line-up")
    guard(slot(bc, PER_FILTERED) is not None, "there is no place for the filtered line-up")
    went = 0
    # the feature's own table, so a pass added there is proven here without anybody adding it
    for named, owner in spliced_names():
        fn = function_named(bc, owner)
        spliced = where(bc, named)
        guard(spliced, "`%s` never went in" % named)
        at, how_many = spliced
        guard(site_of(bc, named) == gv(fn.findex),
              "`%s` went into some other function" % named)
        _it_rides_the_game_own_push(bc, fn, at, at + how_many, named)
        _everything_lands_inside(fn)
        went += how_many
    _the_building_route_is_ridden(bc)
    return went


def _the_building_route_is_ridden(bc):
    """The route a building state's rows come in by is filed against AND filtered alongside."""
    from framework.userow import SITES
    building = "logic.Upgrades.addAttributes"
    guard(building in SITES,
          "%s files no row of ours, so a building state's rows carry no columns" % building)
    guard(len([n for n, owner in spliced_names() if owner == REFILTERS]) == 2,
          "the list %s walks is filtered twice, and both walks have to be ridden" % building)


def _it_rides_the_game_own_push(bc, fn, at, ends, named):
    """Our own push sits beside the game's, in the same function, and adds exactly one."""
    from framework import tray
    pushing = gv(function_named(bc, tray.PUSH).findex)
    block = fn.ops[at:ends]
    ours = [o for o in block if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == pushing]
    # more than one, as a line-up is also grown by pushing; the LAST push is onto a list of ours
    guard(ours, "`%s` pushes nothing, so no entry of ours rides the game's" % named)
    # ⛔ AND THE GAME'S OWN PUSH IS STILL THERE, outside our block, so the two grow together
    theirs = [i for i, o in enumerate(fn.ops)
              if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == pushing
              and not (at <= i < ends)]
    guard(theirs, "the game's own push is gone from the function `%s` rides in" % named)


def _everything_lands_inside(fn):
    """Every jump in the whole function, ours and the game's, lands somewhere in it."""
    for i, op in enumerate(fn.ops):
        for name in distances_in(op):
            target = i + 1 + gv(op.df[name])
            guard(0 <= target < len(fn.ops),
                  "the %s at %d lands at %d and the function has %d"
                  % (op.op, i, target, len(fn.ops)))
