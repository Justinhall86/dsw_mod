#!/usr/bin/env python3
"""`building.props.hostLimit` sets how many of one building any host may hold."""
import os
import sys
from copy import deepcopy

HERE = os.path.dirname(os.path.abspath(__file__))
for _p in (HERE, os.path.join(os.path.dirname(os.path.dirname(HERE)), "lib")):
    if _p not in sys.path:
        sys.path.insert(0, _p)

from armoury_lib import _guard, by_name, str_ref            # noqa: E402
from armoury_charge import splice                               # noqa: E402
from crashlink import disasm                            # noqa: E402

TARGET = "logic.Upgrades.getIsolatedLimit"
COLUMN = "hostLimit"
PROPS = "props"
# pristine op count; the join of every road into the base, before the village gate; base; row
N_OPS = 125
C = 50
R_BASE = 14
R_ROW = 2


def apply_w41(bc, verbose=True):
    fn = by_name(bc, TARGET)
    ops = fn.ops
    _guard(len(ops) == N_OPS,
           "%s should have %d ops, has %d -- the game or an earlier pass moved it"
           % (TARGET, N_OPS, len(ops)))
    _guard(not any(o.op == "Switch" for o in ops),
           "a Switch in %s would need its own offset fix-up" % TARGET)

    # (1) r2 is the row as a Dyn, before its ToVirtual narrowing
    tv = [i for i, o in enumerate(ops)
          if o.op == "ToVirtual" and o.df["src"].value == R_ROW]
    _guard(len(tv) == 2, "expected the row Dyn r%d to be narrowed twice, found %s" % (R_ROW, tv))
    for i in tv:
        _guard(ops[i - 1].op.startswith("Call") and ops[i - 1].df["dst"].value == R_ROW,
               "op%d's ToVirtual is not fed by the byId lookup" % i)
    last_write = max(tv) - 1
    _guard(disasm.type_name(bc, fn.regs[R_ROW].resolve(bc)) == "Dyn",
           "r%d is %s, not Dyn -- a Field-typed register cannot see an added column"
           % (R_ROW, disasm.type_name(bc, fn.regs[R_ROW].resolve(bc))))

    # (2) the row register survives from its last write to the splice point
    for i in range(last_write + 1, C):
        d = ops[i].df.get("dst")
        _guard(not (d is not None and getattr(d, "value", None) == R_ROW),
               "the row register r%d is overwritten at op%d -- re-look the row up instead"
               % (R_ROW, i))

    # (3) op38 is the default base, and C is the join every road reaches.
    _guard(ops[38].op == "Int" and ops[38].df["dst"].value == R_BASE,
           "op38 is %s, not the `Int -> r%d` default base" % (ops[38].op, R_BASE))
    joins = [i for i, o in enumerate(ops[:C])
             if o.op in ("JNull", "JNotNull", "JAlways", "JFalse", "JTrue")
             and i + 1 + o.df["offset"].value == C]
    _guard(len(joins) == 2,
           "expected TWO jumps into the base join at op%d (row-null and column-absent), found %s"
           % (C, joins))
    _guard(ops[C - 1].df.get("dst") is not None and ops[C - 1].df["dst"].value == R_BASE,
           "op%d does not write the base register -- op%d is not the join it was read as"
           % (C - 1, C))

    # (4) the base register is an int register, proved by the game writing an `Int` into it
    _guard(any(o.op == "Int" and o.df["dst"].value == R_BASE for o in ops),
           "no `Int` op writes r%d in %s, so it cannot be assumed to be an int register"
           % (R_BASE, TARGET))

    # (5) the file-wide int pool's index for 0; this function holds no zero constant
    zero_idx = [i for i, v in enumerate(bc.ints) if getattr(v, "value", v) == 0]
    _guard(zero_idx, "the int pool has no 0 -- cannot emit the comparison")
    i_zero = zero_idx[0]
    tpl_int = next((o for f in bc.functions for o in f.ops if o.op == "Int"), None)
    _guard(tpl_int is not None, "no Int op anywhere in the file to clone")

    tpl_dynget = next((o for f in bc.functions for o in f.ops if o.op == "DynGet"), None)
    _guard(tpl_dynget is not None, "no DynGet anywhere in the file to clone")
    tpl_jnull = next(o for o in ops if o.op == "JNull")
    tpl_jsgte = next((o for f in bc.functions for o in f.ops if o.op == "JSGte"), None)
    _guard(tpl_jsgte is not None, "no JSGte anywhere in the file to clone")
    tpl_mov = next((o for f in bc.functions for o in f.ops if o.op == "Mov"), None)
    _guard(tpl_mov is not None, "no Mov anywhere in the file to clone")

    # one Dyn register cloned from the row, two I32 cloned from the base
    base_reg = len(fn.regs)
    fn.regs.append(deepcopy(fn.regs[R_ROW]))
    fn.regs.append(deepcopy(fn.regs[R_BASE]))
    fn.regs.append(deepcopy(fn.regs[R_BASE]))
    R_PROPS, R_HL, R_ZERO = base_reg, base_reg + 1, base_reg + 2
    fn.nregs.value = len(fn.regs)

    s_props, s_col = str_ref(bc, PROPS), str_ref(bc, COLUMN)

    def mk(tpl, **df):
        o = deepcopy(tpl)
        for k, v in df.items():
            _guard(k in o.df, "%s has no operand %r" % (o.op, k))
            o.df[k].value = v
        return o

    # hostLimit is read into an I32 so an absent column is 0; only a value > 0 replaces the base
    block = [
        mk(tpl_dynget, dst=R_PROPS, obj=R_ROW, field=s_props),
        mk(tpl_jnull, reg=R_PROPS, offset=4),
        mk(tpl_dynget, dst=R_HL, obj=R_PROPS, field=s_col),
        mk(tpl_int, dst=R_ZERO, ptr=i_zero),
        mk(tpl_jsgte, a=R_ZERO, b=R_HL, offset=1),
        mk(tpl_mov, dst=R_BASE, src=R_HL),
    ]
    _guard(len(block) == 6, "block length changed without its jump offsets")

    K, preds = splice(fn, C, block, "W41 hostLimit")
    _guard(K == 6, "spliced %d ops, expected 6" % K)
    _guard(any(p[0] == "jump" for p in preds),
           "the block at op%d has no jump predecessor -- the two absent-cases would skip it" % C)

    # verify the change landed, looking only at our block
    blk = fn.ops[C:C + K]
    _guard([o.op for o in blk] == ["DynGet", "JNull", "DynGet", "Int", "JSGte", "Mov"],
           "the spliced block is not the shape that was written: %s" % [o.op for o in blk])
    _guard(blk[0].df["field"].value == s_props and blk[2].df["field"].value == s_col,
           "the spliced reads do not name %r and %r" % (PROPS, COLUMN))
    _guard(blk[5].df["dst"].value == R_BASE, "the block does not write the base register")
    _guard(len(fn.ops) == N_OPS + K, "op count is %d, expected %d" % (len(fn.ops), N_OPS + K))
    _guard(bc.strings.value[s_col] == COLUMN, "the %r string did not land" % COLUMN)

    if verbose:
        print("    W41: %s +%d ops at op%d; `props.%s` overrides the base limit for ANY host "
              "(predecessors: %s)" % (TARGET, K, C, COLUMN, [p[0] for p in preds]))
    return "W41 hostLimit: %s %d -> %d ops" % (TARGET, N_OPS, len(fn.ops))
