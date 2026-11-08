#!/usr/bin/env python3
"""One walk of the input rows fires ability keys, named or numbered, skipping claimed ones."""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import abilitykeys                                                   # noqa: E402
from abilitykeys import _int_pool_ref, _no_dead_branches, _mint_string_global   # noqa: E402
from keycancel import fld, _input_walk_templates, _reg_of, _check_operands, _Blk, \
    ABILITY_COLUMN, ARRO, BTN, COMPARE                           # noqa: E402
from armoury_lib import _guard, by_name, op                          # noqa: E402
from armoury_charge import splice                                        # noqa: E402
from loops_lib import resolve, label, header                      # noqa: E402
from crashlink import disasm                                     # noqa: E402
from crashlink.opcodes import opcodes                            # noqa: E402
from crashlink.core import VarInt, Reg, fIndex                   # noqa: E402
from copy import deepcopy                                        # noqa: E402

HOLD = "HoldPosition"
OBJ = "h2d.Object"
TYPECHECK = "hl.BaseType.check"
TYPEDONOR = "ui.comp.EntityRefundButton.isVillage"
UNIT = "ent.Unit"
FAMILY = "Ability"          # the family token -- a RULE, minted once, never a row

FAMILY_GLOBAL = None        # set by apply_w38; `keycancel`'s cancel reads the SAME prepared token
STRFNS = ("String.indexOf", "String.substr", "String.charCodeAt")
DEPLOY_GETTERS = ("_Data.$Unit_props_Impl_.get_deployAbility",
                  "_Data.$Unit_props_Impl_.get_undeployAbility",
                  "_Data.$Unit_props_Impl_.get_undeployCancelAbility")


def _string_calls(bc):
    """Templates for the three string helpers, each CLONED FROM THE GAME'S OWN CALL."""
    out = {}
    for name in STRFNS:
        fi = by_name(bc, name).findex.value
        # direct calls only: `CallClosure`'s `fun` operand is a register, not a findex
        DIRECT = ("Call0", "Call1", "Call2", "Call3", "Call4", "CallN")
        site = next(((f, o) for f in bc.functions for o in (f.ops or [])
                     if o.op in DIRECT and getattr(o.df.get("fun"), "value", None) == fi), None)
        _guard(site is not None,
               "nothing in the game calls %s, so there is no arity to copy" % name)
        f, o = site
        out[name] = (deepcopy(o), deepcopy(f.regs[o.df["dst"].value]))
    return out


def _selected_units(bc, fn):
    """The game's own road to the selected units; `button.entity` holds a faction or a group."""
    gm = next((o for o in fn.ops if o.op == "Call1"
               and disasm.type_name(bc, fn.regs[o.df["dst"].value].resolve(bc)) == "Game"
               and disasm.type_name(bc, fn.regs[o.df["arg0"].value].resolve(bc)) == BTN), None)
    _guard(gm is not None, "this routine no longer gets the Game from the button -- vanilla's own "
                           "HoldPosition block in it is where that call is cloned from")
    keys = by_name(bc, "Game.updateKeys")
    sel = next((o for o in keys.ops if o.op == "Call1"
                and disasm.type_name(bc, keys.regs[o.df["dst"].value].resolve(bc)) == ARRO
                and disasm.type_name(bc, keys.regs[o.df["arg0"].value].resolve(bc)) == "ui.GameUI"),
               None)
    _guard(sel is not None, "Game.updateKeys no longer asks the interface for the selected units")
    r_game = deepcopy(fn.regs[gm.df["dst"].value])
    r_ui = deepcopy(keys.regs[sel.df["arg0"].value])
    return deepcopy(gm), deepcopy(sel), r_game, r_ui


def _typetest(bc):
    """The game's own "is this object of this class?" test; never read through an unproven cast."""
    chk = by_name(bc, TYPECHECK)
    donor = by_name(bc, TYPEDONOR)
    ci = next((i for i, o in enumerate(donor.ops)
               if o.op == "Call2" and getattr(o.df.get("fun"), "value", None) == chk.findex.value),
              None)
    _guard(ci is not None, "%s no longer asks %s -- the type test this clones has moved"
           % (TYPEDONOR, TYPECHECK))
    a0 = donor.ops[ci].df["arg0"].value
    gi = next((i for i in range(ci - 1, -1, -1)
               if donor.ops[i].op == "GetGlobal" and donor.ops[i].df["dst"].value == a0), None)
    _guard(gi is not None, "the class the test is given does not come from a prepared global")
    return (deepcopy(donor.ops[gi]), deepcopy(donor.ops[ci]),
            deepcopy(donor.regs[a0]), deepcopy(donor.regs[donor.ops[ci].df["arg1"].value]),
            deepcopy(donor.regs[donor.ops[ci].df["dst"].value]), chk.findex.value)


def field_from_type(bc, objtype, name, donor_field_op):
    """The field index from the type's own declaration, which holds fields no op reads."""
    t = None
    for x in bc.types:
        try:
            if disasm.type_name(bc, x) == objtype:
                t = x
                break
        except Exception:
            continue
    _guard(t is not None, "no type named %r" % objtype)
    flds = t.definition.resolve_fields(bc)
    hits = [(i, f) for i, f in enumerate(flds) if f.name.resolve(bc) == name]
    _guard(len(hits) == 1, "%r declares %d fields called %r" % (objtype, len(hits), name))
    i, f = hits[0]
    o = deepcopy(donor_field_op)
    o.df["field"] = type(donor_field_op.df["field"])(i)
    reg = _reg_of(bc, disasm.type_name(bc, f.type.resolve(bc)))
    return o, reg


def field_by_either(bc, name, objtype, donor_field_op):
    """A `Field <objtype>.name` op, resolved from reads by `Field` or by `GetThis`."""
    import re as _re
    idx = set()
    for f in bc.functions:
        for i, o in enumerate(f.ops or []):
            if o.op == "Field":
                obj = o.df.get("obj")
                if obj is None:
                    continue
                try:
                    if disasm.type_name(bc, f.regs[obj.value].resolve(bc)) != objtype:
                        continue
                except Exception:
                    continue
            elif o.op == "GetThis":
                if not f.regs:
                    continue
                try:
                    if disasm.type_name(bc, f.regs[0].resolve(bc)) != objtype:
                        continue
                except Exception:
                    continue
            else:
                continue
            try:
                m = _re.search(r'"([^"]+)"', disasm.fmt_op_compact(bc, f.regs, o, i, func=f))
            except Exception:
                continue
            if m and m.group(1) == name:
                idx.add(o.df["field"].value)
                dst = f.regs[o.df["dst"].value]
    _guard(idx, "no read of `%s.%s` anywhere, by Field or by GetThis" % (objtype, name))
    _guard(len(idx) == 1, "`%s.%s` resolves to more than one field index: %s"
           % (objtype, name, sorted(idx)))
    o = deepcopy(donor_field_op)
    o.df["field"] = type(donor_field_op.df["field"])(idx.pop())
    return o, dst


def _class_global(bc, tname):
    """The global holding a CLASS. Guarded to one, and never minted."""
    hits = []
    for g, t in enumerate(bc.global_types):
        try:
            n = disasm.type_name(bc, t.resolve(bc))
        except Exception:
            continue
        if n == tname:
            hits.append(g)
    _guard(len(hits) == 1, "expected exactly one global typed %r, found %s" % (tname, hits))
    return hits[0]


def string_global(bc, s):
    """The existing global holding `s`, through the constant table; nothing is minted."""
    hits = []
    for c in bc.constants:
        try:
            if disasm.type_name(bc, bc.global_types[c._global.value].resolve(bc)) != "String":
                continue
        except Exception:
            continue
        for f in c.fields:
            v = getattr(f, "value", f)
            if isinstance(v, int) and 0 <= v < len(bc.strings.value) and bc.strings.value[v] == s:
                hits.append(c._global.value)
                break
    _guard(len(hits) == 1,
           "expected exactly one prepared global holding %r, found %s" % (s, hits))
    return hits[0]


def apply_w38(bc, verbose=True):
    _check_operands()
    _guard(set(opcodes.get("JEq", {})) == {"a", "b", "offset"},
           "JEq's operands are %s, not (a, b, offset)" % sorted(opcodes.get("JEq", {})))
    _guard(abilitykeys.W33 is not None, "apply_w33(emit=False) must run first -- this clones its "
                                    "templates and its slot names")
    W = abilitykeys.W33
    _guard(W["K"] == 0,
           "apply_w33 EMITTED. This walk replaces those blocks; run it with emit=False")
    fn = W["fn"]
    NAMES, GLOBALS = W["NAMES"], W["GLOBALS"]
    _guard(len(NAMES) == len(GLOBALS), "a slot name has no prepared global")
    N = len(NAMES)     # reported only; nothing below depends on it
    cmp_fn = by_name(bc, COMPARE)
    g_hold = string_global(bc, HOLD)
    (t_data, t_input, t_all, t_cast, t_tovirt,
     r_data, r_idx, r_alld, r_all, r_row, ROWT) = _input_walk_templates(bc)
    t_inf, r_inf = fld(bc, "inf", BTN)
    ABT = disasm.type_name(bc, r_inf.resolve(bc))
    t_abid, r_str = fld(bc, "id", ABT)
    t_rowid, _ = fld(bc, "id", ROWT)
    t_len, r_i32 = fld(bc, "length", ARRO)
    t_raw, r_raw = fld(bc, "array", ARRO)
    r_dyn = _reg_of(bc, "Dyn")
    r_arro = _reg_of(bc, ARRO)
    dg = next(o for f in bc.functions for o in f.ops if o.op == "DynGet")
    zero = next(o for o in fn.ops if o.op == "Int")
    t_cls, t_check, r_cls, r_obj_arg, r_chkok, chk_fi = _typetest(bc)
    g_btncls = _class_global(bc, "ui.comp.$" + BTN.split(".")[-1])
    # the acting unit's three deploy columns, through the game's getters, exclude their abilities
    g_unitcls = _class_global(bc, "ent.$" + UNIT.split(".")[-1])
    SC = _string_calls(bc)
    t_idxof, r_i32b = SC["String.indexOf"]
    t_ccat, r_null = SC["String.charCodeAt"]
    t_slen, _r2 = field_from_type(bc, "String", "length", t_inf)
    r_nullarg = _reg_of(bc, disasm.type_name(
        bc, fn.regs[0].resolve(bc))) if False else deepcopy(r_null)
    global FAMILY_GLOBAL
    g_family = _mint_string_global(bc, FAMILY + "_", verbose)
    FAMILY_GLOBAL = g_family      # the cancel reuses this one, so the pool holds no duplicate
    _guard(set(opcodes.get("Mov", {})) == {"dst", "src"}, "Mov's operands changed")
    for k2 in ("Mul", "Add", "Sub"):
        _guard(set(opcodes.get(k2, {})) == {"dst", "a", "b"}, "%s's operands changed" % k2)
    t_game, t_sel, r_game, r_ui = _selected_units(bc, fn)
    t_gameui, _r = field_from_type(bc, "Game", "ui", t_inf)
    # vanilla's key gates, plus any open window, which is what catches a confirm dialog
    t_wins, r_wins = field_from_type(bc, "ui.GameUI", "windows", t_inf)
    _guard(disasm.type_name(bc, r_wins.resolve(bc)) == ARRO, "`ui.GameUI.windows` is not a list")
    blk1 = by_name(bc, "ui.BaseUI.anyBlockingHightPriorityInputsWindow")
    blk2 = by_name(bc, "ui.GameUI.anyBlockingWindow")
    t_uinf, r_uinf = fld(bc, "inf", UNIT)
    UNITT = disasm.type_name(bc, r_uinf.resolve(bc))
    t_uprops, r_uprops = fld(bc, "props", UNITT)
    PROPT = disasm.type_name(bc, r_uprops.resolve(bc))
    _guard("deployAbility" in PROPT and "undeployAbility" in PROPT,
           "the unit props this reads do not carry the deploy columns: %r" % PROPT[:120])
    DEP = [by_name(bc, g).findex.value for g in DEPLOY_GETTERS]
    _guard(set(opcodes.get("Null", {})) == {"dst"},
           "Null's operands are %s, not (dst)" % sorted(opcodes.get("Null", {})))
    base = len(fn.regs)
    # one register per name in the unpacking below, in the same order
    RT = [deepcopy(W["r_btn"]), deepcopy(r_inf), deepcopy(r_str),
          r_data, r_idx, r_alld, r_all,
          deepcopy(W["r_obj"]), deepcopy(W["r_obj"]), deepcopy(W["r_arr2"]),
          deepcopy(r_i32), deepcopy(r_i32), deepcopy(r_i32), deepcopy(r_i32),
          deepcopy(r_i32), deepcopy(r_i32), deepcopy(r_i32), deepcopy(r_i32),
          deepcopy(r_i32),
          deepcopy(r_raw), deepcopy(r_dyn), deepcopy(r_row),
          deepcopy(r_dyn), deepcopy(r_arro), deepcopy(r_dyn),
          deepcopy(r_str), deepcopy(r_str), deepcopy(r_str),
          deepcopy(r_i32),
          deepcopy(W["r_btn"]), deepcopy(r_inf),
          deepcopy(r_dyn), deepcopy(r_row), deepcopy(r_dyn), deepcopy(r_arro),
          deepcopy(r_dyn), deepcopy(r_str),
          deepcopy(W["r_bool"]), deepcopy(W["r_bool"]),
          deepcopy(W["r_bool"]), deepcopy(r_wins),
          deepcopy(W["r_fun"]), deepcopy(W["r_void"]),
          deepcopy(W["r_arr"]), deepcopy(W["r_ctx"]), deepcopy(r_str),
          deepcopy(r_cls), deepcopy(r_obj_arg), deepcopy(r_chkok),
          deepcopy(r_i32),
          deepcopy(r_str), deepcopy(r_i32), deepcopy(r_i32), deepcopy(r_i32),
          deepcopy(r_i32), deepcopy(r_i32), deepcopy(r_i32), deepcopy(r_i32),
          deepcopy(r_i32), deepcopy(r_null), deepcopy(r_i32), deepcopy(r_nullarg),
          deepcopy(r_game), deepcopy(r_ui), deepcopy(r_arro),
          deepcopy(r_uinf), deepcopy(r_uprops),
          _reg_of(bc, UNIT),
          deepcopy(r_inf), deepcopy(r_str), deepcopy(r_str), deepcopy(r_str)]
    for r in RT:
        fn.regs.append(r)
    (S_BTN, S_INF, S_MYID, S_DATA, S_IDX, S_ALLD, S_ALL, S_SELF, S_PAR, S_CH,
     S_I, S_J, S_S, S_N, S_P, S_Q, S_LEN, S_ZI, S_K,
     S_RAW, S_DYN, S_ROW, S_LISTD, S_LIST, S_EID, S_ES, S_ROWID, S_SID, S_CMP,
     S_SIB, S_SINF, S_PDYN, S_PROW, S_PLD, S_PLIST, S_QID, S_QS,
     S_OK, S_CAN, S_BLK, S_WINS, S_FUN, S_VOID, S_ARR, S_CTX, S_HOLD,
     S_CLS, S_CAND, S_ISBTN,
     S_ONE, S_FAM, S_IDX2, S_FLEN, S_RLEN, S_J2, S_NUM, S_TEN, S_C48, S_C57, S_CC, S_V, S_NULLA,
     S_GAME, S_UI, S_UNITS, S_UINF, S_UPROPS, S_UNIT,
     S_DA, S_DAID, S_UAID, S_UCID) = range(base, base + len(RT))
    fn.nregs = VarInt(len(fn.regs))
    for nm, s, want in (("S_UNIT", S_UNIT, UNIT), ("S_MYID", S_MYID, "String"),
                        ("S_ALL", S_ALL, ARRO), ("S_LIST", S_LIST, ARRO),
                        ("S_PLIST", S_PLIST, ARRO), ("S_ROW", S_ROW, ROWT),
                        ("S_PROW", S_PROW, ROWT), ("S_BTN", S_BTN, BTN), ("S_SIB", S_SIB, BTN),
                        ("S_SELF", S_SELF, OBJ), ("S_HOLD", S_HOLD, "String")):
        got = disasm.type_name(bc, fn.regs[s].resolve(bc))
        _guard(got == want, "%s is typed %r, expected %r" % (nm, got, want))

    b = _Blk(bc, fn, zero, dg)
    b._len, b._raw = S_LEN, S_RAW
    N = len(NAMES)

    def gg(tpl, dst, g):
        o = deepcopy(tpl)
        o.df["dst"] = Reg(dst)
        o.df["global"] = type(tpl.df["global"])(g)
        b.ops.append(o)
        return o

    # ---- once per frame: who am I, and the rows -------------------------------------------------
    b.clone(W["t_enum"], dst=S_BTN)
    b.add(op("JNull", reg=Reg(S_BTN), offset="OUT"))
    b.clone(t_inf, dst=S_INF, obj=S_BTN)
    b.add(op("JNull", reg=Reg(S_INF), offset="OUT"))
    b.clone(t_abid, dst=S_MYID, obj=S_INF)
    b.add(op("JNull", reg=Reg(S_MYID), offset="OUT"))
    b.clone(t_data, dst=S_DATA)
    b.add(op("JNull", reg=Reg(S_DATA), offset="OUT"))
    b.clone(t_input, dst=S_IDX, obj=S_DATA)
    b.add(op("JNull", reg=Reg(S_IDX), offset="OUT"))
    b.clone(t_all, dst=S_ALLD, obj=S_IDX)
    b.add(op("JNull", reg=Reg(S_ALLD), offset="OUT"),
          op("SafeCast", dst=Reg(S_ALL), src=Reg(S_ALLD)),
          op("JNull", reg=Reg(S_ALL), offset="OUT"),
          op("UnsafeCast", dst=Reg(S_SELF), src=Reg(S_BTN)))
    b.clone(W["t_parent"], dst=S_PAR, obj=S_SELF)
    b.add(op("JNull", reg=Reg(S_PAR), offset="OUT"))
    b.clone(W["t_children"], dst=S_CH, obj=S_PAR)
    b.add(op("JNull", reg=Reg(S_CH), offset="OUT"))
    b.const(S_ZI, 0)
    b.const(S_ONE, 1)
    b.const(S_I, 0)

    # ---- the rows, key question FIRST ------------------------------------------------------------
    b.walk(S_ALL, S_I, "OUT", "ROWTOP", t_len, t_raw, S_DYN)
    b.add(op("ToVirtual", dst=Reg(S_ROW), src=Reg(S_DYN)),
          op("JNull", reg=Reg(S_ROW), offset="ROWTOP"))
    b.clone(t_rowid, dst=S_ROWID, obj=S_ROW)
    b.add(op("JNull", reg=Reg(S_ROWID), offset="ROWTOP"))
    b.clone(W["t_press"], dst=S_OK, arg0=S_ROWID)
    b.add(op("JFalse", cond=Reg(S_OK), offset="ROWTOP"))
    b.dynget(S_LISTD, S_ROW, ABILITY_COLUMN)
    b.add(op("JNull", reg=Reg(S_LISTD), offset="NUM0"),
          op("SafeCast", dst=Reg(S_LIST), src=Reg(S_LISTD)),
          op("JNull", reg=Reg(S_LIST), offset="NUM0"))
    # ---- NAMED: does this row name the ability I am showing? -------------------------------------
    b.const(S_J, 0)
    b.walk(S_LIST, S_J, "ROWTOP", "ABTOP", t_len, t_raw, S_DYN)
    b.dynget(S_EID, S_DYN, ABILITY_COLUMN)
    b.add(op("JNull", reg=Reg(S_EID), offset="ABTOP"),
          op("UnsafeCast", dst=Reg(S_ES), src=Reg(S_EID)),
          op("JNull", reg=Reg(S_ES), offset="ABTOP"),
          op("Call2", dst=Reg(S_CMP), fun=fIndex(cmp_fn.findex.value),
             arg0=Reg(S_ES), arg1=Reg(S_MYID)),
          op("JNotEq", a=Reg(S_CMP), b=Reg(S_ZI), offset="ABTOP"),
          op("JAlways", offset="ACT"))

    # numbered: the row id must start with the family token, and its digits are read at run time
    b.ops.append(label("NUM0"))
    gg(W["t_getglob"], S_FAM, g_family)
    b.add(op("Null", dst=Reg(S_NULLA)))
    b.clone(t_idxof, dst=S_IDX2, arg0=S_ROWID, arg1=S_FAM, arg2=S_NULLA)
    b.add(op("JNotEq", a=Reg(S_IDX2), b=Reg(S_ZI), offset="ROWTOP"))   # must START with it
    b.clone(t_slen, dst=S_FLEN, obj=S_FAM)
    b.clone(t_slen, dst=S_RLEN, obj=S_ROWID)
    b.add(op("Mov", dst=Reg(S_J2), src=Reg(S_FLEN)),
          op("JSGte", a=Reg(S_J2), b=Reg(S_RLEN), offset="ROWTOP"))    # nothing after the token
    b.const(S_NUM, 0)
    b.const(S_TEN, 10)
    b.const(S_C48, 48)
    b.const(S_C57, 57)
    b.ops.append(header("DIGTOP"))
    b.add(op("JSGte", a=Reg(S_J2), b=Reg(S_RLEN), offset="DIGDONE"))
    b.clone(t_ccat, dst=S_CC, arg0=S_ROWID, arg1=S_J2)
    b.add(op("JNull", reg=Reg(S_CC), offset="ROWTOP"),
          op("SafeCast", dst=Reg(S_V), src=Reg(S_CC)),
          op("JSLt", a=Reg(S_V), b=Reg(S_C48), offset="ROWTOP"),
          op("JSGt", a=Reg(S_V), b=Reg(S_C57), offset="ROWTOP"),
          op("Mul", dst=Reg(S_NUM), a=Reg(S_NUM), b=Reg(S_TEN)),
          op("Sub", dst=Reg(S_V), a=Reg(S_V), b=Reg(S_C48)),
          op("Add", dst=Reg(S_NUM), a=Reg(S_NUM), b=Reg(S_V)),
          op("Incr", dst=Reg(S_J2)),
          op("JAlways", offset="DIGTOP"))
    b.ops.append(label("DIGDONE"))
    b.add(op("Sub", dst=Reg(S_K), a=Reg(S_NUM), b=Reg(S_ONE)),         # Ability_1 is position 0
          op("JSLt", a=Reg(S_K), b=Reg(S_ZI), offset="ROWTOP"))

    k = 0     # one block; the labels keep their suffix
    b.add(op("Null", dst=Reg(S_DAID)), op("Null", dst=Reg(S_UAID)), op("Null", dst=Reg(S_UCID)))
    b.clone(t_game, dst=S_GAME, arg0=S_BTN)
    b.add(op("JNull", reg=Reg(S_GAME), offset="NODEP%d" % k))
    b.clone(t_gameui, dst=S_UI, obj=S_GAME)
    b.add(op("JNull", reg=Reg(S_UI), offset="NODEP%d" % k))
    b.clone(t_sel, dst=S_UNITS, arg0=S_UI)
    b.add(op("JNull", reg=Reg(S_UNITS), offset="NODEP%d" % k))
    b.clone(t_len, dst=S_LEN, obj=S_UNITS)
    b.add(op("JSGte", a=Reg(S_ZI), b=Reg(S_LEN), offset="NODEP%d" % k))
    b.clone(t_raw, dst=S_RAW, obj=S_UNITS)
    b.add(op("GetArray", dst=Reg(S_DYN), array=Reg(S_RAW), index=Reg(S_ZI)),
          op("JNull", reg=Reg(S_DYN), offset="NODEP%d" % k),
          op("UnsafeCast", dst=Reg(S_CAND), src=Reg(S_DYN)))
    gg(t_cls, S_CLS, g_unitcls)
    b.add(op("Call2", dst=Reg(S_ISBTN), fun=fIndex(chk_fi), arg0=Reg(S_CLS), arg1=Reg(S_CAND)),
          op("JFalse", cond=Reg(S_ISBTN), offset="NODEP%d" % k),
          op("UnsafeCast", dst=Reg(S_UNIT), src=Reg(S_DYN)))
    b.clone(t_uinf, dst=S_UINF, obj=S_UNIT)
    b.add(op("JNull", reg=Reg(S_UINF), offset="NODEP%d" % k))
    b.clone(t_uprops, dst=S_UPROPS, obj=S_UINF)
    b.add(op("JNull", reg=Reg(S_UPROPS), offset="NODEP%d" % k))
    for gi, (fi_, dst) in enumerate(zip(DEP, (S_DAID, S_UAID, S_UCID))):
        tag = "DEP%d_%d" % (k, gi)
        b.add(op("Call1", dst=Reg(S_DA), fun=fIndex(fi_), arg0=Reg(S_UPROPS)),
              op("JNull", reg=Reg(S_DA), offset=tag))
        b.clone(t_abid, dst=dst, obj=S_DA)
        b.ops.append(label(tag))
    b.ops.append(label("NODEP%d" % k))
    b.const(S_N, 0)
    b.const(S_S, 0)
    b.walk(S_CH, S_S, "ROWTOP", "SIB%d" % k, t_len, t_raw, S_DYN)
    b.add(op("UnsafeCast", dst=Reg(S_CAND), src=Reg(S_DYN)))
    gg(t_cls, S_CLS, g_btncls)
    b.add(op("Call2", dst=Reg(S_ISBTN), fun=fIndex(chk_fi), arg0=Reg(S_CLS), arg1=Reg(S_CAND)),
          op("JFalse", cond=Reg(S_ISBTN), offset="SIB%d" % k),
          op("UnsafeCast", dst=Reg(S_SIB), src=Reg(S_DYN)))
    b.clone(t_inf, dst=S_SINF, obj=S_SIB)
    b.add(op("JNull", reg=Reg(S_SINF), offset="SIB%d" % k))
    b.clone(t_abid, dst=S_SID, obj=S_SINF)
    b.add(op("JNull", reg=Reg(S_SID), offset="SIB%d" % k))
    gg(W["t_getglob"], S_HOLD, g_hold)
    b.add(op("Call2", dst=Reg(S_CMP), fun=fIndex(cmp_fn.findex.value),
             arg0=Reg(S_SID), arg1=Reg(S_HOLD)),
          op("JEq", a=Reg(S_CMP), b=Reg(S_ZI), offset="SIB%d" % k))
    for gi, src in enumerate((S_DAID, S_UAID, S_UCID)):
        tag = "NOTDEP%d_%d" % (k, gi)
        b.add(op("JNull", reg=Reg(src), offset=tag),
              op("Call2", dst=Reg(S_CMP), fun=fIndex(cmp_fn.findex.value),
                 arg0=Reg(S_SID), arg1=Reg(src)),
              op("JEq", a=Reg(S_CMP), b=Reg(S_ZI), offset="SIB%d" % k))
        b.ops.append(label(tag))
    b.const(S_P, 0)
    b.walk(S_ALL, S_P, "KEEP%d" % k, "EX%d" % k, t_len, t_raw, S_PDYN)
    b.add(op("ToVirtual", dst=Reg(S_PROW), src=Reg(S_PDYN)),
          op("JNull", reg=Reg(S_PROW), offset="EX%d" % k))
    b.dynget(S_PLD, S_PROW, ABILITY_COLUMN)
    b.add(op("JNull", reg=Reg(S_PLD), offset="EX%d" % k),
          op("SafeCast", dst=Reg(S_PLIST), src=Reg(S_PLD)),
          op("JNull", reg=Reg(S_PLIST), offset="EX%d" % k))
    b.const(S_Q, 0)
    b.walk(S_PLIST, S_Q, "EX%d" % k, "EXA%d" % k, t_len, t_raw, S_PDYN)
    b.dynget(S_QID, S_PDYN, ABILITY_COLUMN)
    b.add(op("JNull", reg=Reg(S_QID), offset="EXA%d" % k),
          op("UnsafeCast", dst=Reg(S_QS), src=Reg(S_QID)),
          op("JNull", reg=Reg(S_QS), offset="EXA%d" % k),
          op("Call2", dst=Reg(S_CMP), fun=fIndex(cmp_fn.findex.value),
             arg0=Reg(S_QS), arg1=Reg(S_SID)),
          op("JNotEq", a=Reg(S_CMP), b=Reg(S_ZI), offset="EXA%d" % k),
          op("JAlways", offset="SIB%d" % k))
    b.ops.append(label("KEEP%d" % k))
    b.add(op("JNotEq", a=Reg(S_N), b=Reg(S_K), offset="INC%d" % k),
          op("JNotEq", a=Reg(S_SIB), b=Reg(S_BTN), offset="ROWTOP"),
          op("JAlways", offset="ACT"))
    b.ops.append(label("INC%d" % k))
    b.add(op("Incr", dst=Reg(S_N)),
          op("JAlways", offset="SIB%d" % k))

    # ---- the two roads, shared -------------------------------------------------------------------
    b.ops.append(label("ACT"))
    # the gates sit behind the key question, so an unpressed frame never pays for them
    b.clone(t_game, dst=S_GAME, arg0=S_BTN)
    b.add(op("JNull", reg=Reg(S_GAME), offset="OUT"))
    b.clone(t_gameui, dst=S_UI, obj=S_GAME)
    b.add(op("JNull", reg=Reg(S_UI), offset="OUT"),
          op("Call1", dst=Reg(S_BLK), fun=fIndex(blk1.findex.value), arg0=Reg(S_UI)),
          op("JTrue", cond=Reg(S_BLK), offset="OUT"),
          op("Call1", dst=Reg(S_BLK), fun=fIndex(blk2.findex.value), arg0=Reg(S_UI)),
          op("JTrue", cond=Reg(S_BLK), offset="OUT"))
    b.clone(t_wins, dst=S_WINS, obj=S_UI)
    b.add(op("JNull", reg=Reg(S_WINS), offset="NOWIN"))
    b.clone(t_len, dst=S_LEN, obj=S_WINS)
    b.add(op("JSGte", a=Reg(S_ZI), b=Reg(S_LEN), offset="NOWIN"),
          op("JAlways", offset="OUT"))
    b.ops.append(label("NOWIN"))
    b.add(op("Call1", dst=Reg(S_CAN), fun=fIndex(W["cancel_fi"]), arg0=Reg(S_BTN)),
          op("JFalse", cond=Reg(S_CAN), offset="START"))
    b.clone(W["t_enum_arr"], dst=S_ARR)
    b.clone(W["t_alloc"], dst=S_CTX)
    setf = [None, None]
    for idx, src in ((W["I_ARR"], S_ARR), (W["I_BTN"], S_BTN)):
        o = deepcopy(W["t_setf"][idx])
        o.df["value"], o.df["src"] = Reg(S_CTX), Reg(src)
        setf[idx] = o
    b.add(setf[0], setf[1],
          op("Call1", dst=Reg(S_VOID), fun=fIndex(W["rclick_fi"]), arg0=Reg(S_CTX)),
          op("JAlways", offset="OUT"))
    b.ops.append(label("START"))
    b.clone(W["t_nullfun"], dst=S_FUN)
    b.clone(W["t_click"], dst=S_VOID, arg0=S_BTN, arg1=S_FUN)

    block = resolve(b.ops, "W38 unified ability walk")
    K = len(block)
    _no_dead_branches(block, "W38")
    # six loop headers whatever the modder authored: rows, list, digits, siblings, two claim walks
    _guard(sum(1 for o in block if o.op == "Label") == 6,
           "expected six loop headers, found %d" % sum(1 for o in block if o.op == "Label"))
    C = 1
    n, preds = splice(fn, C, block, "W38 unified ability walk")
    _guard(n == K, "block length changed")
    seg = fn.ops[C:C + K]
    press = [i for i, o in enumerate(seg) if o.op.startswith("Call")
             and getattr(o.df.get("fun"), "value", None) == W["pressed_fi"]]
    _guard(len(press) == 1, "the key must be asked ONCE per row, before anything else (%s)" % press)
    _guard(sum(1 for o in seg if o.op == "DynGet") == 4,
           "expected four cdb reads by name, found %d"
           % sum(1 for o in seg if o.op == "DynGet"))
    acts = [i for i, o in enumerate(seg) if o.op.startswith("Call")
            and getattr(o.df.get("fun"), "value", None) == W["click_fi"]]
    cans = [i for i, o in enumerate(seg) if o.op.startswith("Call")
            and getattr(o.df.get("fun"), "value", None) == W["rclick_fi"]]
    _guard(len(acts) == 1 and len(cans) == 1,
           "both roads are shared, so there is exactly one of each (%s / %s)" % (acts, cans))
    _guard(max(press) < min(acts + cans), "the key question must come before either road")
    for i, o in enumerate(seg):
        for nm2, pt in opcodes.get(o.op or "", {}).items():
            if pt != "JumpOffset" or o.df.get(nm2) is None:
                continue
            t = i + 1 + o.df[nm2].value
            _guard(0 <= t <= K, "block op%d jumps to %d, outside the block (0..%d)" % (i, t, K))
    if verbose:
        print("W38: %d ops at op%d of f@%d (now %d), preds %s"
              % (K, C, fn.findex.value, len(fn.ops), preds))
        print("     %d numbered slot(s) %s; named rows fire from any position; a button is skipped "
              "when a named row claims it or it is %r (g@%d). Deploy exclusion is NOT built."
              % (N, ", ".join(NAMES), HOLD, g_hold))
    return fn
