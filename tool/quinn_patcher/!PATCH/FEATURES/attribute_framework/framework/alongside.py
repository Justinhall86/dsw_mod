#!/usr/bin/env python3
"""A line-up of ours riding beside the game's registrations, so our entry N is its entry N."""
from tools.project import gv, guard
from tools.hlcode import (SLOTS_ON, assemble, call_sites, field_by_name,
                          function_named, kind_named, number, returns_type, slot_global,
                          template, written)
from tools.splice import insert
from framework import columns, traps, tray
from framework.oneshot import MAKE, MAP, TELL
from framework.loadguard import emit_empty
from framework.parsed import READ, a_new_place

# the game's own filtering of a source kind's registrations into one holder's list
FILTERS = "logic.$AttributesManager.getDescriptions"
# AND THE SECOND FILTERING (the building-state route, which copies rows): both walks ridden
REFILTERS = "logic.Upgrades.getAttributes"
# how many walks that function runs -- one per list it builds
REFILTER_PASSES = 2
# our two places, for the game's own list and a FILTERED one, each keyed by that list
OURS = "our columns beside the game's own registrations"
PER_FILTERED = "our columns beside a filtered list"
# what each splice is called, which is what its own record answers to
AT_THE_PUSH = "our line-up grows with the game's"
AT_THE_FILTER = "our line-up is filtered with the game's"
AT_THE_REFILTER = "our line-up is filtered again with the game's, pass %d of %d"
# where the second block leaves when our line-up has nothing at that place
NOTHING_TO_CARRY = "there is nothing of ours at that place"


def make_slots(bc):
    """MAKE both places, each ⛔ a MAP from one of the game's own lists to a line-up of ours."""
    return {OURS: slot_global(bc, OURS, kind_named(bc, MAP)),
            PER_FILTERED: slot_global(bc, PER_FILTERED, kind_named(bc, MAP))}


def slot(bc, which):
    """READ one of those places. Reading never makes."""
    return (getattr(bc, SLOTS_ON, None) or {}).get(which)


def counted(bc):
    """Which place on a list says how long it is, asked by name."""
    return field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES), tray.COUNT_ON, "a list")[0]


def backing(bc):
    """Which place on a list holds the things in it, asked by name."""
    return field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES), tray.BACKING_ON, "a list")[0]


def _a_list(bc, op, made, into, at):
    """An empty list, made the way the game makes its own."""
    return [op("Int", dst=at["size"], ptr=number(bc, 0)),
            op("Type", dst=at["typed"], ty=kind_named(bc, tray.ARRAY_OF_ENTRIES)),
            op("Call2", dst=at["raw"], fun=made["alloc"], arg0=at["typed"], arg1=at["size"]),
            op("UnsafeCast", dst=at["backing"], src=at["raw"]),
            op("Call1", dst=into, fun=made["wrap"], arg0=at["backing"])]


def _places(bc, fn, made):
    """Every place either block needs, in one table, each typed from what fills it."""
    from framework.rowreader import reader_for
    reader = reader_for(bc)
    wanted = (("outer", kind_named(bc, tray.ARRAY_OF_ENTRIES)),
              ("mine", kind_named(bc, tray.ARRAY_OF_ENTRIES)),
              ("theirs", kind_named(bc, tray.ARRAY_OF_ENTRIES)),
              ("backing", made["of"]["backing"]),
              ("raw", made["of"]["raw"]),
              ("typed", made["of"]["typed"]),
              ("size", made["of"]["counted"]),
              ("howlong", reader.count_kind),
              ("at", reader.count_kind),
              ("zero", reader.count_kind),
              ("got", reader.value_kind),
              ("nothing", reader.value_kind),
              ("pushed", returns_type(function_named(bc, tray.PUSH), tray.PUSH)),
              ("themap", kind_named(bc, MAP)),
              ("mapmade", returns_type(function_named(bc, MAKE), MAKE)),
              ("told", returns_type(function_named(bc, TELL), TELL)),
              ("secondmap", kind_named(bc, MAP)),
              ("asked2", returns_type(function_named(bc, READ), READ)),
              ("asked", returns_type(function_named(bc, READ), READ)))
    return {name: a_new_place(bc, fn, kind) for name, kind in wanted}


def _our_line_up_for(bc, op, made, at, theirs, tag, from_map=OURS):
    """Our line-up for one of the game's lists, keyed by that list, from place `from_map`."""
    where = slot(bc, from_map)
    there = "there is a map of line-ups, %s" % tag
    has = "this list has a line-up, %s" % tag
    inhand = "the line-up is in hand, %s" % tag
    return [op("GetGlobal", **{"dst": at["themap"], "global": where}),
            (op("JNotNull", reg=at["themap"]), there),
            op("New", dst=at["themap"]),
            op("Call1", dst=at["mapmade"], fun=gv(function_named(bc, MAKE).findex),
               arg0=at["themap"]),
            op("SetGlobal", **{"global": where, "src": at["themap"]}),
            there + ":",
            op("Label"),
            op("Call2", dst=at["asked"], fun=gv(function_named(bc, READ).findex),
               arg0=at["themap"], arg1=theirs),
            (op("JNotNull", reg=at["asked"]), has),
            ] + _a_list(bc, op, made, at["mine"], at) + [
            op("Call3", dst=at["told"], fun=gv(function_named(bc, TELL).findex),
               arg0=at["themap"], arg1=theirs, arg2=at["mine"]),
            (op("JAlways"), inhand),
            has + ":",
            op("Label"),
            op("UnsafeCast", dst=at["mine"], src=at["asked"]),
            inhand + ":",
            op("Label")]


def emit_at_the_push(bc, fn, *, theirs):
    """In the registrar, ahead of its own push: one entry of ours (maybe nothing) rides along."""
    made = tray.recipe(bc)

    def op(name, **operands):
        return written(template(bc, name), **operands)

    at = _places(bc, fn, made)
    waiting = columns.slot(bc, columns.FOR_THE_NEXT_REGISTRATION)
    return assemble(
        _our_line_up_for(bc, op, made, at, theirs, "pushing") + [
            # what the load left for this row, or nothing -- emptied as it is taken
            op("GetGlobal", **{"dst": at["got"], "global": waiting}),
            op("Null", dst=at["nothing"]),
            op("SetGlobal", **{"global": waiting, "src": at["nothing"]}),
            op("Call2", dst=at["pushed"], fun=gv(function_named(bc, tray.PUSH).findex),
               arg0=at["mine"], arg1=at["got"]),
        ])


def emit_at_the_filter(bc, fn, *, theirs, index, kept_in, from_map=OURS, tag="filtering"):
    """In the game's own filtering, past its push: our entry at the same place rides along."""
    made = tray.recipe(bc)

    def op(name, **operands):
        return written(template(bc, name), **operands)

    at = _places(bc, fn, made)
    where = slot(bc, PER_FILTERED)
    return assemble(
        _our_line_up_for(bc, op, made, at, theirs, tag, from_map=from_map) + [
            op("GetGlobal", **{"dst": at["secondmap"], "global": where}),
            (op("JNotNull", reg=at["secondmap"]), "there is a map of filtered line-ups"),
            op("New", dst=at["secondmap"]),
            op("Call1", dst=at["mapmade"], fun=gv(function_named(bc, MAKE).findex),
               arg0=at["secondmap"]),
            op("SetGlobal", **{"global": where, "src": at["secondmap"]}),
            "there is a map of filtered line-ups:",
            op("Label"),
            # the one that goes with the list the game is building, made on first use
            op("Call2", dst=at["asked2"], fun=gv(function_named(bc, READ).findex),
               arg0=at["secondmap"], arg1=kept_in),
            (op("JNotNull", reg=at["asked2"]), "this filtered list has a line-up"),
        ] + _a_list(bc, op, made, at["theirs"], at) + [
            op("Call3", dst=at["told"], fun=gv(function_named(bc, TELL).findex),
               arg0=at["secondmap"], arg1=kept_in, arg2=at["theirs"]),
            (op("JAlways"), "the filtered line-up is in hand"),
            "this filtered list has a line-up:",
            op("Label"),
            op("UnsafeCast", dst=at["theirs"], src=at["asked2"]),
            "the filtered line-up is in hand:",
            op("Label"),
            # ⛔ THE PLACE IS THE COUNT LESS ONE: the game has already stepped past the element
            op("Mov", dst=at["at"], src=index),
            op("Decr", dst=at["at"]),
            op("Int", dst=at["zero"], ptr=number(bc, 0)),
            (op("JSLt", a=at["at"], b=at["zero"]), NOTHING_TO_CARRY),
            op("Field", dst=at["howlong"], obj=at["mine"], field=counted(bc)),
            (op("JSGte", a=at["at"], b=at["howlong"]), NOTHING_TO_CARRY),
            op("Field", dst=at["backing"], obj=at["mine"], field=backing(bc)),
            op("GetArray", dst=at["got"], array=at["backing"], index=at["at"]),
            (op("JAlways"), "push what we found"),
            NOTHING_TO_CARRY + ":",
            op("Label"),
            op("Null", dst=at["got"]),
            "push what we found:",
            op("Label"),
            op("Call2", dst=at["pushed"], fun=gv(function_named(bc, tray.PUSH).findex),
               arg0=at["theirs"], arg1=at["got"]),
        ])


def emit_at_a_new_world(bc, fn, into):
    """NOT A STAGE. Only the FILTERED line-ups go at a new state, ⛔ never the stored one."""
    return emit_empty(bc, fn, slot(bc, PER_FILTERED), into)


def where_it_is_pushed(bc, fn, made_by=None):
    """The instruction that pushes what this function MADE into a list, found by asking."""
    holds = made_by
    if holds is None:
        made = [i for i, o in enumerate(fn.ops) if o.op == "New"]
        guard(len(made) == 1, "that function makes %d thing(s), and this wants one" % len(made))
        holds = gv(fn.ops[made[0]].df["dst"])
    pushes = [i for i in call_sites(fn, function_named(bc, tray.PUSH))
              if gv(fn.ops[i].df.get("arg1", -1)) == holds]
    guard(len(pushes) == 1,
          "that function pushes what it made %d time(s), and this wants one" % len(pushes))
    return pushes[0], holds


def the_filtering(bc):
    """The game's own filtering, and the three things in hand inside its loop."""
    fn = function_named(bc, FILTERS)
    narrowings = [i for i, o in enumerate(fn.ops) if o.op == "ToVirtual"]
    guard(len(narrowings) == 1,
          "%s narrows %d time(s), and this wants the one" % (FILTERS, len(narrowings)))
    narrowed = gv(fn.ops[narrowings[0]].df["dst"])
    pushed, _what = where_it_is_pushed(bc, fn, made_by=narrowed)
    # ⛔ KEYED ON THE LIST PUSHED INTO, NOT THE THING PUSHED
    kept_in = gv(fn.ops[pushed].df["arg0"])
    reads = [i for i in range(narrowings[0]) if fn.ops[i].op == "GetArray"
             and gv(fn.ops[i].df["dst"]) == gv(fn.ops[narrowings[0]].df["src"])]
    guard(reads, "%s reads no element into the thing it narrows" % FILTERS)
    # the STORED list the element came out of, which is the one our line-up is kept under
    held = gv(fn.ops[reads[-1]].df["array"])
    made_it = [i for i in range(reads[-1]) if fn.ops[i].op == "Field"
               and gv(fn.ops[i].df["dst"]) == held]
    guard(made_it, "%s reads its elements off nothing that names a list" % FILTERS)
    return fn, pushed, gv(fn.ops[reads[-1]].df["index"]), kept_in, gv(fn.ops[made_it[-1]].df["obj"])


def the_passes(bc, fn, name, how_many):
    """Every walk in a function filling a list, as (push, place, list, source), found by shape."""
    out = []
    for at in call_sites(fn, function_named(bc, tray.PUSH)):
        reads = [i for i in range(at) if fn.ops[i].op == "GetArray"]
        guard(reads, "the push at %d in %s follows no walk over a list" % (at, name))
        read = reads[-1]
        backing = gv(fn.ops[read].df["array"])
        named = [i for i in range(read) if fn.ops[i].op == "Field"
                 and gv(fn.ops[i].df["dst"]) == backing]
        guard(named, "the walk at %d in %s reads its elements off nothing that names a list"
                     % (read, name))
        out.append((at, gv(fn.ops[read].df["index"]), gv(fn.ops[at].df["arg0"]),
                    gv(fn.ops[named[-1]].df["obj"])))
    guard(len(out) == how_many,
          "%s fills %d list(s), and it runs %d pass(es)" % (name, len(out), how_many))
    return out


def spliced_names():
    """Every name this feature splices under, with its function; the cases read this table."""
    from framework.atload import REGISTRAR
    return ([(AT_THE_PUSH, REGISTRAR), (AT_THE_FILTER, FILTERS)]
            + [(AT_THE_REFILTER % (which, REFILTER_PASSES), REFILTERS)
               for which in range(1, REFILTER_PASSES + 1)])


def install(bc):
    """Put both halves in: one beside the registrar's push, one beside the filtering's."""
    from framework.atload import REGISTRAR
    make_slots(bc)
    registrar = function_named(bc, REGISTRAR)
    pushed, _holds = where_it_is_pushed(bc, registrar)
    # the source kind is what the registrar is handed first, and it is what our list is per
    theirs = gv(registrar.ops[pushed].df["arg0"])
    one = insert(bc, registrar, pushed, emit_at_the_push(bc, registrar, theirs=theirs),
                 AT_THE_PUSH, traps.AT_AUTHORED_DATA)
    fn, at, index, kept_in, stored = the_filtering(bc)
    two = insert(bc, fn, at + 1,
                 emit_at_the_filter(bc, fn, theirs=stored, index=index, kept_in=kept_in),
                 AT_THE_FILTER, traps.AT_AUTHORED_DATA)
    # and the second filtering's two passes, ⛔ FRONT TO BACK (`splice.where` records never move)
    again = function_named(bc, REFILTERS)
    passes = the_passes(bc, again, REFILTERS, REFILTER_PASSES)
    three = 0
    for which, (pushed_at, place, into, source) in enumerate(passes, start=1):
        # ⛔ FROM THE FILTERED PLACE, where the pass before left its line-up
        three += insert(bc, again, pushed_at + 1 + three,
                        emit_at_the_filter(bc, again, theirs=source, index=place, kept_in=into,
                                           from_map=PER_FILTERED,
                                           tag="refiltering %d" % which),
                        AT_THE_REFILTER % (which, len(passes)), traps.AT_AUTHORED_DATA)
    return ("ALONGSIDE: %d instruction(s) grow our line-up with the registrar's own push, %d "
            "filter it with the game's, and %d ride the %d further pass(es) %s runs, so entry N "
            "of ours belongs to entry N of whatever any of them hands back"
            % (one, two, three, len(passes), REFILTERS))
