#!/usr/bin/env python3
"""What proves the tick sweep, asked of the file the build just wrote, never of its source."""
from tools.project import guard, gv
from tools.hlcode import field_by_name, function_named, kind_named
from tools.splice import kind_of, site_of, where
from framework import lasttick, traps


def _the_block(bc):
    """Where the sweep went, how many went in, and the function it went into."""
    found = where(bc, "the world's own sweep")
    guard(found, "the world's own sweep was never spliced anywhere")
    at, many = found
    guard(many, "the world's own sweep went in with no instructions")
    return at, many, site_of(bc, "the world's own sweep")


def one_sweep_only(bc):
    """It is spliced ONCE, into the game's own tick, and it declares the kind that waits."""
    at, _many, findex = _the_block(bc)
    guard(findex == gv(lasttick.the_tick(bc).findex),
          "the sweep went into f@%s and the game's tick is f@%s"
          % (findex, gv(lasttick.the_tick(bc).findex)))
    guard(site_of(bc, "the world's own sweep") == findex,
          "the splice register disagrees with itself about where the sweep went")
    # ⛔ THE KIND IS WHAT MAKES IT WAIT FOR THE WORLD, instead of running in world generation
    guard(kind_of(bc, "the world's own sweep") == traps.PER_TICK,
          "the sweep is spliced into the game's own clock and does not declare it")
    guard(at > 0, "the sweep went in at the very top, in front of the countdown it waits on")


def past_the_countdown(bc):
    """It goes INSIDE the fixed-rate body, never in front of the test that guards it: the RATE."""
    fn = lasttick.the_tick(bc)
    at, _many, _f = _the_block(bc)
    field, _kind = field_by_name(bc, kind_named(bc, "logic.Logic"),
                                 lasttick.THE_COUNTDOWN_ON, "the game's own clock")
    read = [i for i, one in enumerate(fn.ops or [])
            if one.op in ("GetThis", "Field") and gv(one.df.get("field")) == field and i < at]
    guard(read, "the sweep sits in front of every read of `%s`" % lasttick.THE_COUNTDOWN_ON)
    tests = [i for i, one in enumerate(fn.ops or [])
             if one.op in ("JNotLt", "JSGte", "JULt", "JNotGte") and read[0] < i < at]
    guard(tests, "nothing tests `%s` between its read and the sweep"
                 % lasttick.THE_COUNTDOWN_ON)
    guard(at == tests[0] + 1,
          "the sweep is %d instruction(s) past the countdown's test rather than immediately after"
          % (at - tests[0]))


def a_place_for_every_road(bc):
    """Four places per road and one for the world, all made; ⛔ shared, one road undoes another."""
    roads = lasttick.every_road()
    guard(roads, "no road has a place for what it has granted to lately")
    guard(lasttick.slot(bc, lasttick.WINDOW) is not None,
          "the world has no count of how much of the window is left")
    for road in roads:
        for which in (lasttick.NOW, lasttick.NOW_LIST,
                      lasttick.BEFORE, lasttick.BEFORE_LIST, lasttick.RAN):
            guard(lasttick.slot(bc, which, road) is not None,
                  "the `%s` road has no place for `%s`" % (road, which))
    # and no two roads share one, which is the thing the name is for
    every = [lasttick.slot(bc, which, road) for road in roads
             for which in (lasttick.NOW, lasttick.NOW_LIST,
                           lasttick.BEFORE, lasttick.BEFORE_LIST, lasttick.RAN)]
    guard(len(set(every)) == len(every),
          "%d places were made for %d road-and-kind pairs, so two roads share one"
          % (len(set(every)), len(every)))


def the_window_is_more_than_one(bc):
    """The margin is declared, and ⚠ wider than a single step until a run says otherwise."""
    guard(isinstance(lasttick.EVERY, int), "the window is not a count of ticks")
    guard(lasttick.EVERY > 1,
          "the window is %d tick(s) wide, and a road throttled inside its own manager would then "
          "read as gone" % lasttick.EVERY)


def the_road_writes_what_the_tick_reads(bc):
    """Every road's own walk puts its receivers where the sweep will look for them."""
    from framework import names, storewalk
    words = names.vocabulary()
    for road in lasttick.every_road():
        at = lasttick.slot(bc, lasttick.NOW, road)
        fn = function_named(bc, storewalk.Site(bc, road, words).name)
        wrote = [one for one in (fn.ops or [])
                 if one.op == "SetGlobal" and gv(one.df.get("global")) == at]
        guard(wrote, "the `%s` road never writes down who it granted to, so the tick would "
                     "take back every mark it holds" % road)


def only_the_world_runs_it(bc):
    """The exact-class question comes FIRST: `logic.Logic` is also a faction's base class."""
    from tools.hlcode import class_global
    at, many, _f = _the_block(bc)
    fn = lasttick.the_tick(bc)
    inside = list(fn.ops or [])[at:at + many]
    wanted = class_global(bc, kind_named(bc, lasttick.THE_WORLD))
    asked = [i for i, one in enumerate(inside)
             if one.op == "GetGlobal" and gv(one.df.get("global")) == wanted]
    guard(asked, "the sweep never asks whether it is the world's own object, so it runs once "
                 "per faction per tick as well")
    # and nothing of a road's is written before that question has been asked
    roads = {lasttick.slot(bc, which, road) for road in lasttick.every_road()
             for which in (lasttick.NOW, lasttick.NOW_LIST,
                           lasttick.BEFORE, lasttick.BEFORE_LIST)}
    early = [i for i, one in enumerate(inside)
             if one.op in ("SetGlobal", "GetGlobal")
             and gv(one.df.get("global")) in roads and i < asked[0]]
    guard(not early,
          "the sweep touches a road's own place %d time(s) before it has established that it is "
          "the world" % len(early))
    guard(lasttick.ASKED_WITH == "hl.BaseType.check",
          "the sweep names `%s` as its question, and the exact-class one is `hl.BaseType.check`"
          % lasttick.ASKED_WITH)


def an_idle_road_is_never_swept(bc):
    """The road says it finished a pass, and the sweep reads that FIRST: no idle road is swept."""
    from framework import names, storewalk
    at, many, _f = _the_block(bc)
    inside = list(lasttick.the_tick(bc).ops or [])[at:at + many]
    words = names.vocabulary()
    for road in lasttick.every_road():
        flag = lasttick.slot(bc, lasttick.RAN, road)
        fn = function_named(bc, storewalk.Site(bc, road, words).name)
        wrote = [one for one in (fn.ops or [])
                 if one.op == "SetGlobal" and gv(one.df.get("global")) == flag]
        guard(wrote, "the `%s` road never says it finished a pass, so the sweep can never tell "
                     "it apart from a road that did not run" % road)
        read = [i for i, one in enumerate(inside)
                if one.op == "GetGlobal" and gv(one.df.get("global")) == flag]
        guard(read, "the sweep never asks whether the `%s` road ran" % road)
        others = {lasttick.slot(bc, which, road)
                  for which in (lasttick.NOW, lasttick.NOW_LIST,
                                lasttick.BEFORE, lasttick.BEFORE_LIST)}
        early = [i for i, one in enumerate(inside)
                 if one.op in ("GetGlobal", "SetGlobal")
                 and gv(one.df.get("global")) in others and i < read[0]]
        guard(not early,
              "the sweep touches the `%s` road's own places %d time(s) before it has asked "
              "whether that road ran at all" % (road, len(early)))


def retracts_with_no_totals(bc):
    """The sweep reads no running totals: ⛔ at the tick they belong to whichever pass ran last."""
    from framework import running
    at, many, findex = _the_block(bc)
    fn = lasttick.the_tick(bc)
    inside = list(fn.ops or [])[at:at + many]
    totals = running.slot(bc)
    guard(totals is not None, "there are no running totals to be sure the sweep avoids")
    read = [one for one in inside
            if one.op == "GetGlobal" and gv(one.df.get("global")) == totals]
    guard(not read,
          "the sweep reads the running totals %d time(s), and at the tick they belong to "
          "whichever pass ran last" % len(read))


def check(bc):
    """Every case, in the order a reader wants them."""
    one_sweep_only(bc)
    past_the_countdown(bc)
    only_the_world_runs_it(bc)
    a_place_for_every_road(bc)
    the_window_is_more_than_one(bc)
    the_road_writes_what_the_tick_reads(bc)
    an_idle_road_is_never_swept(bc)
    retracts_with_no_totals(bc)
    at, many, _f = _the_block(bc)
    return ("THE TICK: %d instruction(s) at %d, %d road(s) each with four places of their own, "
            "a window %d step(s) wide, and no running total read inside it"
            % (many, at, len(lasttick.every_road()), lasttick.EVERY))
