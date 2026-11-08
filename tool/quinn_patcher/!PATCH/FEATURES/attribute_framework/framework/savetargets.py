#!/usr/bin/env python3
"""A row's own columns and reach, saved after the game's places and read back onto the row."""
from tools.hlcode import (argument_kind, assemble, enum_case, field_by_name, fields_of,
                          function_named, kind_named, name_of_kind, number, returns_type,
                          template, text_object, written)
from tools.project import gv, guard
from tools.splice import insert
from framework import board, sayonce, tray, traps, widen
from framework.boundary import LOOKUP
from framework.parsed import HELD_BY, a_new_place
from framework.saveplace import (ADD_A_NUMBER, GET_A_NUMBER, READER, SCHEMA, WRITER, _generated,
                             _the_one_way_out, the_last_pair)
from framework.storewalk import NAMED_BY

# what the two saved places are called in the save's own description of a row
COLUMNS, REACH = "spineColumns", "spineReach"
# the game's own way in and out for a text
ADD_TEXT, GET_TEXT = "hxbit.Serializer.addString", "hxbit.Serializer.getString"
# what a saved place is described as, and the case that describes a list of them
DESCRIBED_AS, A_LIST_OF = "hxbit.PropTypeDesc", "PArray"
# the place a text keeps its characters in, which is what a text global holds
CHARACTERS = "bytes"
# the two entries `framework/atload.py` puts past a row's columns: its place in the sheet, its reach
PAST_THE_COLUMNS = 2
# the reading that says which way each saved or restored row went
READING = "savedrow"
WROTE = "SPINE a row's own columns went into the save"
TOO_SHORT = "SPINE a row's list was too short to save"
TOOK = "SPINE a restored row took its own saved columns"
OLDER = "SPINE a restored row came from an older save, so it is matched as before"
NOTHING = "SPINE a restored row had nothing of ours saved"
# what each block is called once it is in
IN_THE_LIST = "a row's columns are described"
IN_THE_WRITER = "a row's columns are written"
IN_THE_READER = "a row's columns are read back"


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def _said(bc, fn, word):
    """That word behind the reading's own gate."""
    return board.said(bc, fn, READING, lambda: sayonce.emit(bc, fn, word, even_when_quiet=True))


def _text_held(bc, glob, text_kind):
    """The text one of the game's own globals holds, or nothing when it holds none."""
    names, _fields = fields_of(bc, text_kind, "a text")
    guard(CHARACTERS in names, "a text keeps no `%s`, only %s" % (CHARACTERS, names))
    at = names.index(CHARACTERS)
    for c in bc.constants:
        if gv(c._global) == glob and len(c.fields) > at:
            return bc.strings.value[gv(c.fields[at])]
    return None


def _last_writer(ops, before, reg):
    """The last instruction before that point that put something in that register."""
    for one in reversed(ops[:before]):
        if one.df.get("dst") is not None and gv(one.df["dst"]) == reg:
            return one
    return None


def _described_as_text(bc, fn, pushes):
    """The game's own description of a text, off the one saved place it keeps as text."""
    ops = list(fn.ops)
    text_kind = argument_kind(bc, ADD_TEXT, 0)
    names, fields = fields_of(bc, kind_named(bc, HELD_BY), HELD_BY)
    texts = {n for n, f in zip(names, fields) if gv(f.type) == text_kind}
    found = []
    for name_at, kind_at in zip(pushes[0::2], pushes[1::2]):
        named = _last_writer(ops, name_at, gv(ops[name_at].df["arg1"]))
        kinded = _last_writer(ops, kind_at, gv(ops[kind_at].df["arg1"]))
        if named is None or kinded is None or {named.op, kinded.op} != {"GetGlobal"}:
            continue
        if _text_held(bc, gv(named.df["global"]), text_kind) in texts:
            found.append(gv(kinded.df["global"]))
    guard(len(found) == 1,
          "%d saved place(s) on %s are text, and exactly one is described from" % (len(found),
                                                                                  HELD_BY))
    return found[0]


def _a_list_of(bc, fn, text_at, into):
    """A description of a list of texts, made the way the game makes its other described kinds."""
    desc = kind_named(bc, DESCRIBED_AS)
    case = enum_case(bc, DESCRIBED_AS, A_LIST_OF)
    params = list(getattr(bc.types[desc].definition.constructs[case], "params", []) or [])
    guard(len(params) == 1, "a list's description carries %d value(s), not one" % len(params))
    held = gv(params[0])
    guard(held == desc or name_of_kind(bc, held) == "Dyn",
          "a list's description holds a %s, not a description" % name_of_kind(bc, held))
    shaped = [o for o in fn.ops if o.op == "MakeEnum" and getattr(o.df["args"], "value", None)]
    guard(shaped, "%s makes no described kind to copy the making from" % SCHEMA)
    # an object goes into a Dyn place bare, as the game's own calls hand one over
    return [written(shaped[0], dst=into, construct=case, args=[text_at])]


def _into_the_list(bc):
    """Our two names and their descriptions, after the game's own pairs and ahead of any other."""
    fn = function_named(bc, "%s.%s" % (HELD_BY, SCHEMA))
    last = the_last_pair(bc, fn)
    naming, kinding, schema, push = last["naming"], last["kinding"], last["schema"], last["push"]
    text = _described_as_text(bc, fn, last["pushes"])
    regs = list(fn.regs)
    a_list = a_new_place(bc, fn, gv(regs[gv(kinding.df["arg0"])]))
    a_name = a_new_place(bc, fn, gv(regs[gv(naming.df["arg1"])]))
    a_text = a_new_place(bc, fn, gv(regs[gv(kinding.df["arg1"])]))
    a_kind = a_new_place(bc, fn, gv(regs[gv(kinding.df["arg1"])]))
    spare = a_new_place(bc, fn, gv(regs[gv(kinding.df["dst"])]))
    names_at, kinds_at = gv(last["names"].df["field"]), gv(last["kinds"].df["field"])

    def pair(name, described):
        return ([_op(bc, "Field", dst=a_list, obj=schema, field=names_at),
                 _op(bc, "GetGlobal", **{"dst": a_name, "global": text_object(bc, name)}),
                 _op(bc, "Call2", dst=spare, fun=push, arg0=a_list, arg1=a_name),
                 _op(bc, "Field", dst=a_list, obj=schema, field=kinds_at)]
                + described
                + [_op(bc, "Call2", dst=spare, fun=push, arg0=a_list, arg1=a_kind)])

    listed = ([_op(bc, "GetGlobal", **{"dst": a_text, "global": text})]
              + _a_list_of(bc, fn, a_text, a_kind))
    # the reach goes LAST and is described as the game's own last place is, a plain number
    counted = [_op(bc, "GetGlobal", **{"dst": a_kind, "global": gv(last["plain"].df["global"])})]
    block = pair(COLUMNS, listed) + pair(REACH, counted)
    return insert(bc, fn, last["pushes"][-1] + 1, assemble(block), IN_THE_LIST, traps.AT_A_SAVE)


def _kinds(bc):
    """Every kind both halves need, each taken off the function or place that uses it."""
    listed = kind_named(bc, tray.ARRAY_OF_ENTRIES)
    back_at, back_kind = field_by_name(bc, listed, tray.BACKING_ON, "a list")
    return dict(count=argument_kind(bc, ADD_A_NUMBER, 0), text=argument_kind(bc, ADD_TEXT, 0),
                listed=listed, counted_at=field_by_name(bc, listed, tray.COUNT_ON, "a list")[0],
                back_at=back_at, back=back_kind, value=argument_kind(bc, tray.PUSH, 0),
                made=tray.recipe(bc), on_it=widen.on_the_filed_thing(bc))


def _into_the_writer(bc):
    """After every place the game writes: the row's column texts as a list, then its reach."""
    fn = function_named(bc, _generated(WRITER))
    at_ret = _the_one_way_out(bc, fn, _generated(WRITER))
    ret = gv(fn.ops[at_ret].df["ret"])
    k = _kinds(bc)
    made, (at, holds) = k["made"], k["on_it"]
    mine = a_new_place(bc, fn, holds)
    n, cols, i, two, r = (a_new_place(bc, fn, k["count"]) for _ in range(5))
    back, got = a_new_place(bc, fn, k["back"]), a_new_place(bc, fn, k["value"])
    one_text = a_new_place(bc, fn, k["text"])
    entry, amount = a_new_place(bc, fn, made["entry"]), a_new_place(bc, fn, made["of"]["held"])
    add_int = gv(function_named(bc, ADD_A_NUMBER).findex)
    add_text = gv(function_named(bc, ADD_TEXT).findex)
    nothing, short, loop = "no row to save", "a row too short to save", "the next column saved"
    done, no_reach, end = "every column saved", "no reach to save", "a row's columns are saved"
    block = [
        _op(bc, "Field", dst=mine, obj=1, field=at),
        (_op(bc, "JNull", reg=mine), nothing),
        _op(bc, "Field", dst=n, obj=mine, field=k["counted_at"]),
        _op(bc, "Int", dst=two, ptr=number(bc, PAST_THE_COLUMNS)),
        (_op(bc, "JSLt", a=n, b=two), short),
        _op(bc, "Sub", dst=cols, a=n, b=two),
        _op(bc, "Mov", dst=i, src=cols),
        _op(bc, "Incr", dst=i),
        _op(bc, "Call2", dst=ret, fun=add_int, arg0=0, arg1=i),
        _op(bc, "Field", dst=back, obj=mine, field=k["back_at"]),
        _op(bc, "Int", dst=i, ptr=number(bc, 0)),
        loop + ":", _op(bc, "Label"),
        (_op(bc, "JSGte", a=i, b=cols), done),
        _op(bc, "GetArray", dst=got, array=back, index=i),
        _op(bc, "UnsafeCast", dst=one_text, src=got),
        _op(bc, "Call2", dst=ret, fun=add_text, arg0=0, arg1=one_text),
        _op(bc, "Incr", dst=i),
        (_op(bc, "JAlways"), loop),
        done + ":", _op(bc, "Label"),
        _op(bc, "Mov", dst=i, src=n),
        _op(bc, "Decr", dst=i),
        _op(bc, "GetArray", dst=got, array=back, index=i),
        _op(bc, "Int", dst=r, ptr=number(bc, 0)),
        (_op(bc, "JNull", reg=got), no_reach),
        _op(bc, "UnsafeCast", dst=entry, src=got),
        _op(bc, "Field", dst=amount, obj=entry, field=made["amount"]),
        _op(bc, "ToInt", dst=r, src=amount),
        no_reach + ":", _op(bc, "Label"),
        # counted from one, so the nothing an older save is filled with reads as nothing saved
        _op(bc, "Incr", dst=r),
        _op(bc, "Call2", dst=ret, fun=add_int, arg0=0, arg1=r),
    ] + _said(bc, fn, WROTE) + [
        (_op(bc, "JAlways"), end),
        short + ":", _op(bc, "Label"),
    ] + _said(bc, fn, TOO_SHORT) + [
        nothing + ":", _op(bc, "Label"),
        _op(bc, "Int", dst=r, ptr=number(bc, 0)),
        _op(bc, "Call2", dst=ret, fun=add_int, arg0=0, arg1=r),
        _op(bc, "Call2", dst=ret, fun=add_int, arg0=0, arg1=r),
        end + ":", _op(bc, "Label"),
    ]
    return insert(bc, fn, at_ret, assemble(block), IN_THE_WRITER, traps.AT_A_SAVE)


def _a_new_list(bc, fn, k, into):
    """An empty list, made the way `framework/atload.py` makes a row's own."""
    of = k["made"]["of"]
    size, typed = a_new_place(bc, fn, of["counted"]), a_new_place(bc, fn, of["typed"])
    raw, backing = a_new_place(bc, fn, of["raw"]), a_new_place(bc, fn, of["backing"])
    return [_op(bc, "Int", dst=size, ptr=number(bc, 0)),
            _op(bc, "Type", dst=typed, ty=k["listed"]),
            _op(bc, "Call2", dst=raw, fun=k["made"]["alloc"], arg0=typed, arg1=size),
            _op(bc, "UnsafeCast", dst=backing, src=raw),
            _op(bc, "Call1", dst=into, fun=k["made"]["wrap"], arg0=backing)]


def _an_entry(bc, fn, k, number_in, into_list, pushed):
    """One entry carrying that number, pushed onto the list, as the load's own are."""
    made = k["made"]
    entry, amount = a_new_place(bc, fn, made["entry"]), a_new_place(bc, fn, made["of"]["held"])
    return [_op(bc, "ToSFloat", dst=amount, src=number_in),
            _op(bc, "New", dst=entry),
            _op(bc, "SetField", obj=entry, field=made["amount"], src=amount),
            _op(bc, "Call2", dst=pushed, fun=gv(function_named(bc, tray.PUSH).findex),
                arg0=into_list, arg1=entry)]


def _into_the_reader(bc):
    """After every place the game reads: the column texts, the reach, and the row's list rebuilt."""
    fn = function_named(bc, _generated(READER))
    k = _kinds(bc)
    at, holds = k["on_it"]
    get_int, get_text = function_named(bc, GET_A_NUMBER), function_named(bc, GET_TEXT)
    lookup = function_named(bc, LOOKUP)
    id_at, id_kind = field_by_name(bc, kind_named(bc, HELD_BY), NAMED_BY, HELD_BY)
    guard(id_kind == argument_kind(bc, LOOKUP, 0),
          "%s does not take the text a row keeps its id in" % LOOKUP)
    mine = a_new_place(bc, fn, holds)
    c, r = (a_new_place(bc, fn, returns_type(get_int, GET_A_NUMBER)) for _ in range(2))
    howmany, i, zero = (a_new_place(bc, fn, k["count"]) for _ in range(3))
    one_text = a_new_place(bc, fn, returns_type(get_text, GET_TEXT))
    pushed = a_new_place(bc, fn, returns_type(function_named(bc, tray.PUSH), tray.PUSH))
    row_id, row = a_new_place(bc, fn, id_kind), a_new_place(bc, fn, returns_type(lookup, LOOKUP))
    loop, reach, unsaved = "the next column read", "the columns are read", "no row was saved"
    older, end = "an older save", "a row's columns are read back"
    block = [
        _op(bc, "Null", dst=mine),
        _op(bc, "Call1", dst=c, fun=gv(get_int.findex), arg0=0),
        _op(bc, "Int", dst=zero, ptr=number(bc, 0)),
        (_op(bc, "JEq", a=c, b=zero), reach),
    ] + _a_new_list(bc, fn, k, mine) + [
        _op(bc, "Mov", dst=howmany, src=c),
        _op(bc, "Decr", dst=howmany),
        _op(bc, "Int", dst=i, ptr=number(bc, 0)),
        loop + ":", _op(bc, "Label"),
        (_op(bc, "JSGte", a=i, b=howmany), reach),
        _op(bc, "Call1", dst=one_text, fun=gv(get_text.findex), arg0=0),
        _op(bc, "Call2", dst=pushed, fun=gv(function_named(bc, tray.PUSH).findex),
            arg0=mine, arg1=one_text),
        _op(bc, "Incr", dst=i),
        (_op(bc, "JAlways"), loop),
        reach + ":", _op(bc, "Label"),
        _op(bc, "Call1", dst=r, fun=gv(get_int.findex), arg0=0),
        (_op(bc, "JEq", a=r, b=zero), unsaved),
        (_op(bc, "JNull", reg=mine), unsaved),
        _op(bc, "Field", dst=row_id, obj=1, field=id_at),
        _op(bc, "Call1", dst=row, fun=gv(lookup.findex), arg0=row_id),
    ] + _an_entry(bc, fn, k, row, mine, pushed) + [
        _op(bc, "Decr", dst=r),
    ] + _an_entry(bc, fn, k, r, mine, pushed) + [
        _op(bc, "SetField", obj=1, field=at, src=mine),
    ] + _said(bc, fn, TOOK) + [
        (_op(bc, "JAlways"), end),
        unsaved + ":", _op(bc, "Label"),
        (_op(bc, "JNotNull", reg=mine), older),
    ] + _said(bc, fn, NOTHING) + [
        (_op(bc, "JAlways"), end),
        older + ":", _op(bc, "Label"),
    ] + _said(bc, fn, OLDER) + [
        end + ":", _op(bc, "Label"),
    ]
    at_ret = _the_one_way_out(bc, fn, _generated(READER))
    return insert(bc, fn, at_ret, assemble(block), IN_THE_READER, traps.AT_A_SAVE)


def _the_last_written_is_a_number(bc):
    """The game's last saved place goes in as a number, so its description is a number's."""
    fn = function_named(bc, _generated(WRITER))
    before = fn.ops[_the_one_way_out(bc, fn, _generated(WRITER)) - 1]
    guard(before.op == "Call2"
          and gv(before.df["fun"]) == gv(function_named(bc, ADD_A_NUMBER).findex),
          "the game's last saved place is not put in as a number, so the reach's description "
          "cannot be copied off it")


def install(bc):
    """Describe, write and read back a row's columns, all three ahead of the saved place."""
    _the_last_written_is_a_number(bc)
    described = _into_the_list(bc)
    out, back = _into_the_writer(bc), _into_the_reader(bc)
    return ("SAVETARGETS: `%s` and `%s` go after the game's own places on %s -- %d instruction(s) "
            "describe them, %d write them, %d read them back and hand the row its list"
            % (COLUMNS, REACH, HELD_BY, described, out, back))
