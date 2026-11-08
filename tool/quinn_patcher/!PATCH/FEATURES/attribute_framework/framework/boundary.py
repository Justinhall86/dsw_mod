#!/usr/bin/env python3
"""Which `attribute` rows are ours: those below `Invalid`, asked by name while the game runs."""
from crashlink import disasm

from tools.project import gv, guard
from tools.hlcode import function_named, minted_text, text_object

# the row ours are authored below, settled by the user; the boundary is wherever THIS one sits
SENTINEL = "Invalid"
# what this is called on a road, written once for the road and the splice that reads it back
STAGE = "is this row ours"
# the game's own lookup: hand it an id's text, get back the row that id names
LOOKUP = "$HAttributes.getID"
# the lookup has to reach this, because this is what compares text by VALUE
BY_VALUE = "haxe.ds.StringMap.get"
# instructions that load a value written into the code -- none of ours may be one
CONSTANTS = ("Int", "Float", "Bool", "String", "Bytes")


def _called_header(bc, op):
    # the printed name of whatever function this one instruction calls
    target = next((f for f in bc.functions if gv(f.findex) == gv(op.df["fun"])), None)
    return (disasm.func_header(bc, target) or "") if target is not None else ""


def id_lookup(bc):
    """The game's id lookup, found by name and checked to be the one we can actually use."""
    fn = function_named(bc, LOOKUP)
    # it must compare text by value; one comparing by identity could never match text we mint
    reached = [_called_header(bc, o) for o in fn.ops if o.df.get("fun") is not None]
    guard(any(BY_VALUE in h for h in reached),
          "%s never reaches %s, so text we mint could not match" % (LOOKUP, BY_VALUE))
    return fn


def minted(bc):
    # the sentinel THIS game file carries, or nothing when it has not been minted into it yet
    return minted_text(bc, SENTINEL)


def mint_sentinel(bc, verbose=False):
    """The `Invalid` id as a real text object, put into this game file once."""
    return text_object(bc, SENTINEL, verbose)


def emit_ask(op, fun, minted, into_text, into_boundary):
    """Ask the game where the sentinel sits. THE ONE PLACE that question is written."""
    return [op("GetGlobal", **{"dst": into_text, "global": minted}),
            op("Call1", dst=into_boundary, fun=fun, arg0=into_text)]


def emit_below(op, boundary_reg, row_reg, goes_to):
    """Leave unless this row sits BELOW the sentinel. THE ONE PLACE that comparison is written."""
    return [(op("JSGte", a=boundary_reg, b=row_reg), goes_to)]


def open_the_road(place):
    """ONCE, before any row: where the sentinel sits, in registers typed BY THE LOOKUP itself."""
    holds_text = place.scratch_arg(LOOKUP)
    holds_boundary = place.scratch_return(LOOKUP)
    return (emit_ask(place.op, place.named_function(LOOKUP), place.text_object(SENTINEL),
                     holds_text, holds_boundary), holds_boundary)


def emit_gate(place):
    """Per row: end the road for anything not ours, read off `source.row` (the row's own id)."""
    return emit_below(place.op, place.kept, place.row["source.row"], place.refused)


def install(bc):
    """Put the sentinel in the game file, then run the cases over what the emitters write."""
    lookup = id_lookup(bc)
    text = mint_sentinel(bc)
    # the minted text must be the type the lookup takes, or it is torn apart when handed over
    guard(gv(bc.global_types[text]) == gv(list(lookup.regs)[0]),
          "the minted `%s` is not the text type %s takes" % (SENTINEL, LOOKUP))
    return ("BOUNDARY: `%s` minted as global %d, and the boundary is asked for by name while "
            "the game runs" % (SENTINEL, text))
