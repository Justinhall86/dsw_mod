#!/usr/bin/env python3
"""Every game attribute our words add is marked in use, as a row naming it would have marked it."""
from tools.project import gv, guard
from tools.hlcode import (assemble, call_sites, field_by_name, function_named, kind_named,
                          number, returns_type, template, written)
from tools.splice import insert
from framework import boundary, traps
from framework.parsed import a_new_place
from framework.sayonce import emit_always, emit_word_now

# the game's own reload: its cache, then its bake; ours goes after both, before it returns
SITE = "$HAttributes.reload"
CACHE_MADE, BAKED = "$HAttributes.reloadAttribCache", "$HAttributes.bakeAttributes"
# one attribute's cache entry, and the mark that lets a read look past the identity
CACHE = "$HAttributes.getCache"
IN_USE = "isUsed"
MARKED = "SPINE marked in use"
NO_ENTRY = "SPINE no cache entry to mark"
# the attributes, one table walked by one loop: a word adds an entry, never an instruction
TABLE = ("the in-use table", "the in-use table's entries", "the in-use table, built")


def attributes():
    """Every game attribute an act of ours adds, by name: every act holding families, by name."""
    import importlib
    from framework.names import members
    from framework.prodpick import attributes as of
    acts = [importlib.import_module("framework.acts.%s" % one)
            for one in members("framework.acts")]
    return [one for act in acts for one in of(getattr(act, "FAMILIES", ()))]


def install(bc):
    fn = function_named(bc, SITE)
    lookup = boundary.id_lookup(bc)
    cache = function_named(bc, CACHE)
    made = call_sites(fn, function_named(bc, CACHE_MADE))
    baked = call_sites(fn, function_named(bc, BAKED))
    guard(len(made) == 1 and len(baked) == 1,
          "%s calls %s %d time(s) and %s %d" % (SITE, CACHE_MADE, len(made), BAKED, len(baked)))
    ends = [i for i, o in enumerate(fn.ops) if o.op == "Ret"]
    guard(len(ends) == 1 and ends[0] > max(made[0], baked[0]),
          "%s has %d return(s), and ours goes after the cache and the bake" % (SITE, len(ends)))
    entry = returns_type(cache, CACHE)
    at_mark, flag = field_by_name(bc, entry, IN_USE, CACHE)

    def op(name, **operands):
        return written(template(bc, name), **operands)

    text = a_new_place(bc, fn, gv(list(lookup.regs)[0]))
    number = a_new_place(bc, fn, returns_type(lookup, boundary.LOOKUP))
    held = a_new_place(bc, fn, entry)
    yes = a_new_place(bc, fn, flag)
    named = list(dict.fromkeys(attributes()))
    items = _walking(bc, fn, op, text, ",".join(named)) + [
        op("Call1", dst=number, fun=gv(lookup.findex), arg0=text),
        op("Call1", dst=held, fun=gv(cache.findex), arg0=number)] + emit_always(bc, fn, text) + [
        (op("JNull", reg=held), "in use: no entry"),
        op("Bool", dst=yes, value=True),
        op("SetField", obj=held, field=at_mark, src=yes)] + emit_word_now(bc, fn, MARKED) + [
        (op("JAlways"), "in use: next"),
        "in use: no entry:", op("Label")] + emit_word_now(bc, fn, NO_ENTRY) + [
        (op("JAlways"), "in use: next"),
        "in use: done:", op("Label")]
    went_in = insert(bc, fn, ends[0], assemble(items), "our attributes marked in use",
                     traps.AT_AUTHORED_DATA)
    return ("IN USE: %d game attribute(s) marked after `%s`'s bake, %d instruction(s)"
            % (len(named), SITE, went_in))


def _walking(bc, fn, op, text, table):
    """The in-use table built, and each of its entries into `text` in turn; then `done`."""
    from framework import tray, wordtable
    from framework.rowreader import reader_for
    reader = reader_for(bc)
    zero, at, count = (a_new_place(bc, fn, reader.count_kind) for _ in range(3))
    listed = kind_named(bc, tray.ARRAY_OF_ENTRIES)
    the_list = a_new_place(bc, fn, listed)
    counted, _c = field_by_name(bc, listed, tray.COUNT_ON, "a list")
    ready, _map, backing, got = wordtable.emit_ready(bc, fn, reader, table, TABLE, "IN USE",
                                                     zero, listed=True)
    return [op("Int", dst=zero, ptr=number(bc, 0))] + ready + [
        op("GetGlobal", **{"dst": the_list, "global": wordtable._slots(bc, reader, TABLE)[1]}),
        op("Field", dst=count, obj=the_list, field=counted),
        op("Mov", dst=at, src=zero),
        "in use: next:", op("Label"),
        (op("JSGte", a=at, b=count), "in use: done"),
        op("GetArray", dst=got, array=backing, index=at),
        op("SafeCast", dst=text, src=got),
        op("Incr", dst=at)]
