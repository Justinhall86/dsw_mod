#!/usr/bin/env python3
"""The interface inspector, turned on; `standalone/kit.py` carries its helpers."""
from standalone import kit, onoff
from standalone.kit import Anchors, C, _flat_fields, _guard, _gv, _nops, _sv, _tfields  # noqa: F401

NAME = "inspector"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ()

# the targets this change needs resolved, by name; `kit.every_need()` merges them
NEEDS = {
    'loadStyle': 'BaseUI.loadStyle',
    'set_allowInspect': 'set_allowInspect',
}


def install(game):
    # off means the base already carries it; see `standalone/onoff.py`
    if not onoff.on(NAME):
        return "inspector: OFF -- the base this build starts from already carries it"
    return "inspector: " + str(apply_inspector(game, kit.context(game)))


# ---------- CHANGE 2: enable domkit CSS/UI inspector ----------
def apply_inspector(game, resolved):
    funcs = resolved["funcs"]
    patched = funcs["loadStyle"]
    code = patched.ops
    _guard(code[-1].op == "Ret", "loadStyle last op Ret")
    setai = funcs["set_allowInspect"]
    style_t = _gv(setai.regs[0])
    bool_t = _gv(setai.regs[1])                          # Bool type index (param 2), per-build
    setai_fx = setai.findex.value

    ret_idx = len(code) - 1
    base = len(code)
    rbool = C(patched.regs[0])
    if hasattr(rbool, "value"): rbool.value = bool_t
    patched.regs.append(rbool)
    R_BOOL = len(patched.regs) - 1
    try: patched.nregs.value = len(patched.regs)
    except Exception: pass

    # described, not counted: the style is read off the interface, whose load is the one cloned
    at = Anchors(patched, resolved["global_text"], "the interface inspector")
    AT_STYLE = next((i for i, o in enumerate(code) if o.op == "Field"
                     and _gv(patched.regs[_gv(o.df["dst"])]) == style_t), None)
    _guard(AT_STYLE is not None, "the interface's style read")
    UI, STYLE = _gv(code[AT_STYLE].df["obj"]), _gv(code[AT_STYLE].df["dst"])
    AT_INTERFACE = at.before("GetGlobal", AT_STYLE, dst=UI)
    TPL_GLOBAL = code[AT_INTERFACE]
    TPL_FIELD = code[AT_STYLE]
    TPL_JUMP_IF_NULL = code[at.first("JNull")]
    TPL_CALL2 = code[at.first("Call2")]
    TPL_RETURN = code[ret_idx]
    TPL_JUMP = resolved["template"]("JAlways")
    TPL_BOOL = resolved["template"]("Bool")

    block = [C(TPL_GLOBAL), C(TPL_FIELD)]                  # the interface's style; if null -> Ret
    block.append(_sv(_sv(C(TPL_JUMP_IF_NULL), "reg", STYLE), "offset", 2))
    block.append(_sv(_sv(C(TPL_BOOL), "dst", R_BOOL), "value", True))
    instr = C(TPL_CALL2)
    _sv(instr, "dst", R_BOOL)
    _sv(instr, "fun", setai_fx)
    _sv(instr, "arg0", STYLE)
    _sv(instr, "arg1", R_BOOL)
    block.append(instr)
    block.append(C(TPL_RETURN))

    code.extend(block)
    patched.debuginfo.value.extend([patched.debuginfo.value[ret_idx]] * len(block))
    _nops(patched)
    code[ret_idx] = _sv(C(TPL_JUMP), "offset", base - (ret_idx + 1))
    return "css-inspector (enabled)"
