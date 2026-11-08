#!/usr/bin/env python3
"""One place on the filed thing put LAST into the three lists a save writes it from."""
from tools.hlcode import (argument_kind, assemble, field_by_name, function_named, kind_named,
                          number, returns_type, template, text_object, written)
from tools.project import gv, guard
from tools.splice import insert
from framework import traps, tray, widen
from framework.parsed import HELD_BY, a_new_place

# what the place is called on the class and in the save's own list of them
PLACE = "spinePlace"
# the three the game generates per saved class, named OFF the class rather than typed twice
SCHEMA, WRITER, READER = "getSerializeSchema", "doSerialize", "doUnserialize"
# the game's own way in and out for a plain number
ADD_A_NUMBER, GET_A_NUMBER = "hxbit.Serializer.addInt", "hxbit.Serializer.getInt"
# what each block is called once it is in
IN_THE_LIST = "the saved place is described"
IN_THE_WRITER = "the saved place is written"
IN_THE_READER = "the saved place is read back"


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def _generated(what):
    """What the game calls one of the generated pair, which sits on the class's static side."""
    package, cls = HELD_BY.rsplit(".", 1)
    return "%s.$%s.%s" % (package, cls, what)


def the_place(bc):
    """Which numbered place on the filed thing is ours, asked BY NAME and never counted to."""
    return field_by_name(bc, kind_named(bc, HELD_BY), PLACE, HELD_BY)


def _wrote(ops, before, reg, which):
    """The last instruction of that shape, before that point, that filled that register."""
    for one in reversed(ops[:before]):
        if one.op == which and gv(one.df.get("dst")) == reg:
            return one
    return None


def _a_number(bc):
    """The kind a saved number is, taken off the game's own way of putting one in."""
    return argument_kind(bc, ADD_A_NUMBER, 0)


def install(bc):
    """Add the place, then put it last in all three; every place already there stays put."""
    from framework.acts.gain_ttrait_stacks import STACKS_ON
    filed = kind_named(bc, HELD_BY)
    counts = _a_number(bc)
    like = field_by_name(bc, filed, STACKS_ON, HELD_BY)[1]
    guard(like == counts,
          "a saved number and `%s` are different kinds, so one reads wrong" % STACKS_ON)
    went = widen.widen(bc, filed, PLACE, counts, HELD_BY)
    at = the_place(bc)[0]
    described = _into_the_list(bc)
    out, back = _into_the_writer(bc, at), _into_the_reader(bc, at)
    return ("SAVEPLACE: `%s` is place %d on %s (%s), and all three take it LAST -- %d "
            "instruction(s) describe it, %d write it, %d read it back"
            % (PLACE, at, HELD_BY, "added here" if went else "already there",
               described, out, back))


def the_last_pair(bc, fn):
    """Every push the class describes itself with, and the last name-and-kind pair of them."""
    ops = list(fn.ops)
    push = gv(function_named(bc, tray.PUSH).findex)
    pushes = [i for i, o in enumerate(ops) if o.op == "Call2" and gv(o.df["fun"]) == push]
    guard(len(pushes) >= 4 and len(pushes) % 2 == 0,
          "%s pushes %d time(s), not a whole number of name-and-kind pairs" % (SCHEMA,
                                                                              len(pushes)))
    naming, kinding = ops[pushes[-2]], ops[pushes[-1]]
    names = _wrote(ops, pushes[-2], gv(naming.df["arg0"]), "Field")
    kinds = _wrote(ops, pushes[-1], gv(kinding.df["arg0"]), "Field")
    plain = _wrote(ops, pushes[-1], gv(kinding.df["arg1"]), "GetGlobal")
    guard(names is not None and kinds is not None,
          "the last pair pushed does not come off the schema, so the two lists cannot be read")
    guard(plain is not None,
          "the last kind pushed is made rather than named, so it cannot be copied for ours")
    guard(gv(names.df["obj"]) == gv(kinds.df["obj"]),
          "the two lists come off different things, so one of them is not the schema's")
    guard(gv(names.df["field"]) != gv(kinds.df["field"]),
          "the names and the kinds resolved to one place on the schema")
    return dict(push=push, pushes=pushes, naming=naming, kinding=kinding, names=names,
                kinds=kinds, plain=plain, schema=gv(names.df["obj"]))


def _into_the_list(bc):
    """Push our name and our kind onto the two lists the class describes itself with."""
    fn = function_named(bc, "%s.%s" % (HELD_BY, SCHEMA))
    last = the_last_pair(bc, fn)
    push, pushes, schema = last["push"], last["pushes"], last["schema"]
    naming, kinding, names, kinds = (last[k] for k in ("naming", "kinding", "names", "kinds"))
    plain = last["plain"]
    a_list = a_new_place(bc, fn, gv(fn.regs[gv(kinding.df["arg0"])]))
    a_name = a_new_place(bc, fn, gv(fn.regs[gv(naming.df["arg1"])]))
    a_kind = a_new_place(bc, fn, gv(fn.regs[gv(kinding.df["arg1"])]))
    spare = a_new_place(bc, fn, gv(fn.regs[gv(kinding.df["dst"])]))
    block = [
        _op(bc, "Field", dst=a_list, obj=schema, field=gv(names.df["field"])),
        _op(bc, "GetGlobal", **{"dst": a_name, "global": text_object(bc, PLACE)}),
        _op(bc, "Call2", dst=spare, fun=push, arg0=a_list, arg1=a_name),
        _op(bc, "Field", dst=a_list, obj=schema, field=gv(kinds.df["field"])),
        _op(bc, "GetGlobal", **{"dst": a_kind, "global": gv(plain.df["global"])}),
        _op(bc, "Call2", dst=spare, fun=push, arg0=a_list, arg1=a_kind),
    ]
    return insert(bc, fn, pushes[-1] + 1, assemble(block), IN_THE_LIST, traps.AT_A_SAVE)


def emit_stamp(bc, fn, application, place):
    """That filing's place in our line-up, plus one, into the spot a save carries; zero is none."""
    stamp = a_new_place(bc, fn, _a_number(bc))
    return [_op(bc, "Mov", dst=stamp, src=place),
            _op(bc, "Incr", dst=stamp),
            _op(bc, "SetField", obj=application, field=the_place(bc)[0], src=stamp)]


def emit_came_back(bc, fn, application, said, past):
    """Say so when a restored thing arrives still naming the filing it was made at."""
    spot = a_new_place(bc, fn, _a_number(bc))
    one = a_new_place(bc, fn, _a_number(bc))
    return ([_op(bc, "Field", dst=spot, obj=application, field=the_place(bc)[0]),
             _op(bc, "Int", dst=one, ptr=number(bc, 1)),
             (_op(bc, "JSLt", a=spot, b=one), past)]
            + said("names the filing it was made at")
            + [past + ":", _op(bc, "Label")])


def _the_one_way_out(bc, fn, what):
    """Where LAST is, refused unless the function leaves in exactly one place."""
    leaves = [i for i, o in enumerate(fn.ops) if o.op == "Ret"]
    guard(len(leaves) == 1,
          "%s leaves %d time(s), so there is no one place that is last" % (what, len(leaves)))
    guard(gv(fn.regs[1]) == kind_named(bc, HELD_BY),
          "%s is not handed the filed thing where its own kind says it is" % what)
    return leaves[0]


def _into_the_writer(bc, at):
    """Put our number in after every one the game writes, so nothing before it moves."""
    name = _generated(WRITER)
    fn = function_named(bc, name)
    last = _the_one_way_out(bc, fn, name)
    value = a_new_place(bc, fn, _a_number(bc))
    block = [_op(bc, "Field", dst=value, obj=1, field=at),
             _op(bc, "Call2", dst=gv(fn.ops[last].df["ret"]),
                 fun=gv(function_named(bc, ADD_A_NUMBER).findex), arg0=0, arg1=value)]
    return insert(bc, fn, last, assemble(block), IN_THE_WRITER, traps.AT_A_SAVE)


def _into_the_reader(bc, at):
    """Take ours back after every one the game takes, which is the order it went in."""
    name = _generated(READER)
    fn = function_named(bc, name)
    last = _the_one_way_out(bc, fn, name)
    take = function_named(bc, GET_A_NUMBER)
    value = a_new_place(bc, fn, returns_type(take, GET_A_NUMBER))
    block = [_op(bc, "Call1", dst=value, fun=gv(take.findex), arg0=0),
             _op(bc, "SetField", obj=1, field=at, src=value)]
    return insert(bc, fn, last, assemble(block), IN_THE_READER, traps.AT_A_SAVE)
