#!/usr/bin/env python3
"""Entity_HasTTraitStacks: a condition whose current value is the entity's stacks of a trait."""
from tools.project import gv
from tools.hlcode import (argument_kind, assemble, field_by_name, function_named, kind_named,
                          number, returns_type, text_object)
from tools.splice import insert
from framework import board, traps
from framework.parsed import a_new_place
from standalone import cdbwalk, onoff

NAME = "traitstacks"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ()

# the condition's id, as a modder types it in a quest's or an objective's `ref`
WORD = "Entity_HasTTraitStacks"
# where every numeric condition is valued; the comparison and VAL are applied by its callers
VALUED = "$HCondition.getConditionCurrentVal"
# the same three the game's own Entity_HasTTrait uses, and the stack total beside its yes/no
TRAITS, TRAIT_OF, TOTAL = ("ent.Object.get_traits", "$HData.getTTrait",
                           "logic.TraitsManager.getTraitTotalStacksCount")
# the field `get_traits` reads without a null check, read first and skipped on empty
OBJECT, HELD = "ent.Object", "_traits"
WHAT = "Entity_HasTTraitStacks is valued as the entity's stacks of its trait"


def emit(bc, fn):
    """At the top: our id answers the stack total, or 0 with no entity, traits or trait."""
    op = cdbwalk.op_of(bc)
    name, target, entity = 0, 1, 3
    traits_fn, trait_fn, total_fn = (function_named(bc, n) for n in (TRAITS, TRAIT_OF, TOTAL))
    held_at, held_kind = field_by_name(bc, kind_named(bc, OBJECT), HELD, "an entity")
    r = {k: a_new_place(bc, fn, kind) for k, kind in (
        ("word", returns_type(trait_fn, TRAIT_OF)), ("trait", returns_type(trait_fn, TRAIT_OF)),
        ("held", held_kind), ("traits", returns_type(traits_fn, TRAITS)),
        ("n", board.a_number(bc)), ("value", returns_type(fn, VALUED)))}
    # the total's four filters, all left empty as Entity_HasTTrait leaves them
    empty = [a_new_place(bc, fn, argument_kind(bc, TOTAL, i)) for i in (1, 2, 3, 4)]
    return assemble([
        op("GetGlobal", **{"dst": r["word"], "global": text_object(bc, WORD)}),
        (op("JNotEq", a=name, b=r["word"]), "other"),
        op("Int", dst=r["n"], ptr=number(bc, 0)),
        (op("JNull", reg=entity), "answer"),
        op("Field", dst=r["held"], obj=entity, field=held_at),
        (op("JNull", reg=r["held"]), "answer"),
        op("Call1", dst=r["traits"], fun=gv(traits_fn.findex), arg0=entity),
        (op("JNull", reg=r["traits"]), "answer"),
        op("Call1", dst=r["trait"], fun=gv(trait_fn.findex), arg0=target),
        (op("JNull", reg=r["trait"]), "answer")]
        + [op("Null", dst=e) for e in empty]
        + [op("CallN", dst=r["n"], fun=gv(total_fn.findex), args=[r["traits"], r["trait"]] + empty),
           "answer:", op("Label"),
           op("ToSFloat", dst=r["value"], src=r["n"]),
           op("Ret", ret=r["value"]),
           "other:", op("Label")])


def install(bc):
    if not onoff.on(NAME):
        return "traitstacks: OFF"
    fn = function_named(bc, VALUED)
    went = insert(bc, fn, 0, emit(bc, fn), WHAT, traps.IN_PLAY)
    return "traitstacks: %d instruction(s) value %s by the entity's trait stacks" % (went, WORD)
