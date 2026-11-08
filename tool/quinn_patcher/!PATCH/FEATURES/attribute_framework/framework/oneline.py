#!/usr/bin/env python3
"""One reading, one line: pieces joined in the game's own `StringBuf` and said once."""
from tools.project import guard, gv
from tools.hlcode import (argument_kind, function_named, kind_named, returns_type, template,
                          text_object, written)
from framework.parsed import a_new_place
from framework import sayonce

# the game's own way of building one piece of text out of several
THE_BUFFER = "StringBuf"
A_NEW_BUFFER = "$StringBuf.__constructor__"
ADD = "StringBuf.add"
READ_BACK = "StringBuf.toString"
# what a caller says a place holds: text already carries its own kind, a number does not
TEXT, COUNT = "text", "count"


def op_of(bc):
    """The instruction writer, for a caller that has none of its own."""
    def op(what_op, **operands):
        return written(template(bc, what_op), **operands)
    return op


def places(bc, fn):
    """Every register one joined line needs, made once for the whole splice."""
    return {
        "buffer": a_new_place(bc, fn, kind_named(bc, THE_BUFFER)),
        # what `add` takes: one slot, reused by every piece in turn
        "boxed": a_new_place(bc, fn, argument_kind(bc, ADD, 0)),
        # where a piece of OUR OWN wording lands on its way in
        "minted": a_new_place(bc, fn, argument_kind(bc, sayonce.COMPLAIN, 0)),
        "line": a_new_place(bc, fn, argument_kind(bc, sayonce.COMPLAIN, 0)),
        "spare": a_new_place(bc, fn, returns_type(function_named(bc, ADD), ADD)),
        "made": a_new_place(bc, fn, returns_type(function_named(bc, A_NEW_BUFFER), A_NEW_BUFFER)),
        "said": a_new_place(bc, fn, returns_type(function_named(bc, sayonce.COMPLAIN),
                                                 sayonce.COMPLAIN)),
    }


def emit(bc, fn, op, at, pieces, naming=None):
    """Say `pieces` (a `str`, or `(place, TEXT|COUNT)`) as ONE line; ⛔ box a COUNT, never TEXT."""
    from framework import board
    # EVERY line, not only one opening with our mark: `WHICHHOST: ` walked past that reading
    guard(naming is not None or board.current() is not None,
          "a joined line with no word gates nothing: name the reading it belongs to")
    return board.gated(bc, fn, join(bc, fn, op, at, pieces) + [
        op("Call1", dst=at["said"], fun=gv(function_named(bc, sayonce.COMPLAIN).findex),
           arg0=at["line"])], word=naming)


def join(bc, fn, op, at, pieces):
    """The same joining, left in `at["line"]` for a caller that says it somewhere of its own."""
    adding, reading_back = function_named(bc, ADD), function_named(bc, READ_BACK)
    making = function_named(bc, A_NEW_BUFFER)
    # a FRESH buffer per reading -- one kept between them would hand back every line before it
    out = [op("New", dst=at["buffer"]),
           op("Call1", dst=at["made"], fun=gv(making.findex), arg0=at["buffer"])]
    for piece in pieces:
        if isinstance(piece, str):
            out += [op("GetGlobal", **{"dst": at["minted"], "global": text_object(bc, piece)}),
                    op("UnsafeCast", dst=at["boxed"], src=at["minted"])]
        else:
            place, kind = piece
            out += [op("ToDyn" if kind == COUNT else "UnsafeCast", dst=at["boxed"], src=place)]
        out += [op("Call2", dst=at["spare"], fun=gv(adding.findex),
                   arg0=at["buffer"], arg1=at["boxed"])]
    return out + [op("Call1", dst=at["line"], fun=gv(reading_back.findex), arg0=at["buffer"])]
