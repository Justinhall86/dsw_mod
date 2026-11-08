#!/usr/bin/env python3
"""Is this thing of that kind? Asked of the game first: a checked cast raises, so cast after."""
from tools.project import gv
from tools.hlcode import (argument_kind, class_global, function_named, returns_type, template,
                          written)

# ⛔ the EXACT-class question, which `ent.Entity.get_owner` asks; it dereferences what it is handed
IS_REALLY = "hl.BaseType.check"
# the question to ask about a SUPERCLASS, `static (Dyn, Dyn) -> Bool`
IS_ONE_OF = "$Std.isOfType"


def emit(bc, fn, op, thing, into, of_kind, goes_to):
    """Put `thing` in `into` as `of_kind` (a kind, not its name), or leave for `goes_to`."""
    from framework.parsed import a_new_place
    asks = function_named(bc, IS_REALLY)
    # ⛔ the class object comes out of its global; a `Type` instruction writes a type, not a class
    its_class = a_new_place(bc, fn, gv(bc.global_types[class_global(bc, of_kind)]))
    answer = a_new_place(bc, fn, returns_type(asks, IS_REALLY))
    return [(op("JNull", reg=thing), goes_to),
            op("GetGlobal", **{"dst": its_class, "global": class_global(bc, of_kind)}),
            op("Call2", dst=answer, fun=gv(asks.findex), arg0=its_class, arg1=thing),
            (op("JFalse", cond=answer), goes_to),
            op("UnsafeCast", dst=into, src=thing)]


def emit_or_below(bc, fn, op, thing, into, of_kind, goes_to):
    """That kind OR A KIND UNDER IT; ⚠ value first, class second, each cast into its place."""
    from framework.parsed import a_new_place
    asks = function_named(bc, IS_ONE_OF)
    its_class = a_new_place(bc, fn, gv(bc.global_types[class_global(bc, of_kind)]))
    asked_about = a_new_place(bc, fn, argument_kind(bc, IS_ONE_OF, 0))
    against = a_new_place(bc, fn, argument_kind(bc, IS_ONE_OF, 1))
    answer = a_new_place(bc, fn, returns_type(asks, IS_ONE_OF))
    return [(op("JNull", reg=thing), goes_to),
            op("GetGlobal", **{"dst": its_class, "global": class_global(bc, of_kind)}),
            op("UnsafeCast", dst=asked_about, src=thing),
            op("UnsafeCast", dst=against, src=its_class),
            op("Call2", dst=answer, fun=gv(asks.findex), arg0=asked_about, arg1=against),
            (op("JFalse", cond=answer), goes_to),
            op("UnsafeCast", dst=into, src=thing)]


def op_of(bc):
    """The writer, for a caller with no `op` of its own to hand over."""
    return lambda name, **operands: written(template(bc, name), **operands)
