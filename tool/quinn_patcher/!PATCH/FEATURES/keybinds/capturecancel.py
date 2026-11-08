#!/usr/bin/env python3
"""The same key cancels a capture, by calling the game's own `tryRightClick`."""
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from armoury_lib import _guard, by_name, op                          # noqa: E402
from armoury_charge import splice                                        # noqa: E402
import abilitykeys                                                   # noqa: E402
from crashlink import disasm                                     # noqa: E402
from crashlink.core import VarInt, Reg, fIndex                    # noqa: E402
from copy import deepcopy                                        # noqa: E402

# on the village panel: per frame by `bindUpdate`, holding the indicator in its `capture` field
HOST = "ui.hud.StructureVillage"
HOST_INIT = "ui.hud.StructureVillage.init"
IND = "ui.hud.StructureCaptureIndicator"
IND_INIT = "ui.hud.StructureCaptureIndicator.init"
IND_CTOR = "ui.hud.$StructureCaptureIndicator.__constructor__"
BINDERS = ("ui.comp.BaseElement.bindUpdate", "ui.comp.BaseElement.bind")
CALLBINDS = "ui.comp.BaseElement.callBinds"
ELEMUPDATE = "ui.comp.BaseElement._update"
RIGHTSETTER = "ui.comp.Element.set_onRightClick"
TRYRIGHT = "ui.comp.Element.tryRightClick"
ISPRESSED = "lib.$Input.isPressed"
GETBINDS = "lib.$Input.getBindings"
MAPGET = "haxe.ds.StringMap.get"


def _fname(bc, f):
    try:
        return disasm.full_func_name_str(bc, f)
    except Exception:
        return "<none>"


def _quoted(bc, f, o, i):
    m = re.search(r'"([^"]+)"', disasm.fmt_op_compact(bc, f.regs, o, i, func=f))
    return m.group(1) if m else None


def _hosts(bc):
    out = []
    for nm in (IND_INIT, IND_CTOR):
        hits = [f for f in bc.functions if _fname(bc, f) == nm]
        if hits:
            out.append((nm, hits[0]))
    _guard(out, "neither %r nor %r exists" % (IND_INIT, IND_CTOR))
    return out


def _closure_before(host, i):
    j = i - 1
    while j >= 0 and host.ops[j].op != "InstanceClosure":
        j -= 1
    return j


def _report(bc, hosts):
    print("  what the capture indicator installs on itself:")
    for nm, host in hosts:
        for i, o in enumerate(host.ops):
            fv = getattr(o.df.get("fun"), "value", None)
            if fv is None or not o.op.startswith("Call"):
                continue
            g = next((x for x in bc.functions if x.findex.value == fv), None)
            gname = _fname(bc, g) if g is not None else "?"
            if re.search(r"(?i)\.(bind|bindUpdate|set_on\w+|set_check\w+|set_get\w+)$", gname):
                j = _closure_before(host, i)
                print("    %-30s op%-4d %-44s handler f@%s"
                      % (nm.split(".")[-1], i, gname,
                         host.ops[j].df["fun"].value if j >= 0 else None))


def apply_w33cap(bc, verbose=True, emit=True):
    """`emit=False`: resolve and publish `W33CAP`, splice nothing; `apply_w37cap` cancels."""
    _guard(abilitykeys.SLOT_GLOBAL is not None,
           "apply_w33 must run first -- this reuses the SAME name it minted")
    global W33CAP
    GSLOT = abilitykeys.SLOT_GLOBAL
    pressed_fn = by_name(bc, ISPRESSED)
    hosts = _hosts(bc)
    if verbose:
        _report(bc, hosts)

    # ---- 1. WHICH FIELD A RIGHT-CLICK HANDLER IS STORED IN, by INDEX, not by rendered name ----
    setter = by_name(bc, RIGHTSETTER)
    stores = [(i, o) for i, o in enumerate(setter.ops) if o.op in ("SetThis", "SetField")]
    _guard(len(stores) == 1,
           "%s writes %d fields, expected exactly one -- cannot tell where the handler is kept"
           % (RIGHTSETTER, len(stores)))
    FIELD = stores[0][1].df["field"].value

    # ---- 2. THE GAME'S OWN ENTRY, PROVEN TO READ THE FIELD by `Field` OR `GetThis` ----------
    tryfn = by_name(bc, TRYRIGHT)
    reads = [(i, o) for i, o in enumerate(tryfn.ops)
             if o.op in ("Field", "GetThis") and o.df["field"].value == FIELD]
    _guard(reads, "%s does not read field %d, the one %s writes -- wrong function"
                  % (TRYRIGHT, FIELD, RIGHTSETTER))
    invoked = [(i, j) for i, o in reads
               for j, p in enumerate(tryfn.ops)
               if j > i and p.op == "CallClosure" and p.df["fun"].value == o.df["dst"].value]
    _guard(invoked, "%s reads field %d but never calls what it read" % (TRYRIGHT, FIELD))

    # its call shape is taken from a REAL vanilla call site, not written from the signature
    csites = [(f, i) for f in bc.functions for i, o in enumerate(f.ops)
              if o.op == "Call1" and getattr(o.df.get("fun"), "value", None) == tryfn.findex.value]
    _guard(csites, "nothing in the game calls %s with one argument" % TRYRIGHT)
    sf, CI = csites[0]
    t_try = deepcopy(sf.ops[CI])
    r_elem = sf.regs[t_try.df["arg0"].value]
    r_ret = sf.regs[t_try.df["dst"].value]
    ELEMT = disasm.type_name(bc, r_elem.resolve(bc))
    _guard(ELEMT == "ui.comp.Element",
           "the vanilla call passes a %s, not a ui.comp.Element" % ELEMT)
    _guard(disasm.type_name(bc, r_ret.resolve(bc)) == "Bool",
           "%s does not return a Bool at the site being cloned" % TRYRIGHT)
    if verbose:
        print("  the handler is kept in field %d; %s reads it back and calls it (read op%d, "
              "call op%d), and vanilla calls it from %s op%d"
              % (FIELD, TRYRIGHT, invoked[0][0], invoked[0][1], _fname(bc, sf), CI))

    # the indicator's own stored handler must be the one that aborts a capture
    found = []
    for nm, host in hosts:
        for i, o in enumerate(host.ops):
            fv = getattr(o.df.get("fun"), "value", None)
            g = next((x for x in bc.functions if x.findex.value == fv), None) if fv else None
            if g is not None and _fname(bc, g).endswith("set_onRightClick"):
                j = _closure_before(host, i)
                _guard(j >= 0, "no InstanceClosure before the right-click setter in %s op%d"
                       % (nm, i))
                found.append(host.ops[j].df["fun"].value)
    _guard(len(found) == 1,
           "expected exactly ONE right-click handler on the capture indicator, found %s" % found)
    rclick = next(f for f in bc.functions if f.findex.value == found[0])
    names = set()
    for o in rclick.ops:
        fv = getattr(o.df.get("fun"), "value", None)
        if fv is None:
            continue
        g = next((x for x in bc.functions if x.findex.value == fv), None)
        if g is None:
            continue
        names.add(_fname(bc, g))
        if len(g.ops) <= 40:
            for x in g.ops:
                fv2 = getattr(x.df.get("fun"), "value", None)
                g2 = next((y for y in bc.functions if y.findex.value == fv2), None) if fv2 else None
                if g2 is not None:
                    names.add(_fname(bc, g2))
    _guard(any(n.endswith("abortCapture") for n in names),
           "the indicator's right-click handler never reaches abortCapture -- wrong road (%s)"
           % sorted(n for n in names if "aptur" in n))

    # ---- 3. THE VILLAGE PANEL'S OWN PER-FRAME CODE ---------------------------------------------
    binders = {}
    for nm in BINDERS:
        hits = [f for f in bc.functions if _fname(bc, f) == nm]
        if hits:
            binders[nm] = hits[0].findex.value
    _guard(binders, "neither %s exists" % (BINDERS,))
    vinit = [f for f in bc.functions if _fname(bc, f) == HOST_INIT]
    _guard(len(vinit) == 1, "expected exactly one %s, found %d" % (HOST_INIT, len(vinit)))
    vinit = vinit[0]
    perframe = []
    for i, o in enumerate(vinit.ops):
        fv = getattr(o.df.get("fun"), "value", None)
        which = next((b for b, v in binders.items() if v == fv), None)
        if o.op.startswith("Call") and which is not None:
            j = _closure_before(vinit, i)
            _guard(j >= 0, "no InstanceClosure before %s in %s op%d" % (which, HOST_INIT, i))
            perframe.append((j, vinit.ops[j].df["fun"].value, which))
    _guard(len(perframe) == 1,
           "%s makes %d per-frame registrations, expected exactly 1" % (HOST_INIT, len(perframe)))
    PIC, fn_fi, WHICH = perframe[0]
    fn = next(f for f in bc.functions if f.findex.value == fn_fi)
    # `bind` runs on a timer and misses edge-triggered presses; only `bindUpdate` runs every frame
    _guard(WHICH.endswith(".bindUpdate"),
           "%s registers its per-frame code with %s, not bindUpdate -- an edge-triggered key "
           "question sampled on a timer misses most presses, which is the defect this move fixes"
           % (HOST_INIT, WHICH))
    if verbose:
        print("  host: %s registers f@%d with bindUpdate (per frame)" % (HOST_INIT, fn_fi))

    ev = [o for o in fn.ops if o.op == "EnumField"
          and disasm.type_name(bc, fn.regs[o.df["dst"].value].resolve(bc)) == HOST]
    self_is_arg = bool(fn.regs) and disasm.type_name(bc, fn.regs[0].resolve(bc)) == HOST
    _guard(ev or self_is_arg, "the panel's per-frame code cannot hand us the panel")
    if ev:
        _guard(len({o.df["field"].value for o in ev}) == 1, "more than one panel in the context")
        t_self = deepcopy(ev[0])
        r_host = fn.regs[ev[0].df["dst"].value]
    else:
        t_self = None
        r_host = fn.regs[0]

    # ---- 3b. THE `capture` FIELD -- taken from the WRITE, because vanilla never reads it -------
    stores = [o for o in vinit.ops if o.op in ("SetThis", "SetField")
              and disasm.type_name(bc, vinit.regs[o.df["src"].value].resolve(bc)) == IND]
    # two stores (null, then fill) are normal: every one must AGREE ON THE FIELD INDEX (§6h)
    _guard(stores, "%s never stores a %s at all" % (HOST_INIT, IND))
    _fields = {o.df["field"].value for o in stores}
    _guard(len(_fields) == 1,
           "%s stores a %s into %d different fields (%s) -- ambiguous, so it refuses"
           % (HOST_INIT, IND, len(_fields), sorted(_fields)))
    CAPF = _fields.pop()
    r_cap = vinit.regs[stores[-1].df["src"].value]
    if verbose:
        print("  the panel keeps the indicator in field %d (taken from the only write to it)"
              % CAPF)

    # ---- 4. the key question and the bindings guard --------------------------------------------
    v_press = None
    for f in bc.functions:
        for i, o in enumerate(f.ops):
            if o.op == "Call1" \
                    and getattr(o.df.get("fun"), "value", None) == pressed_fn.findex.value \
                    and i > 0 and f.ops[i - 1].op == "GetGlobal":
                v_press = (f, i)
                break
        if v_press:
            break
    _guard(v_press is not None, "no vanilla `GetGlobal` + key question to copy")
    vf, vi = v_press
    t_getglob = deepcopy(vf.ops[vi - 1])
    t_press = deepcopy(vf.ops[vi])
    r_str = vf.regs[t_getglob.df["dst"].value]
    r_bool = vf.regs[t_press.df["dst"].value]
    _guard(disasm.type_name(bc, r_str.resolve(bc)) == "String",
           "the key name template is not a String")

    gb = by_name(bc, GETBINDS)
    mapget = by_name(bc, MAPGET)
    _gg = next((i for i, o in enumerate(gb.ops)
                if o.op == "Field" and _quoted(bc, gb, o, i) == "defaultBinds"), None)
    _guard(_gg is not None and gb.ops[_gg - 1].op == "GetGlobal",
           "cannot find the defaultBinds read")
    t_inputglob = deepcopy(gb.ops[_gg - 1])
    t_defbinds = deepcopy(gb.ops[_gg])
    r_inputglob = gb.regs[t_inputglob.df["dst"].value]
    r_map = gb.regs[t_defbinds.df["dst"].value]
    r_dyn = next(r for f in bc.functions for r in f.regs
                 if disasm.type_name(bc, r.resolve(bc)) == "Dyn")

    base = len(fn.regs)
    for r in (r_str, r_bool, r_inputglob, r_map, r_dyn, r_host, r_cap, r_elem, r_ret):
        fn.regs.append(deepcopy(r))
    S_ID, S_OK, S_IGLOB, S_MAP, S_BIND, S_HOST, S_CAP, S_ELEM, S_RET = range(base, base + 9)
    fn.nregs = VarInt(len(fn.regs))
    _guard(disasm.type_name(bc, fn.regs[S_ELEM].resolve(bc)) == ELEMT, "S_ELEM has the wrong type")
    _guard(disasm.type_name(bc, fn.regs[S_HOST].resolve(bc)) == HOST, "S_HOST has the wrong type")
    _guard(disasm.type_name(bc, fn.regs[S_CAP].resolve(bc)) == IND, "S_CAP has the wrong type")

    def clone(t, **kw):
        o = deepcopy(t)
        for kk, v in kw.items():
            o.df[kk] = Reg(v)
        return o

    gslot = deepcopy(t_getglob)
    gslot.df["dst"] = Reg(S_ID)
    gslot.df["global"] = type(t_getglob.df["global"])(GSLOT)

    C = 1
    _guard(len(fn.ops) > C, "the per-frame code is too short to splice into (%d ops)" % len(fn.ops))

    block = [clone(t_self, dst=S_HOST) if t_self is not None
             else op("Mov", dst=Reg(S_HOST), src=Reg(0))]
    block += [
        op("JNull", reg=Reg(S_HOST), offset=None),
        gslot,
        clone(t_inputglob, dst=S_IGLOB),
        clone(t_defbinds, dst=S_MAP, obj=S_IGLOB),
        op("JNull", reg=Reg(S_MAP), offset=None),
        op("Call2", dst=Reg(S_BIND), fun=fIndex(mapget.findex.value),
           arg0=Reg(S_MAP), arg1=Reg(S_ID)),
        op("JNull", reg=Reg(S_BIND), offset=None),
        clone(t_press, dst=S_OK, arg0=S_ID),
        op("JFalse", cond=Reg(S_OK), offset=None),
        # the indicator off the panel, its field operand copied from the game's own write
        op("Field", dst=Reg(S_CAP), obj=Reg(S_HOST), field=deepcopy(stores[-1].df["field"])),
        op("JNull", reg=Reg(S_CAP), offset=None),
        # cast to exactly the type the vanilla call site passes
        op("UnsafeCast", dst=Reg(S_ELEM), src=Reg(S_CAP)),
        clone(t_try, dst=S_RET, arg0=S_ELEM),
    ]
    K = len(block)
    OUT = C + K
    BAILS = [i for i, o in enumerate(block) if o.op in ("JNull", "JFalse")]
    for i in BAILS:
        block[i].df["offset"] = VarInt(OUT - (C + i + 1))
        _guard(block[i].df["offset"].value > 0, "the guard at block op%d is not forward" % i)

    if not emit:
        W33CAP = dict(fn=fn, t_self=t_self, capfield=deepcopy(stores[-1].df["field"]),
                      t_try=deepcopy(t_try), t_press=deepcopy(t_press),
                      t_getglob=deepcopy(t_getglob), r_host=r_host, r_cap=r_cap,
                      r_elem=r_elem, r_ret=r_ret, r_str=r_str, r_bool=r_bool,
                      tryfi=tryfn.findex.value, elemt=ELEMT)
        if verbose:
            print("W33cap: RESOLVED ONLY, nothing emitted -- the named cancel carries it")
        return fn
    n, preds = splice(fn, C, block, "W33 capture cancel")
    _guard(n == K, "block length changed")
    _guard(fn.ops[C + K - 1].op == "Call1", "the cancel call is not the last op of the block")
    _guard(fn.ops[C + K - 1].df["fun"].value == tryfn.findex.value,
           "the last op does not call %s" % TRYRIGHT)
    _guard(fn.ops[C + K - 1].df["arg0"].value == S_ELEM,
           "the cancel call is not passed the indicator")
    for i in BAILS:
        _guard(C + i + 1 + fn.ops[C + i].df["offset"].value == OUT,
               "the guard at block op%d does not land on the vanilla body" % i)
    # a jump to its own fall-through decides nothing yet passes every landing check (§6j)
    for i in BAILS:
        _guard(fn.ops[C + i].df["offset"].value != 0,
               "the guard at block op%d jumps to its own fall-through, so it decides nothing" % i)
    if verbose:
        print("W33cap: %d ops at op%d of f@%d (now %d), preds %s"
              % (K, C, fn.findex.value, len(fn.ops), preds))
        print("     %r from g@%d -> %s on the indicator, the same road the mouse takes; its own "
              "stored handler is f@%d (reaches abortCapture)"
              % (abilitykeys.SLOT_INPUT, GSLOT, TRYRIGHT, rclick.findex.value))
    # published for `keycancel`'s named-bind cancel, which adds its own block beside this one
    W33CAP = dict(fn=fn, t_self=t_self, capfield=deepcopy(stores[-1].df["field"]),
                  t_try=deepcopy(t_try), t_press=deepcopy(t_press),
                  t_getglob=deepcopy(t_getglob), r_host=r_host, r_cap=r_cap,
                  r_elem=r_elem, r_ret=r_ret, r_str=r_str, r_bool=r_bool,
                  tryfi=tryfn.findex.value, elemt=ELEMT)
    return fn


W33CAP = None      # set by apply_w33cap; `keycancel` refuses to run before it
