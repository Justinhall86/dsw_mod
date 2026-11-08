#!/usr/bin/env python3
"""Refuse the unaffordable, charge on commit, show the removal fee plus the item's own price."""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from armoury_lib import (_guard, by_name, str_ref, op, HLBOOT, FLAG_FIELD,  # noqa: E402
                         PROPS_FIELD)
from crashlink import Bytecode, disasm            # noqa: E402
from crashlink.opcodes import opcodes             # noqa: E402
from crashlink.core import VarInt, Reg, strRef, fIndex, intRef   # noqa: E402
from copy import deepcopy                          # noqa: E402

OUT = os.path.join(HERE, "hlboot_w30bc.dat")
TERMINATORS = ("Ret", "Throw", "Rethrow", "JAlways", "Switch")


def splice(fn, C, block, label):
    """Insert `block` at index C, fix only the jumps that span it, and PROVE it is reachable."""
    K = len(block)
    ops = fn.ops
    for i, o in enumerate(ops):
        for nm, pt in opcodes.get(o.op or "", {}).items():
            if pt != "JumpOffset" or o.df.get(nm) is None:
                continue
            v = o.df[nm]
            tgt = i + 1 + v.value
            if i < C < tgt:          # strictly after: a jump TO C must land on the new block
                v.value += K
            elif tgt < C <= i:
                v.value -= K
    fn.ops[:] = ops[:C] + block + ops[C:]
    fn.nops = VarInt(len(fn.ops))
    n = len(fn.ops)
    for i, o in enumerate(fn.ops):
        for nm, pt in opcodes.get(o.op or "", {}).items():
            if pt == "JumpOffset" and o.df.get(nm) is not None:
                t = i + 1 + o.df[nm].value
                _guard(0 <= t < n, "%s: op%d jumps out of range (-> %d of %d)" % (label, i, t, n))
    preds = []
    for i, o in enumerate(fn.ops):
        if i == C:
            continue
        for nm, pt in opcodes.get(o.op or "", {}).items():
            if pt == "JumpOffset" and o.df.get(nm) is not None and i + 1 + o.df[nm].value == C:
                preds.append(("jump", i, o.op))
        if i == C - 1 and o.op not in TERMINATORS:
            preds.append(("fallthrough", i, o.op))
    _guard(preds, "%s: THE BLOCK AT op%d IS UNREACHABLE (op%d is %s). This is the defect that made "
                  "three builds do nothing." % (label, C, C - 1, fn.ops[C - 1].op if C else "-"))
    if fn.debuginfo is not None and getattr(fn.debuginfo, "value", None) is not None:
        di = fn.debuginfo.value
        di[:] = di[:C] + [di[C]] * K + di[C:]
        _guard(len(di) == n, "%s: debuginfo/op count mismatch" % label)
    return K, preds


def clone_of(fn, pred, what):
    hits = [o for o in fn.ops if pred(o)]
    _guard(hits, "no %s to clone in f@%d" % (what, fn.findex.value))
    return hits[0]


def _same_slot(bc, tip, rc, call, u_id):
    """Tooltip ops: the slot already holds this item -> skip its own cost (2 ops follow)."""
    ty = lambda o, k: disasm.type_name(bc, rc.regs[o.df[k].value].resolve(bc))
    picks = (("Call2", "dst", "hxbit.ArrayProxyData"), ("Field", "obj", "hxbit.ArrayProxyData"),
             ("SafeCast", "dst", "hl.types.ArrayObj"), ("Field", "dst", "I32"),
             ("Field", "dst", "Array"), ("GetArray", "dst", "Dyn"),
             ("UnsafeCast", "dst", "String"))
    t = [deepcopy(clone_of(rc, lambda o, p=p: o.op == p[0] and ty(o, p[1]) == p[2], p[2]))
         for p in picks]
    zero = deepcopy(clone_of(rc, lambda o: o.op == "Int" and o.df["ptr"].value == 1, "Int 0"))
    base = len(tip.regs)
    for o in t + [zero, t[3]]:
        tip.regs.append(deepcopy(rc.regs[o.df["dst"].value]))
    PRX, ARD, ARO, LEN, RAW, EL, CUR, ZI, CMP = range(base, base + 9)
    tip.nregs = VarInt(len(tip.regs))
    eqs, unit, slot = (call.df[k].value for k in ("arg0", "arg1", "arg3"))
    _guard(disasm.type_name(bc, tip.regs[slot].resolve(bc)) == "I32", "tooltip slot is not I32")
    cmp_fn = by_name(bc, "String.__compare")
    t[0].df.update(dst=Reg(PRX), arg0=Reg(eqs), arg1=Reg(unit))
    t[1].df.update(dst=Reg(ARD), obj=Reg(PRX)); t[2].df.update(dst=Reg(ARO), src=Reg(ARD))
    t[3].df.update(dst=Reg(LEN), obj=Reg(ARO)); t[4].df.update(dst=Reg(RAW), obj=Reg(ARO))
    t[5].df.update(dst=Reg(EL), array=Reg(RAW), index=Reg(slot))
    t[6].df.update(dst=Reg(CUR), src=Reg(EL)); zero.df["dst"] = Reg(ZI)
    out = [zero, t[0], op("NullCheck", reg=Reg(PRX)), t[1], t[2],
           op("NullCheck", reg=Reg(ARO)), t[3],
           op("JSLt", a=Reg(slot), b=Reg(ZI), offset=None),
           op("JSGte", a=Reg(slot), b=Reg(LEN), offset=None), t[4], t[5], t[6],
           op("JNull", reg=Reg(CUR), offset=None),
           op("Call2", dst=Reg(CMP), fun=fIndex(cmp_fn.findex.value),
              arg0=Reg(CUR), arg1=Reg(u_id)),
           op("JEq", a=Reg(CMP), b=Reg(ZI), offset=None)]
    H = len(out)
    for j in (7, 8, 12):
        out[j].df["offset"] = VarInt(H - 1 - j)
    out[14].df["offset"] = VarInt(H + 2 - 1 - 14)           # same item -> skip the cost
    return out


def apply_w30bc(bc, verbose=True):
    fn = by_name(bc, "logic.faction.Equipments.implInlineApply")
    costfn = by_name(bc, "$HUnit.getEquipmentCost")
    affordfn = by_name(bc, "ent.Object.hasResources")
    spendfn = by_name(bc, "ent.Object.useResources")
    cheatfn = by_name(bc, "lib.$Input.cheatFree")
    mapget = by_name(bc, "haxe.ds.StringMap.get")
    removecost = by_name(bc, "logic.faction.Equipments.getRemoveCost")
    addcost = by_name(bc, "ui.comp.TipEquipment.addCost")
    donor = by_name(bc, "logic.faction.Equipments.implRemoveEquipment")

    s_props, s_flag = str_ref(bc, PROPS_FIELD), str_ref(bc, FLAG_FIELD)
    dg = next(o for f in bc.functions for o in f.ops if o.op == "DynGet")
    # =================================================================== f@9961 : A and B
    ops = fn.ops
    _guard(len(ops) == 81, "expected the pristine 81-op function, got %d" % len(ops))
    _guard(not any(o.op == "Switch" for o in ops), "a Switch would need its own offset fix-up")
    cands = [i for i, o in enumerate(ops) if o.op == "JFalse" and o.df["cond"].value == 4]
    _guard(len(cands) == 1, "expected ONE JFalse on the commit flag, found %s" % cands)
    C = cands[0]
    r_dyn, r_virt = ops[26].df["dst"].value, ops[27].df["dst"].value
    _guard(ops[27].op == "ToVirtual" and ops[27].df["src"].value == r_dyn, "op26/27 shape changed")
    for i in range(27, C):
        d = ops[i].df.get("dst")
        _guard(not (d is not None and getattr(d, "value", None) == r_dyn),
               "the equipment row register is overwritten at op%d" % i)
    # captured BEFORE any splice: f@9961 ops 21-26 are the $Data.equipment.byId.get lookup
    ORIG_EQUIP_FIELD = deepcopy(ops[22])
    ORIG_BYID_FIELD = deepcopy(ops[24])
    _guard(ORIG_EQUIP_FIELD.op == "Field" and ORIG_BYID_FIELD.op == "Field",
           "f@9961 ops 22/24 are not the $Data.equipment / .byId reads")
    mk =[o for o in donor.ops if o.op == "MakeEnum"
          and len(getattr(o.df.get("args"), "value", None) or []) == 1
          and disasm.type_name(bc, donor.regs[o.df["args"].value[0].value].resolve(bc))
          == "hl.types.ArrayObj"]
    _guard(len(mk) == 1, "expected one cannot-afford MakeEnum in the donor, found %d" % len(mk))
    tpl_getthis = clone_of(fn, lambda o: o.op == "GetThis" and o.df["dst"].value == 11,
                           "GetThis owner")
    def find_reg(fx, t):
        for r in fx.regs:
            if disasm.type_name(bc, r.resolve(bc)) == t:
                return r
        return None
    t_dyn, t_bool = find_reg(fn, "Dyn"), find_reg(fn, "Bool")
    t_arr, t_fac, t_reason = (find_reg(fn, "hl.types.ArrayObj"), find_reg(fn, "ent.Faction"),
                              find_reg(fn, "EReason"))
    for nm, r in (("Dyn", t_dyn), ("Bool", t_bool), ("ArrayObj", t_arr),
                  ("ent.Faction", t_fac), ("EReason", t_reason)):
        _guard(r is not None, "no register of type %s to clone in the target" % nm)
    base = len(fn.regs)
    spend_donor = by_name(bc, "logic.faction.Equipments.implRemoveEquipment")
    t_ref = None
    for f in bc.functions:
        for i, o in enumerate(f.ops):
            if o.op == "Call4" and getattr(o.df.get("fun"), "value", None) == spendfn.findex.value:
                t_ref = f.regs[o.df["arg3"].value]
                _guard(disasm.type_name(bc, t_ref.resolve(bc)) == "Ref",
                       "useResources' 4th argument is %s, not Ref"
                       % disasm.type_name(bc, t_ref.resolve(bc)))
                break
        if t_ref is not None:
            break
    _guard(t_ref is not None, "no existing call to useResources to take the 4th argument type from")
    for r in (t_dyn, t_bool, t_arr, t_fac, t_arr, t_bool, t_reason, t_bool, t_ref):
        fn.regs.append(deepcopy(r))
    (R_PROPS, R_BOOL, R_COST, R_OWNER, R_NULLARR, R_AFFORD, R_REASON, R_CHEAT,
     R_NULLREF) = range(base, base + 9)
    fn.nregs = VarInt(len(fn.regs))

    def dynget(dst, obj, s):
        o = deepcopy(dg); o.df["dst"] = Reg(dst); o.df["obj"] = Reg(obj)
        o.df["field"] = strRef(s); return o

    # stage B first, at the higher index: a null cost means A did not flag it; cheat mode is free
    blockB = [
        op("JNull", reg=Reg(R_COST), offset=VarInt(5)),
        op("Call0", dst=Reg(R_CHEAT), fun=fIndex(cheatfn.findex.value)),
        op("JTrue", cond=Reg(R_CHEAT), offset=VarInt(3)),
        op("Null", dst=Reg(R_NULLARR)),
        op("Null", dst=Reg(R_NULLREF)),
        op("Call4", dst=Reg(R_AFFORD), fun=fIndex(spendfn.findex.value),
           arg0=Reg(R_OWNER), arg1=Reg(R_COST), arg2=Reg(R_NULLARR),
           arg3=Reg(R_NULLREF)),
    ]
    for i, o in enumerate(blockB):
        for nm, pt in opcodes.get(o.op or "", {}).items():
            if pt == "JumpOffset" and o.df.get(nm) is not None:
                t = i + 1 + o.df[nm].value
                _guard(o.df[nm].value >= 0 and t == len(blockB),
                       "B block op%d must jump forward past the block, goes to %d" % (i, t))
    KB, predsB = splice(fn, C + 1, blockB, "stage B")

    # stage A second, at the lower index: op 0 nulls the cost B reads, op 6 owner, op 12 reason
    KA_ops = [
        op("Null", dst=Reg(R_COST)),
        dynget(R_PROPS, r_dyn, s_props),
        op("JNull", reg=Reg(R_PROPS), offset=None),
        dynget(R_BOOL, R_PROPS, s_flag),
        op("JFalse", cond=Reg(R_BOOL), offset=None),
        op("Call1", dst=Reg(R_COST), fun=fIndex(costfn.findex.value), arg0=Reg(r_virt)),
        deepcopy(tpl_getthis),
        op("JNull", reg=Reg(R_OWNER), offset=None),
        op("NullCheck", reg=Reg(R_OWNER)),
        op("Null", dst=Reg(R_NULLARR)),
        op("Call3", dst=Reg(R_AFFORD), fun=fIndex(affordfn.findex.value),
           arg0=Reg(R_OWNER), arg1=Reg(R_COST), arg2=Reg(R_NULLARR)),
        op("JTrue", cond=Reg(R_AFFORD), offset=None),
        deepcopy(mk[0]),
        op("Ret", ret=Reg(R_REASON)),
    ]
    KA = len(KA_ops)
    KA_ops[6].df["dst"] = Reg(R_OWNER)
    KA_ops[12].df["dst"] = Reg(R_REASON)
    KA_ops[12].df["args"].value = [Reg(R_COST)]
    for i in (2, 4, 7, 11):
        KA_ops[i].df["offset"] = VarInt(KA - 1 - i)      # every skip lands on the commit flag
    for i, o in enumerate(KA_ops):
        for nm, pt in opcodes.get(o.op or "", {}).items():
            if pt == "JumpOffset" and o.df.get(nm) is not None:
                t = i + 1 + o.df[nm].value
                _guard(o.df[nm].value >= 0 and t == KA,
                       "A block op%d must jump forward to the commit flag, goes to %d" % (i, t))
    _, predsA = splice(fn, C, KA_ops, "stage A")
    _guard(fn.ops[-1].op == "Ret", "f@9961 must still end on a Ret")

    # =================================================================== f@30378 : C
    ui = None
    for f in bc.functions:
        if len(f.ops) != 97:
            continue
        calls = [(i, o) for i, o in enumerate(f.ops)
                 if o.op in ("Call3", "Call4") and getattr(o.df.get("fun"), "value", None)
                 in (removecost.findex.value, addcost.findex.value)]
        if len(calls) == 2:
            ui = f
            break
    _guard(ui is not None, "could not find the Armoury tooltip closure by shape")
    uops = ui.ops
    i_cost = next(i for i, o in enumerate(uops)
                  if getattr(o.df.get("fun"), "value", None) == removecost.findex.value)
    i_add = next(i for i, o in enumerate(uops) if i > i_cost and o.op == "Call3")
    _guard(i_add - i_cost == 2,
           "expected getRemoveCost and addCost two ops apart, got %d" % (i_add - i_cost))
    r_costs = uops[i_cost].df["dst"].value
    r_equip = uops[i_cost].df["arg2"].value
    _guard(uops[i_add].df["arg1"].value == r_costs,
           "addCost must be handed the array getRemoveCost built")

    # f@9961 is spliced by now: templates go by shape, the two $Data reads by the saved originals
    appendfn = by_name(bc, "$HTools.appendResCosts")
    tpl_id = clone_of(removecost, lambda o: o.op == "Field"
                      and disasm.type_name(bc, removecost.regs[o.df["dst"].value].resolve(bc))
                      == "String" and o.df["obj"].value == 2,
                      "Field `id` on the equipment row virtual")
    getdata = clone_of(fn, lambda o: o.op == "GetGlobal" and o.df["global"].value == 568,
                       "GetGlobal $Data")
    f_equip, f_byid = ORIG_EQUIP_FIELD, ORIG_BYID_FIELD
    _guard(f_equip.op == "Field" and f_byid.op == "Field", "the $Data lookup shape changed")
    ubase = len(ui.regs)
    for r in (find_reg(removecost, "String"),
              fn.regs[getdata.df["dst"].value],
              fn.regs[f_equip.df["dst"].value], fn.regs[f_byid.df["dst"].value],
              t_dyn, t_dyn, t_bool, t_arr):
        _guard(r is not None, "missing a register type for stage C")
        ui.regs.append(deepcopy(r))
    U_ID, U_DATA, U_IDX, U_MAP, U_DYN, U_PROPS, U_FLAG, U_COST = range(ubase, ubase + 8)
    ui.nregs = VarInt(len(ui.regs))

    def ufield(tpl, dst, obj):
        o = deepcopy(tpl); o.df["dst"] = Reg(dst); o.df["obj"] = Reg(obj); return o

    def _getglobal(dst):
        o = deepcopy(getdata); o.df["dst"] = Reg(dst); return o

    # stage C: a flagged row shows the slot's removal fee plus its own cost, summed per resource
    blockC = [
        ufield(tpl_id, U_ID, r_equip),
        _getglobal(U_DATA),
        ufield(f_equip, U_IDX, U_DATA),
        op("NullCheck", reg=Reg(U_IDX)),
        ufield(f_byid, U_MAP, U_IDX),
        op("NullCheck", reg=Reg(U_MAP)),
        op("Call2", dst=Reg(U_DYN), fun=fIndex(mapget.findex.value),
           arg0=Reg(U_MAP), arg1=Reg(U_ID)),
        op("JNull", reg=Reg(U_DYN), offset=None),
        dynget(U_PROPS, U_DYN, s_props),
        op("JNull", reg=Reg(U_PROPS), offset=None),
        dynget(U_FLAG, U_PROPS, s_flag),
        op("JFalse", cond=Reg(U_FLAG), offset=None),
        *_same_slot(bc, ui, removecost, uops[i_cost], U_ID),
        op("Call1", dst=Reg(U_COST), fun=fIndex(costfn.findex.value), arg0=Reg(r_equip)),
        op("Call2", dst=Reg(r_costs), fun=fIndex(appendfn.findex.value),
           arg0=Reg(r_costs), arg1=Reg(U_COST)),
    ]
    KC = len(blockC)
    for i in (7, 9, 11):
        blockC[i].df["offset"] = VarInt(KC - 1 - i)
    for i, o in enumerate(blockC):
        for nm, pt in opcodes.get(o.op or "", {}).items():
            if pt == "JumpOffset" and o.df.get(nm) is not None:
                t = i + 1 + o.df[nm].value
                _guard(o.df[nm].value >= 0 and t in (KC, KC - 2),
                       "C block op%d must jump forward past the block, goes to %d" % (i, t))
    _, predsC = splice(ui, i_cost + 1, blockC, "stage C")
    _guard(ui.ops[-1].op == "Ret", "the tooltip must still end on a Ret")

    if verbose:
        print("f@%d  A: %d ops at op%d (preds %s)" % (fn.findex.value, KA, C, predsA))
        print("f@%d  B: %d ops at op%d (preds %s)" % (fn.findex.value, KB, C + 1, predsB))
        print("f@%d  C: %d ops at op%d (preds %s)" % (ui.findex.value, KC, i_cost + 1, predsC))
        print("  f@9961 %d ops / %d regs;  f@%d %d ops / %d regs"
              % (len(fn.ops), len(fn.regs), ui.findex.value, len(ui.ops), len(ui.regs)))
        print("  spend f@%d, cheat f@%d, cost f@%d, afford f@%d, map.get f@%d"
              % (spendfn.findex.value, cheatfn.findex.value, costfn.findex.value,
                 affordfn.findex.value, mapget.findex.value))
    return fn, ui, C, KA, KB, i_cost + 1, KC
