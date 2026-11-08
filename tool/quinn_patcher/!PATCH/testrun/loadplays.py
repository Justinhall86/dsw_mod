"""A loaded save plays: the tutorial's check answers yes on every load, dropping the saved pause."""
from tools.hlcode import assemble, function_named, template, written
from tools.project import gv, guard
from tools.splice import insert
from standalone import onoff
from framework import traps

NAME = "loadplays"
WHERE = "Game.onSaveLoaded"
ASKS = "Game.isTuto"


def install(bc):
    if not onoff.on(NAME):
        return "loadplays: OFF"
    fn = function_named(bc, WHERE)
    asked = gv(function_named(bc, ASKS).findex)
    at = next((i for i, o in enumerate(fn.ops)
               if o.op == "Call1" and gv(o.df["fun"]) == asked), None)
    guard(at is not None, "%s never asks %s" % (WHERE, ASKS))
    guard(fn.ops[at + 1].op == "JFalse", "%s does not branch on %s" % (WHERE, ASKS))
    answer = gv(fn.ops[at].df["dst"])
    block = assemble([written(template(bc, "Bool"), dst=answer, value=True)])
    insert(bc, fn, at + 1, block, "a loaded save plays", traps.IN_PLAY)
    return "loadplays: %s drops the pause a save carried, for every load" % WHERE
