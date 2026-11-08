#!/usr/bin/env python3
"""What proves `framework/setreach.py`. It reads the SPLICED road, and changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import field_by_name, kind_named
from tools.splice import where
from framework import reach, setreach
from framework.storewalk import Site, scopes_with_roads, splice_name


def check(bc):
    """Every set reach has a route the file agrees with, and every road walks it."""
    routes = setreach.routes(bc)
    guard(routes, "no scope word says its reach names a set, so nothing would ever be a member")
    _the_route_lands_where_it_says(bc, routes)
    _nobody_reads_the_field_that_faults(bc, routes)
    _every_place_the_walk_writes_is_emptied_first(bc, routes)
    _the_set_carrier_reads_nothing_at_a_road_s_own_numbers(bc)

    from framework.names import vocabulary
    words = vocabulary()
    asked = 0
    for spelling in scopes_with_roads(words):
        site = Site(bc, spelling, words)
        spliced = where(bc, splice_name(spelling))
        guard(spliced, "the `%s` rules never went in" % spelling)
        at, how_many = spliced
        if _asks_the_question(bc, site.fn.ops[at:at + how_many], routes):
            asked += 1
    guard(asked == len(list(scopes_with_roads(words))),
          "%d of %d roads ask whether a thing is in the carrier's set -- every road weighs a "
          "set row, so every road has to ask"
          % (asked, len(list(scopes_with_roads(words)))))
    return "%d set reach(es), asked on %d road(s)" % (len(routes), asked)


def _the_route_lands_where_it_says(bc, routes):
    """Each named step is a real field of the kind in front of it, ending on the wrapper."""
    for value, route in sorted(routes.items()):
        at = kind_named(bc, setreach.A_VILLAGE)
        for name in route:
            _where, holds = field_by_name(bc, at, name, "a village's own list")
            at = holds
        guard(at == kind_named(bc, setreach.WRAPPER),
              "case %d's route `%s` ends on a t@%s rather than a %s"
              % (value, ".".join(route), at, setreach.WRAPPER))


def _nobody_reads_the_field_that_faults(bc, routes):
    """⛔ No route may name `_structure`, on any kind: reading it off a unit faults."""
    banned = "_structure"
    for value, route in sorted(routes.items()):
        guard(banned not in route,
              "case %d's route names `%s`, and reading that off a thing is the fault this "
              "whole step exists to go around" % (value, banned))


def _every_place_the_walk_writes_is_emptied_first(bc, routes):
    """⛔ Every place a route writes is emptied first, or an early exit carries a stale object."""
    from framework.storewalk import Site, scopes_with_roads, splice_name
    from framework.names import vocabulary
    from tools.hlcode import assemble, template, written
    from framework.rowreader import reader_for
    words = vocabulary()
    spelling = sorted(scopes_with_roads(words))[0]
    site = Site(bc, spelling, words)
    guard(where(bc, splice_name(spelling)), "the `%s` rules never went in" % spelling)

    def op(name, **operands):
        return written(template(bc, name), **operands)
    reader = reader_for(bc)
    held = reader.borrow_register(bc, site.fn, "count_kind")
    carrier = reader.borrow_register(bc, site.fn, "count_kind")
    # the walk leaves to the road's next row; on its own it needs somewhere for that to land
    away = "%s: where the road would carry on" % spelling
    made = assemble(setreach.emit_is_a_member(bc, site.fn, op, reader, spelling, held,
                                              carrier, away) + [away + ":", op("Label")])
    # a count read off a list is a number, and emptying one of those is not a thing to ask for
    a_number = gv(list(site.fn.regs)[held])
    written_by = {}
    for at, one in enumerate(made):
        dst = gv(one.df.get("dst", -1))
        if one.op != "Field" or dst in written_by or dst < 0:
            continue
        if gv(list(site.fn.regs)[dst]) == a_number:
            continue
        written_by[dst] = at
    emptied = {gv(o.df["dst"]) for o in made if o.op == "Null"}
    late = sorted(r for r in written_by if r not in emptied)
    guard(not late,
          "%d place(s) in the membership walk are read into without being emptied first: %s -- "
          "a path that leaves early would carry the last row's object into this one"
          % (len(late), ", ".join(str(r) for r in late)))
    guard(len(routes) >= 1 and made, "the membership walk emitted nothing at all")


def _the_set_carrier_reads_nothing_at_a_road_s_own_numbers(bc):
    """⛔ The set carrier reads only fields EVERY holder shares, asks what it IS, refuses foreign."""
    from framework.storewalk import Site, scopes_with_roads, splice_name
    from framework.names import vocabulary
    from framework.ofthekind import IS_REALLY
    from tools.hlcode import assemble, function_named, template, written
    from framework.rowreader import reader_for
    words = vocabulary()
    spelling = sorted(scopes_with_roads(words))[0]
    site = Site(bc, spelling, words)
    guard(where(bc, splice_name(spelling)), "the `%s` rules never went in" % spelling)

    def op(name, **operands):
        return written(template(bc, name), **operands)
    reader = reader_for(bc)
    carrier = reader.borrow_register(bc, site.fn, "count_kind")
    owner = reader.borrow_register(bc, site.fn, "count_kind")
    store = reader.borrow_register(bc, site.fn, "count_kind")
    whose = reader.borrow_register(bc, site.fn, "count_kind")
    on = "%s: the store is in hand" % spelling
    off = "%s: on to the next store" % spelling
    made = assemble(setreach.emit_a_carrier_of_another_kind(
        bc, site.fn, op, reader, spelling, carrier, owner, store, whose, on, off)
        + [on + ":", op("Label"), off + ":", op("Label")])
    guard(made, "the set carrier pass emitted nothing, so no village could ever be one")

    shared = kind_named(bc, reach.EVERY_HOLDER)
    allowed = {setreach.where_the_rules_are(bc),
               field_by_name(bc, shared, setreach.THE_ID_ON, "any holder")[0]}
    from tools.hlcode import returns_type
    a_faction = returns_type(function_named(bc, setreach.ITS_FACTION), setreach.ITS_FACTION)
    allowed.add(field_by_name(bc, a_faction, setreach.THE_ID_ON, "a faction")[0])
    read = sorted({gv(o.df["field"]) for o in made if o.op == "Field"})
    stray = [f for f in read if f not in allowed]
    guard(not stray,
          "the set carrier pass reads field(s) %s, and only %s are declared on the kind every "
          "holder shares -- any other number means one kind's layout read on another"
          % (", ".join(str(f) for f in stray), ", ".join(str(f) for f in sorted(allowed))))

    asked = next((i for i, o in enumerate(made)
                  if o.op.startswith("Call") and _calls(bc, o, IS_REALLY)), None)
    guard(asked is not None, "the set carrier pass never asks the game what the carrier is")
    first = next((i for i, o in enumerate(made) if o.op == "Field"), len(made))
    guard(asked < first,
          "the set carrier pass reads a field at %d before asking what the carrier is at %d"
          % (first, asked))
    guard(any(_calls(bc, o, setreach.ITS_FACTION) for o in made),
          "the set carrier pass never asks who holds the carrier, so a foreign one gets on")


def _calls(bc, one, name):
    """Is this instruction a call to the function of that name?"""
    from tools.hlcode import function_named
    return gv(one.df.get("fun", -1)) == gv(function_named(bc, name).findex)


def _asks_the_question(bc, block, routes):
    """Does this road hold the membership walk: a `GetArray` indexed by the `Incr` above it?"""
    id_at = field_by_name(bc, kind_named(bc, reach.EVERY_HOLDER), setreach.THE_ID_ON,
                          "a member")[0]
    reads = [i for i, o in enumerate(block)
             if o.op == "Field" and gv(o.df.get("field", -1)) == id_at]
    walks = [i for i, o in enumerate(block) if o.op == "GetArray"]
    guard(len(routes) <= len(walks) or not reads,
          "a road reads an identity but walks no list, so the membership question is half in")
    return bool(reads) and len(walks) >= len(routes)
