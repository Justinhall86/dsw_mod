#!/usr/bin/env python3
"""The interface error overlay, hidden; `standalone/kit.py` carries its helpers."""
from standalone import kit, onoff
from standalone.kit import Anchors, C, _flat_fields, _guard, _gv, _nops, _sv, _tfields  # noqa: F401

NAME = "hideerrors"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ()

# the targets this change needs resolved, by name; `kit.every_need()` merges them
NEEDS = {
    'refreshErrors': 'Style.refreshErrors',
}


def install(game):
    # off means the base already carries it; see `standalone/onoff.py`
    if not onoff.on(NAME):
        return "hideerrors: OFF -- the base this build starts from already carries it"
    return "hideerrors: " + str(apply_hide_errors(game, kit.context(game)))


# ---------- CHANGE 3: hide domkit CSS error overlay ----------
def apply_hide_errors(game, resolved):
    patched = resolved["funcs"]["refreshErrors"]
    code = patched.ops
    # one instruction: the function's first becomes its return, so the overlay is never drawn
    at = Anchors(patched, resolved["global_text"], "the error overlay")
    AT_START = at.first("GetThis")
    ret = next(op for op in code if op.op == "Ret")
    code[AT_START] = C(ret)
    return "css-error-overlay (hidden)"
