#!/usr/bin/env python3
"""Work out a restored row's record (a restore files nothing) the first time the road meets it."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import (SLOTS_ON, argument_kind, function_named, kind_named, number,
                          returns_type, slot_global, template, written)
from framework import bake, boundary, saveplace, sayonce, scopematch
from framework.loadguard import emit_empty
from framework.oneshot import ASK, MAKE, MAP, TELL
from framework.parsed import a_new_place

# our own place for the map of holders already swept (a holder outlives its applications)
SLOT = "holders already swept"
SWEPT = "this holder has been swept"
# where the block leaves when this row already knows itself
KNOWN = "this row already carries its own"
# where the saved-place word leaves, whichever way it went
PAST = "a restored row: whether it named its filing"
# ⛔ NO WORD HERE
WORKED_ONE_OUT = "a restored row was worked out"
# written before the work, so a foreign row is never looked at again (the scope file owns it)
LOOKED_AT = scopematch.NOT_OURS


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def yes_or_no(bc):
    """The kind a `Bool` instruction writes, taken from the game's own rather than named."""
    for f in bc.functions:
        for o in f.ops or []:
            if o.op == "Bool":
                return gv(list(f.regs)[gv(o.df["dst"])])
    guard(False, "the file has no `Bool` instruction to take a kind from")


def make_slot(bc):
    """MAKE our own place for the map of holders. Empty until a road first reaches one."""
    return slot_global(bc, SLOT, kind_named(bc, MAP))


def slot(bc):
    """READ that place. Reading never makes."""
    return (getattr(bc, SLOTS_ON, None) or {}).get(SLOT)


def emit_at_a_new_world(bc, fn, into):
    """NOT A STAGE. The map goes when a new state begins, so a second game sweeps again."""
    made = slot(bc)
    guard(made is not None, "there is no place for the swept holders yet -- install goes first")
    return emit_empty(bc, fn, made, into)


def emit_is_the_first_pass(bc, fn, holder):
    """Once per holder per world: is this the road's first walk over it? Raised before the walk."""
    where = slot(bc)
    guard(where is not None, "there is no place for the swept holders yet -- install goes first")
    held = a_new_place(bc, fn, kind_named(bc, MAP))
    asked = a_new_place(bc, fn, returns_type(function_named(bc, ASK), ASK))
    told = a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL))
    first = a_new_place(bc, fn, yes_or_no(bc))
    there, done = "there is a map of swept holders at %d" % held, "swept already at %d" % held
    return ([
        _op(bc, "Bool", dst=first, value=False),
        _op(bc, "GetGlobal", **{"dst": held, "global": where}),
        (_op(bc, "JNotNull", reg=held), there),
        _op(bc, "New", dst=held),
        _op(bc, "Call1", dst=a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE)),
            fun=gv(function_named(bc, MAKE).findex), arg0=held),
        _op(bc, "SetGlobal", **{"global": where, "src": held}),
        there + ":",
        _op(bc, "Label"),
        _op(bc, "Call2", dst=asked, fun=gv(function_named(bc, ASK).findex),
            arg0=held, arg1=holder),
        (_op(bc, "JTrue", cond=asked), done),
        # a SET: the holder is its own value, as the said rows do
        _op(bc, "Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
            arg0=held, arg1=holder, arg2=holder),
        _op(bc, "Bool", dst=first, value=True),
        done + ":",
        _op(bc, "Label"),
    ], first)


def check_what_we_borrow(bc, id_kind):
    """The lookup takes the very text an application keeps its own id in."""
    guard(argument_kind(bc, boundary.LOOKUP) == id_kind,
          "%s does not take the text an application keeps its id in" % boundary.LOOKUP)


def emit(bc, fn, *, application, row_id, scope, scope_map, first_pass, reader):
    """Nothing when the row knows itself (`scope`); otherwise write its record for the next walk."""
    check_what_we_borrow(bc, gv(list(fn.regs)[row_id]))
    lookup = function_named(bc, boundary.LOOKUP)
    nothing = a_new_place(bc, fn, reader.count_kind)
    row = a_new_place(bc, fn, returns_type(lookup, boundary.LOOKUP))
    seen = a_new_place(bc, fn, reader.count_kind)
    boxed = a_new_place(bc, fn, argument_kind(bc, TELL, 1))
    told = a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL))

    return ([
        # ONLY ON THE ROAD'S FIRST WALK OVER THIS HOLDER; later filings go through the bake
        (_op(bc, "JFalse", cond=first_pass), KNOWN),
        _op(bc, "Int", dst=nothing, ptr=number(bc, scopematch.NOTHING_NAMED)),
        (_op(bc, "JNotEq", a=scope, b=nothing), KNOWN),
        # marked as looked at BEFORE the work, so a foreign row is not redone every tick
        _op(bc, "Int", dst=seen, ptr=number(bc, LOOKED_AT)),
        _op(bc, "ToDyn", dst=boxed, src=seen),
        _op(bc, "Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
            arg0=scope_map, arg1=application, arg2=boxed),
        # the id this application keeps, turned into the row it names by the game's own lookup
        _op(bc, "Call1", dst=row, fun=gv(lookup.findex), arg0=row_id),
    ]
        # ⛔ ONE SHARED BAKE FOR EVERY ROAD: written inline it was a whole bake in each routine
        + _calling_the_bake(bc, fn, row_id, row, application, reader)
        + _its_own_row_again(bc, fn, application, row_id, reader.count_kind)
        + [KNOWN + ":", _op(bc, "Label")])


def _calling_the_bake(bc, fn, row_id, row, application, reader):
    """The bake of a restored row: the game's own filing's, which raises nothing of itself."""
    # the road's gate already turned away what is not ours: no second boundary question
    called, _hook = bake.emit_call(bc, fn, row_id, row, application, reader)
    return called


def _like(fn, other, reg):
    """One more place on `fn`, of the very kind `reg` is on the game's own `other`."""
    fn.regs.append(deepcopy(other.regs[reg]))
    fn.nregs.value = len(fn.regs)
    return len(fn.regs) - 1


def _its_own_row_again(bc, fn, application, row_id, count_kind):
    """A RESTORED APPLICATION GETS the entry of the first registration matching id and targets."""
    from framework import alongside, tray, widen
    from framework.atload import REGISTRAR
    from framework.parsed import HELD_BY, READ, hands_back
    from tools.hlcode import field_by_name
    registrar = function_named(bc, REGISTRAR)
    ops = list(registrar.ops)
    # the registrar's own read of its map, found by the function AND the argument it hands on
    lookup = gv(function_named(bc, "haxe.ds.BalancedTree.get").findex)
    asks = next(i for i, o in enumerate(ops)
                if o.op == "Call2" and gv(o.df["fun"]) == lookup and gv(o.df["arg1"]) == 0)
    via = next(o for o in reversed(ops[:asks])
               if o.op == "Field" and gv(o.df["dst"]) == gv(ops[asks].df["arg0"]))
    root = next(o for o in reversed(ops[:asks])
                if o.op == "GetGlobal" and gv(o.df["dst"]) == gv(via.df["obj"]))
    cast = next(o for o in ops[asks:] if o.op == "SafeCast")
    # a registration is what the game's OWN push hands that list, never "the first thing made"
    push = gv(function_named(bc, tray.PUSH).findex)
    pushed = [o for o in ops if o.op == "Call2" and gv(o.df["fun"]) == push
              and gv(o.df["arg0"]) == gv(cast.df["dst"])]
    guard(len(pushed) == 1, "the registrar pushes into its list %d time(s)" % len(pushed))
    kind = kind_named(bc, HELD_BY)
    on_app, holds = widen.on_the_filed_thing(bc)
    registration = widen.the_registration(bc)
    from_at, from_kind = field_by_name(bc, kind, "source", "an application")
    ref_at, ref_kind = field_by_name(bc, registration, "ref", "a registration")
    rid_at, _k = field_by_name(bc, ref_kind, "id", "the rule a registration names")
    listed_kind = gv(registrar.regs[gv(cast.df["dst"])])
    count_at, _k = field_by_name(bc, listed_kind, "length", "the registrations")
    back_at, back_kind = field_by_name(bc, listed_kind, "array", "the registrations")
    text_kind = field_by_name(bc, kind, "kind", "an application")[1]

    def reg(kind_of):
        return a_new_place(bc, fn, kind_of)

    root_r = _like(fn, registrar, gv(root.df["dst"]))
    tree = _like(fn, registrar, gv(via.df["dst"]))
    got = _like(fn, registrar, gv(ops[asks].df["dst"]))
    listed = _like(fn, registrar, gv(cast.df["dst"]))
    one_reg = _like(fn, registrar, gv(pushed[0].df["arg1"]))
    item = _like(fn, registrar, gv(ops[asks].df["dst"]))
    source, carried, found = reg(from_kind), reg(holds), reg(holds)
    ours_map, asked = reg(kind_named(bc, MAP)), reg(hands_back(bc, READ))
    lineup = reg(kind_named(bc, tray.ARRAY_OF_ENTRIES))
    lback, entry = reg(hands_back(bc, READ)), reg(hands_back(bc, READ))
    count, at, one, lcount = (reg(count_kind) for _ in range(4))
    back, ref, theirs = reg(back_kind), reg(ref_kind), reg(text_kind)
    loop, step, done = ("a restored row's registration: %s" % w
                        for w in ("the next", "not this one", "found or not"))

    def said(what):
        return sayonce.emit(bc, fn, "SPINE a restored row: " + what, even_when_quiet=True)

    out = [
        _op(bc, "Field", dst=carried, obj=application, field=on_app),
        (_op(bc, "JNotNull", reg=carried), done),
    ] + said("carries nothing") + saveplace.emit_came_back(bc, fn, application, said, PAST) + [
        _op(bc, "GetGlobal", **{"dst": root_r, "global": gv(root.df["global"])}),
        (_op(bc, "JNull", reg=root_r), done),
        _op(bc, "Field", dst=tree, obj=root_r, field=gv(via.df["field"])),
        (_op(bc, "JNull", reg=tree), done),
        _op(bc, "Field", dst=source, obj=application, field=from_at),
        (_op(bc, "JNull", reg=source), done),
        _op(bc, "Call2", dst=got, fun=gv(ops[asks].df["fun"]), arg0=tree, arg1=source),
        (_op(bc, "JNull", reg=got), done),
    ] + said("the registrar has a list") + [
        _op(bc, "SafeCast", dst=listed, src=got),
        (_op(bc, "JNull", reg=listed), done),
        _op(bc, "GetGlobal", **{"dst": ours_map, "global": alongside.slot(bc, alongside.OURS)}),
        (_op(bc, "JNull", reg=ours_map), done),
        _op(bc, "Call2", dst=asked, fun=gv(function_named(bc, READ).findex),
            arg0=ours_map, arg1=listed),
        (_op(bc, "JNull", reg=asked), done),
    ] + said("our line-up is there") + [
        _op(bc, "UnsafeCast", dst=lineup, src=asked),
        _op(bc, "Field", dst=lcount, obj=lineup, field=alongside.counted(bc)),
        _op(bc, "Field", dst=lback, obj=lineup, field=alongside.backing(bc)),
        _op(bc, "Field", dst=count, obj=listed, field=count_at),
        _op(bc, "Field", dst=back, obj=listed, field=back_at),
        _op(bc, "Int", dst=at, ptr=number(bc, 0)),
        loop + ":", _op(bc, "Label"),
        (_op(bc, "JSGte", a=at, b=count), done),
        _op(bc, "GetArray", dst=item, array=back, index=at),
        (_op(bc, "JNull", reg=item), step),
        _op(bc, "UnsafeCast", dst=one_reg, src=item),
        (_op(bc, "JSGte", a=at, b=lcount), step),
        _op(bc, "GetArray", dst=entry, array=lback, index=at),
        (_op(bc, "JNull", reg=entry), step),
        _op(bc, "UnsafeCast", dst=found, src=entry),
    ] + said("an entry at that place") + [
        _op(bc, "Field", dst=ref, obj=one_reg, field=ref_at),
        (_op(bc, "JNull", reg=ref), step),
        _op(bc, "Field", dst=theirs, obj=ref, field=rid_at),
        (_op(bc, "JNull", reg=theirs), step),
        # ⛔ TEXT AGAINST TEXT BY THE JUMP ITSELF, as `framework/scopematch.py` does; box no side
        (_op(bc, "JNotEq", a=theirs, b=row_id), step),
    ] + said("the same rule")
    for side in ("target", "target2"):
        out += _same_target(bc, fn, application, kind, one_reg, registration, side, step,
                            count_kind) + said("the same %s" % side)
    return out + said("matched") + [
        _op(bc, "SetField", obj=application, field=on_app, src=found),
        (_op(bc, "JAlways"), done),
        step + ":", _op(bc, "Label"),
        _op(bc, "Int", dst=one, ptr=number(bc, 1)),
        _op(bc, "Add", dst=at, a=at, b=one),
        (_op(bc, "JAlways"), loop),
        done + ":", _op(bc, "Label"),
    ]


def _same_target(bc, fn, application, kind, one_reg, registration, side, step, count_kind):
    """Leave for `step` unless registration and application name the same target, case by case."""
    from tools.hlcode import field_by_name
    at_app, target_kind = field_by_name(bc, kind, side, "an application")
    at_reg, _k = field_by_name(bc, registration, side, "a registration")
    a, b = a_new_place(bc, fn, target_kind), a_new_place(bc, fn, target_kind)
    ia, ib = a_new_place(bc, fn, count_kind), a_new_place(bc, fn, count_kind)
    alike = "a restored row's registration: the %s agrees" % side
    both_none = "a restored row's registration: no %s on the application" % side
    out = [_op(bc, "Field", dst=a, obj=application, field=at_app),
           _op(bc, "Field", dst=b, obj=one_reg, field=at_reg),
           (_op(bc, "JNull", reg=a), both_none),
           (_op(bc, "JNull", reg=b), step),
           _op(bc, "EnumIndex", dst=ia, value=a),
           _op(bc, "EnumIndex", dst=ib, value=b),
           (_op(bc, "JNotEq", a=ia, b=ib), step)]
    for c, case in enumerate(bc.types[target_kind].definition.constructs):
        params = list(getattr(case, "params", []) or [])
        if not params:
            continue
        guard(len(params) == 1, "a %s case carries %d values" % (side, len(params)))
        past = "a restored row's registration: the %s is not case %d" % (side, c)
        pa, pb = a_new_place(bc, fn, gv(params[0])), a_new_place(bc, fn, gv(params[0]))
        out += [_op(bc, "Int", dst=ib, ptr=number(bc, c)),
                (_op(bc, "JNotEq", a=ia, b=ib), past),
                _op(bc, "EnumField", dst=pa, value=a, construct=c, field=0),
                _op(bc, "EnumField", dst=pb, value=b, construct=c, field=0),
                (_op(bc, "JNotEq", a=pa, b=pb), step),
                (_op(bc, "JAlways"), alike), past + ":", _op(bc, "Label")]
    return out + [(_op(bc, "JAlways"), alike),
                  both_none + ":", _op(bc, "Label"),
                  (_op(bc, "JNotNull", reg=b), step),
                  alike + ":", _op(bc, "Label")]


def install(bc):
    """Only the place for the swept holders. The road writes everything else."""
    make_slot(bc)
    return "REDERIVE: a place for the holders this road has already swept"
