#!/usr/bin/env python3
"""A walker's pass, for production: our places readied at its start, and its end's sweep."""
from tools.project import gv
from tools.hlcode import SLOTS_ON, field_by_name, function_named, kind_named, number, \
    returns_type, template, written
from framework.parsed import HELD_BY as APPLICATION, a_new_place
from framework.tray import ARRAY_OF_ENTRIES as A_LIST, BACKING_ON, COUNT_ON
from framework.acts.gain_res import PAYS
from framework.acts.gain_res_prod import (FORGET, GONE, MAKE, MAP, OURS, OWNED_BY, OWNER_GONE, READ,
                                      REMOVE, RENEWED, TAKEN_BACK, THE_ID_ON, UNLIST, WALKERS)


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def _slot(bc, which):
    return (getattr(bc, SLOTS_ON, None) or {}).get(which)


def emit_ready(bc, fn):
    """At a pass's start: our list and each map, each made the first time a pass finds none."""
    from framework.settle import _a_new_list
    op = lambda name, **operands: _op(bc, name, **operands)
    ledger = a_new_place(bc, fn, kind_named(bc, A_LIST))
    there = "production: our list is there"
    out = [op("GetGlobal", **{"dst": ledger, "global": _slot(bc, OURS)}),
           (op("JNotNull", reg=ledger), there)]
    out += _a_new_list(bc, fn, op, ledger) + [
        op("SetGlobal", **{"global": _slot(bc, OURS), "src": ledger}),
        there + ":", op("Label")]
    making = function_named(bc, MAKE)
    from framework.questtimer import MAPS
    for which in (OWNED_BY, RENEWED, WALKERS) + MAPS:
        held = a_new_place(bc, fn, kind_named(bc, MAP))
        made = a_new_place(bc, fn, returns_type(making, MAKE))
        there = "production: %s is there" % which
        out += [op("GetGlobal", **{"dst": held, "global": _slot(bc, which)}),
                (op("JNotNull", reg=held), there),
                op("New", dst=held),
                op("Call1", dst=made, fun=gv(making.findex), arg0=held),
                op("SetGlobal", **{"global": _slot(bc, which), "src": held}),
                there + ":", op("Label")]
    return out


def _unless_gone(bc, fn, op, whose, got, keep):
    """On to `keep` unless the game has taken the owning unit or agent off the map."""
    from framework.reach import EVERY_HOLDER
    walkers = a_new_place(bc, fn, kind_named(bc, MAP))
    holder = a_new_place(bc, fn, kind_named(bc, EVERY_HOLDER))
    dead = a_new_place(bc, fn, returns_type(function_named(bc, GONE), GONE))
    return [
        op("GetGlobal", **{"dst": walkers, "global": _slot(bc, WALKERS)}),
        (op("JNull", reg=walkers), keep),
        op("Call2", dst=got, fun=gv(function_named(bc, READ).findex), arg0=walkers, arg1=whose),
        (op("JNull", reg=got), keep),
        op("UnsafeCast", dst=holder, src=got),
        op("Call1", dst=dead, fun=gv(function_named(bc, GONE).findex), arg0=holder),
        (op("JFalse", cond=dead), keep),
    ]


def emit_sweep(bc, fn, walker, road):
    """Past a pass's last row: the walker's unrenewed applications, and a gone walker's, go back."""
    from framework import board, sayonce
    from framework.reach import EVERY_HOLDER
    op = lambda name, **operands: _op(bc, name, **operands)
    new = lambda kind: a_new_place(bc, fn, kind)
    app_kind, list_kind = kind_named(bc, APPLICATION), kind_named(bc, A_LIST)
    ledger, owners, renewed = new(list_kind), new(kind_named(bc, MAP)), new(kind_named(bc, MAP))
    id_at, id_kind = field_by_name(bc, kind_named(bc, EVERY_HOLDER), THE_ID_ON, "a walker")
    count_at, count_kind = field_by_name(bc, list_kind, COUNT_ON, "a list")
    backing_at, backing_kind = field_by_name(bc, list_kind, BACKING_ON, "a list")
    faction_at, entity_kind = field_by_name(bc, app_kind, "faction", "an application")
    uid_at, uid_kind = field_by_name(bc, app_kind, "uid", "an application")
    walker_id, whose = new(id_kind), new(id_kind)
    index, one, count = new(count_kind), new(count_kind), new(count_kind)
    backing = new(backing_kind)
    asked = returns_type(function_named(bc, READ), READ)
    item, got, app = new(asked), new(asked), new(app_kind)
    entity, faction, uid = new(entity_kind), new(kind_named(bc, PAYS)), new(uid_kind)
    answers = lambda name: new(returns_type(function_named(bc, name), name))
    removed, gone, unlisted = answers(REMOVE), answers(FORGET), answers(UNLIST)
    loop, step, take, drop, done, others, buried = (
        "production on the %s: %s" % (road, w) for w in (
            "the next", "on to the next", "take it back", "off our list", "done",
            "another walker's", "its walker is gone"))
    call = lambda name: gv(function_named(bc, name).findex)
    say = lambda word: board.said(bc, fn, "prodpath", lambda: sayonce.emit(
        bc, fn, word, even_when_quiet=True))
    return [
        (op("JNull", reg=walker), done),
        op("GetGlobal", **{"dst": ledger, "global": _slot(bc, OURS)}),
        (op("JNull", reg=ledger), done),
        op("GetGlobal", **{"dst": owners, "global": _slot(bc, OWNED_BY)}),
        (op("JNull", reg=owners), done),
        op("GetGlobal", **{"dst": renewed, "global": _slot(bc, RENEWED)}),
        (op("JNull", reg=renewed), done),
        op("Field", dst=walker_id, obj=walker, field=id_at),
        op("Int", dst=index, ptr=number(bc, 0)),
        op("Int", dst=one, ptr=number(bc, 1)),
        loop + ":", op("Label"),
        op("Field", dst=count, obj=ledger, field=count_at),
        (op("JSGte", a=index, b=count), done),
        op("Field", dst=backing, obj=ledger, field=backing_at),
        op("GetArray", dst=item, array=backing, index=index),
        (op("JNull", reg=item), step),
        op("UnsafeCast", dst=app, src=item),
        op("Field", dst=uid, obj=app, field=uid_at),
        op("Call2", dst=got, fun=call(READ), arg0=owners, arg1=uid),
        (op("JNull", reg=got), step),
        op("SafeCast", dst=whose, src=got),
        (op("JNotEq", a=whose, b=walker_id), others),
        op("Call2", dst=got, fun=call(READ), arg0=renewed, arg1=uid),
        (op("JNull", reg=got), take),
        # renewed this pass: kept, and the renewal spent so the next pass must renew it again
        op("Call2", dst=gone, fun=call(FORGET), arg0=renewed, arg1=uid),
        (op("JAlways"), step),
        others + ":", op("Label"),
    ] + _unless_gone(bc, fn, op, whose, got, step) + say(OWNER_GONE) + [
        (op("JAlways"), buried),
        take + ":", op("Label"),
    ] + say(TAKEN_BACK) + [
        buried + ":", op("Label"),
        op("Field", dst=entity, obj=app, field=faction_at),
        (op("JNull", reg=entity), drop),
        op("UnsafeCast", dst=faction, src=entity),
        op("Call2", dst=removed, fun=call(REMOVE), arg0=faction, arg1=uid),
        drop + ":", op("Label"),
        op("Call2", dst=gone, fun=call(FORGET), arg0=owners, arg1=uid),
        # ⛔ NO STEP AFTER A REMOVAL: the list closed up, so this index already holds the next
        op("Call2", dst=unlisted, fun=call(UNLIST), arg0=ledger, arg1=app),
        (op("JAlways"), loop),
        step + ":", op("Label"),
        op("Add", dst=index, a=index, b=one),
        (op("JAlways"), loop),
        done + ":", op("Label"),
    ]
