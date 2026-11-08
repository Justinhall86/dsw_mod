#!/usr/bin/env python3
"""`Building_HostLimit_Flat` / `TBuilding_HostLimit_Flat` (leave `stack` unset) add to it."""
import os
import sys
from copy import deepcopy

HERE = os.path.dirname(os.path.abspath(__file__))
for _p in (HERE, os.path.join(os.path.dirname(os.path.dirname(HERE)), "lib")):
    if _p not in sys.path:
        sys.path.insert(0, _p)

from armoury_lib import _guard, by_name, str_ref              # noqa: E402
from armoury_charge import splice                                 # noqa: E402
from abilitykeys import _mint_string_global                   # noqa: E402
from crashlink import disasm                              # noqa: E402

TARGET = "logic.Upgrades.getIsolatedLimit"
GETID_HDR = "static $HAttributes.getID ("
ATB_NAME = "ent.Object.getAtbVal"
ID_ALL = "Building_HostLimit_Flat"
ID_ONE = "TBuilding_HostLimit_Flat"
ID_INVALID = "Invalid"
# 125 pristine ops + hostlimit's 6; the base, the F64 bonus accumulator, the packed target filter
N_OPS = 131
R_BASE = 14
R_ACC = 20
R_FILTER = 12


def _gv(x):
    return getattr(x, "value", x)


def apply_w42(bc, verbose=True):
    fn = by_name(bc, TARGET)
    ops = fn.ops
    _guard(len(ops) == N_OPS,
           "%s should have %d ops (125 pristine + hostlimit's 6), has %d -- run hostlimit "
           "first, and check nothing else moved it" % (TARGET, N_OPS, len(ops)))
    _guard(not any(o.op == "Switch" for o in ops),
           "a Switch in %s would need its own offset fix-up" % TARGET)

    # (1) the splice point: the one ToSFloat of the base, which every road reaches
    tos = [i for i, o in enumerate(ops)
           if o.op == "ToSFloat" and _gv(o.df["src"]) == R_BASE]
    _guard(len(tos) == 1,
           "expected exactly one ToSFloat of the base register r%d, found %s" % (R_BASE, tos))
    C = tos[0]
    nxt = ops[C + 1]
    _guard(nxt.op == "Add" and _gv(nxt.df["b"]) == R_ACC,
           "op%d is %s, not the `base + bonus` Add -- op%d is not the join it was read as"
           % (C + 1, nxt.op, C))

    # (2) the accumulator is written by vanilla's own bonus roads
    acc_writes = [i for i, o in enumerate(ops[:C])
                  if o.df.get("dst") is not None and _gv(o.df["dst"]) == R_ACC]
    _guard(len(acc_writes) >= 2,
           "r%d is written %d times before op%d -- it is not the bonus accumulator"
           % (R_ACC, len(acc_writes), C))
    _guard(ops[acc_writes[0]].op == "Float",
           "the first write to r%d is %s, not the `Float 0.0` that initialises it"
           % (R_ACC, ops[acc_writes[0]].op))

    # (3) the target filter is live at C: written before it, never rewritten
    f_writes = [i for i, o in enumerate(ops)
                if o.df.get("dst") is not None and _gv(o.df["dst"]) == R_FILTER]
    _guard(f_writes and max(f_writes) < C,
           "the target filter r%d is written at %s -- not live and unmodified at op%d"
           % (R_FILTER, f_writes, C))

    # (4) templates, cloned from this function's own ops
    calls = [(i, o) for i, o in enumerate(ops) if o.op == "Call4"]
    _guard(calls, "no Call4 in %s to clone the attribute read from" % TARGET)
    atb = None
    for i, o in calls:
        callee = next((f for f in bc.functions if _gv(f.findex) == _gv(o.df["fun"])), None)
        if callee is None:
            continue
        if (disasm.func_header(bc, callee) or "").startswith(
                "f@%d %s (" % (_gv(callee.findex), ATB_NAME)):
            atb = (i, o)
            break
    _guard(atb is not None,
           "no Call4 to %s in %s -- the shape to clone is gone" % (ATB_NAME, TARGET))
    i_atb, t_call4 = atb
    ATB_FX = _gv(t_call4.df["fun"])
    A_OWN, A_ROW, A_REF, A_FAC = (_gv(t_call4.df["arg0"]), _gv(t_call4.df["arg1"]),
                                  _gv(t_call4.df["arg2"]), _gv(t_call4.df["arg3"]))
    R_VAL_SRC = _gv(t_call4.df["dst"])

    def one(pred, what):
        hits = [o for o in ops if pred(o)]
        _guard(hits, "no %s in %s to clone" % (what, TARGET))
        return hits[0]

    t_getthis = one(lambda o: o.op == "GetThis", "GetThis")
    F_OWNER = _gv(t_getthis.df["field"])
    _guard(any(o.op == "GetThis" and _gv(o.df["field"]) == F_OWNER
               and _gv(o.df["dst"]) == A_OWN for o in ops),
           "the GetThis that feeds %s's owner argument is not the one being cloned" % ATB_NAME)
    t_nullck = one(lambda o: o.op == "NullCheck", "NullCheck")
    t_null = one(lambda o: o.op == "Null", "Null")
    t_mov = one(lambda o: o.op == "Mov", "Mov")
    t_ref = one(lambda o: o.op == "Ref", "Ref")
    t_add = one(lambda o: o.op == "Add", "Add")
    t_int = one(lambda o: o.op == "Int", "Int")
    t_jslt = one(lambda o: o.op == "JSLt", "JSLt")
    t_jeq = one(lambda o: o.op == "JEq", "JEq")
    t_getglobal = one(lambda o: o.op == "GetGlobal", "GetGlobal")
    t_call1 = next((o for f in bc.functions for o in (f.ops or []) if o.op == "Call1"), None)
    _guard(t_call1 is not None, "no Call1 anywhere in the file to clone")

    # (5) the id resolver, by name, guarded to one match
    hits = [f for f in bc.functions
            if (disasm.func_header(bc, f) or "").startswith(
                "f@%d %s" % (_gv(f.findex), GETID_HDR))]
    _guard(len(hits) == 1, "expected exactly one %r, found %d" % (GETID_HDR, len(hits)))
    getid = hits[0]
    GETID_FX = _gv(getid.findex)
    _guard(_gv(list(getid.regs)[0]) == _gv(list(fn.regs)[1]),
           "getID's argument type is not this function's String type")
    # it must compare strings by value, not identity, or a minted id never matches
    _guard(any(o.op.startswith("Call") and (disasm.func_header(
                bc, next((g for g in bc.functions if _gv(g.findex) == _gv(o.df["fun"])), getid))
                or "").find("StringMap.get") >= 0
               for o in getid.ops if o.df.get("fun") is not None),
           "getID does not go through StringMap.get -- a minted String may never match it")
    _ret = [o for o in getid.ops if o.op == "Ret"]
    _guard(_ret and _gv(list(getid.regs)[_gv(_ret[0].df["ret"])]) == _gv(list(fn.regs)[A_ROW]),
           "getID's return type is not the type %s takes as its row argument" % ATB_NAME)

    # (6) each id, and `Invalid`, as a real String object: a `String` op makes raw characters only
    g_all, g_one = (_mint_string_global(bc, ID_ALL, verbose),
                    _mint_string_global(bc, ID_ONE, verbose))
    g_inv = _mint_string_global(bc, ID_INVALID, verbose)
    _guard(len({g_all, g_one, g_inv}) == 3, "the three ids did not resolve to distinct globals")
    T_ARG = _gv(list(fn.regs)[1])
    for g, nm in ((g_all, ID_ALL), (g_one, ID_ONE), (g_inv, ID_INVALID)):
        _guard(_gv(bc.global_types[g]) == T_ARG,
               "the global minted for %r is t@%s, not the String type this function's own argument "
               "register carries (t@%s)" % (nm, _gv(bc.global_types[g]), T_ARG))
    s_all, s_one = str_ref(bc, ID_ALL), str_ref(bc, ID_ONE)
    s_inv = str_ref(bc, ID_INVALID)
    _guard(len({s_all, s_one, s_inv}) == 3, "the three ids share a pool entry")

    # ---- (7) registers: clones of the ones the game's own call uses -------------------------
    base = len(fn.regs)
    for src in (1, A_ROW, A_ROW, A_OWN, A_REF, A_FAC, R_VAL_SRC, _gv(t_ref.df["src"])):
        fn.regs.append(deepcopy(fn.regs[src]))
    R_STR, R_ROW, R_BND, R_OWN, R_REF, R_FAC, R_VAL, R_TMP = range(base, base + 8)
    names = [R_STR, R_ROW, R_BND, R_OWN, R_REF, R_FAC, R_VAL, R_TMP]
    _guard(len(set(names)) == len(names), "duplicate register in the table")   # GOTCHAS group B
    fn.nregs.value = len(fn.regs)

    def mk(tpl, **df):
        o = deepcopy(tpl)
        for k, v in df.items():
            _guard(k in o.df, "%s has no operand %r" % (o.op, k))
            o.df[k].value = v
        return o

    def road(s_id, use_filter, skip_to, at):
        """One attribute read, added into the accumulator. `at` is the block index it starts at."""
        # `global` is a Python keyword, so the operand goes in as a dict rather than a kwarg
        b = [mk(t_getglobal, **{"dst": R_STR, "global": s_id}),
             mk(t_call1, dst=R_ROW, fun=GETID_FX, arg0=R_STR)]
        if at == 0:
            # `Invalid` is resolved once, above both gates; R_ROW already holds this road's row
            b += [mk(t_getglobal, **{"dst": R_STR, "global": g_inv}),
                  mk(t_call1, dst=R_BND, fun=GETID_FX, arg0=R_STR)]
        # skip the road when the id did not resolve -- an unauthored id comes back `Invalid`
        b.append(mk(t_jeq, a=R_ROW, b=R_BND, offset=skip_to - (at + len(b) + 1)))
        b += [mk(t_getthis, dst=R_OWN, field=F_OWNER),
              mk(t_nullck, reg=R_OWN)]
        if use_filter:
            b += [mk(t_mov, dst=R_TMP, src=R_FILTER),
                  mk(t_ref, dst=R_REF, src=R_TMP)]
        else:
            b.append(mk(t_null, dst=R_REF))
        b += [mk(t_null, dst=R_FAC),
              mk(t_call4, dst=R_VAL, fun=ATB_FX, arg0=R_OWN, arg1=R_ROW, arg2=R_REF, arg3=R_FAC),
              mk(t_add, dst=R_ACC, a=R_ACC, b=R_VAL)]
        return b

    r1 = road(g_all, False, 11, 0)
    _guard(len(r1) == 11, "road 1 is %d ops, its jump was computed for 11" % len(r1))
    r2 = road(g_one, True, 21, 11)
    _guard(len(r2) == 10, "road 2 is %d ops, its jump was computed for 10" % len(r2))
    block = r1 + r2
    _guard(len(block) == 21, "block length changed without its jump offsets")
    jeqs = [i for i, o in enumerate(block) if o.op == "JEq"]
    _guard(jeqs == [4, 13], "the two gates are at %s, not [4, 13]" % jeqs)
    for i, want in ((4, 11), (13, 21)):
        t = i + 1 + _gv(block[i].df["offset"])
        _guard(t == want,
               "block op%d jumps to %d, not to %d -- the end of its own road" % (i, t, want))

    K, preds = splice(fn, C, block, "W42 HostLimit attributes")
    _guard(K == 21, "spliced %d ops, expected 21" % K)
    _guard(any(p[0] in ("jump", "fallthrough") for p in preds),
           "the block at op%d has no predecessor -- it would be dead code" % C)

    # ---- (8) verify the change landed, fenced to OUR block (group E) ------------------------
    blk = fn.ops[C:C + K]
    _guard([o.op for o in blk] == (
        ["GetGlobal", "Call1", "GetGlobal", "Call1", "JEq",
         "GetThis", "NullCheck", "Null", "Null", "Call4", "Add"]
        + ["GetGlobal", "Call1", "JEq", "GetThis", "NullCheck", "Mov", "Ref", "Null",
           "Call4", "Add"]),
        "the spliced block is not the shape that was written: %s" % [o.op for o in blk])
    _guard(_gv(blk[0].df["global"]) == g_all and _gv(blk[11].df["global"]) == g_one,
           "the spliced reads do not name %r and %r" % (ID_ALL, ID_ONE))
    _guard(_gv(blk[2].df["global"]) == g_inv,
           "the boundary is not resolved from the %r row" % ID_INVALID)
    _guard(bc.strings.value[s_all] == ID_ALL and bc.strings.value[s_one] == ID_ONE,
           "the id strings did not land in the pool")
    _guard(all(_gv(o.df["fun"]) == GETID_FX for o in (blk[1], blk[3], blk[12])),
           "a road does not call the id resolver")
    _guard(not any(o.op == "Int" for o in blk),
           "an Int survived in the block -- a baked position is exactly what this removed")
    _guard(all(_gv(o.df["fun"]) == ATB_FX for o in (blk[9], blk[19])),
           "a road does not call %s" % ATB_NAME)
    _guard(all(_gv(o.df["dst"]) == R_ACC and _gv(o.df["a"]) == R_ACC for o in (blk[10], blk[20])),
           "a road does not add into the accumulator")
    _guard(_gv(blk[17].df["src"]) == R_TMP and _gv(blk[16].df["src"]) == R_FILTER,
           "the TBuilding road does not pass the target filter")
    _guard(fn.ops[C + K].op == "ToSFloat" and _gv(fn.ops[C + K].df["src"]) == R_BASE,
           "the block did not land immediately before the final add")
    _guard(len(fn.ops) == N_OPS + K, "op count is %d, expected %d" % (len(fn.ops), N_OPS + K))

    if verbose:
        print("    W42: %s +%d ops at op%d; `%s` / `%s` add to the per-host limit "
              "(predecessors: %s)" % (TARGET, K, C, ID_ALL, ID_ONE, [p[0] for p in preds]))
    return "W42 HostLimit attributes: %s %d -> %d ops" % (TARGET, N_OPS, len(fn.ops))
