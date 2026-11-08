#!/usr/bin/env python3
"""The walk that asks a row for its `targetN` columns at run time and numbers each off its name."""
import os
import re

from tools.project import gv, guard
from tools.hlcode import (SLOTS_ON, assemble, calls, kind_named, slot_global, template,
                          text_object, written)
from framework.rowreader import PREFIX, reader_for

# instructions that load a value written into the code -- none of ours may be one
CONSTANTS = ("Int", "Float", "Bool", "String", "Bytes")
# the operands that name a register, so a jump's distance is never mistaken for one
REG_SLOTS = ("dst", "src", "obj", "array", "index", "reg", "a", "b", "arg0", "arg1", "arg2")
# the ONE column an effect's own number picked; the parse keeps the id it names, as typed
NAMED = "named"
PART = "columns.%s" % NAMED
# the column the effect was spelled on, 0 when it was spelled with no target
SPELLED_ON = "effect.column"
GATE_READS = (PART, SPELLED_ON)
# and the same for the columns a marked TRIGGER, a marked SCOPE, a NARROWING, a PARAMETER name
PART_FOR_HOOK = "%s for the trigger" % PART
PART_FOR_SCOPE = "%s for the scope" % PART
PART_FOR_NARROWING = "%s for the narrowing" % PART
PART_FOR_PARAMETER = "%s for the parameter" % PART
PART_FOR_COUNT = "%s for the narrowed count" % PART
PART_FOR_MEMBERS = "%s for the counted members" % PART
# ⛔ THE NARROWINGS', PARAMETER'S AND COUNTS' ARE LISTS: every column they mark, in spelled order
FOUND = ((PART, "text_kind"), (PART_FOR_HOOK, "text_kind"), (PART_FOR_SCOPE, "text_kind"),
         (PART_FOR_NARROWING, "listing_kind"), (PART_FOR_PARAMETER, "listing_kind"),
         (PART_FOR_COUNT, "listing_kind"), (PART_FOR_MEMBERS, "listing_kind"))
# every authored row's columns between load and road: one list per row, at the row's position
KEPT_COLUMNS = "what each authored row's columns name"
# AND WHICH USE OF ONE ATTRIBUTE: the row's `val`, ⛔ compared as a number, never as text
WHICH_USE = "val"
# THREE LISTS, SIDE BY SIDE, ONE ENTRY PER AUTHORED ROW; the bake matches attribute AND use
WHICH_ATTRIBUTE = "which attribute each authored row is a use of"
WHICH_USE_OF_IT = "which use of that attribute each authored row is"
# where a row's columns wait between load and registrar (`framework/alongside.py` empties it)
FOR_THE_NEXT_REGISTRATION = "the columns of the row about to be registered"


# AND THE REACH, named here to avoid an import ring; ⛔ it rides the row's own column list
WHICH_REACH = "what reach each authored row was written with"
# UNDER `columns.`: the cdb's own `scope` column, read off the row like every other
REACH_NAMED = "columns.reach"
# and the game's own enum the reach column compiles to; ⛔ never kept: the road reads the row's
REACH_ENUM = "EScope"

# the places above, in the order the bake reads them
EVERY_LIST = (WHICH_ATTRIBUTE, WHICH_USE_OF_IT, KEPT_COLUMNS)


def make_slots(bc):
    """MAKE all three places, empty until the first authored row fills them."""
    from framework import tray
    made = {name: slot_global(bc, name, kind_named(bc, tray.ARRAY_OF_ENTRIES))
            for name in EVERY_LIST}
    made[FOR_THE_NEXT_REGISTRATION] = slot_global(bc, FOR_THE_NEXT_REGISTRATION,
                                                  kind_named(bc, tray.ARRAY_OF_ENTRIES))
    return made


def slot(bc, which=KEPT_COLUMNS):
    """READ one of those places: the one this file already has. Reading never makes."""
    have = getattr(bc, SLOTS_ON, None) or {}
    guard(which in have, "there is no place for `%s` yet -- install goes first" % which)
    return have[which]


REFUSED_HERE = "SPINE the `%s` road refused a row whose effect names no column it carries"


def saying_the_refusal():
    """Is the per-row column refusal said? `standalone/onoff.py` holds the switch (per row: off)."""
    from standalone import onoff
    return onoff.on("columnrefusal")


def gate_for(road="a"):
    """The column gate, told which road it is on so its refusal can say so."""

    def emit_gate(place):
        """Per row: end the road, and say so, when the column this effect names is not there."""
        past = place.here("the column is there")
        # a row spelled with no target names no column, so none is missing
        zero = place.scratch_like(place.row[SPELLED_ON])
        return [(place.op("JNotNull", reg=place.row[PART]), past),
                place.op("Int", dst=zero, ptr=place.number(0)),
                (place.op("JEq", a=place.row[SPELLED_ON], b=zero), past)] \
            + (place.said("columnrefusal", lambda: place.said_now(REFUSED_HERE % road))
               if saying_the_refusal() else []) \
            + [(place.op("JAlways"), place.refused),
               past + ":", place.op("Label")]
    return emit_gate


def emit_gate(place):
    """The gate with no road named -- kept so anything asking for it directly still works."""
    return gate_for()(place)


def emit_entry(place, listed, at, into, gone):
    """What place `at` of a row's list names, into `into`; nothing there leaves for `gone`."""
    from framework.rowreader import READ_COLUMN
    from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON
    length_at, how_many = place.field_of(ARRAY_OF_ENTRIES, COUNT_ON)
    backing_at, backing = place.field_of(ARRAY_OF_ENTRIES, BACKING_ON)
    got = place.scratch_return(READ_COLUMN)
    return [
        (place.op("JNull", reg=listed), gone),
        place.op("Field", dst=how_many, obj=listed, field=length_at),
        (place.op("JSGte", a=at, b=how_many), gone),
        place.op("Field", dst=backing, obj=listed, field=backing_at),
        place.op("GetArray", dst=got, array=backing, index=at),
        (place.op("JNull", reg=got), gone),
        place.op("UnsafeCast", dst=into, src=got)]


def emit_walk(bc, *, fn, row_reg, regs, reader, body=(), missing=(), saying=()):
    """The walk: `body` per numbered column, else `missing` once; `saying` before each search."""
    r = regs
    guard(reader.word is not None, "the word is not in this file yet -- install the walk first")
    # the RAW row: a converted one answers nothing (`python _rules.py $Reflect.field`)
    guard(gv(list(fn.regs)[row_reg]) == reader.row_kind,
          "register %d holds t@%s, not the raw row a column is read off"
          % (row_reg, gv(list(fn.regs)[row_reg])))

    def op(name, **operands):
        return written(template(bc, name), **operands)

    return ([
        # ask the row for its column names; a row that has none is nothing to walk
        op("Call1", dst=r["names"], fun=gv(reader.listing.findex), arg0=row_reg),
        (op("JNull", reg=r["names"]), "DONE"),
        # the names sit inside that answer, and the answer says how many there are
        op("Field", dst=r["place"], obj=r["names"], field=reader.place_field),
        (op("JNull", reg=r["place"]), "DONE"),
        op("Int", dst=r["index"], ptr=reader.zero),
        "TOP:",
        op("Label"),
        op("Field", dst=r["howmany"], obj=r["names"], field=reader.length_field),
        (op("JSGte", a=r["index"], b=r["howmany"]), "DONE"),
        # the name at this position, and nothing to do with it unless it really is text
        op("GetArray", dst=r["namedyn"], array=r["place"], index=r["index"]),
        (op("JNull", reg=r["namedyn"]), "NEXT"),
        op("SafeCast", dst=r["name"], src=r["namedyn"]),
        (op("JNull", reg=r["name"]), "NEXT"),
        # does the name start with the word? anything else is somebody else's column
        op("GetGlobal", **{"dst": r["word"], "global": reader.word}),
        # ⛔ a global holds NOTHING before the file's own init, and a search with it faults
        (op("JNotNull", reg=r["word"]), "HAVE THE WORD"),
    ] + list(missing) + [
        (op("JAlways"), "DONE"),
        "HAVE THE WORD:",
        op("Label"),
        op("Null", dst=r["nothing"]),
    ] + list(saying) + [
        op("Call3", dst=r["at"], fun=gv(reader.finding.findex),
           arg0=r["name"], arg1=r["word"], arg2=r["nothing"]),
        op("Int", dst=r["zero"], ptr=reader.zero),
        (op("JNotEq", a=r["at"], b=r["zero"]), "NEXT"),
        # what follows the word, taken from where the word itself ends
        op("Field", dst=r["wordlen"], obj=r["word"], field=reader.text_length_field),
        op("Call3", dst=r["rest"], fun=gv(reader.tailing.findex),
           arg0=r["name"], arg1=r["wordlen"], arg2=r["nothing"]),
        # the word on its own means column one; that is what the number starts as
        op("Int", dst=r["number"], ptr=reader.one),
        (op("JNull", reg=r["rest"]), "HAVE"),
        op("Field", dst=r["restlen"], obj=r["rest"], field=reader.text_length_field),
        (op("JEq", a=r["restlen"], b=r["zero"]), "HAVE"),
        # and anything else has to BE a number, or the column is not one of the numbered ones
        op("Call1", dst=r["maybe"], fun=gv(reader.numbering.findex), arg0=r["rest"]),
        (op("JNull", reg=r["maybe"]), "NEXT"),
        op("SafeCast", dst=r["number"], src=r["maybe"]),
        "HAVE:",
        # `target0`, or a minus, names no column at all -- one is the lowest there is
        op("Int", dst=r["lowest"], ptr=reader.one),
        (op("JSLt", a=r["number"], b=r["lowest"]), "NEXT"),
        # read that column off the row, by the name the row itself just gave us
        op("Call2", dst=r["value"], fun=gv(reader.reading.findex),
           arg0=row_reg, arg1=r["name"]),
        (op("JNull", reg=r["value"]), "NEXT"),
    ] + list(body) + [
        "NEXT:",
        op("Incr", dst=r["index"]),
        (op("JAlways"), "TOP"),
        "DONE:",
    ])


def install(bc):
    """Put the one word the walk searches with into the game file, and resolve the reader."""
    word = text_object(bc, PREFIX)
    reader_for(bc)
    make_slots(bc)
    return ("COLUMNS: `%s` minted as global %d, the walk reads the names the ROW gives it, and "
            "%d place(s) of its own hold one entry per authored row" % (PREFIX, word,
                                                                        len(EVERY_LIST)))
