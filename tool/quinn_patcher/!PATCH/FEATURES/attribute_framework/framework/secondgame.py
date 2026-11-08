#!/usr/bin/env python3
"""What a new game still holds of the last one's receivers, said when it begins (`D2`)."""
from tools.project import gv, guard
from tools.hlcode import (assemble, field_by_name, kind_named, template, written)
from tools import splice
from tools.splice import insert
from framework import board, lasttick, newworld, rehosted, running, sayonce, settle, traps
from framework.loadguard import clear_site, emit_empty
from framework.parsed import a_new_place
from framework.tray import ARRAY_OF_ENTRIES, COUNT_ON

SPLICE = "what a new game still holds of the last one"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ("attributes",)
# said before a store's name, so every line of this reading is found with one search
LEFT = "left from the last game: "
AFTER = "after the emptying, still holding: "
# ON from 751: 750 measured 23 carriers and every road's records left from the first game
EMPTIES = True


def stores(bc):
    """Every store the spine's own emptying leaves, as (name, slot, is a list)."""
    found = [(rehosted.CARRIERS, rehosted.slot(bc, rehosted.CARRIERS), True),
             (rehosted.ALREADY, rehosted.slot(bc, rehosted.ALREADY), False),
             (rehosted.STANDS, rehosted.slot(bc, rehosted.STANDS), False),
             (running.SLOT, running.slot(bc, running.SLOT), False),
             (running.CREDIT, running.slot(bc, running.CREDIT), False)]
    for road in settle.every_road():
        for which in (settle.SLOT, settle.KNOWN, settle.TOUCHED, settle.TOUCHED_KNOWN,
                      settle.MINE, settle.MINE_LIST):
            found.append((settle.named_for(which, road), settle.slot(bc, which, road),
                          which == settle.TOUCHED))
    for road in lasttick.every_road():
        for which in (lasttick.NOW, lasttick.NOW_LIST, lasttick.BEFORE, lasttick.BEFORE_LIST):
            found.append((lasttick.named_for(which, road), lasttick.slot(bc, which, road),
                          which in (lasttick.NOW_LIST, lasttick.BEFORE_LIST)))
    missing = [name for name, where, _ in found if where is None]
    guard(not missing, "never made: %s" % "; ".join(missing))
    return found


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def emit_naming(bc, fn, found, opening, places):
    """Say each store that holds something; a list says its length too."""
    counted_at, count_kind = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), COUNT_ON,
                                           "a list")
    many = a_new_place(bc, fn, count_kind)
    out = []
    for n, (name, where, is_list) in enumerate(found):
        held = places[gv(bc.global_types[where])]
        past = "%s%d: empty" % (opening, n)
        out += [_op(bc, "GetGlobal", **{"dst": held, "global": where}),
                (_op(bc, "JNull", reg=held), past)]
        if is_list:
            out += [_op(bc, "Field", dst=many, obj=held, field=counted_at)]
            out += settle._saying_a_number(bc, fn, opening + name, many)
        else:
            out += sayonce.emit_word_now(bc, fn, opening + name)
        out += [past + ":", _op(bc, "Label")]
    return out


def install(bc):
    """At the start of a new state, after the spine's emptying: name what is left."""
    found = stores(bc)
    fn = clear_site(bc)
    places = {}
    for _, where, _ in found:
        kind = gv(bc.global_types[where])
        if kind not in places:
            places[kind] = a_new_place(bc, fn, kind)
    # ONE GATE OVER ALL OF IT: a gate keeps its own latch, and one per store is 562 of them
    with board.saying(sayonce.BYPASS):
        left = emit_naming(bc, fn, found, LEFT, places)
        after = emit_naming(bc, fn, found, AFTER, places) if EMPTIES else []
    block = board.gated(bc, fn, left, sayonce.BYPASS)
    if EMPTIES:
        for _, where, _ in found:
            block += emit_empty(bc, fn, where, places[gv(bc.global_types[where])])
        block += board.gated(bc, fn, after, sayonce.BYPASS)
    # right behind the spine's own emptying, so this reads what that one left
    spine_at = splice.where(bc, newworld.THROWN_AWAY)
    guard(spine_at is not None, "the spine's emptying is not in yet -- this goes after it")
    went = insert(bc, fn, sum(spine_at), assemble(block), SPLICE, traps.AT_A_MOMENT)
    return ("SECOND GAME: %d store(s) the spine does not empty are named when a new world "
            "begins%s, %d instruction(s)"
            % (len(found), " and emptied" if EMPTIES else "", went))
