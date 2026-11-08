#!/usr/bin/env python3
"""One number per resource for a pass over one store, where a row's own tray draws one each."""
from tools.project import gv, guard
from tools.hlcode import (field_by_name, function_named, kind_named, number, returns_type,
                          slot_global, template, written)
from framework import ownermatch, sayonce, tray
from framework.loadguard import emit_empty
from framework.parsed import a_new_place

# our own three places, never a row's: which payee a row pays is known only once its act has run
ENTRIES = "the numbers this pass has collected"
WHERE = "where this pass's numbers go"
ALREADY = "the entry each resource in this pass's tray already has"
# what every block here hands `framework/tray.py`, so its own emitters read these three
OURS = (ENTRIES, WHERE, ALREADY)
# ⛔ AND THE EVENTS' OWN THREE: rows drawn where an event happened sum here, drawn once a pass
EVENTS = ("the numbers this pass's events collected", "where this pass's events are drawn",
          "the entry each resource in this pass's events' tray already has")
# the ways a row's numbers leave it, each said the first time a world reaches it
HANDED = "a row's numbers went into the pass's own tray"
ITS_OWN = "a row drew its own numbers where it named"
JOINED = "a row's numbers joined the pass's events, drawn where they happened"
DRAWN_NOW = "a ForAll payment was drawn to the faction it paid"


def _op(bc, name, **operands):
    """One instruction, written from the shape the file itself declares."""
    return written(template(bc, name), **operands)


def said(bc, fn, word):
    """That word, the first time a world reaches it and never again -- this feature's diagnosis."""
    return sayonce.emit(bc, fn, word, even_when_quiet=True)


def make_slots(bc):
    """MAKE our three and the events' three, each of the kind a row's tray keeps it in."""
    for entries, where, already in (OURS, EVENTS):
        slot_global(bc, entries, kind_named(bc, tray.ARRAY_OF_ENTRIES))
        slot_global(bc, where, tray.recipe(bc)["of"]["where"])
        slot_global(bc, already, kind_named(bc, tray.ONE_PER_RESOURCE))


def slots(bc):
    """READ our three, under the keys a row's tray uses for the same three things."""
    return tray.slots(bc, OURS)


def calling(bc, fn, key, handed, block_of):
    """⛔ IN A FUNCTION OF OURS, handed `handed`: the game's own function only makes the call."""
    from tools.hlcode import assemble, shared_function
    counted = tray.recipe(bc)["of"]["counted"]

    def body(made):
        back = a_new_place(bc, made, counted)
        return assemble(block_of(made) + [_op(bc, "Int", dst=back, ptr=number(bc, 0)),
                                          _op(bc, "Ret", ret=back)])
    shared = shared_function(bc, fn, lambda _bc, made: made, (key, gv(list(fn.regs)[handed])),
                             [gv(list(fn.regs)[handed])], counted, body)
    return [_op(bc, "Call1", dst=a_new_place(bc, fn, counted), fun=shared, arg0=handed)]


def emit_open(bc, fn, over, triple=OURS):
    """Open a tray over the scope's stand-in (a zone's: its centre), empty; the pass's own first."""
    made = tray.recipe(bc)
    if gv(fn.regs[over]) != made["of"]["point"]:
        return tray.emit_open(bc, fn, over, triple)
    where = a_new_place(bc, fn, made["of"]["where"])
    past = "no centre to draw over at %d" % where
    return tray.emit_open(bc, fn, over, triple, aim=[
        (_op(bc, "JNull", reg=over), past),
        _op(bc, "ToVirtual", dst=where, src=over),
        _op(bc, "SetGlobal", **{"global": tray.slots(bc, triple)[tray.WHERE], "src": where}),
        past + ":", _op(bc, "Label")])


def emit_close(bc, fn, shown_to):
    """Draw the events' sum and the pass's to `shown_to`, and leave both empty either way."""
    return calling(bc, fn, "close the events and the pass", shown_to, lambda made: (
        tray.emit_close(bc, made, 0, EVENTS) + tray.emit_close(bc, made, 0, OURS)))


def _cast_out_of(bc):
    """The kind a map hands back, which is the one kind an entry is ever cast out of."""
    return returns_type(function_named(bc, tray.LOOK_UP), tray.LOOK_UP)


def emit_take(bc, fn, into=OURS):
    """Move what a row collected into the pass's tray, summed per resource, and empty the row's."""
    made = tray.recipe(bc)
    row = tray.slots(bc)
    of_a_list = kind_named(bc, tray.ARRAY_OF_ENTRIES)
    counted, _c = field_by_name(bc, of_a_list, tray.COUNT_ON, "a list")
    held_in, holds_them = field_by_name(bc, of_a_list, tray.BACKING_ON, "a list")
    _res_at, of_a_resource = field_by_name(bc, made["entry"], tray.RESOURCE_ON, "a loot entry")
    # a resource is filed under what the map filing it wants, or the pass's own push faults
    keyed_as = gv(list(function_named(bc, tray.LOOK_UP).regs)[1])
    guard(of_a_resource == keyed_as, "an entry's `%s` is a t@%s and the map is read with a t@%s"
          % (tray.RESOURCE_ON, of_a_resource, keyed_as))
    holding = a_new_place(bc, fn, of_a_list)
    backing = a_new_place(bc, fn, holds_them)
    how_many = a_new_place(bc, fn, made["of"]["counted"])
    at = a_new_place(bc, fn, made["of"]["counted"])
    one = a_new_place(bc, fn, made["of"]["counted"])
    got = a_new_place(bc, fn, _cast_out_of(bc))
    entry = a_new_place(bc, fn, made["entry"])
    what = a_new_place(bc, fn, of_a_resource)
    how_much = a_new_place(bc, fn, made["of"]["held"])
    emptied = a_new_place(bc, fn, of_a_list)
    forgotten = a_new_place(bc, fn, kind_named(bc, tray.ONE_PER_RESOURCE))
    nowhere = a_new_place(bc, fn, made["of"]["where"])
    # named after a place of this block's own, so two takes in one function name no label twice
    each = "the next of this row's numbers at %d" % holding
    step = "on to the next of this row's numbers at %d" % holding
    done = "this row's numbers are in the pass's tray at %d" % holding
    return [
        _op(bc, "GetGlobal", **{"dst": holding, "global": row[tray.ENTRIES]}),
        (_op(bc, "JNull", reg=holding), done),
        _op(bc, "Int", dst=at, ptr=number(bc, 0)),
        _op(bc, "Int", dst=one, ptr=number(bc, 1)),
        each + ":", _op(bc, "Label"),
        # the count every time round, because this row's list is read while another grows
        _op(bc, "Field", dst=how_many, obj=holding, field=counted),
        (_op(bc, "JSGte", a=at, b=how_many), done),
        _op(bc, "Field", dst=backing, obj=holding, field=held_in),
        _op(bc, "GetArray", dst=got, array=backing, index=at),
        (_op(bc, "JNull", reg=got), step),
        _op(bc, "UnsafeCast", dst=entry, src=got),
        _op(bc, "Field", dst=what, obj=entry, field=made["resource"]),
        _op(bc, "Field", dst=how_much, obj=entry, field=made["amount"]),
    ] + tray.emit_push(bc, fn, what, how_much, into) + [
        step + ":", _op(bc, "Label"),
        _op(bc, "Add", dst=at, a=at, b=one),
        (_op(bc, "JAlways"), each),
        done + ":", _op(bc, "Label"),
        # and the row's tray is left exactly as its own close leaves one, so nothing goes twice
        _op(bc, "Null", dst=emptied),
        _op(bc, "SetGlobal", **{"global": row[tray.ENTRIES], "src": emptied}),
        _op(bc, "Null", dst=nowhere),
        _op(bc, "SetGlobal", **{"global": row[tray.WHERE], "src": nowhere}),
        _op(bc, "Null", dst=forgotten),
        _op(bc, "SetGlobal", **{"global": row[tray.ALREADY], "src": forgotten}),
    ]


def emit_row_or_pass(bc, fn, took_a_place, shown_to, owner):
    """A row paying somebody else draws; one drawn where its event was joins the events' sum."""
    made = tray.recipe(bc)
    enough = a_new_place(bc, fn, made["of"]["counted"])
    mine = a_new_place(bc, fn, made["of"]["counted"])
    theirs = a_new_place(bc, fn, made["of"]["counted"])
    who, _kind = field_by_name(bc, kind_named(bc, ownermatch.ASKED_ON), ownermatch.THE_ID_ON,
                               "a thing a number is shown to")
    drew = "this row draws its own numbers at %d" % enough
    placed = "this row's numbers join the pass's events at %d" % enough
    away = "this row's numbers are away at %d" % enough
    events = tray.slots(bc, EVENTS)
    return ([# a payee nobody can be compared with is never summed with the road's own
             (_op(bc, "JNull", reg=shown_to), drew),
             (_op(bc, "JNull", reg=owner), drew),
             _op(bc, "Field", dst=mine, obj=shown_to, field=who),
             _op(bc, "Field", dst=theirs, obj=owner, field=who),
             # ⛔ BY THE IDENTITY EVERY NETWORKED THING CARRIES: an act may have moved the payee
             (_op(bc, "JNotEq", a=mine, b=theirs), drew),
             _op(bc, "Int", dst=enough, ptr=number(bc, tray.PER_PLACE)),
             # a row that took a place of its own is drawn there, summed with the other events
             (_op(bc, "JSGte", a=took_a_place, b=enough), placed)]
            + said(bc, fn, HANDED)
            + emit_take(bc, fn)
            + [(_op(bc, "JAlways"), away), placed + ":", _op(bc, "Label")]
            + calling(bc, fn, "join the events", shown_to, lambda made: _joined(bc, made, events))
            + [(_op(bc, "JAlways"), away), drew + ":", _op(bc, "Label")]
            + said(bc, fn, ITS_OWN)
            + tray.emit_close(bc, fn, shown_to)
            + [away + ":", _op(bc, "Label")])


def _joined(bc, made, events):
    """The row's numbers into the events' tray, opened by its first; drawn where this row's was."""
    where = a_new_place(bc, made, tray.recipe(bc)["of"]["where"])
    held = a_new_place(bc, made, kind_named(bc, tray.ARRAY_OF_ENTRIES))
    nowhere = a_new_place(bc, made, tray.recipe(bc)["of"]["over"])
    opened = "the events' tray is open at %d" % held
    return [_op(bc, "GetGlobal", **{"dst": held, "global": events[tray.ENTRIES]}),
            (_op(bc, "JNotNull", reg=held), opened),
            _op(bc, "Null", dst=nowhere)] + tray.emit_open(bc, made, nowhere, EVENTS) + [
            opened + ":", _op(bc, "Label"),
            _op(bc, "GetGlobal", **{"dst": where, "global": tray.slots(bc)[tray.WHERE]}),
            _op(bc, "SetGlobal", **{"global": events[tray.WHERE], "src": where})] + said(
        bc, made, JOINED) + emit_take(bc, made, EVENTS)


def emit_draw_now(bc, fn, shown_to):
    """A row's tray drawn to `shown_to` at once, then open again, empty, at the same place."""
    made = tray.recipe(bc)
    row = tray.slots(bc)
    held = a_new_place(bc, fn, kind_named(bc, tray.ARRAY_OF_ENTRIES))
    kept = a_new_place(bc, fn, made["of"]["where"])
    nothing = a_new_place(bc, fn, made["of"]["over"])
    shut = "no row's tray is open to draw now at %d" % kept
    return ([_op(bc, "GetGlobal", **{"dst": held, "global": row[tray.ENTRIES]}),
             (_op(bc, "JNull", reg=held), shut),
             _op(bc, "GetGlobal", **{"dst": kept, "global": row[tray.WHERE]})]
            + said(bc, fn, DRAWN_NOW)
            + tray.emit_close(bc, fn, shown_to)
            # opened over nothing, so the place it was aimed at is put back by hand
            + [_op(bc, "Null", dst=nothing)] + tray.emit_open(bc, fn, nothing)
            + [_op(bc, "SetGlobal", **{"global": row[tray.WHERE], "src": kept}),
               shut + ":", _op(bc, "Label")])


def emit_at_a_new_world(bc, fn, into, forgotten, nowhere):
    """NOT A STAGE. A world begins with no pass collecting anything anywhere."""
    return [op for have in (slots(bc), tray.slots(bc, EVENTS)) for op in (
        emit_empty(bc, fn, have[tray.ENTRIES], into)
        + emit_empty(bc, fn, have[tray.ALREADY], forgotten)
        + emit_empty(bc, fn, have[tray.WHERE], nowhere))]


def install(bc):
    """Make our three places, and check each one is its own. NOTHING IS EMITTED."""
    make_slots(bc)
    # both words are made HERE, so the emptying at a new world is built knowing about them
    for word in (HANDED, ITS_OWN, JOINED, DRAWN_NOW):
        sayonce.slot_for(bc, word)
    have = slots(bc)
    guard(len(set(have.values())) == 3 and None not in have.values(),
          "the pass's tray wants three places of its own and has %s" % (tuple(have.values()),))
    return ("PASS TRAY: three places of our own, so a pass over one store draws its "
            "rows' sum as one number per resource. Nothing is spliced")
