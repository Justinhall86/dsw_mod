#!/usr/bin/env python3
"""One floating number per resource per event, drawn where it happened, via the game's loot draw."""
from tools.project import gv, guard
from tools.hlcode import (SLOTS_ON, argument_kind, call_sites, field_by_name, function_named,
                          kind_named, number, returns_type, slot_global, template,
                          written)
from framework.loadguard import emit_empty
from framework.oneshot import TELL
from framework.parsed import READ, a_new_place
from framework import board, gone, mark, sayonce

# the game's own draw, and the function that already performs it for a pillage
DRAW = "ent.Faction.rpcDisplayLoot"
DRAWN_IN = "ent.comp.SiegeComponent.occupationActionEffects"
# which of the draw's arguments is the point; its kind comes from the draw itself
POINT_ARGUMENT = 2
# what a tray collects into, by the name the game gives that kind
ARRAY_OF_ENTRIES = "hl.types.ArrayObj"
# what one entry says, BY NAME -- never as field 0 and field 1
AMOUNT_ON, RESOURCE_ON = "qty", "res"
# our three places: what this event collected, where it goes, and what is in it already
ENTRIES = "the numbers this event has collected"
WHERE = "where this event's numbers go"
ALREADY = "the entry each resource in this tray already has"
# the game's own way of adding to one of its arrays, and what an array calls its own count
PUSH = "hl.types.ArrayObj.push"
COUNT_ON = "length"
# and its own way of keeping one thing per name, which is how a repeat is found
ONE_PER_RESOURCE = "haxe.ds.StringMap"
A_NEW_ONE = "haxe.ds.$StringMap.__constructor__"
LOOK_UP, RECORD = "haxe.ds.StringMap.get", "haxe.ds.StringMap.set"
# where a trigger's numbers belong: ONE QUEUE per application, since a mark is a COUNT
PER_EVENT = "where each application's events are drawn, in order"
# WHO A ROW'S NUMBERS ARE DRAWN TO: the road's payee, or the faction an act pays instead
SHOWN_TO = "shown_to"
# how far along that list the road has paid; ⛔ a count, never the game's own shift (it faults)
TAKEN_FROM = "how many of each application's places are already paid"
# how a list is added to. ⛔ LOOT ENTRIES, each carrying one coordinate; a boxed number faults
QUEUE_PUSH = "hl.types.ArrayObj.push"
# the run of memory a list of entries holds them in, beside the count of them
BACKING_ON = "array"
# how many coordinates one event puts in, which is also how many the road reads back
PER_PLACE = 2
# reads per row of a map keyed by the application: the list, and how far along it
READS_PER_ROW = 2
# what a tray says about itself, rarely; ⛔ nothing is said on every read-back
A_WHOLE = "there is a whole place to take"
REACHED_RUN = "the run of memory is reached"
IN_HAND = "an entry is in hand"
READ_ONE = "a coordinate is read"
# THE FOUR WAYS OUT OF A CLOSE, one word each
NO_LIST = "a tray closed with no list at all"
NOWHERE = "a tray closed with nowhere to draw"
NOTHING_IN_IT = "a tray closed with nothing collected"
AIMED = "the tray moved to what a row named"
DREW = "the tray drew what it collected"
# THE DISPLAY'S OWN QUEUE: it never writes its count forward, so we carry it
THE_DISPLAY = "$HLoot.displayLoot"
# where each handle sits inside it, each checked against the shape it must have -- v1's own pins
KEY_AT, CACHE_AT, CACHE_FIELD_AT = 7, 64, 65
LOOKED_UP_AT, RECORD_AT = 72, 73
COUNT_AT, CARRY_AT, WROTE_AT = 96, 97, 146


def what_wrote(fn, reg, before):
    """The last instruction before `before` that put something in `reg`."""
    made = [i for i in range(before)
            if fn.ops[i].df.get("dst") is not None and gv(fn.ops[i].df["dst"]) == reg]
    guard(made, "nothing writes place %d before %d, so the recipe cannot be read" % (reg, before))
    return made[-1], fn.ops[made[-1]]


def recipe(bc):
    """Every piece of the game's own loot draw, off the one draw that BUILDS its entries; once."""
    if "_tray_recipe" in bc.__dict__:
        return bc.__dict__["_tray_recipe"]
    site = function_named(bc, DRAWN_IN)
    draws = call_sites(site, function_named(bc, DRAW))
    guard(draws, "%s never draws loot, so there is no recipe to lift" % DRAWN_IN)
    found = [r for r in (_one_draw(bc, site, at) for at in draws) if r is not None]
    guard(len(found) == 1,
          "%d of %s's %d loot draws build their own entries, and exactly one may"
          % (len(found), DRAWN_IN, len(draws)))
    bc.__dict__["_tray_recipe"] = found[0]
    return found[0]


def _one_draw(bc, site, at):
    """The recipe as one call states it, or nothing when that call did not build its entries."""
    call = site.ops[at]
    entries_reg, point_reg = gv(call.df["arg1"]), gv(call.df["arg2"])

    # a draw handed an array it did not make says nothing about how one is made: skipped
    _, wrap = what_wrote(site, entries_reg, at)
    if wrap.op != "Call1":
        return None
    backing_at, backing = what_wrote(site, gv(wrap.df["arg0"]), at)
    guard(backing.op == "UnsafeCast", "the backing comes from a %s" % backing.op)
    _, alloc = what_wrote(site, gv(backing.df["src"]), backing_at)
    guard(alloc.op == "Call2", "the array is made by a %s rather than a call" % alloc.op)
    _, kind = what_wrote(site, gv(alloc.df["arg0"]), backing_at)
    guard(kind.op == "Type", "the array's element kind comes from a %s" % kind.op)

    # the point is a Virtual over an object built from two of the entity's own fields
    virtual_at, virtual = what_wrote(site, point_reg, at)
    guard(virtual.op == "ToVirtual", "the point reaches the draw as a %s" % virtual.op)
    ctor_at, ctor = _the_call_making(site, gv(virtual.df["src"]), virtual_at)
    handed_in = [gv(ctor.df["arg1"]), gv(ctor.df["arg2"])]
    axes = []
    for which in handed_in:
        ref_at, ref = what_wrote(site, which, ctor_at)
        guard(ref.op == "Ref", "a coordinate reaches the point as a %s" % ref.op)
        _, read = what_wrote(site, gv(ref.df["src"]), ref_at)
        guard(read.op == "Field", "a coordinate is read by a %s" % read.op)
        axes.append(gv(read.df["field"]))
    guard(len(set(axes)) == 2, "both coordinates are read from one field, which cannot be right")

    entry_kind = gv(kind.df["ty"])
    # EVERY PLACE BELOW IS TYPED OFF THE GAME'S OWN REGISTER HERE, never off a named kind
    of = {name: gv(list(site.regs)[reg]) for name, reg in (
        ("point", gv(ctor.df["arg0"])), ("across", gv(ref.df["dst"])),
        # WHAT THE COORDINATES ARE READ OFF: the narrower kind the game casts down to here
        ("over", gv(read.df["obj"])),
        ("held", gv(ref.df["src"])), ("typed", gv(kind.df["dst"])),
        ("raw", gv(alloc.df["dst"])), ("backing", gv(backing.df["dst"])),
        ("entries", entries_reg), ("where", point_reg),
        ("counted", gv(alloc.df["arg1"])), ("void", gv(ctor.df["dst"])))}
    return dict(draw=gv(call.df["fun"]), wrap=gv(wrap.df["fun"]), alloc=gv(alloc.df["fun"]),
                point=gv(ctor.df["fun"]), entry=entry_kind, across=axes, of=of,
                amount=field_by_name(bc, entry_kind, AMOUNT_ON, "a loot entry")[0],
                resource=field_by_name(bc, entry_kind, RESOURCE_ON, "a loot entry")[0])


def _the_call_making(fn, reg, before):
    """The CALL that filled `reg`: a constructor fills it through its first argument."""
    made = [i for i in range(before)
            if fn.ops[i].op in ("Call3", "Call2") and gv(fn.ops[i].df.get("arg0", -1)) == reg]
    guard(made, "nothing calls anything with place %d, so the point is not built here" % reg)
    return made[-1], fn.ops[made[-1]]


def make_slots(bc):
    """MAKE our three places, empty until an event opens a tray, and hand back the recipe."""
    slot_global(bc, ENTRIES, kind_named(bc, ARRAY_OF_ENTRIES))
    slot_global(bc, WHERE, gv(list(function_named(bc, DRAW).regs)[POINT_ARGUMENT]))
    slot_global(bc, ALREADY, kind_named(bc, ONE_PER_RESOURCE))
    # and two more keyed by the application, so a new world empties them with the marks
    mark.make_slot(bc, PER_EVENT)
    mark.make_slot(bc, TAKEN_FROM)
    return recipe(bc)


def slots(bc, triple=(ENTRIES, WHERE, ALREADY)):
    """READ a set of three places by name, under this file's own three keys. Reading never makes."""
    have = getattr(bc, SLOTS_ON, None) or {}
    return dict(zip((ENTRIES, WHERE, ALREADY), [have.get(name) for name in triple]))


def emit_open(bc, fn, over, triple=(ENTRIES, WHERE, ALREADY), aim=None):
    """Open a tray for this event over `over` (maybe nothing); both places emptied FIRST."""
    made = recipe(bc)
    have = slots(bc, triple)
    R = {name: a_new_place(bc, fn, kind) for name, kind in made["of"].items()}
    seen = a_new_place(bc, fn, kind_named(bc, ONE_PER_RESOURCE))
    built = a_new_place(bc, fn, made["of"]["void"])

    def op(what, **operands):
        return written(template(bc, what), **operands)

    return [
        op("Null", dst=R["entries"]),
        op("SetGlobal", **{"global": have[ENTRIES], "src": R["entries"]}),
        op("Null", dst=R["where"]),
        op("SetGlobal", **{"global": have[WHERE], "src": R["where"]}),
        op("Null", dst=seen),
        op("SetGlobal", **{"global": have[ALREADY], "src": seen}),
    ] + (emit_aim(bc, fn, over, triple) if aim is None else aim) + [
        # AND AN EMPTY ARRAY TO COLLECT INTO, WHATEVER IT IS AIMED AT
        op("Int", dst=R["counted"], ptr=number(bc, 0)),
        op("Type", dst=R["typed"], ty=made["entry"]),
        op("Call2", dst=R["raw"], fun=made["alloc"], arg0=R["typed"], arg1=R["counted"]),
        op("UnsafeCast", dst=R["backing"], src=R["raw"]),
        op("Call1", dst=R["entries"], fun=made["wrap"], arg0=R["backing"]),
        op("SetGlobal", **{"global": have[ENTRIES], "src": R["entries"]}),
        # and a fresh record of what is in it, so a repeat is found rather than added twice
        op("New", dst=seen),
        op("Call1", dst=built, fun=gv(function_named(bc, A_NEW_ONE).findex), arg0=seen),
        op("SetGlobal", **{"global": have[ALREADY], "src": seen}),
    ]


def emit_aim(bc, fn, over, triple=(ENTRIES, WHERE, ALREADY)):
    """Point the open tray at `over`; nothing happens when there is nowhere to draw."""
    made = recipe(bc)
    have = slots(bc, triple)
    R = {name: a_new_place(bc, fn, kind) for name, kind in made["of"].items()}
    second, second_across = (a_new_place(bc, fn, made["of"][k]) for k in ("held", "across"))
    # named after the place this aim reads from, so two aims in one function name no label twice
    nothing = "there is nowhere to draw at %d" % over

    def op(what, **operands):
        return written(template(bc, what), **operands)

    return [
        (op("JNull", reg=over), nothing),
        # the point, built exactly as the game builds its own
        op("Field", dst=R["held"], obj=over, field=made["across"][0]),
        op("Ref", dst=R["across"], src=R["held"]),
        op("Field", dst=second, obj=over, field=made["across"][1]),
        op("Ref", dst=second_across, src=second),
        op("New", dst=R["point"]),
        op("Call3", dst=R["void"], fun=made["point"],
           arg0=R["point"], arg1=R["across"], arg2=second_across),
        op("ToVirtual", dst=R["where"], src=R["point"]),
        op("SetGlobal", **{"global": have[WHERE], "src": R["where"]}),
        nothing + ":", op("Label"),
    ]


def emit_publish(bc, fn, holds, key, thing):
    """Put this event's position on the end of that application's queue; a trigger calls it."""
    made = recipe(bc)
    over, one = (a_new_place(bc, fn, made["of"][k]) for k in ("over", "held"))
    # ⛔ THE KIND THE GAME'S OWN DRAW HOLDS ITS ARRAY IN; the plain kind faults the push
    queue = a_new_place(bc, fn, made["of"]["entries"])
    got = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    wrapped = a_new_place(bc, fn, argument_kind(bc, TELL, 1))
    raw, backing = (a_new_place(bc, fn, made["of"][k]) for k in ("raw", "backing"))
    typed, counted = (a_new_place(bc, fn, made["of"][k]) for k in ("typed", "counted"))
    pushing = function_named(bc, QUEUE_PUSH)
    past, ready = ("that event named nowhere at %d" % over,
                   "the queue is in hand at %d" % queue)

    def op(what, **operands):
        return written(template(bc, what), **operands)

    out = [
        (op("JNull", reg=thing), past),
        # cast down the way the GAME casts at this very draw
        op("UnsafeCast", dst=over, src=thing),
        op("Call2", dst=got, fun=gv(function_named(bc, READ).findex), arg0=holds, arg1=key),
        (op("JNotNull", reg=got), ready),
        # no queue yet: make one with ⛔ THE TRAY'S OWN ELEMENT TYPE, or the push faults
        op("Int", dst=counted, ptr=number(bc, 0)),
        op("Type", dst=typed, ty=made["entry"]),
        op("Call2", dst=raw, fun=made["alloc"], arg0=typed, arg1=counted),
        op("UnsafeCast", dst=backing, src=raw),
        op("Call1", dst=queue, fun=made["wrap"], arg0=backing),
        # ⛔ HANDED OVER AS ITSELF; boxing it first faults the push on the second event
        op("Call3", dst=a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL)),
           fun=gv(function_named(bc, TELL).findex), arg0=holds, arg1=key, arg2=queue),
        (op("JAlways"), "past making one at %d" % queue),
        ready + ":", op("Label"),
        op("UnsafeCast", dst=queue, src=got),
        "past making one at %d:" % queue, op("Label"),
    ]
    # THE TWO NUMBERS ARE TAKEN HERE, AT THE EVENT, in the order the road reads them back
    carried = a_new_place(bc, fn, made["entry"])
    for which in range(PER_PLACE):
        out += [op("Field", dst=one, obj=over, field=made["across"][which]),
                # ONE ENTRY PER COORDINATE, which is what this array was allocated to hold
                op("New", dst=carried),
                op("SetField", obj=carried, field=made["amount"], src=one),
                op("Call2", dst=a_new_place(bc, fn, returns_type(pushing, QUEUE_PUSH)),
                   fun=gv(pushing.findex), arg0=queue, arg1=carried)]
    return out + [past + ":", op("Label")]


def emit_aim_at_what_it_named(bc, fn, holds, taken_at, key):
    """Move the open tray over the OLDEST place this application still owes a number for."""
    made = recipe(bc)
    have = slots(bc)
    reading, telling = function_named(bc, READ), function_named(bc, TELL)
    counted, _c = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), COUNT_ON, "a list")
    held_in, holds_them = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), BACKING_ON,
                                        "a list")
    got = a_new_place(bc, fn, returns_type(reading, READ))
    was = a_new_place(bc, fn, returns_type(reading, READ))
    # ⛔ THE KIND THE GAME'S OWN DRAW HOLDS ITS ARRAY IN; the plain kind faults the push
    queue = a_new_place(bc, fn, made["of"]["entries"])
    # ⛔ THE KIND COMES FROM THE FIELD ITSELF, NEVER FROM THE RECIPE (access violation)
    backing = a_new_place(bc, fn, holds_them)
    how_many = a_new_place(bc, fn, made["of"]["counted"])
    so_far = a_new_place(bc, fn, made["of"]["counted"])
    wanted = a_new_place(bc, fn, made["of"]["counted"])
    enough, at = (a_new_place(bc, fn, made["of"]["counted"]) for _ in range(2))
    wrapped = a_new_place(bc, fn, argument_kind(bc, TELL, 1))
    point = a_new_place(bc, fn, made["of"]["point"])
    where = a_new_place(bc, fn, made["of"]["where"])
    void = a_new_place(bc, fn, made["of"]["void"])
    past = "that row named nowhere at %d" % point
    fresh = "none of this application's list is paid yet at %d" % point

    def op(what, **operands):
        return written(template(bc, what), **operands)

    def say(word):
        return sayonce.emit_word_always(bc, fn, word)

    out = [
        # nothing taken yet; a place taken always leaves this at PER_PLACE or more
        op("Int", dst=wanted, ptr=number(bc, 0)),
        op("Call2", dst=got, fun=gv(reading.findex), arg0=holds, arg1=key),
        (op("JNull", reg=got), past),
        op("UnsafeCast", dst=queue, src=got),
        op("Field", dst=how_many, obj=queue, field=counted),
    ] + [
        # how far along this application's list the road is; unread reads as nothing paid
        op("Int", dst=so_far, ptr=number(bc, 0)),
        op("Call2", dst=was, fun=gv(reading.findex), arg0=taken_at, arg1=key),
        (op("JNull", reg=was), fresh),
        op("SafeCast", dst=so_far, src=was),
        fresh + ":", op("Label"),
    ] + [
        # a whole place or none of it: half a position is worse than the stand-in
        op("Mov", dst=enough, src=so_far),
    ] + [op("Incr", dst=enough)] * PER_PLACE + [
        (op("JSLt", a=how_many, b=enough), past),
        # ⛔ ONLY PAST THE CHECK, or every walk that took nothing moves the count on
        op("Mov", dst=wanted, src=enough),
    ] + say(A_WHOLE) + [
        # ⛔ THE LIST'S BACKING, READ AT AN INDEX; nothing here moves it (the game's take faults)
        op("Field", dst=backing, obj=queue, field=held_in),
    ] + say(REACHED_RUN)
    refs = []
    for which in range(PER_PLACE):
        fetched = a_new_place(bc, fn, returns_type(reading, READ))
        one = a_new_place(bc, fn, made["of"]["held"])
        across = a_new_place(bc, fn, made["of"]["across"])
        refs.append(across)
        carried = a_new_place(bc, fn, made["entry"])
        out += [op("Mov", dst=at, src=so_far)]
        out += [op("Incr", dst=at)] * which
        out += [op("GetArray", dst=fetched, array=backing, index=at),
                (op("JNull", reg=fetched), past)]
        out += say(IN_HAND)
        out += [
                # the coordinate rides in the amount field of an entry of this list's own kind
                op("UnsafeCast", dst=carried, src=fetched),
                op("Field", dst=one, obj=carried, field=made["amount"])]
        out += say(READ_ONE)
        # THIS frame's own place: the point is built and drawn inside this same call
        out += [op("Ref", dst=across, src=one)]
    done = "the place this row took is written down at %d" % point
    told = a_new_place(bc, fn, returns_type(telling, TELL))
    # ⛔ PAST THE ACT: a road refused after the aim must aim at this SAME place next walk
    moved = [
        op("Int", dst=at, ptr=number(bc, 1)), (op("JSLt", a=wanted, b=at), done),
        op("Mov", dst=wanted, src=how_many),
    ] + gone.emit_paid_up(bc, op, queue, counted, wanted, how_many, at) + [
        op("ToDyn", dst=wrapped, src=at),
        op("Call3", dst=told, fun=gv(telling.findex), arg0=taken_at, arg1=key, arg2=wrapped),
        done + ":", op("Label"),
    ]
    return out + sayonce.emit_word_always(bc, fn, AIMED, even_when_quiet=True) + [
        op("New", dst=point),
        op("Call3", dst=void, fun=made["point"], arg0=point, arg1=refs[0], arg2=refs[1]),
        op("ToVirtual", dst=where, src=point),
        op("SetGlobal", **{"global": have[WHERE], "src": where}),
        past + ":", op("Label")], moved, wanted


def emit_push(bc, fn, what, how_much, triple=(ENTRIES, WHERE, ALREADY)):
    """Put one payment in the open tray, ADDED to this resource's entry when it has one."""
    made = recipe(bc)
    have = slots(bc, triple)
    push, look_up, record = (function_named(bc, name) for name in (PUSH, LOOK_UP, RECORD))
    holding = a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    seen = a_new_place(bc, fn, kind_named(bc, ONE_PER_RESOURCE))
    hit = a_new_place(bc, fn, returns_type(look_up, LOOK_UP))
    entry = a_new_place(bc, fn, made["entry"])
    so_far = a_new_place(bc, fn, made["of"]["held"])
    now_holds = a_new_place(bc, fn, returns_type(push, PUSH))
    noted = a_new_place(bc, fn, made["of"]["void"])
    whole, nothing = (a_new_place(bc, fn, made["of"][k]) for k in ("counted", "held"))
    # named after the place this push made, so two pushes in one block name different labels
    past = "no tray is open at %d" % holding
    fresh = "this resource is new to the tray at %d" % holding

    def op(name, **operands):
        return written(template(bc, name), **operands)

    return [
        # A PAYMENT OF 0 SHOWS NOTHING; the game's amounts are decimal, so 0 is made the same way
        op("Int", dst=whole, ptr=number(bc, 0)), op("ToSFloat", dst=nothing, src=whole),
        (op("JEq", a=how_much, b=nothing), past),
        op("GetGlobal", **{"dst": holding, "global": have[ENTRIES]}),
        (op("JNull", reg=holding), past),
        op("GetGlobal", **{"dst": seen, "global": have[ALREADY]}),
        # no record of what is in the tray -- then nothing can be a repeat, so just add it
        (op("JNull", reg=seen), fresh),
        op("Call2", dst=hit, fun=gv(look_up.findex), arg0=seen, arg1=what),
        (op("JNull", reg=hit), fresh),
        # THIS RESOURCE IS ALREADY HERE: add to the entry it already has and show nothing new
        op("UnsafeCast", dst=entry, src=hit),
        op("Field", dst=so_far, obj=entry, field=made["amount"]),
        op("Add", dst=so_far, a=so_far, b=how_much),
        op("SetField", obj=entry, field=made["amount"], src=so_far),
        (op("JAlways"), past),
        fresh + ":", op("Label"),
        op("New", dst=entry),
        op("SetField", obj=entry, field=made["resource"], src=what),
        op("SetField", obj=entry, field=made["amount"], src=how_much),
        op("Call2", dst=now_holds, fun=gv(push.findex), arg0=holding, arg1=entry),
        # READ THE RECORD AGAIN: one of the two paths here never read it
        op("GetGlobal", **{"dst": seen, "global": have[ALREADY]}),
        (op("JNull", reg=seen), past),
        op("Call3", dst=noted, fun=gv(record.findex), arg0=seen, arg1=what, arg2=entry),
        past + ":", op("Label"),
    ]


def staggering(bc):
    """What the display needs told when a widget already runs at our spot, shape-checked."""
    shows = function_named(bc, THE_DISPLAY)
    ops = shows.ops or []
    guard(len(ops) > WROTE_AT, "%s is %d instructions, too short to hold its own queue"
          % (THE_DISPLAY, len(ops)))
    kinds = [gv(r) for r in list(shows.regs)]

    def at(where, what, why):
        guard(ops[where].op == what, "%s at %d is a %s rather than %s -- %s"
              % (THE_DISPLAY, where, ops[where].op, what, why))
        return ops[where]

    key = at(KEY_AT, "StaticClosure", "the position is what a widget is filed under")
    cache = at(CACHE_AT, "GetGlobal", "the widgets already running live on one object")
    field = at(CACHE_FIELD_AT, "Field", "and that object keeps them in a map of its own")
    looked = at(LOOKED_UP_AT, "Call2", "one is looked up by the position before anything is drawn")
    guard(gv(looked.df["fun"]) == gv(function_named(bc, LOOK_UP).findex),
          "%s does not look a widget up the way a map is read" % THE_DISPLAY)
    record = at(RECORD_AT, "ToVirtual", "what it finds is a record, not the widget itself")
    counted = at(COUNT_AT, "Field", "the record says how many numbers are already queued there")
    at(CARRY_AT, "Add", "and the delay for a new one is counted from it")
    at(WROTE_AT, "SetField", "which is written back only on the path that made the widget")
    guard(gv(counted.df["obj"]) == gv(record.df["dst"]),
          "the count is not read off the record the lookup made")
    # ⚠ THE KEY'S KIND IS WHAT THE KEY FUNCTION HANDS BACK, NOT THE CLOSURE REGISTER'S
    naming = next((f for f in bc.functions if gv(f.findex) == gv(key.df["fun"])), None)
    guard(naming is not None, "%s files a widget under something that is not a function"
          % THE_DISPLAY)
    guard(returns_type(naming, "the position key") == gv(list(function_named(bc, LOOK_UP).regs)[1]),
          "what names a spot is not what the widgets are filed under")
    return {"key": gv(key.df["fun"]), "key_kind": returns_type(naming, "the position key"),
            "on": gv(cache.df["global"]), "on_kind": kinds[gv(cache.df["dst"])],
            "in": gv(field.df["field"]), "in_kind": kinds[gv(field.df["dst"])],
            "found_kind": kinds[gv(looked.df["dst"])],
            "record": record, "record_kind": kinds[gv(record.df["dst"])],
            "count": gv(counted.df["field"]), "count_kind": kinds[gv(counted.df["dst"])],
            "reads": counted, "adds": ops[CARRY_AT], "writes": ops[WROTE_AT]}


def emit_close(bc, fn, shown_to, triple=(ENTRIES, WHERE, ALREADY)):
    """Draw what this event collected to `shown_to` (an empty tray draws nothing); then empty it."""
    made = recipe(bc)
    have = slots(bc, triple)
    holding = a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    at = a_new_place(bc, fn, made["of"]["where"])
    how_many = a_new_place(bc, fn, made["of"]["counted"])
    none = a_new_place(bc, fn, made["of"]["counted"])
    drawn = a_new_place(bc, fn, made["of"]["void"])
    forgotten = a_new_place(bc, fn, kind_named(bc, ONE_PER_RESOURCE))
    counted, _holds = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), COUNT_ON,
                                    "a collected array")
    queue = staggering(bc)
    key = a_new_place(bc, fn, queue["key_kind"])
    on = a_new_place(bc, fn, queue["on_kind"])
    among = a_new_place(bc, fn, queue["in_kind"])
    found = a_new_place(bc, fn, queue["found_kind"])
    already = a_new_place(bc, fn, queue["record_kind"])
    so_far = a_new_place(bc, fn, queue["count_kind"])
    # ⛔ NAMED AFTER A PLACE OF THIS CALL'S OWN: a road closes a tray twice in one function
    empty = "nothing was collected at %d" % holding
    draw = "draw it, busy spot or not, at %d" % holding

    def op(name, **operands):
        return written(template(bc, name), **operands)

    # each refusal says which one it was, and each lands on the same emptying as before
    def _why(word, goes_to):
        from standalone import onoff
        if not onoff.on("traypath"):
            return [], goes_to
        mine = "%s at %d" % (word, holding)
        # ⛔ `even_when_quiet`, BECAUSE `sayonce.SAYING` IS FALSE and these must speak
        said = board.said(bc, fn, "traypath", lambda: sayonce.emit_word_always(
            bc, fn, word, even_when_quiet=True))
        return [mine + ":", op("Label")] + said + [(op("JAlways"), goes_to)], mine

    no_list, at_no_list = _why(NO_LIST, empty)
    nowhere, at_nowhere = _why(NOWHERE, empty)
    nothing_in_it, at_nothing = _why(NOTHING_IN_IT, empty)
    return [
        op("GetGlobal", **{"dst": holding, "global": have[ENTRIES]}),
        (op("JNull", reg=holding), at_no_list),
        op("GetGlobal", **{"dst": at, "global": have[WHERE]}),
        (op("JNull", reg=at), at_nowhere),
        op("Field", dst=how_many, obj=holding, field=counted),
        op("Int", dst=none, ptr=number(bc, 0)),
        (op("JEq", a=how_many, b=none), at_nothing),
        # IS A WIDGET ALREADY RUNNING AT THIS SPOT? decides whether to carry its count forward
        op("Null", dst=already),
        op("Call1", dst=key, fun=queue["key"], arg0=at),
        (op("JNull", reg=key), draw),
        op("GetGlobal", **{"dst": on, "global": queue["on"]}),
        (op("JNull", reg=on), draw),
        op("Field", dst=among, obj=on, field=queue["in"]),
        (op("JNull", reg=among), draw),
        op("Call2", dst=found, fun=gv(function_named(bc, LOOK_UP).findex),
           arg0=among, arg1=key),
        (op("JNull", reg=found), draw),
        written(queue["record"], dst=already, src=found),
        draw + ":", op("Label"),
    # the draw word is behind the quiet vocabulary: once per draw, and nothing reads it
    ] + sayonce.emit_word_always(bc, fn, DREW) + [
        op("Call3", dst=drawn, fun=made["draw"], arg0=shown_to, arg1=holding, arg2=at),
        # THE SPOT WAS BUSY: carry the display's count forward here, past the call that reads it
        (op("JNull", reg=already), empty),
        written(queue["reads"], dst=so_far, obj=already, field=queue["count"]),
        written(queue["adds"], dst=so_far, a=so_far, b=how_many),
        written(queue["writes"], obj=already, field=queue["count"], src=so_far),
    ] + no_list + nowhere + nothing_in_it + [
        empty + ":", op("Label"),
        op("Null", dst=holding),
        op("SetGlobal", **{"global": have[ENTRIES], "src": holding}),
        op("Null", dst=at),
        op("SetGlobal", **{"global": have[WHERE], "src": at}),
        op("Null", dst=forgotten),
        op("SetGlobal", **{"global": have[ALREADY], "src": forgotten}),
    ]


def emit_at_a_new_world(bc, fn, into, forgotten):
    """NOT A STAGE. A world begins with no tray open and nothing recorded as being in one."""
    return (emit_empty(bc, fn, slots(bc)[ENTRIES], into)
            + emit_empty(bc, fn, slots(bc)[ALREADY], forgotten))


def install(bc):
    """Make the three places and resolve the recipe. NOTHING IS EMITTED."""
    made = make_slots(bc)
    return ("TRAY: the game's own loot draw resolves -- entry kind t@%s with `%s` at %d and `%s` "
            "at %d, coordinates at %s, and three places of our own. Nothing is spliced"
            % (made["entry"], AMOUNT_ON, made["amount"], RESOURCE_ON, made["resource"],
               " and ".join(str(a) for a in made["across"])))
