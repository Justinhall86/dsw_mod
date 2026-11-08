#!/usr/bin/env python3
"""What proves `standalone/traitshownonce.py`. It reads the patched function and changes nothing."""
from standalone import kit, onoff
from standalone.kit import _gv
from standalone.traitshownonce import NAME, NEEDS
from tools.project import guard


def check(bc):
    if not onoff.on(NAME):
        return "off"
    resolved = kit.context(bc)
    fn = resolved["funcs"]["aggregate"]
    joins = _gv(resolved["funcs"]["joins"].findex)
    groups = _gv(resolved["funcs"]["groups"].findex)
    ops = fn.ops

    lookup = next((i for i, o in enumerate(ops)
                   if o.op == "Call2" and _gv(o.df["fun"]) == groups), None)
    guard(lookup is not None, "the grouping lookup is gone from the trait bar's aggregation")
    key = _gv(ops[lookup].df["arg1"])

    # THE CLAIM THAT MATTERS: nothing joins onto the key, so one trait is one key, drawn once
    left = [i for i in range(lookup)
            if ops[i].op == "Call2" and _gv(ops[i].df["fun"]) == joins
            and _gv(ops[i].df["dst"]) == key and _gv(ops[i].df["arg0"]) == key]
    guard(not left,
          "%d join(s) still build the key, so a trait granted twice still shows twice" % len(left))

    # AND THEY WERE REPLACED, NOT REMOVED: two jumps span this stretch and would aim short
    standing = [i for i in range(lookup)
                if ops[i].op == "Mov" and _gv(ops[i].df["dst"]) == key
                and _gv(ops[i].df["src"]) == key]
    guard(len(standing) >= 2,
          "%d instruction(s) stand where the joins were, and two were replaced -- the rest of "
          "the function is reached by counting from here" % len(standing))
    return "the key is the trait's id alone, %d instruction(s) standing in" % len(standing)
