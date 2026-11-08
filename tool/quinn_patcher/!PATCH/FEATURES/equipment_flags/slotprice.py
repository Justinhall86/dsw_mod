#!/usr/bin/env python3
"""
The fix for the double charge. An empty-slot gate cannot work: the Armoury removes
the old equipment BEFORE applying the new one, so the apply always sees an empty slot.

===================== THE IDEA: DON'T GUESS THE PAST, REMOVE IT ============================
The apply cannot tell a replace from a fresh install because the removal already happened. So
stop the removal from happening -- for FLAGGED equipment only -- and the apply sees the truth.

  F1  in the Armoury's click handler (f@30374): when the equipment being installed carries
      `props.costToEquip`, SKIP the `removeEquipment` call. The apply overwrites the slot
      anyway (it does a plain store), and `apply` calls `refreshEquipments` itself, so the
      removal's only remaining job -- charging the flat replace fee -- moves to F2.
      Unflagged equipment is untouched: vanilla removes, vanilla charges.

  F2  in `implInlineApply` (f@9961): once we know the row is flagged, pick the cost by asking
      the game's own slot-aware pricing routine `getRemoveCost` f@9942:
          slot OCCUPIED -> the old item's removal fee, plus `props.cost`, summed per resource
                           by the game's `$HTools.appendResCosts` (free if the old one is flagged)
          slot EMPTY    -> `getEquipmentCost`, i.e. `props.cost`
      One rule, one charge, no stored state, and the tooltip shows the same sum.

WHY THIS IS NOT THE HEURISTIC I REJECTED: nothing here asks "does this slot look like it was
just emptied". A hole in the list stays ambiguous -- right-clicking an equipment unequips it
(`onRightClick` -> f@30375) and installing into a later slot expands the list over earlier ones,
so holes arise with no replace in sight. Under F1/F2 every one of those cases is priced
correctly, because the slot's true state at apply time is what is read.

MULTIPLAYER: F1 only OMITS a client-side call, so the host never receives the remove request and
both sides agree. The charge stays in `implInlineApply`, beneath the network layer, as before.
"""
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from armoury_lib import _guard, by_name, str_ref, op, FLAG_FIELD, PROPS_FIELD   # noqa: E402
from armoury_charge import splice                                                   # noqa: E402
from crashlink import disasm                                                # noqa: E402
from crashlink.core import VarInt, Reg, strRef, fIndex                      # noqa: E402
from copy import deepcopy                                                   # noqa: E402

APPLY = "logic.faction.Equipments.implInlineApply"
PRICE = "logic.faction.Equipments.getRemoveCost"
COST = "$HUnit.getEquipmentCost"
REMOVE = "logic.faction.Equipments.removeEquipment"


def _fld(bc, fn, name, dsttype, objtype):
    """A `Field` op resolved by FIELD NAME (pitfall 7), guarded to one field index."""
    hits = []
    for i, o in enumerate(fn.ops):
        if o.op != "Field":
            continue
        if disasm.type_name(bc, fn.regs[o.df["obj"].value].resolve(bc)) != objtype:
            continue
        if disasm.type_name(bc, fn.regs[o.df["dst"].value].resolve(bc)) != dsttype:
            continue
        m = re.search(r'"([^"]+)"', disasm.fmt_op_compact(bc, fn.regs, o, i, func=fn))
        if m and m.group(1) == name:
            hits.append(o)
    _guard(hits, "no `Field <%s>.%s` template in f@%d" % (objtype, name, fn.findex.value))
    idxs = {h.df["field"].value for h in hits}
    _guard(len(idxs) == 1, "`Field <%s>.%s` is ambiguous across %d field indices %s"
           % (objtype, name, len(idxs), sorted(idxs)))
    return hits[0]


# ============================ F2: the cost source in the apply =============================
def apply_w30f2(bc, verbose=True):
    fn = by_name(bc, APPLY)
    price = by_name(bc, PRICE)
    costfn = by_name(bc, COST)
    ops = fn.ops
    _guard(len(ops) == 101, "f@%d should have 101 ops after A+B (Stage E must NOT be applied), "
                            "has %d" % (fn.findex.value, len(ops)))

    # --- Stage A's own landmarks, by shape ---------------------------------------------------
    cands = [i for i in range(len(ops) - 1)
             if ops[i].op == "Null" and ops[i + 1].op == "DynGet"
             and bc.strings.value[ops[i + 1].df["field"].value] == PROPS_FIELD]
    _guard(len(cands) == 1, "expected exactly ONE Stage A head, found %s" % cands)
    A = cands[0]
    R_COST = ops[A].df["dst"].value

    flag = [i for i, o in enumerate(ops) if o.op == "DynGet"
            and bc.strings.value[o.df["field"].value] == FLAG_FIELD]
    _guard(len(flag) == 1, "expected exactly ONE %r read, found %s" % (FLAG_FIELD, flag))
    _guard(ops[flag[0] + 1].op == "JFalse", "the flag read is not followed by its own test")

    getcost = [i for i, o in enumerate(ops)
               if o.op == "Call1" and getattr(o.df.get("fun"), "value", None) == costfn.findex.value]
    _guard(len(getcost) == 1, "expected exactly ONE getEquipmentCost call, found %s" % getcost)
    C = getcost[0]
    _guard(C == flag[0] + 2, "the cost call does not immediately follow the flag test")
    _guard(ops[C].df["dst"].value == R_COST, "the cost call does not write the cost register")
    R_EQUIP = ops[C].df["arg0"].value

    # the unit virtual: the ToVirtual that feeds getCurrentFor
    proxy = [i for i, o in enumerate(ops[:A]) if o.op == "Call2"
             and disasm.type_name(bc, fn.regs[o.df["dst"].value].resolve(bc)) == "hxbit.ArrayProxyData"]
    _guard(len(proxy) == 1, "expected ONE equipment-proxy call, found %s" % proxy)
    R_PROXY = ops[proxy[0]].df["dst"].value
    R_UNIT = ops[proxy[0]].df["arg1"].value
    R_SLOT = 3
    _guard(disasm.type_name(bc, fn.regs[R_SLOT].resolve(bc)) == "I32", "reg3 is not the slot index")

    # --- the call template: take the ARGUMENT TYPES from a real call site --------------------
    site = None
    for f in bc.functions:
        for i, o in enumerate(f.ops):
            if o.op == "Call4" and getattr(o.df.get("fun"), "value", None) == price.findex.value:
                site = (f, o)
                break
        if site:
            break
    _guard(site is not None, "no existing call to getRemoveCost to copy the shape from")
    sf, so = site
    for our, theirs, what in ((R_UNIT, so.df["arg1"].value, "unit row"),
                              (R_EQUIP, so.df["arg2"].value, "equipment row"),
                              (R_SLOT, so.df["arg3"].value, "slot")):
        a = disasm.type_name(bc, fn.regs[our].resolve(bc))
        b = disasm.type_name(bc, sf.regs[theirs].resolve(bc))
        _guard(a == b, "getRemoveCost's %s is %s at the vanilla call site, ours is %s" % (what, b, a))
    _guard(disasm.type_name(bc, fn.regs[R_COST].resolve(bc))
           == disasm.type_name(bc, sf.regs[so.df["dst"].value].resolve(bc)),
           "getRemoveCost returns a different type than our cost register")

    t_parr = _fld(bc, fn, "array", "hl.types.ArrayDyn", "hxbit.ArrayProxyData")
    t_cast = next(o for o in ops if o.op == "SafeCast"
                  and disasm.type_name(bc, fn.regs[o.df["dst"].value].resolve(bc)) == "hl.types.ArrayObj")
    t_len = _fld(bc, fn, "length", "I32", "hl.types.ArrayObj")
    t_raw = _fld(bc, fn, "array", "Array", "hl.types.ArrayObj")
    t_jsgte = next(o for o in ops if o.op == "JSGte")
    t_jnull = next(o for o in ops if o.op == "JNull")

    base = len(fn.regs)
    for src in (t_parr.df["dst"].value, t_cast.df["dst"].value, t_len.df["dst"].value,
                t_raw.df["dst"].value, ops[26].df["dst"].value, 2, R_COST):
        fn.regs.append(deepcopy(fn.regs[src]))
    E_ARRD, E_ARRO, E_LEN, E_RAW, E_DYN, E_CUR, E_REM = range(base, base + 7)
    fn.nregs = VarInt(len(fn.regs))
    append = by_name(bc, "$HTools.appendResCosts")

    def clone(t, **kw):
        o = deepcopy(t)
        for k, v in kw.items():
            o.df[k] = Reg(v)
        return o
    K = 13
    block = [
        clone(t_parr, dst=E_ARRD, obj=R_PROXY),                                   # 0
        clone(t_cast, dst=E_ARRO, src=E_ARRD),                                    # 1
        op("NullCheck", reg=Reg(E_ARRO)),                                         # 2
        clone(t_len, dst=E_LEN, obj=E_ARRO),                                      # 3
        deepcopy(t_jsgte),                                                        # 4 beyond -> empty
        clone(t_raw, dst=E_RAW, obj=E_ARRO),                                      # 5
        op("GetArray", dst=Reg(E_DYN), array=Reg(E_RAW), index=Reg(R_SLOT)),      # 6
        op("UnsafeCast", dst=Reg(E_CUR), src=Reg(E_DYN)),                         # 7
        deepcopy(t_jnull),                                                        # 8 null -> empty
        op("Call4", dst=Reg(E_REM), fun=fIndex(price.findex.value), arg0=Reg(0),
           arg1=Reg(R_UNIT), arg2=Reg(R_EQUIP), arg3=Reg(R_SLOT)),                # 9 occupied
        deepcopy(ops[C]),
        op("Call2", dst=Reg(R_COST), fun=fIndex(append.findex.value),
           arg0=Reg(E_REM), arg1=Reg(R_COST)),
        op("JAlways", offset=VarInt(1)),                                          # 12 past the fallback
    ]
    block[4].df.update(a=Reg(R_SLOT), b=Reg(E_LEN), offset=VarInt(K - 5))
    block[8].df.update(reg=Reg(E_CUR), offset=VarInt(K - 9))    # both -> the moved row cost

    n, preds = splice(fn, C, block, "W30F2 cost source")
    _guard(n == K, "block length changed")
    _guard(C + 4 + 1 + fn.ops[C + 4].df["offset"].value == C + K, "beyond-array must fall to the row cost")
    _guard(C + 8 + 1 + fn.ops[C + 8].df["offset"].value == C + K, "empty slot must fall to the row cost")
    _guard(C + 12 + 1 + fn.ops[C + 12].df["offset"].value == C + K + 1, "occupied must SKIP the row cost")
    _guard(fn.ops[C + K].op == "Call1"
           and fn.ops[C + K].df["fun"].value == costfn.findex.value, "the row-cost call moved oddly")
    if verbose:
        print("W30F2: %d ops at op%d of f@%d (now %d), preds %s" % (K, C, fn.findex.value, len(fn.ops), preds))
    return fn


# ================== F1: the Armoury skips the removal for a flagged row ====================
def apply_w30f1(bc, verbose=True):
    rem = by_name(bc, REMOVE)
    hits = [f for f in bc.functions
            if any(o.op == "Call4" and getattr(o.df.get("fun"), "value", None) == rem.findex.value
                   for o in f.ops)
            and any(o.op == "Call4" and getattr(o.df.get("fun"), "value", None)
                    == by_name(bc, "logic.faction.Equipments.apply").findex.value for o in f.ops)]
    _guard(len(hits) == 1, "expected exactly ONE handler that both removes and applies, found %d" % len(hits))
    fn = hits[0]
    ops = fn.ops
    R = [i for i, o in enumerate(ops)
         if o.op == "Call4" and getattr(o.df.get("fun"), "value", None) == rem.findex.value]
    _guard(len(R) == 1, "expected ONE removeEquipment call in the handler, found %s" % R)
    RC = R[0]
    SKIP = RC + 1                                        # everything after the removal

    # the occupancy test that already guards the removal, and the equipment-row virtual
    occ = [i for i in range(RC) if ops[i].op == "JNull" and i + 1 + ops[i].df["offset"].value == SKIP]
    _guard(len(occ) == 1, "expected ONE occupancy test jumping past the removal, found %s" % occ)
    C = occ[0] + 1

    t_id = _fld(bc, fn, "id", "String", "Virtual[aiWeights, desc, gfx, id, index, name, props, traits]")
    R_EQUIPV = t_id.df["obj"].value
    look = [i for i, o in enumerate(ops) if o.op == "GetGlobal"
            and i + 5 < len(ops) and ops[i + 5].op == "Call2"
            and re.search(r'"equipment"', disasm.fmt_op_compact(bc, fn.regs, ops[i + 1], i + 1, func=fn) or "")]
    _guard(len(look) == 1, "expected ONE $Data.equipment lookup to clone, found %s" % look)
    L = look[0]
    tpl = [deepcopy(ops[L + k]) for k in range(6)]       # GetGlobal, Field, NullCheck, Field, NullCheck, Call2
    _guard(tpl[5].op == "Call2", "the lookup template is not shaped as expected")
    dg = next(o for o in bc.functions[0].ops if False) if False else None
    # a DynGet template from the apply patch (Stage A emitted the first ones)
    dgsrc = None
    for f in bc.functions:
        for o in f.ops:
            if o.op == "DynGet":
                dgsrc = o
                break
        if dgsrc:
            break
    _guard(dgsrc is not None, "no DynGet anywhere to clone")

    base = len(fn.regs)
    apply_fn = by_name(bc, APPLY)
    t_dyn = next(r for r in apply_fn.regs if disasm.type_name(bc, r.resolve(bc)) == "Dyn")
    t_bool = next(r for r in apply_fn.regs if disasm.type_name(bc, r.resolve(bc)) == "Bool")
    t_str = next(r for r in apply_fn.regs if disasm.type_name(bc, r.resolve(bc)) == "String")
    t_idx = next(r for r in apply_fn.regs if disasm.type_name(bc, r.resolve(bc)) == "cdb.IndexId")
    t_map = next(r for r in apply_fn.regs if disasm.type_name(bc, r.resolve(bc)) == "haxe.ds.StringMap")
    t_dat = fn.regs[tpl[0].df["dst"].value]
    for r in (t_dat, t_idx, t_map, t_str, t_dyn, t_dyn, t_bool):
        fn.regs.append(deepcopy(r))
    G_DAT, G_IDX, G_MAP, G_ID, G_DYN, G_PROPS, G_FLAG = range(base, base + 7)
    fn.nregs = VarInt(len(fn.regs))

    def dynget(dst, obj, s):
        o = deepcopy(dgsrc)
        o.df["dst"] = Reg(dst)
        o.df["obj"] = Reg(obj)
        o.df["field"] = strRef(str_ref(bc, s))
        return o

    tpl[0].df["dst"] = Reg(G_DAT)
    tpl[1].df["dst"] = Reg(G_IDX); tpl[1].df["obj"] = Reg(G_DAT)
    tpl[2].df["reg"] = Reg(G_IDX)
    tpl[3].df["dst"] = Reg(G_MAP); tpl[3].df["obj"] = Reg(G_IDX)
    tpl[4].df["reg"] = Reg(G_MAP)
    tpl[5].df["dst"] = Reg(G_DYN); tpl[5].df["arg0"] = Reg(G_MAP); tpl[5].df["arg1"] = Reg(G_ID)

    K = 13
    block = ([op("NullCheck", reg=Reg(R_EQUIPV)),
              deepcopy(t_id)] + tpl +
             [op("JNull", reg=Reg(G_DYN), offset=VarInt(0)),
              dynget(G_PROPS, G_DYN, PROPS_FIELD),
              op("JNull", reg=Reg(G_PROPS), offset=VarInt(0)),
              dynget(G_FLAG, G_PROPS, FLAG_FIELD),
              op("JTrue", cond=Reg(G_FLAG), offset=VarInt(0))])
    block[1].df["dst"] = Reg(G_ID); block[1].df["obj"] = Reg(R_EQUIPV)
    _guard(len(block) == K, "block is %d ops, expected %d" % (len(block), K))
    # jump targets: the three escapes
    block[8].df["offset"] = VarInt((C + K) - (C + 8 + 1))       # row missing -> do the removal
    block[10].df["offset"] = VarInt((C + K) - (C + 10 + 1))     # no props   -> do the removal
    block[12].df["offset"] = VarInt((SKIP + K) - (C + 12 + 1))  # FLAGGED    -> skip the removal

    n, preds = splice(fn, C, block, "W30F1 skip the removal for a flagged row")
    _guard(n == K, "block length changed")
    _guard(fn.ops[C + 12].op == "JTrue"
           and C + 12 + 1 + fn.ops[C + 12].df["offset"].value == SKIP + K,
           "the flagged escape does not land just past the removal")
    _guard(fn.ops[SKIP + K - 1].op == "Call4"
           and fn.ops[SKIP + K - 1].df["fun"].value == rem.findex.value,
           "the removal is not where we think it is")
    if verbose:
        print("W30F1: %d ops at op%d of f@%d (now %d), removal at op%d, preds %s"
              % (K, C, fn.findex.value, len(fn.ops), SKIP + K - 1, preds))
    return fn


def apply_w30f(bc, verbose=True):
    return apply_w30f2(bc, verbose), apply_w30f1(bc, verbose)
