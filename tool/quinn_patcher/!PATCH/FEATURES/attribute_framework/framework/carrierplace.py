#!/usr/bin/env python3
"""On a carrier's pass, a row a reach moved to a place is read only where the walker shares it."""
from tools.hlcode import (class_global, field_by_name, fields_of, function_named, kind_named,
                          number, returns_type)
from tools.project import guard, gv
from framework import reach, sayonce, scopematch, setreach
from framework.ofthekind import IS_REALLY
from framework.ownermatch import ASKED_ON as AN_ENTITY
from framework.parsed import a_new_place
from framework.rowreader import reader_for

# the places a carrier's pass reads off the carrier itself; any other would be the walker's
CARRIERS_OWN = ("region",)
# where a carrier of another kind, once let on, has its own region read
PLACED = "%s: the carrier's own region"
# per function: (the function, the place saying its carrier is in for its Regional rows only)
_FLAGS = {}

# instrument: a moved row met on a carrier's pass, read against its place or stepped over
READ_ON_THE_CARRIER = "SPINE the `%s` road read a moved row against its carrier's place"
SKIPPED_ON_THE_CARRIER = "SPINE the `%s` road stepped over a moved row: its carrier stands nowhere"
ELSEWHERE = "SPINE the `%s` road stepped over a Regional row: its carrier stands elsewhere"
TOOK_ANOTHER_KIND = "SPINE the `%s` road read a Regional row off a carrier of another kind"
# instrument: a building state's row on its host pass, left without its village remembered
HOST_UNMOVED = "SPINE the `%s` road's host pass met a row no reach moved"
HOST_NO_HOST = "SPINE the `%s` road's host pass had no host to remember"


def emit(bc, fn, op, word, named, asked, holders, walker_region, here, leave):
    """Step over a moved row whose carrier stands nowhere, or in another region than the walker."""
    out, a_set = [], reach.naming_a_set(bc)
    if holders.get("region") is not None:
        out += _only_its_regional_rows(bc, fn, op, word, named, asked, here, leave)
    for case, onto in sorted(scopematch.rehosts_onto().items()):
        value = reach.case_value(bc, case)
        # a set is `framework/setreach.py`'s, and the owner is proved shared before any carrier
        if value in a_set or onto == "owner":
            continue
        guard(onto in CARRIERS_OWN, "a reach moves rows onto the %s, but a carrier's pass reads "
              "only the walker's %s; read the carrier's first" % (onto, onto))
        past = "%s: not moved to the %s" % (here, onto)
        placed = "%s: the carrier stands in its %s" % (here, onto)
        out += [op("Int", dst=asked, ptr=number(bc, value)),
                (op("JNotEq", a=named, b=asked), past)]
        if holders.get(onto) is not None:
            out += [(op("JNotNull", reg=holders[onto]), placed)]
        out += (sayonce.emit(bc, fn, SKIPPED_ON_THE_CARRIER % word, even_when_quiet=True)
                + [(op("JAlways"), leave)])
        if holders.get(onto) is not None:
            out += [placed + ":", op("Label")]
            if onto == "region":
                out += _in_the_walkers_region(bc, fn, op, word, holders[onto], walker_region,
                                              here, leave)
            out += sayonce.emit(bc, fn, READ_ON_THE_CARRIER % word, even_when_quiet=True)
        out += [past + ":", op("Label")]
    return out


def _in_the_walkers_region(bc, fn, op, word, carriers_region, walker_region, here, leave):
    """A Regional row counts only for a walker standing in its carrier's own region."""
    same = "%s: the carrier stands in the walker's region" % here
    return ([(op("JEq", a=carriers_region, b=walker_region), same)]
            + sayonce.emit(bc, fn, ELSEWHERE % word, even_when_quiet=True)
            + [(op("JAlways"), leave), same + ":", op("Label")])


def only_regional(bc, fn, row_region):
    """This function's place saying its carrier is in for Regional rows only; none off a region."""
    if row_region is None:
        return None
    kept = _FLAGS.get(id(fn))
    if kept is None or kept[0] is not fn:
        kept = _FLAGS[id(fn)] = (fn, a_new_place(bc, fn, reader_for(bc).count_kind))
    return kept[1]


def emit_start(bc, fn, op, row_region, the_region):
    """Each store starts on the walker's own region, its carrier taken for all its rows."""
    if row_region is None:
        return []
    return [op("Mov", dst=row_region, src=the_region),
            op("Int", dst=only_regional(bc, fn, row_region), ptr=number(bc, 0))]


def _only_its_regional_rows(bc, fn, op, word, named, asked, here, leave):
    """A carrier taken for its Regional rows only has every other row stepped over."""
    every_row = "%s: the carrier is taken for all its rows" % here
    regional = "%s: a Regional row off a carrier of another kind" % here
    out = [op("Int", dst=asked, ptr=number(bc, 0)),
           (op("JEq", a=only_regional(bc, fn, True), b=asked), every_row)]
    for case, onto in sorted(scopematch.rehosts_onto().items()):
        if onto == "region":
            out += [op("Int", dst=asked, ptr=number(bc, reach.case_value(bc, case))),
                    (op("JEq", a=named, b=asked), regional)]
    return (out + [(op("JAlways"), leave), regional + ":", op("Label")]
            + sayonce.emit(bc, fn, TOOK_ANOTHER_KIND % word, even_when_quiet=True)
            + [every_row + ":", op("Label")])


def emit_placed(bc, fn, op, word, carrier, row_region, onward):
    """`PLACED`: the carrier's own region, off the route every scope standing in one declares."""
    placed = PLACED % word
    if row_region is None:
        return [placed + ":", op("Label"), (op("JAlways"), onward)]
    return ([placed + ":", op("Label")] + emit_region_of(bc, fn, op, carrier, row_region, placed)
            + [(op("JAlways"), onward)])


def past_the_kind_match(bc):
    """The reaches a host row skips the building-kind match by: the whole faction, a region."""
    return [reach.case_value(bc, reach.FACTION)] + [
        reach.case_value(bc, case) for case, onto in sorted(scopematch.rehosts_onto().items())
        if onto == "region"]


def host_leaves(word):
    """The two ways a host pass leaves without naming its village a carrier: (unmoved, no host)."""
    return "%s: a host row no reach moved" % word, "%s: a host row with no host" % word


def emit_host_leaves(bc, fn, op, word, past):
    """Past the host pass's remembering, each of `host_leaves` said once a game, then `past`."""
    unmoved, no_host = host_leaves(word)
    return ([(op("JAlways"), past), unmoved + ":", op("Label")]
            + sayonce.emit(bc, fn, HOST_UNMOVED % word, even_when_quiet=True)
            + [(op("JAlways"), past), no_host + ":", op("Label")]
            + sayonce.emit(bc, fn, HOST_NO_HOST % word, even_when_quiet=True)
            + [(op("JAlways"), past)])


def region_kind(bc):
    """The kind a region is, at the end of the route every scope standing in one declares."""
    at = kind_named(bc, AN_ENTITY)
    for name in scopematch.the_region_question()[0]:
        at = field_by_name(bc, at, name, "a thing standing in a region")[1]
    return at


def _hosted_by_a_field(bc):
    """[(a kind, its host field, the host's kind)], off `framework/setreach.py`'s own list."""
    return [(entity, at, gv(fields_of(bc, kind_named(bc, entity))[1][at].type))
            for entity, at in setreach.carriers_that_name_a_village(bc)]


def _route(bc, fn, op, start, into, leave):
    """`into` := the region `start`, an entity, stands in by its own cell; `leave` if none."""
    names = scopematch.the_region_question()[0]
    out, at, at_reg = [], kind_named(bc, AN_ENTITY), start
    for n, name in enumerate(names):
        where, at = field_by_name(bc, at, name, "a thing standing in a region")
        got = into if n == len(names) - 1 else a_new_place(bc, fn, at)
        out += [op("Null", dst=got), op("Field", dst=got, obj=at_reg, field=where),
                (op("JNull", reg=got), leave)]
        at_reg = got
    return out


def emit_region_of(bc, fn, op, thing, into, here):
    """`into` := the region a proved entity stands in; with no cell, where its host stands."""
    done, hosted = "%s: its region is read" % here, "%s: it has no cell of its own" % here
    as_entity = a_new_place(bc, fn, kind_named(bc, AN_ENTITY))
    # ⛔ emptied first: a thing standing nowhere leaves before any hop writes it
    out = ([op("Null", dst=into), op("UnsafeCast", dst=as_entity, src=thing)]
           + _route(bc, fn, op, as_entity, into, hosted)
           + [(op("JAlways"), done), hosted + ":", op("Label")])
    for entity, host_at, host_kind in _hosted_by_a_field(bc):
        a_kind = kind_named(bc, entity)
        its_class = a_new_place(bc, fn, gv(bc.global_types[class_global(bc, a_kind)]))
        really = a_new_place(bc, fn, returns_type(function_named(bc, IS_REALLY), IS_REALLY))
        as_it, host = a_new_place(bc, fn, a_kind), a_new_place(bc, fn, host_kind)
        its_host = a_new_place(bc, fn, kind_named(bc, AN_ENTITY))
        not_it = "%s: not a %s" % (here, entity)
        out += [op("Null", dst=host),
                op("GetGlobal", **{"dst": its_class, "global": class_global(bc, a_kind)}),
                op("Call2", dst=really, fun=gv(function_named(bc, IS_REALLY).findex),
                   arg0=its_class, arg1=thing),
                (op("JFalse", cond=really), not_it),
                op("UnsafeCast", dst=as_it, src=thing),
                op("Field", dst=host, obj=as_it, field=host_at),
                (op("JNull", reg=host), done),
                op("UnsafeCast", dst=its_host, src=host)]
        out += (_route(bc, fn, op, its_host, into, done)
                + [(op("JAlways"), done), not_it + ":", op("Label")])
    return out + [done + ":", op("Label")]
