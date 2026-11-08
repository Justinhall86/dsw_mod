#!/usr/bin/env python3
"""A generic `spawnStructure` for a custom siege action, owned by the besieger on `spawnOwned`."""
from standalone import kit, onoff
from standalone.kit import C, _flat_fields, _guard, _gv, _nops, _sv, _tfields  # noqa: F401
from armoury_lib import str_ref

NAME = "siegespawn"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ()

# the targets this change needs resolved, by name; `kit.every_need()` merges them
NEEDS = {
    'occupActionEffects': 'SiegeComponent.occupationActionEffects',
    'setBesieging': 'SiegeComponent.set_besiegingFaction',
    'structCreate': 'ent.$Structure.create (',
}
OWNED = "spawnOwned"


def install(game):
    # off means the base already carries it; see `standalone/onoff.py`
    if not onoff.on(NAME):
        return "siegespawn: OFF -- the base this build starts from already carries it"
    return "siegespawn: " + str(apply_siege_spawn(game, kit.context(game)))


def _reads(game, regs, o, name):
    if o.op != "Field": return False
    fields = _tfields(game, regs[_gv(o.df["obj"])])
    k = _gv(o.df["field"])
    return k < len(fields) and fields[k][0] == name


def _spots(game, code, regs, create_fx):
    S = game.strings.value
    # locate the InstallHub spawn block: the JEq after the "InstallHub" compare jumps to it
    SS = None
    for i, instr in enumerate(code):
        if instr.op in ("String", "OString") and _gv((instr.df or {}).get("ptr")) is not None:
            try: text = S[_gv(instr.df["ptr"])]
            except Exception: text = None
            if text == "InstallHub":
                for j in range(i, i + 8):
                    if code[j].op == "JEq":
                        SS = j + 1 + _gv(code[j].df["offset"])
                        break
                break
    _guard(SS is not None, "locate InstallHub spawn block")
    def reads(o, name): return _reads(game, regs, o, name)
    def dst_is(reg): return lambda o: _gv((o.df or {}).get("dst")) == reg
    def seek(span, test, what):
        k = next((k for k in span if test(code[k])), None)
        _guard(k is not None, what)
        return k
    DEF = seek(range(SS - 1, -1, -1), lambda o: o.op == "JAlways", "switch default JAlways")
    FLD = seek(range(SS, len(code)), lambda o: reads(o, "spawnStructure"), "results.spawnStructure")
    JN = seek(range(FLD + 1, len(code)), lambda o: o.op == "JNull", "JNull(spawnStructure)")
    NEW = seek(range(JN + 1, len(code)),
               lambda o: o.op == "Call4" and _gv(o.df["fun"]) == create_fx, "Structure.create")
    OWN = seek(range(NEW - 1, JN, -1), dst_is(_gv(code[NEW].df["arg3"])), "Null(owner)")
    RES = seek(range(NEW - 1, JN, -1), dst_is(_gv(code[NEW].df["arg0"])), "create's name read")
    END = seek(range(NEW + 1, len(code)), lambda o: o.op == "CallMethod", "register CallMethod")
    JN2 = seek(range(END - 1, NEW, -1), lambda o: o.op == "JNull", "JNull(register callback)")
    _guard(_gv(code[JN].df["reg"]) == _gv(code[FLD].df["dst"]), "JNull tests spawnStructure")
    _guard(code[OWN].op == "Null", "Null(owner)")
    _guard(reads(code[RES], "spawnStructure"), "create is handed spawnStructure")
    _guard(JN2 + 1 + _gv(code[JN2].df["offset"]) == END + 1, "JNull skips the register call")
    _guard(regs[_gv(code[RES].df["obj"])] == regs[_gv(code[FLD].df["obj"])], "one results type")
    return SS, DEF, FLD, JN, OWN, NEW, JN2, END, _gv(code[RES].df["obj"])


# ---- CHANGE 8 (DRAFT): InstallHub's spawn ops, cloned onto the switch's DEFAULT branch ----
def apply_siege_spawn(game, resolved):
    patched = resolved["funcs"]["occupActionEffects"]
    code = patched.ops
    set_besieging = resolved["funcs"]["setBesieging"]
    regs = [_gv(r) for r in patched.regs]
    create_fx = _gv(resolved["funcs"]["structCreate"].findex)
    spots = _spots(game, code, regs, create_fx)
    A_SS, A_DEF, A_FLD, A_JN, A_OWN, A_NEW, A_JN2, A_END, R_RES = spots
    DEF_TGT = A_DEF + 1 + _gv(code[A_DEF].df["offset"])
    R_RESULTS = _gv(code[A_FLD].df["obj"])
    BES_IDX = next(_gv(instr.df["field"]) for instr in set_besieging.ops if instr.op == "SetThis")
    T_OWNER = regs[_gv(code[A_NEW].df["arg3"])]
    T_BOOL = next(i for i, t in enumerate(game.types) if _gv(getattr(t, "kind", None)) == 7)

    t_field = code[A_FLD]
    TPL_NULL = code[A_OWN]
    t_dynget = next(o for f in game.functions for o in (f.ops or []) if o.op == "DynGet")
    TPL_GET_THIS = next(instr for instr in code if instr.op == "GetThis")
    TPL_JUMP = resolved["template"]("JAlways")
    t_jfalse = resolved["template"]("JFalse")

    def rr(type_index):
        r = C(patched.regs[_gv(code[A_NEW].df["arg3"])])
        if hasattr(r, "value"): r.value = type_index
        patched.regs.append(r)
        return len(patched.regs) - 1
    R_owned = rr(T_BOOL)
    R_own = rr(T_OWNER)
    try: patched.nregs.value = len(patched.regs)
    except Exception: pass

    block = []
    pending = []
    labels = {}
    def E(op): block.append(op); return len(block) - 1
    def L(expected): labels[expected] = len(block)
    def J(op, field, expected): i = E(op); pending.append((i, field, expected)); return i
    def FLD(dst, obj, fld):
        instr = C(t_field)
        _sv(instr, "dst", dst)
        _sv(instr, "obj", obj)
        _sv(instr, "field", fld)
        return instr

    for k in range(A_SS, A_END + 1):
        if k == A_JN:
            J(C(code[A_JN]), "offset", "END")                     # spawnStructure null -> done
        elif k == A_OWN:
            # owner = the besieger when the row's results say `spawnOwned`, else nobody
            E(_sv(_sv(_sv(C(t_dynget), "dst", R_owned), "obj", R_RESULTS), "field",
                  str_ref(game, OWNED)))
            J(_sv(C(t_jfalse), "cond", R_owned), "offset", "OWNNULL")
            J(C(TPL_JUMP), "offset", "OWNBES")
            L("OWNNULL")
            E(_sv(C(TPL_NULL), "dst", R_own))
            J(C(TPL_JUMP), "offset", "OWNDONE")
            # besieger read this-relative (GetThis), NOT Field on reg1, the results holder
            L("OWNBES")
            E(_sv(_sv(C(TPL_GET_THIS), "dst", R_own), "field", BES_IDX))
            L("OWNDONE")
        elif k == A_NEW:
            instr = C(code[A_NEW])
            _sv(instr, "arg3", R_own)
            E(instr)       # create with our owner
        elif k == A_JN2:
            J(C(code[A_JN2]), "offset", "END")                    # skip register-callback -> done
        else:
            E(C(code[k]))
    L("END")
    term = J(C(TPL_JUMP), "offset", "__DEF__")

    for (i, field, expected) in pending:
        if expected == "__DEF__": continue
        _sv(block[i], field, labels[expected] - (i + 1))
    base = len(code)
    _sv(block[term], "offset", DEF_TGT - (base + term + 1))
    code.extend(block)
    patched.debuginfo.value.extend([patched.debuginfo.value[A_SS]] * len(block))
    _nops(patched)
    code[A_DEF] = _sv(C(TPL_JUMP), "offset", base - (A_DEF + 1))  # switch default -> ours
    return "siege-spawn (generic spawnStructure, owner via `%s`)" % OWNED
