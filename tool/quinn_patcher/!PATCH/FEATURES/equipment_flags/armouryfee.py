#!/usr/bin/env python3
"""The remove fee is the removed item's `props.cost`, else the global fee; none for costToEquip."""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

from armoury_lib import _guard, by_name, op, str_ref, PROPS_FIELD, FLAG_FIELD   # noqa: E402
from armoury_charge import splice                                  # noqa: E402
from slotprice import _fld                                     # noqa: E402
from crashlink import disasm                               # noqa: E402
from crashlink.core import VarInt, Reg, fIndex, strRef     # noqa: E402
from copy import deepcopy                                  # noqa: E402

TARGET = "logic.faction.Equipments.getRemoveCost"
# the global fee, the props.cost reader, and the game's own lookup idiom feeding that reader
FLATFN = "$HUnit.getRemoveCost"
ROWFN = "$HUnit.getEquipmentCost"
DONOR = "ent.Army.implAddEquipment"
MAPGET = "haxe.ds.StringMap.get"

PRISTINE_OPS = 957


def _only(hits, what):
    _guard(len(hits) == 1, "expected exactly ONE %s, found %d %s" % (what, len(hits), hits))
    return hits[0]


def _writer(fn, upto, reg, what):
    """The last op below `upto` that writes `reg`."""
    hits = [i for i in range(upto) if fn.ops[i].df.get("dst") is not None
            and fn.ops[i].df["dst"].value == reg]
    _guard(hits, "nothing writes r%d before op%d (%s)" % (reg, upto, what))
    return hits[-1]


def _field_name(bc, fn, i):
    import re
    m = re.search(r'"([^"]+)"', disasm.fmt_op_compact(bc, fn.regs, fn.ops[i], i, func=fn))
    return m.group(1) if m else None


def _append_vanilla_copy(bc, src, verbose=True):
    """A verbatim copy of `src` at a fresh findex, out of reach of a later pass patching `src`."""
    _guard(len(src.ops) == 42, "the copy must be taken from the PRISTINE %s (42 ops), got %d -- "
                               "apply_w39 must run BEFORE apply_w30d" % (ROWFN, len(src.ops)))
    findexes = [getattr(f.findex, "value", f.findex) for f in bc.functions] + \
               [getattr(n.findex, "value", n.findex) for n in bc.natives]
    new_ix = max(findexes) + 1
    _guard(len(set(findexes)) == len(findexes), "the findex space has duplicates before we add one")
    _guard(new_ix == len(findexes), "the findex space is not dense (%d entries, max+1 = %d) -- "
                                    "appending would leave a hole" % (len(findexes), new_ix))
    clone = deepcopy(src)
    clone.findex.value = new_ix
    bc.functions.append(clone)
    bc.nfunctions.value = len(bc.functions)
    if hasattr(bc, "invalidate_findex_cache"):
        bc.invalidate_findex_cache()
    _guard(len(clone.ops) == len(src.ops) and len(clone.regs) == len(src.regs),
           "the copy is not op- and register-identical to its source")
    # a copy answering to the original's name would make every `by_name` find two
    named = [f for f in bc.functions if disasm.full_func_name_str(bc, f) == ROWFN]
    _guard(len(named) == 1, "the appended copy also answers to %r (%d matches) -- every by_name in "
                            "this line would now be ambiguous" % (ROWFN, len(named)))
    if verbose:
        print("W39: appended a vanilla copy of %s as f@%d (%d ops), so no later pass on it can "
              "reach the removal price" % (ROWFN, new_ix, len(clone.ops)))
    return clone


def apply_w39(bc, verbose=True):
    fn = by_name(bc, TARGET)
    flat = by_name(bc, FLATFN)
    rowfn = by_name(bc, ROWFN)
    donor = by_name(bc, DONOR)
    mapget = by_name(bc, MAPGET)
    # our own copy, so no later pass on the shared builder ever prices a removal
    ourcost = _append_vanilla_copy(bc, rowfn, verbose=verbose)
    ops = fn.ops
    _guard(len(ops) == PRISTINE_OPS,
           "f@%d should be the pristine %d ops (nothing else in this line touches it), has %d"
           % (fn.findex.value, PRISTINE_OPS, len(ops)))

    # ---- the splice point: the ONE call to the flat global fee ------------------------------
    C = _only([i for i, o in enumerate(ops)
               if o.op == "Call0" and getattr(o.df.get("fun"), "value", None) == flat.findex.value],
              "call to %s in f@%d" % (FLATFN, fn.findex.value))
    R_COST = ops[C].df["dst"].value

    # ---- the id of the equipment ACTUALLY IN THE SLOT, sitting right above us ---------------
    _guard(ops[C - 1].op == "JNull", "op%d above the fee call is %s, not the empty-slot test"
                                     % (C - 1, ops[C - 1].op))
    R_ID = ops[C - 1].df["reg"].value
    _guard(ops[C - 2].op == "UnsafeCast" and ops[C - 2].df["dst"].value == R_ID,
           "the slot id is not produced by the UnsafeCast at op%d" % (C - 2))
    _guard(disasm.type_name(bc, fn.regs[R_ID].resolve(bc)) == "String",
           "the slot id register is %s, not String"
           % disasm.type_name(bc, fn.regs[R_ID].resolve(bc)))
    # vanilla's empty-slot jump must clear BOTH original ops, or an empty slot would be priced
    _guard((C - 1) + 1 + ops[C - 1].df["offset"].value == C + 2,
           "the empty-slot test does not jump past the fee and its append")

    # ---- the donor idiom, resolved backwards from ITS OWN getEquipmentCost call -------------
    d = donor.ops
    d_cost = _only([i for i, o in enumerate(d)
                    if o.op == "Call1"
                    and getattr(o.df.get("fun"), "value", None) == rowfn.findex.value],
                   "call to %s in the donor" % ROWFN)
    D_ROW = d[d_cost].df["arg0"].value
    d_tv = _writer(donor, d_cost, D_ROW, "the donor's ToVirtual")
    _guard(d[d_tv].op == "ToVirtual", "the donor's row comes from %s, not a ToVirtual" % d[d_tv].op)
    D_DYN = d[d_tv].df["src"].value
    d_get = _writer(donor, d_tv, D_DYN, "the donor's map lookup")
    _guard(d[d_get].op == "Call2" and d[d_get].df["fun"].value == mapget.findex.value,
           "the donor's row is not fetched with StringMap.get")
    D_MAP, D_KEY = d[d_get].df["arg0"].value, d[d_get].df["arg1"].value
    _guard(disasm.type_name(bc, donor.regs[D_KEY].resolve(bc)) == "String",
           "the donor looks the row up by something other than a String")
    d_byid = _writer(donor, d_get, D_MAP, "the donor's byId read")
    _guard(d[d_byid].op == "Field", "byId does not come from a Field")
    D_IDX = d[d_byid].df["obj"].value
    d_sheet = _writer(donor, d_byid, D_IDX, "the donor's sheet read")
    _guard(d[d_sheet].op == "Field", "the sheet does not come from a Field")
    D_DATA = d[d_sheet].df["obj"].value
    d_glob = _writer(donor, d_sheet, D_DATA, "the donor's $Data")
    _guard(d[d_glob].op == "GetGlobal", "$Data does not come from a GetGlobal")

    # CDB_METHODS pitfall 7: checked BY FIELD NAME, or the price comes off the wrong sheet
    _guard(_field_name(bc, donor, d_sheet) == "equipment",
           "the donor's sheet field is %r, not 'equipment'" % _field_name(bc, donor, d_sheet))
    _guard(_field_name(bc, donor, d_byid) == "byId",
           "the donor's map field is %r, not 'byId'" % _field_name(bc, donor, d_byid))
    _guard(disasm.type_name(bc, donor.regs[d[d_cost].df["dst"].value].resolve(bc))
           == disasm.type_name(bc, fn.regs[R_COST].resolve(bc)),
           "%s returns %s but our cost register is %s" %
           (ROWFN, disasm.type_name(bc, donor.regs[d[d_cost].df["dst"].value].resolve(bc)),
            disasm.type_name(bc, fn.regs[R_COST].resolve(bc))))

    # ---- templates, every one taken from a real op that produces the value ------------------
    t_len = _fld(bc, fn, "length", "I32", "hl.types.ArrayObj")
    t_int0 = _only([o for o in fn.ops if o.op == "Int"
                    and getattr(bc.ints[o.df["ptr"].value], "value",
                                bc.ints[o.df["ptr"].value]) == 0][:1],
                   "Int 0 template in f@%d" % fn.findex.value)
    t_jslt = _only([o for o in donor.ops if o.op == "JSLt"][:1], "JSLt template in the donor")
    t_jnull = _only([o for o in fn.ops if o.op == "JNull"][:1],
                    "JNull template in f@%d" % fn.findex.value)

    N = _regs(bc, fn, [donor.regs[r] for r in (D_DATA, D_IDX, D_MAP, D_DYN, D_ROW)], t_len)
    tpl = dict(glob=d[d_glob], sheet=d[d_sheet], byid=d[d_byid], get=d[d_get], tv=d[d_tv],
               cost=d[d_cost], len=t_len, int0=t_int0, jslt=t_jslt, jnull=t_jnull, our=ourcost)
    N.update(ID=R_ID, COST=R_COST)
    block = _block(bc, tpl, N)
    K = len(block)
    n, preds = splice(fn, C, block, "W39 per-equipment remove cost")
    _guard(n == K, "block length changed")
    _check(fn, C, K, N, dict(preds=preds, our=ourcost, rowfn=rowfn, flat=flat))
    if verbose:
        print("W39: %d ops at op%d of f@%d (now %d ops, %d regs); the fee is the removed item's "
              "props.cost (none for costToEquip), else Army_Equipment_RemoveCost; preds %s"
              % (K, C, fn.findex.value, len(fn.ops), len(fn.regs), preds))
    return fn


def _regs(bc, fn, donor_regs, t_len):
    """Our own registers, typed from the ops that produce each value."""
    t_int = fn.regs[t_len.df["dst"].value]
    t_bool = next(r for f in bc.functions for r in f.regs
                  if disasm.type_name(bc, r.resolve(bc)) == "Bool")
    base = len(fn.regs)
    for src in donor_regs + [t_int, t_int, donor_regs[3], t_bool]:
        fn.regs.append(deepcopy(src))
    fn.nregs = VarInt(len(fn.regs))
    names = ("DATA", "IDX", "MAP", "DYN", "ROW", "LEN", "ZERO", "PROPS", "FLAG")
    return dict(zip(names, range(base, base + len(names))))


def _block(bc, t, N):
    """Row lookup; a costToEquip row skips the fee and its append; else its own cost if any."""
    dg = next(o for f in bc.functions for o in f.ops if o.op == "DynGet")

    def clone(tp, **kw):
        o = deepcopy(tp)
        for k, v in kw.items():
            o.df[k] = Reg(v) if isinstance(v, int) else v
        return o

    def dynget(dst, obj, s):
        return clone(dg, dst=dst, obj=obj, field=strRef(str_ref(bc, s)))
    R_ID, R_COST, ourcost = N["ID"], N["COST"], t["our"]
    K = 17
    block = [
        clone(t["glob"], dst=N["DATA"]),
        clone(t["sheet"], dst=N["IDX"], obj=N["DATA"]),
        op("NullCheck", reg=Reg(N["IDX"])),
        clone(t["byid"], dst=N["MAP"], obj=N["IDX"]),
        op("NullCheck", reg=Reg(N["MAP"])),
        clone(t["get"], dst=N["DYN"], arg0=N["MAP"], arg1=R_ID),
        clone(t["jnull"], reg=N["DYN"], offset=VarInt(K - 7)),                     # 6 -> fallback
        dynget(N["PROPS"], N["DYN"], PROPS_FIELD),
        clone(t["jnull"], reg=N["PROPS"], offset=VarInt(2)),                       # 8 -> its cost
        dynget(N["FLAG"], N["PROPS"], FLAG_FIELD),
        op("JTrue", cond=Reg(N["FLAG"]), offset=VarInt(K + 2 - 11)),               # 10 -> no fee
        clone(t["tv"], dst=N["ROW"], src=N["DYN"]),
        clone(t["cost"], dst=R_COST, arg0=N["ROW"], fun=fIndex(ourcost.findex.value)),
        op("NullCheck", reg=Reg(R_COST)),
        clone(t["len"], dst=N["LEN"], obj=R_COST),
        clone(t["int0"], dst=N["ZERO"]),
        clone(t["jslt"], a=N["ZERO"], b=N["LEN"], offset=VarInt(K - 16)),          # 16 -> past it
    ]
    # no emitted conditional may decide nothing (§6j): a zero offset is its own fall-through
    for i, o in enumerate(block):
        if o.df.get("offset") is not None and o.op != "JAlways":
            _guard(o.df["offset"].value != 0, "W39 block op%d is a branch that decides nothing" % i)
    return block


def _check(fn, C, K, N, ctx):
    """Assert what the branches SEPARATE, never only where they land."""
    R, R_COST, preds = fn.ops, N["COST"], ctx["preds"]
    ourcost, rowfn, flat = ctx["our"], ctx["rowfn"], ctx["flat"]
    N_DYN, N_PROPS, N_FLAG, N_ZERO, N_LEN = (N[k] for k in ("DYN", "PROPS", "FLAG", "ZERO", "LEN"))
    _guard(len(R) == PRISTINE_OPS + K, "f@%d is %d ops, expected %d"
           % (fn.findex.value, len(R), PRISTINE_OPS + K))
    _guard(R[C + 6].op == "JNull" and R[C + 6].df["reg"].value == N_DYN,
           "op6 is not the missing-row test")
    _guard(C + 6 + 1 + R[C + 6].df["offset"].value == C + K,
           "a row the cdb does not know must fall back to the global fee")
    _guard(C + 8 + 1 + R[C + 8].df["offset"].value == C + 11 and R[C + 11].op == "ToVirtual",
           "a row the cdb DOES know must fall through to its own cost, not to the fee")
    _guard(R[C + 10].op == "JTrue" and C + 10 + 1 + R[C + 10].df["offset"].value == C + K + 2,
           "a costToEquip row must skip both the fee and its append")
    _guard(R[C + 12].op == "Call1" and R[C + 12].df["fun"].value == ourcost.findex.value,
           "the removal price must ask OUR vanilla copy, never the shared builder")
    _guard(R[C + 12].df["fun"].value != rowfn.findex.value,
           "the removal price is still reading through the shared builder")
    _guard(C + 16 + 1 + R[C + 16].df["offset"].value == C + K + 1,
           "a row WITH its own cost must SKIP the global fee")
    _guard(R[C + K].op == "Call0" and R[C + K].df["fun"].value == flat.findex.value
           and R[C + K].df["dst"].value == R_COST,
           "the original global-fee call is not where the fallback lands")
    _guard(R[C + K + 1].op == "Call2" and R[C + K + 1].df["arg1"].value == R_COST,
           "the append does not consume the cost register")
    _guard((C - 1) + 1 + R[C - 1].df["offset"].value == C + K + 2,
           "the empty-slot test was not re-targeted past the whole block")
    # every register a gate reads is written ABOVE it, inside the block (GOTCHAS group F)
    for gate, regs in ((6, (N_DYN,)), (8, (N_PROPS,)), (10, (N_FLAG,)), (16, (N_ZERO, N_LEN))):
        for r in regs:
            _guard(any(R[C + j].df.get("dst") is not None and R[C + j].df["dst"].value == r
                       for j in range(gate)),
                   "the gate at block op%d reads r%d, which nothing above it assigns" % (gate, r))
    _guard(not any(("jump", i, o) for (kind, i, o) in preds if kind == "jump"),
           "something jumps INTO the W39 block: %s" % preds)


if __name__ == "__main__":
    print(__doc__)
    print("This module is applied by the build; it does not build on its own.")
