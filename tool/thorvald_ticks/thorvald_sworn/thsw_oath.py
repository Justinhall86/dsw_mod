"""Control-loss immunity: a unit holding the attribute Entity_ControlLossImmune is never 'no control' and never 'taunted'.

Unit.isNoControl reads Uncontrollable (Hidden Backdoor, Elecca-style effects) and Human_InCombat_Uncontrollable; Unit.isTaunted reads
Uncontrollable. Both get a first test: hasAttribute(unit, <Entity_ControlLossImmune row>) -> return false.
The row number is the attribute's position in the cdb (custom attributes are appended after `Invalid`, like Convert_TRes_To_TRes2).
"""
from tools.project import gv, guard
from tools.hlcode import assemble, function_named, argument_kinds, returns_type
from tools.splice import insert

from thsw_util import attribute_index, new_reg, op, int_op, call

NAME = "thorvald_control_immunity"
ATTR = "Entity_ControlLossImmune"
HAS = "ent.Object.hasAttribute"


def install(bc):
    idx = attribute_index(ATTR)
    if idx is None:
        return "%s: SKIPPED (the cdb has no attribute %s)" % (NAME, ATTR)
    has = function_named(bc, HAS)
    kinds = argument_kinds(bc, HAS)                       # attribute row, two optionals
    total = 0
    for name in ("ent.Unit.isNoControl", "ent.Unit.isTaunted"):
        fn = function_named(bc, name)
        row = new_reg(bc, fn, kinds[0])
        nulls = [new_reg(bc, fn, k) for k in kinds[1:]]
        got = new_reg(bc, fn, returns_type(has, HAS))
        block = assemble([int_op(bc, row, idx)] + [op(bc, "Null", dst=n) for n in nulls]
                         + [call(bc, got, gv(has.findex), 0, row, *nulls),
                            (op(bc, "JFalse", cond=got), "carry on"),
                            op(bc, "Bool", dst=got, value=False), op(bc, "Ret", ret=got),
                            "carry on:", op(bc, "Label")])
        total += insert(bc, fn, 0, block, "control immunity in %s" % name, "a splice at something the game does in play")
    return "%s: %d instruction(s); units with %s (row %d) cannot be taken out of the player's control" % (NAME, total, ATTR, idx)
