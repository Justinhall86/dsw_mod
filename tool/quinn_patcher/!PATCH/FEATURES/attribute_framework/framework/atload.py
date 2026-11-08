#!/usr/bin/env python3
"""Every authored row's columns, read whole at load on all three routes (`_rules.py target3`)."""
from tools.project import gv, guard
from tools.hlcode import (SLOTS_ON, argument_kind, assemble, call_sites, class_global,
                          field_by_name, function_named,
                          kind_named, number, returns_type, slot_global, template, text_object,
                          written)
from tools.splice import insert
from framework import board, mark, boundary, columns, ofthekind, reach, sayonce, tray, traps
from framework.parsed import a_new_place
from framework.oneshot import TELL
from framework.rowreader import reader_for

# the game's own walk over every authored attribute, and the registrar each route hands a row to
SITE = "$HAttributes.bakeAttributes"
REGISTRAR = "$HAttributes.registerAttributeDesc"
# the game's own complaint channel; proven in game to reach `game/bench/game.log`
from framework.sayonce import COMPLAIN


def _naming_the_row(bc, fn, holds):
    """That id, behind the road's own word, so the board alone says whether it is heard."""
    return board.said(bc, fn, "roadnamesits", lambda: sayonce.emit_always(bc, fn, holds))
# the column an authored row names its attribute row in
REF = "ref"
# one list per authored row at the row's own place; inside it a column sits at its number less one
STORED = "SPINE kept this row's columns"
# how many routes that one function runs -- one per authoring place
ROUTES = 3
# how far a route may narrow its row before we stop believing we are still reading that route
DEPTH = 8
# where the block leaves when there is nothing of ours to say
LEAVE = "this row is not one of ours"
# what this splice is called, which is what the splice's own record answers to
SPLICE = "the load-time count"
# in all three authoring routes: the only way the road reaches a column above the low ones


def site(bc):
    """The game's own walk over authored attributes, found by name."""
    return function_named(bc, SITE)


def routes(bc, fn):
    """Every place that function hands a row to the registrar -- one per authoring place."""
    found = call_sites(fn, function_named(bc, REGISTRAR))
    guard(len(found) == ROUTES,
          "%s hands a row to %s %d time(s), and it runs %d routes"
          % (SITE, REGISTRAR, len(found), ROUTES))
    return found


def _writers(fn, reg, after, before):
    # every instruction between two points that leaves something in that register
    return [i for i in range(after + 1, before)
            if fn.ops[i].df.get("dst") is not None and gv(fn.ops[i].df["dst"]) == reg]


def the_row_itself(bc, fn, at, bounded_by):
    """The unnarrowed row and the hook point, walking back no further than `bounded_by`."""
    untyped = reader_for(bc).row_kind
    reg, cursor = gv(fn.ops[at].df["arg1"]), at
    for _ in range(DEPTH):
        # asked ONCE a step: the last thing to leave anything in `reg` before we read it
        wrote = _writers(fn, reg, bounded_by, cursor)
        guard(wrote, "nothing in this route leaves anything in the place the registrar is "
                     "handed, so there is no row here to read")
        made = wrote[-1]
        if gv(list(fn.regs)[reg]) == untyped:
            # the row is live in front of this narrowing, and nothing may write over it between
            guard(made == cursor - 1,
                  "the row is made at %d and read at %d, and something writes it in between"
                  % (made, cursor))
            return reg, cursor
        cursor = made
        guard(fn.ops[cursor].op == "ToVirtual",
              "the row reaches the registrar through a %s, and this follows only a narrowing"
              % fn.ops[cursor].op)
        reg = gv(fn.ops[cursor].df["src"])
    guard(False, "the row is narrowed more than %d times before the registrar" % DEPTH)


def emit_a_new_list(bc, op, made, of_kind, into, size, typed, raw, backing):
    """An empty list of `of_kind`, made the way the game makes its own."""
    return [op("Int", dst=size, ptr=number(bc, 0)),
            op("Type", dst=typed, ty=of_kind),
            op("Call2", dst=raw, fun=made["alloc"], arg0=typed, arg1=size),
            op("UnsafeCast", dst=backing, src=raw),
            op("Call1", dst=into, fun=made["wrap"], arg0=backing)]


def emit_append(bc, op, made, pushing, which, what, the_list, at, counted_by):
    """Append `what` to the list at the named place, making that list when it is absent."""
    from framework import columns as _columns
    there = "the list for %s is there" % which
    return [op("GetGlobal", **{"dst": the_list, "global": _columns.slot(bc, which)}),
            (op("JNotNull", reg=the_list), there)] + emit_a_new_list(
                bc, op, made, kind_named(bc, tray.ARRAY_OF_ENTRIES), the_list,
                at["size"], at["typed"], at["raw"], at["backing"]) + [
            op("SetGlobal", **{"global": _columns.slot(bc, which), "src": the_list}),
            there + ":",
            op("Label"),
            op("Call2", dst=counted_by, fun=gv(pushing.findex), arg0=the_list, arg1=what)]


def emit_carrying(bc, op, made, holding, number_in):
    """A game loot entry carrying `number_in`: the only number a list of pointers can hold."""
    return [op("New", dst=holding),
            op("SetField", obj=holding, field=made["amount"], src=number_in)]


def emit_put_at(bc, op, pushing, the_list, at, what, how_long, nothing, counted, held_in,
                backing, where):
    """Put `what` in `the_list` AT `at`, growing it with gaps; never a push (out of order)."""
    return [where + ":",
            op("Label"),
            op("Field", dst=how_long, obj=the_list, field=counted),
            (op("JSGt", a=how_long, b=at), "past " + where),
            op("Null", dst=nothing),
            op("Call2", dst=how_long, fun=gv(pushing.findex), arg0=the_list, arg1=nothing),
            (op("JAlways"), where),
            "past " + where + ":",
            op("Label"),
            # the place exists now, so this writes over it rather than adding another
            op("Field", dst=backing, obj=the_list, field=held_in),
            op("SetArray", array=backing, index=at, src=what)]


def places(bc, fn, reader, lookup, complain, made):
    """Every place this block needs, each typed from a borrowed signature, none shared."""
    text = argument_kind(bc, boundary.LOOKUP)
    number = returns_type(lookup, boundary.LOOKUP)
    # a kind named as TEXT is found inside the six borrowed functions, where the rarer ones live
    wanted = (("sentinel", text),
              ("boundary", number),
              ("column", reader.text_kind),                # the name of the column we read
              ("tag", reader.text_kind),
              ("value", reader.value_kind),                # what a column gave, before it is text
              ("id", reader.text_kind),
              ("row", number),                             # where THIS row sits
              ("names", "listing_kind"),
              ("holds", "place_kind"),                     # where those names sit inside it
              ("fielddyn", reader.value_kind),
              ("field", reader.text_kind),                 # and that one, as text
              ("thing", reader.value_kind),
              ("idtext", reader.text_kind),                # the id a modder types
              ("textclass", gv(bc.global_types[class_global(bc, reader.text_kind)])),
              ("istext", returns_type(function_named(bc, ofthekind.IS_REALLY), "is it text")),
              ("outer", kind_named(bc, tray.ARRAY_OF_ENTRIES)),
              ("inner", kind_named(bc, tray.ARRAY_OF_ENTRIES)),
              ("size", made["of"]["counted"]),             # how big a new list is made
              ("typed", made["of"]["typed"]),
              ("raw", made["of"]["raw"]),                  # what the making hands back
              ("backing", made["of"]["backing"]),
              ("howlong", "count_kind"),                   # how long a list is right now
              ("wantedat", "count_kind"),
              ("nothing", reader.value_kind),              # what a gap in a list holds
              ("word", reader.text_kind),
              ("reach", "count_kind"),                     # the reach it was written with
              ("reachheld", made["of"]["held"]),
              ("useval", made["of"]["held"]),              # the row's val, as a number
              ("attrnum", made["of"]["held"]),
              ("carrying", made["entry"]),                 # what carries one of those in a list
              ("howmany", "count_kind"),
              ("zero", "count_kind"),                      # none of them, to compare against
              ("discarded", returns_type(complain, COMPLAIN)))
    return {name: (reader.borrow_register(bc, fn, kind) if isinstance(kind, str)
                   else a_new_place(bc, fn, kind))
            for name, kind in wanted}


def keep_what_each_filled_column_names(bc, op, at, walking, reader, goes_to, pushing, counted,
                                       held_in):
    """Put the id a filled column's one field names at the column's number less one."""
    return [op("Call1", dst=at["names"], fun=gv(reader.listing.findex), arg0=walking["value"]),
            (op("JNull", reg=at["names"]), goes_to),
            op("Field", dst=at["howmany"], obj=at["names"], field=reader.length_field),
            op("Int", dst=at["zero"], ptr=reader.zero),
            (op("JEq", a=at["howmany"], b=at["zero"]), goes_to),
            # the one field it names its thing by, taken off the row's own listing
            op("Field", dst=at["holds"], obj=at["names"], field=reader.place_field),
            (op("JNull", reg=at["holds"]), goes_to),
            op("GetArray", dst=at["fielddyn"], array=at["holds"], index=at["zero"]),
            (op("JNull", reg=at["fielddyn"]), goes_to),
            op("SafeCast", dst=at["field"], src=at["fielddyn"]),
            (op("JNull", reg=at["field"]), goes_to),
            # and what sits under it, which IS the id -- nothing is read off it
            op("Call2", dst=at["thing"], fun=gv(reader.reading.findex),
               arg0=walking["value"], arg1=at["field"]),
            # ⛔ a field holding a list (`convertFrom`) names no id, and a checked cast of it raises
            op("GetGlobal", **{"dst": at["textclass"],
                               "global": class_global(bc, reader.text_kind)}),
            op("Call2", dst=at["istext"], fun=gv(function_named(bc, ofthekind.IS_REALLY).findex),
               arg0=at["textclass"], arg1=at["thing"]),
            (op("JFalse", cond=at["istext"]), goes_to),
            op("UnsafeCast", dst=at["idtext"], src=at["thing"]),
            op("Mov", dst=at["wantedat"], src=walking["number"]),
            op("Decr", dst=at["wantedat"])] + emit_put_at(
                bc, op, pushing, at["inner"], at["wantedat"], at["idtext"], at["howlong"],
                at["nothing"], counted, held_in, at["backing"], "making room in this row's list")


def emit(bc, fn, *, row_reg, route=None):
    """Ask which attribute this row names, and say so when the answer is one of ours."""
    reader = reader_for(bc)
    lookup = function_named(bc, boundary.LOOKUP)
    complain = function_named(bc, COMPLAIN)
    minted = boundary.minted(bc)
    guard(minted is not None, "the sentinel is not in this file yet -- the boundary goes first")
    # the game's own way of making a list and adding to one, lifted rather than named by number
    made = tray.recipe(bc)
    pushing = function_named(bc, tray.PUSH)
    counted, _c = field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES), tray.COUNT_ON, "a list")
    held_in, _h = field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES), tray.BACKING_ON,
                                "a list")
    # the id we read off the row is handed to the complaint, so the two must want the same kind
    guard(argument_kind(bc, COMPLAIN) == reader.text_kind,
          "%s does not take the text a modder wrote" % COMPLAIN)

    def op(name, **operands):
        return written(template(bc, name), **operands)

    at = places(bc, fn, reader, lookup, complain, made)
    # the walk keeps its own places, named in the one table that types them
    walking = reader.registers(bc, fn)
    return assemble(
        # where the sentinel sits, asked the one way the boundary is ever asked
        boundary.emit_ask(op, gv(lookup.findex), minted, at["sentinel"], at["boundary"])
        # which attribute this row names, read off the raw row by name
        + [op("GetGlobal", **{"dst": at["column"], "global": text_object(bc, REF)}),
           op("Call2", dst=at["value"], fun=gv(reader.reading.findex),
              arg0=row_reg, arg1=at["column"]),
           op("SafeCast", dst=at["id"], src=at["value"]),
           # a row naming nothing is not ours, and is not a fault either
           (op("JNull", reg=at["id"]), LEAVE),
           op("Call1", dst=at["row"], fun=gv(lookup.findex), arg0=at["id"])]
        # the one comparison the boundary is ever made with
        + boundary.emit_below(op, at["boundary"], at["row"], LEAVE)
        # THIS row's own list, filled by column number; made for pointers, as text lists garble ids
        + emit_a_new_list(bc, op, made, kind_named(bc, tray.ARRAY_OF_ENTRIES), at["inner"],
                          at["size"], at["typed"], at["raw"], at["backing"])
        # the row's own val, which is what tells this use of the attribute from the others
        + [op("GetGlobal", **{"dst": at["column"], "global": text_object(bc, columns.WHICH_USE)}),
           op("Call2", dst=at["value"], fun=gv(reader.reading.findex),
              arg0=row_reg, arg1=at["column"]),
           op("SafeCast", dst=at["useval"], src=at["value"])]
        # AND THE REACH THE MODDER WROTE, read here while the row is still theirs
        + reach.emit_read(bc, fn, op, row_reg, at["reach"], reader)
        + reach.emit_say(bc, fn, op, at["reach"], reader, route=route)
        # AND WHICH ROW THAT WAS, by `at["id"]`: `at["idtext"]` is still empty here
        + _naming_the_row(bc, fn, at["id"])

        # then every column that row FILLS, read off the raw row
        + columns.emit_walk(bc, fn=fn, row_reg=row_reg, regs=walking, reader=reader,
                            body=keep_what_each_filled_column_names(
                                bc, op, at, walking, reader, "NEXT", pushing, counted, held_in))
        # past the last column: the row's own number, then its reach, so a slipped place shows
        + [op("ToSFloat", dst=at["attrnum"], src=at["row"])]
        + emit_carrying(bc, op, made, at["carrying"], at["attrnum"])
        + [op("Call2", dst=at["howlong"], fun=gv(pushing.findex),
              arg0=at["inner"], arg1=at["carrying"])]
        + [op("ToSFloat", dst=at["reachheld"], src=at["reach"])]
        + emit_carrying(bc, op, made, at["carrying"], at["reachheld"])
        + [op("Call2", dst=at["howlong"], fun=gv(pushing.findex),
              arg0=at["inner"], arg1=at["carrying"])]
        # THREE APPENDS, SIDE BY SIDE: the row's attribute, which use of it, and its columns
        + [op("ToSFloat", dst=at["attrnum"], src=at["row"])]
        + emit_carrying(bc, op, made, at["carrying"], at["attrnum"])
        + emit_append(bc, op, made, pushing, columns.WHICH_ATTRIBUTE, at["carrying"],
                      at["outer"], at, at["howlong"])
        + emit_carrying(bc, op, made, at["carrying"], at["useval"])
        + emit_append(bc, op, made, pushing, columns.WHICH_USE_OF_IT, at["carrying"],
                      at["outer"], at, at["howlong"])
        + emit_append(bc, op, made, pushing, columns.KEPT_COLUMNS, at["inner"],
                      at["outer"], at, at["howlong"])
        # AND LEFT WAITING for `framework/alongside.py`, inside the registrar's own push
        + [op("SetGlobal", **{"global": columns.slot(bc, columns.FOR_THE_NEXT_REGISTRATION),
                              "src": at["inner"]}),
           LEAVE + ":", op("Label")])


# ⛔ no word per column name


def install(bc):
    """Write the block into every authoring route, all rows found first, blocks back to front."""
    fn = site(bc)
    found = routes(bc, fn)
    # each route is bounded by the one before it, and the first by the start of the function
    bounds = [-1] + list(found[:-1])
    rows = [the_row_itself(bc, fn, at, bounded_by=bound)
            for at, bound in zip(found, bounds)]
    went_in = 0
    # the registration each route's call hands back -- the thing our columns ride in
    registrations = {hook: gv(fn.ops[hook].df["dst"]) for _reg, hook in rows}
    for row_reg, hook in rows:
        guard(registrations[hook] != row_reg,
              "the registration and the raw row share a place at %d" % hook)
    ordinals = {hook: i + 1 for i, (_reg, hook) in enumerate(rows)}
    for row_reg, hook in sorted(rows, key=lambda pair: pair[1], reverse=True):
        # each route's block has its own name: one name spliced twice is refused
        went_in += insert(bc, fn, hook,
                          emit(bc, fn, row_reg=row_reg,
                               route="%d of %d" % (ordinals[hook], len(rows))),
                          '%s, route %d of %d' % (SPLICE, ordinals[hook], len(rows)),
                          traps.AT_AUTHORED_DATA)
    return ("AT LOAD: %d instruction(s) spliced into %d route(s) of %s, each in front of that "
            "route's own first narrowing -- every authored row of ours says so once per bake"
            % (went_in, len(rows), SITE))
