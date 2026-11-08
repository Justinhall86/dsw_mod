#!/usr/bin/env python3
"""What the game calls dead leaves our lists, so a walk costs what is alive, never what ever was."""
from tools.hlcode import (argument_kind, field_by_name, function_named, kind_named, method_slot,
                          number, returns_type)
from tools.project import gv

# the game's own question, ASKED ON THE SLOT of the kind every holder shares (`framework/reach.py`)
ASKS = "isDead"
# the game's own way of taking a key out of one of its maps
FORGET = "haxe.ds.ObjectMap.remove"
# the walks one compaction adds: keep or drop each, then let go of the tail
WALKS = 2


def emit_is_dead(bc, fn, op, thing, dead, here):
    """To `dead` when nothing is there or the game calls it dead; a thing of no such kind stays."""
    from framework import ofthekind
    from framework.parsed import a_new_place
    from framework.reach import EVERY_HOLDER as ASKED_ON
    one = a_new_place(bc, fn, kind_named(bc, ASKED_ON))
    asked = "%s.%s" % (ASKED_ON, ASKS)
    answer = a_new_place(bc, fn, returns_type(function_named(bc, asked), asked))
    kept = "%s: it stays" % here
    return [(op("JNull", reg=thing), dead)] + ofthekind.emit_or_below(
        bc, fn, op, thing, one, kind_named(bc, ASKED_ON), kept) + [
        op("CallMethod", dst=answer,
           field=method_slot(bc, kind_named(bc, ASKED_ON), ASKS, ASKED_ON), args=[one]),
        (op("JTrue", cond=answer), dead),
        kept + ":", op("Label")]


def emit_compact(bc, fn, op, listed, here, forget_in=()):
    """Keep what is alive in `listed`, in order, and shorten it; each map in `forget_in` forgets."""
    from framework.parsed import a_new_place
    from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON
    counted_at, count_kind = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), COUNT_ON,
                                           "a list")
    backing_at, backing_kind = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), BACKING_ON,
                                             "a list")
    backing = a_new_place(bc, fn, backing_kind)
    upto, over, kept = (a_new_place(bc, fn, count_kind) for _ in range(3))
    got = a_new_place(bc, fn, kind_named(bc, "Dyn"))
    key = a_new_place(bc, fn, argument_kind(bc, FORGET, 0))
    forgot = a_new_place(bc, fn, returns_type(function_named(bc, FORGET), FORGET))
    done, loop = "%s: compacted" % here, "%s: the next to keep or drop" % here
    drop, short, emptied = ("%s: dropped" % here, "%s: shorten" % here,
                            "%s: the tail is emptied" % here)
    out = [(op("JNull", reg=listed), done),
           op("Field", dst=upto, obj=listed, field=counted_at),
           op("Field", dst=backing, obj=listed, field=backing_at),
           (op("JNull", reg=backing), done),
           op("Int", dst=over, ptr=number(bc, 0)),
           op("Int", dst=kept, ptr=number(bc, 0)),
           loop + ":", op("Label"),
           (op("JSGte", a=over, b=upto), short),
           op("GetArray", dst=got, array=backing, index=over)]
    out += emit_is_dead(bc, fn, op, got, drop, here)
    out += [op("SetArray", array=backing, index=kept, src=got),
            op("Incr", dst=kept),
            (op("JAlways"), "%s: stepped" % here),
            drop + ":", op("Label")]
    for which, one in enumerate(forget_in):
        # a map not made yet has nothing to forget
        past = "%s: map %d has nothing to forget" % (here, which)
        out += [(op("JNull", reg=one), past), (op("JNull", reg=got), past),
                op("UnsafeCast", dst=key, src=got),
                op("Call2", dst=forgot, fun=gv(function_named(bc, FORGET).findex),
                   arg0=one, arg1=key),
                past + ":", op("Label")]
    return out + [
        "%s: stepped" % here + ":", op("Label"),
        op("Incr", dst=over),
        (op("JAlways"), loop),
        short + ":", op("Label"),
        # ⛔ WHAT WAS DROPPED IS LET GO, or the backing keeps every dead thing alive
        op("Mov", dst=over, src=kept),
        op("Null", dst=got),
        "%s: emptying" % here + ":", op("Label"),
        (op("JSGte", a=over, b=upto), emptied),
        op("SetArray", array=backing, index=over, src=got),
        op("Incr", dst=over),
        (op("JAlways"), "%s: emptying" % here),
        emptied + ":", op("Label"),
        op("SetField", obj=listed, field=counted_at, src=kept),
        done + ":", op("Label")]


def emit_paid_up(bc, op, queue, counted_at, wanted, how_many, into):
    """`into` is what the road has taken; ALL PAID, READ PAST THE ACT, and the queue starts over."""
    owed = "the queue still owes at %d" % queue
    return [op("Mov", dst=into, src=wanted),
            op("Field", dst=how_many, obj=queue, field=counted_at),
            (op("JSLt", a=wanted, b=how_many), owed),
            op("Int", dst=into, ptr=number(bc, 0)),
            op("SetField", obj=queue, field=counted_at, src=into),
            owed + ":", op("Label")]
