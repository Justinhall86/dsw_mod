#!/usr/bin/env python3
"""Equipment whose `props.costToEquip` is set is refused when it cannot be afforded."""
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))


def _find(name):
    # same search as `localsietch_lib._find`; change both together
    for base in (HERE, os.path.join(os.path.dirname(os.path.dirname(HERE)), "game"),):
        p = os.path.join(base, name)
        if os.path.exists(p):
            return p
    # the packaged app has no game folder and never reads this one
    return p


for _cl in (os.path.join(os.path.dirname(os.path.dirname(HERE)), "lib"),):
    if os.path.isdir(os.path.join(_cl, "crashlink")):
        sys.path.insert(0, _cl)
        break

sys.setrecursionlimit(200000)   # upstream DebugInfo._flush_repeat recurses per 15 repeats

from crashlink import Bytecode, disasm                           # noqa: E402
from crashlink.opcodes import opcodes                            # noqa: E402
from crashlink.core import Opcode, VarInt, Reg, strRef, fIndex   # noqa: E402
from copy import deepcopy                                        # noqa: E402

HLBOOT = _find("hlboot.dat")
OUT = os.path.join(HERE, "hlboot_w30a.dat")
# for a single-stage script; the merged pipeline takes GAMEDIR from `localsietch_lib`
GAMEDIR = next((d for d in (r"C:\Games\Steam\steamapps\common\D4X",
                            r"D:\Downloads\Steam\steamapps\common\D4X") if os.path.isdir(d)), None)

TARGET = "logic.faction.Equipments.implInlineApply"
COSTFN = "$HUnit.getEquipmentCost"
AFFORDFN = "ent.Object.hasResources"
DONOR_REASON = "logic.faction.Equipments.implRemoveEquipment"   # for the MakeEnum template
FLAG_FIELD = "costToEquip"
PROPS_FIELD = "props"


def _guard(cond, msg):
    if not cond:
        raise AssertionError("W30 GUARD: " + msg)


def _name_of(bc, f):
    try:
        return (disasm.full_func_name_str(bc, f),)
    except Exception:
        return ()


def by_name(bc, name):
    # every function's name read once and kept on the file, as the list grows; not once per ask
    from tools import byname
    found = byname.on(bc, "_armoury_names", lambda f: _name_of(bc, f)).current(bc.functions)
    hits = [f for _at, f in found.get(name, ())]
    _guard(len(hits) == 1, "expected exactly one function named %r, found %d" % (name, len(hits)))
    return hits[0]


def str_ref(bc, s):
    """Index of `s` in the string pool, appending it if absent. Guarded to one match."""
    hits = [i for i, v in enumerate(bc.strings.value) if v == s]
    _guard(len(hits) <= 1, "string %r appears %d times in the pool -- ambiguous" % (s, len(hits)))
    if hits:
        return hits[0]
    bc.strings.value.append(s)
    bc.strings.lengths.append(VarInt(len(s.encode("utf-8"))))
    bc.nstrings.value = len(bc.strings.value)
    _guard(bc.strings.value[-1] == s, "string append failed")
    return len(bc.strings.value) - 1


def op(name, **df):
    o = Opcode()
    o.op = name
    o.df = df
    return o


def apply_w30a(bc, verbose=True):
    fn = by_name(bc, TARGET)
    costfn = by_name(bc, COSTFN)
    affordfn = by_name(bc, AFFORDFN)
    donor = by_name(bc, DONOR_REASON)

    ops = fn.ops
    _guard(len(ops) == 81, "f@%d should have 81 ops, has %d" % (fn.findex.value, len(ops)))
    _guard(not any(o.op == "Switch" for o in ops), "a Switch would need its own offset fix-up")
    # the check sits before the commit flag's JFalse, so the dry run and the commit both see it
    cands = [i for i, o in enumerate(ops)
             if o.op == "JFalse" and o.df["cond"].value == 4]
    _guard(len(cands) == 1,
           "expected exactly ONE JFalse on the commit flag reg4, found %s" % cands)
    C = cands[0]
    _guard(C == 53,
           "the commit flag was at op53 when read; it is at op%d -- re-read before building" % C)
    # the equipment row is read as a Dyn at op26, before op27 narrows it
    _guard(ops[26].op == "Call2",
           "op26 should be the equipment StringMap.get, is %s" % ops[26].op)
    r_dyn = ops[26].df["dst"].value
    _guard(ops[27].op == "ToVirtual" and ops[27].df["src"].value == r_dyn,
           "op27 should ToVirtual the register op26 wrote")
    r_virt = ops[27].df["dst"].value

    # the Dyn must still hold the equipment row where we read it -- no write between 26 and C
    for i in range(27, C):
        d = ops[i].df.get("dst")
        _guard(not (d is not None and getattr(d, "value", None) == r_dyn),
               "reg%d (the equipment row) is overwritten at op%d (%s)" % (r_dyn, i, ops[i].op))

    # the donor's two MakeEnums are told apart by argument type: the reason takes an ArrayObj
    mk = []
    for o in donor.ops:
        if o.op != "MakeEnum":
            continue
        args = getattr(o.df.get("args"), "value", None) or []
        if len(args) != 1:
            continue
        t = disasm.type_name(bc, donor.regs[args[0].value].resolve(bc))
        if t == "hl.types.ArrayObj":
            mk.append(o)
    _guard(len(mk) == 1,
           "expected exactly ONE MakeEnum in %s taking a single ArrayObj (the cannot-afford "
           "reason), found %d" % (DONOR_REASON, len(mk)))
    tpl_makeenum = mk[0]
    dg = None
    for f in bc.functions:
        for o in f.ops:
            if o.op == "DynGet":
                dg = o
                break
        if dg:
            break
    _guard(dg is not None, "no DynGet anywhere to clone")
    getthis_owner = [o for o in ops if o.op == "GetThis" and o.df["dst"].value == 11]
    _guard(getthis_owner, "no GetThis 'owner' to clone in the target")
    tpl_getthis = getthis_owner[0]

    # new registers, types cloned from registers of the right kind
    def find_reg(fnx, tname):
        for i, r in enumerate(fnx.regs):
            if disasm.type_name(bc, r.resolve(bc)) == tname:
                return r
        return None

    t_dyn = find_reg(fn, "Dyn")
    t_bool = find_reg(fn, "Bool")
    t_arr = find_reg(fn, "hl.types.ArrayObj") or find_reg(donor, "hl.types.ArrayObj")
    t_fac = find_reg(fn, "ent.Faction")
    t_reason = find_reg(fn, "EReason")
    for nm, r in (("Dyn", t_dyn), ("Bool", t_bool), ("ArrayObj", t_arr),
                  ("ent.Faction", t_fac), ("EReason", t_reason)):
        _guard(r is not None, "no register of type %s to clone" % nm)

    base = len(fn.regs)
    for r in (t_dyn, t_dyn, t_bool, t_arr, t_fac, t_arr, t_bool, t_reason):
        fn.regs.append(deepcopy(r))
    R_PROPS, R_FLAG, R_BOOL, R_COST, R_OWNER, R_NULLARR, R_AFFORD, R_REASON = range(base, base + 8)
    fn.nregs = VarInt(len(fn.regs))

    s_props = str_ref(bc, PROPS_FIELD)
    s_flag = str_ref(bc, FLAG_FIELD)

    def dynget(dst, obj, sidx):
        o = deepcopy(dg)
        o.df["dst"] = Reg(dst)
        o.df["obj"] = Reg(obj)
        o.df["field"] = strRef(sidx)
        return o

    K = 13  # inserted op count; SKIP is the original commit-flag op at C+K

    def to_skip(i):
        return (K - 1) - i

    # the flag is read into a Bool, so an absent column reads false; op 5 owner, op 11 reason
    block = [
        dynget(R_PROPS, r_dyn, s_props),
        op("JNull", reg=Reg(R_PROPS), offset=VarInt(to_skip(1))),
        dynget(R_BOOL, R_PROPS, s_flag),
        op("JFalse", cond=Reg(R_BOOL), offset=VarInt(to_skip(3))),
        op("Call1", dst=Reg(R_COST), fun=fIndex(costfn.findex.value),
           arg0=Reg(r_virt)),
        deepcopy(tpl_getthis),
        op("JNull", reg=Reg(R_OWNER), offset=VarInt(to_skip(6))),
        op("NullCheck", reg=Reg(R_OWNER)),
        op("Null", dst=Reg(R_NULLARR)),
        op("Call3", dst=Reg(R_AFFORD), fun=fIndex(affordfn.findex.value),
           arg0=Reg(R_OWNER), arg1=Reg(R_COST), arg2=Reg(R_NULLARR)),
        op("JTrue", cond=Reg(R_AFFORD), offset=VarInt(to_skip(10))),
        deepcopy(tpl_makeenum),
        op("Ret", ret=Reg(R_REASON)),
    ]
    block[5].df["dst"] = Reg(R_OWNER)
    block[11].df["dst"] = Reg(R_REASON)
    block[11].df["args"].value = [Reg(R_COST)]
    _guard(len(block) == K, "block is %d ops, K says %d" % (len(block), K))
    for i, o in enumerate(block):
        for nm, pt in opcodes.get(o.op or "", {}).items():
            if pt == "JumpOffset":
                v = o.df.get(nm)
                if v is None:
                    continue
                _guard(v.value >= 0, "block op%d jumps BACKWARD -- forbidden shape" % i)
                _guard(i + 1 + v.value == K, "block op%d must jump to SKIP, goes to %d"
                       % (i, i + 1 + v.value))

    # splice, and fix every jump that spans the insertion
    fixed = 0
    for i, o in enumerate(ops):
        for nm, pt in opcodes.get(o.op or "", {}).items():
            if pt != "JumpOffset":
                continue
            v = o.df.get(nm)
            if v is None:
                continue
            tgt = i + 1 + v.value
            # strict `<`: a jump that targets C itself must land on the block, not skip it
            if i < C < tgt:
                v.value += K
                fixed += 1
            elif tgt < C <= i:
                v.value -= K
                fixed += 1
    fn.ops[:] = ops[:C] + block + ops[C:]
    fn.nops = VarInt(len(fn.ops))

    # every jump in the result must be in range, and the function must not end on one
    n = len(fn.ops)
    for i, o in enumerate(fn.ops):
        for nm, pt in opcodes.get(o.op or "", {}).items():
            if pt == "JumpOffset":
                v = o.df.get(nm)
                if v is None:
                    continue
                t = i + 1 + v.value
                _guard(0 <= t < n, "op%d jumps out of the function (-> %d of %d)" % (i, t, n))
    _guard(fn.ops[-1].op == "Ret", "the last op must stay a Ret")

    # op C needs a real predecessor: a jump to it, or a fall-through from a non-terminator
    TERMINATORS = ("Ret", "Throw", "Rethrow", "JAlways", "Switch")
    preds = []
    for i, o in enumerate(fn.ops):
        if i == C:
            continue
        for nm, pt in opcodes.get(o.op or "", {}).items():
            if pt == "JumpOffset" and o.df.get(nm) is not None and i + 1 + o.df[nm].value == C:
                preds.append(("jump", i, o.op))
        if i == C - 1 and o.op not in TERMINATORS:
            preds.append(("fallthrough", i, o.op))
    _guard(preds, "THE INSERTED BLOCK IS UNREACHABLE: nothing jumps to op%d and op%d is a %s "
                  "(a terminator), so control can never arrive. This is exactly the defect that "
                  "made three builds do nothing." % (C, C - 1, fn.ops[C - 1].op))

    if fn.debuginfo is not None and getattr(fn.debuginfo, "value", None) is not None:
        di = fn.debuginfo.value
        _guard(len(di) == n - K, "debuginfo had %d entries for %d original ops" % (len(di), n - K))
        di[:] = di[:C] + [di[C]] * K + di[C:]
        _guard(len(di) == n, "debuginfo/op count mismatch after patch")

    if verbose:
        print("patched f@%d: inserted %d ops at op%d (now %d), %d spanning jumps re-targeted"
              % (fn.findex.value, K, C, n, fixed))
        print("  equipment row Dyn = reg%d, virtual = reg%d; new regs %d..%d"
              % (r_dyn, r_virt, base, base + 7))
        print("  strings: %r -> #%d, %r -> #%d" % (PROPS_FIELD, s_props, FLAG_FIELD, s_flag))
        print("  cost fn f@%d, afford fn f@%d" % (costfn.findex.value, affordfn.findex.value))
    return fn, C, K


def dump_patched(bc, fn, path=None):
    path = path or os.path.join(HERE, "_w30a_patched.txt")
    with open(path, "w", encoding="utf-8") as fh:
        fh.write("f@%d %s nops=%d nregs=%d\n"
                 % (fn.findex.value, disasm.full_func_name_str(bc, fn), len(fn.ops), len(fn.regs)))
        for i, o in enumerate(fn.ops):
            fh.write("%4d. %s\n" % (i, disasm.fmt_op_compact(bc, fn.regs, o, i, func=fn)))
    print("wrote " + path)
