#!/usr/bin/env python3
"""
`props.cannotRemove`.

    absent or false -> vanilla: the right-click removes, for the usual cost, and the
                       "right-click to remove" line is shown in the tooltip
    true            -> the right-click does nothing AND the tooltip line is gone

Replacing is untouched throughout: it runs through the other handler, which this never enters.

===================== WHY STAGE G WAS WITHDRAWN ==========================================
Stage G tried to give `canUnequip` a default of TRUE, which needs the field's PRESENCE tested
before its value -- a scalar read cannot tell absent from false. It used `$Reflect.hasField`
f@21299. The emitted ops were exactly as designed (verified in the built file), and in game
**nothing could be removed at all** -- i.e. the presence test answered TRUE for a name that was
not there. Inferred from behaviour, not proven from the file:

    ⚠ `$Reflect.hasField` is NOT usable as a presence test on a cdb row's `props`.
    ⚠ Therefore a cdb flag whose default is TRUE is still an UNSOLVED problem. Default false.

This stage needs neither, because false is the default again -- an absent field read into a Bool
yields false, which is the vanilla answer. That is the shape `alwaysCosts` has always used.
"""
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from armoury_lib import _guard, by_name, str_ref, op, PROPS_FIELD    # noqa: E402
from armoury_charge import splice                                        # noqa: E402
from crashlink import disasm                                     # noqa: E402
from crashlink.core import VarInt, Reg, strRef, fIndex           # noqa: E402
from copy import deepcopy                                        # noqa: E402

FIELD = "cannotRemove"
MAPGET = "haxe.ds.StringMap.get"
REMOVE = "logic.faction.Equipments.removeEquipment"
APPLY = "logic.faction.Equipments.apply"
CANREMOVE = "logic.faction.Equipments.canRemoveEquipment"
EQUIPV = "Virtual[aiWeights, desc, gfx, id, index, name, props, traits]"


def _lookup_template(bc, mapget):
    """The six ops of `$Data.equipment.byId.get(id)`, cloned from wherever the game does it."""
    found = []
    for f in bc.functions:
        for i, o in enumerate(f.ops):
            if o.op != "GetGlobal" or i + 5 >= len(f.ops):
                continue
            nxt = f.ops[i + 1]
            if nxt.op != "Field" or f.ops[i + 5].op != "Call2":
                continue
            if getattr(f.ops[i + 5].df.get("fun"), "value", None) != mapget.findex.value:
                continue
            if disasm.type_name(bc, f.regs[o.df["dst"].value].resolve(bc)) != "$Data":
                continue
            m = re.search(r'"([^"]+)"', disasm.fmt_op_compact(bc, f.regs, nxt, i + 1, func=f))
            if m and m.group(1) == "equipment":
                found.append((f, i))
    _guard(found, "no $Data.equipment lookup anywhere to clone")
    sigs = {tuple(None if f.ops[i + k].df.get("field") is None else f.ops[i + k].df["field"].value
                  for k in range(6)) for f, i in found}
    _guard(len(sigs) == 1, "the $Data.equipment lookups disagree on field indices: %s" % sigs)
    f, i = found[0]
    return [deepcopy(f.ops[i + k]) for k in range(6)], f


def _regsrc(bc):
    want = {"Dyn": None, "String": None, "Bool": None, "$Data": None,
            "cdb.IndexId": None, "haxe.ds.StringMap": None}
    for f in bc.functions:
        for r in f.regs:
            t = disasm.type_name(bc, r.resolve(bc))
            if t in want and want[t] is None:
                want[t] = r
        if all(want.values()):
            break
    _guard(all(want.values()), "missing a register template: %s"
           % [k for k, v in want.items() if v is None])
    return want


def _idfield(bc, fn):
    hits = []
    for i, o in enumerate(fn.ops):
        if o.op != "Field" or disasm.type_name(bc, fn.regs[o.df["obj"].value].resolve(bc)) != EQUIPV:
            continue
        m = re.search(r'"([^"]+)"', disasm.fmt_op_compact(bc, fn.regs, o, i, func=fn))
        if m and m.group(1) == "id":
            hits.append(o)
    _guard(hits, "no `Field <equipment row>.id` in f@%d" % fn.findex.value)
    _guard(len({h.df["field"].value for h in hits}) == 1, "the id field index is ambiguous")
    return hits[0]


def _block(bc, fn, tpl, want, dgsrc, R_EQV, C, K, cont, skip, load_eqv=None):
    """id -> row -> props -> cannotRemove. `cont` = keep vanilla, `skip` = the flag is set."""
    base = len(fn.regs)
    # THE ID REGISTER'S TYPE COMES FROM THE GAME'S OWN READ, NOT FROM A NAME SEARCH.
    # `_regsrc` picks the first register whose type NAME is "String" -- and this file has more than
    # one type that renders as `String`. It picked t@12158 while `<equipment row>.id` is declared
    # t@13, so the read AND the `StringMap.get` it feeds were both type errors: two per patched
    # function, found the moment this line got a type check. **A name is not a handle**
    # -- the same rule that governs resolving functions, applied to types.
    _idreg = deepcopy(fn.regs[_idfield(bc, fn).df["dst"].value])
    for r in (_idreg, want["$Data"], want["cdb.IndexId"], want["haxe.ds.StringMap"],
              want["Dyn"], want["Dyn"], want["Bool"]):
        fn.regs.append(deepcopy(r))
    G_ID, G_DAT, G_IDX, G_MAP, G_ROW, G_PROPS, G_NO = range(base, base + 7)
    fn.nregs = VarInt(len(fn.regs))
    t = [deepcopy(o) for o in tpl]
    t[0].df["dst"] = Reg(G_DAT)
    t[1].df["dst"] = Reg(G_IDX); t[1].df["obj"] = Reg(G_DAT)
    t[2].df["reg"] = Reg(G_IDX)
    t[3].df["dst"] = Reg(G_MAP); t[3].df["obj"] = Reg(G_IDX)
    t[4].df["reg"] = Reg(G_MAP)
    t[5].df["dst"] = Reg(G_ROW); t[5].df["arg0"] = Reg(G_MAP); t[5].df["arg1"] = Reg(G_ID)

    def dynget(dst, obj, s):
        o = deepcopy(dgsrc)
        o.df["dst"] = Reg(dst); o.df["obj"] = Reg(obj); o.df["field"] = strRef(str_ref(bc, s))
        return o

    idop = deepcopy(_idfield(bc, fn)); idop.df["dst"] = Reg(G_ID); idop.df["obj"] = Reg(R_EQV)
    head = ([load_eqv] if load_eqv is not None else []) + [op("NullCheck", reg=Reg(R_EQV)), idop]
    blk = head + t + [
        op("JNull", reg=Reg(G_ROW), offset=None),
        dynget(G_PROPS, G_ROW, PROPS_FIELD),
        op("JNull", reg=Reg(G_PROPS), offset=None),
        dynget(G_NO, G_PROPS, FIELD),
        op("JTrue", cond=Reg(G_NO), offset=None),
    ]
    _guard(len(blk) == K, "block is %d ops, expected %d" % (len(blk), K))
    n = len(head)
    blk[n + 6].df["offset"] = VarInt(cont - (C + n + 6 + 1))     # no row   -> vanilla
    blk[n + 8].df["offset"] = VarInt(cont - (C + n + 8 + 1))     # no props -> vanilla
    blk[n + 10].df["offset"] = VarInt(skip - (C + n + 10 + 1))   # FLAGGED  -> skip
    return blk, (G_ROW, G_PROPS, G_NO), n



def _no_dead_branches(block, C, label):
    """A conditional jump whose target IS its own fall-through decides nothing. It passes every
    'does it land in the right place' assertion and silently takes one arm always -- which is
    exactly how Stage H's first build blocked every equipment in the game."""
    cond = ("JTrue", "JFalse", "JNull", "JNotNull", "JEq", "JNotEq", "JSGte", "JSLt",
            "JULt", "JNotGte", "JSGt", "JSLte")
    for k, o in enumerate(block):
        if o.op in cond and o.df.get("offset") is not None:
            _guard(o.df["offset"].value != 0,
                   "%s: the %s at block op%d jumps to its own fall-through -- it decides nothing"
                   % (label, o.op, k))

def apply_w30h(bc, verbose=True):
    rem = by_name(bc, REMOVE)
    app = by_name(bc, APPLY)
    canrem = by_name(bc, CANREMOVE)
    mapget = by_name(bc, MAPGET)
    tpl, _ = _lookup_template(bc, mapget)
    want = _regsrc(bc)
    dgsrc = next(o for f in bc.functions for o in f.ops if o.op == "DynGet")

    # ---------------- H1: the right-click handler does nothing --------------------------------
    cands = [f for f in bc.functions
             if rem.findex.value in {getattr(o.df.get("fun"), "value", None) for o in f.ops}
             and app.findex.value not in {getattr(o.df.get("fun"), "value", None) for o in f.ops}
             and any(o.op == "EnumField" for o in f.ops)]
    _guard(len(cands) == 1, "expected ONE handler that removes without applying, found %d" % len(cands))
    h1 = cands[0]
    N1 = len(h1.ops)
    ev = [o for o in h1.ops if o.op == "EnumField"
          and disasm.type_name(bc, h1.regs[o.df["dst"].value].resolve(bc)) == EQUIPV]
    _guard(ev, "no EnumField producing the equipment row in the right-click handler")
    rets = [o for o in h1.ops if o.op == "Ret"
            and disasm.type_name(bc, h1.regs[o.df["ret"].value].resolve(bc)) == "Void"]
    _guard(rets, "no `Ret <Void>` to copy the early-out from")
    base = len(h1.regs)
    h1.regs.append(deepcopy(h1.regs[ev[0].df["dst"].value]))
    h1.nregs = VarInt(len(h1.regs))
    R_EQV = base
    load = deepcopy(ev[0]); load.df["dst"] = Reg(R_EQV)
    C1, K1 = 1, 15
    blk, _r, _n = _block(bc, h1, tpl, want, dgsrc, R_EQV, C1, K1 - 1,
                         cont=C1 + K1, skip=C1 + K1 - 1, load_eqv=load)
    # THE BUG THIS REPLACES: the last test used to be `JTrue -> the Ret` with the Ret sitting
    # immediately after it, so BOTH outcomes reached the Ret and every equipment was blocked.
    # A conditional jump whose target IS its own fall-through decides nothing. Invert it: the
    # flag being FALSE jumps over the Ret to the vanilla body; only a true falls into it.
    blk[-1] = op("JFalse", cond=Reg(_r[2]),
                 offset=VarInt((C1 + K1) - (C1 + K1 - 2 + 1)))
    blk.append(deepcopy(rets[0]))                         # flagged -> return, doing nothing
    _guard(len(blk) == K1, "H1 block is %d ops, expected %d" % (len(blk), K1))
    _no_dead_branches(blk, C1, "W30H1")
    n1, p1 = splice(h1, C1, blk, "W30H1 cannotRemove (right-click)")
    _guard(n1 == K1 and len(h1.ops) == N1 + K1, "H1 op count is wrong")
    _guard(h1.ops[C1 + K1 - 1].op == "Ret", "H1: the blocked path does not return")
    jf = h1.ops[C1 + K1 - 2]
    _guard(jf.op == "JFalse" and (C1 + K1 - 2) + 1 + jf.df["offset"].value == C1 + K1,
           "H1: an UNflagged row must jump over the return into the vanilla body")
    _guard(all(getattr(o.df.get("fun"), "value", None) != app.findex.value for o in h1.ops),
           "H1: wrong handler -- this one applies something")

    # ---------------- H2: the tooltip line disappears -----------------------------------------
    tips = [f for f in bc.functions
            if any(o.op == "Call4" and getattr(o.df.get("fun"), "value", None) == canrem.findex.value
                   for o in f.ops)
            and any(o.op == "EnumField"
                    and disasm.type_name(bc, f.regs[o.df["dst"].value].resolve(bc)) == EQUIPV
                    for o in f.ops)
            and app.findex.value not in {getattr(o.df.get("fun"), "value", None) for o in f.ops}
            and rem.findex.value not in {getattr(o.df.get("fun"), "value", None) for o in f.ops}]
    # More than one place asks canRemoveEquipment -- the tooltip AND the button's enable
    # predicate. Narrow by what we actually want to suppress: the block the gate skips must
    # be the one that reads the `tip_remove` text.
    picked = []
    for f in tips:
        cr = [i for i, o in enumerate(f.ops)
              if o.op == "Call4" and getattr(o.df.get("fun"), "value", None) == canrem.findex.value]
        if len(cr) != 1:
            continue
        g = cr[0] + 1
        if f.ops[g].op != "JFalse" or f.ops[g].df["cond"].value != f.ops[cr[0]].df["dst"].value:
            continue
        past = g + 1 + f.ops[g].df["offset"].value
        if not (g < past <= len(f.ops)):
            continue
        for i in range(g + 1, past):
            o = f.ops[i]
            if o.op != "Field":
                continue
            m = re.search(r'"([^"]+)"', disasm.fmt_op_compact(bc, f.regs, o, i, func=f))
            if m and m.group(1) == "tip_remove":
                picked.append((f, cr[0], g, past))
                break
    _guard(len(picked) == 1,
           "expected ONE gate whose skipped block reads `tip_remove`, found %d of the %d "
           "candidates %s" % (len(picked), len(tips), [t.findex.value for t in tips]))
    h2, _crc, gate, PAST = picked[0]
    N2 = len(h2.ops)
    C2 = gate + 1                                              # in front of the remove line
    eq2 = [o for o in h2.ops if o.op == "EnumField"
           and disasm.type_name(bc, h2.regs[o.df["dst"].value].resolve(bc)) == EQUIPV]
    _guard(eq2, "no equipment row register in the tooltip")
    R_EQV2 = eq2[0].df["dst"].value
    K2 = 13
    blk2, _r2, _n2 = _block(bc, h2, tpl, want, dgsrc, R_EQV2, C2, K2,
                            cont=C2 + K2, skip=PAST + K2)
    _no_dead_branches(blk2, C2, "W30H2")
    n2, p2 = splice(h2, C2, blk2, "W30H2 cannotRemove (tooltip line)")
    _guard(n2 == K2 and len(h2.ops) == N2 + K2, "H2 op count is wrong")
    _guard(C2 + 12 + 1 + h2.ops[C2 + 12].df["offset"].value == PAST + K2,
           "H2: the flagged escape does not land where the vanilla gate lands")
    _guard(h2.ops[gate].op == "JFalse" and gate + 1 + h2.ops[gate].df["offset"].value == PAST + K2,
           "H2: the vanilla gate no longer lands past the remove line")

    if verbose:
        print("W30H1: %d ops at op%d of f@%d (now %d), preds %s"
              % (K1, C1, h1.findex.value, len(h1.ops), p1))
        print("W30H2: %d ops at op%d of f@%d (now %d), the line is skipped to op%d, preds %s"
              % (K2, C2, h2.findex.value, len(h2.ops), PAST + K2, p2))
        print("       %r -- absent or false is vanilla; no presence test, no true default" % FIELD)
    return h1, h2
