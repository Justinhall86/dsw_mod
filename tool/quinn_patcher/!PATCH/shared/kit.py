#!/usr/bin/env python3
"""What every lifted change shares: the small helpers, and the by-name resolver of `NEEDS`."""
import copy

from crashlink import disasm


def _gv(maybe_wrapped): return getattr(maybe_wrapped, "value", maybe_wrapped)


def _sv(op, func, entry):
    one_type = op.df[func]
    if hasattr(one_type, "value"): one_type.value = entry
    else: op.df[func] = entry
    return op


def C(one_type): return copy.deepcopy(one_type)


def _nops(patched):
    try: patched.nops.value = len(patched.ops)
    except Exception: pass


def _guard(constant, message):
    if not constant: raise RuntimeError("LAYOUT GUARD FAILED: " + message)


def _tfields(game, type_index):
    # ordered (name, type_index) for an HOBJ (own definition.fields) or HVIRTUAL (type.fields)
    one_type = game.types[type_index]
    definition = getattr(one_type, "definition", one_type)
    field_list = getattr(definition, "fields", None) or getattr(one_type, "fields", None)
    out = []
    if field_list:
        S = game.strings.value
        for fld in _gv(field_list):
            expected = _gv(getattr(fld, "name", None))
            if isinstance(expected, int):
                try: expected = S[expected]
                except Exception: pass
            out.append((expected, _gv(getattr(fld, "type", getattr(fld, "t", None)))))
    return out


def _flat_fields(game, type_index, seen=None):
    # RUNTIME-ordered (name, type_index) for an HOBJ: super-class fields first, then its own
    seen = seen or set()
    if type_index in seen: return []
    seen.add(type_index)
    definition = getattr(game.types[type_index], "definition", game.types[type_index])
    super_index = None
    for a in ("super", "_super", "superType", "parent"):
        text = getattr(definition, a, None)
        if text is not None:
            sv = _gv(text)
            if isinstance(sv, int) and sv >= 0: super_index = sv; break
    base = _flat_fields(game, super_index, seen) if super_index is not None else []
    return base + _tfields(game, type_index)



def cut_length_type(resolved):
    """The type the game's own text-cutting helper declares for its length, read per file."""
    return _gv(resolved["funcs"]["substr"].regs[2])


def every_need():
    """Every target asked for, {label: name substring}, from ⛔ EVERY file beside this one."""
    import importlib
    import os

    needs = {}
    # every tick folder and `shared/` is `standalone`'s path; the spine is `framework`'s
    for folder in ("standalone", "framework"):
        for at, name in sorted((a, n) for a in importlib.import_module(folder).__path__
                               for n in os.listdir(a)):
            if not name.endswith(".py") or name.startswith("__") or name == "kit.py":
                continue
            with open(os.path.join(at, name), encoding="utf-8") as f:
                if "\nNEEDS = " not in f.read():
                    continue
            asked = getattr(importlib.import_module(folder + "." + name[:-3]), "NEEDS", {})
            if isinstance(asked, dict):           # the spine's own NEEDS is a different thing
                needs.update(asked)
    return needs


def resolve(game):
    _needs = every_need()
    funcs = {}
    for func in game.functions:
        if len(funcs) == len(_needs):
            break
        try: header = disasm.func_header(game, func)
        except Exception: continue
        for label, name_fragment in _needs.items():
            if label not in funcs and name_fragment in header:
                funcs[label] = func
    missing = [target_label for target_label in _needs if target_label not in funcs]
    if missing:
        raise RuntimeError("could not resolve: %s" % missing)

    ints = getattr(game, "ints", None) or []
    def find_int(value_wanted):
        for i, entry in enumerate(ints):
            if _gv(entry) == value_wanted:
                return i
        raise RuntimeError("int constant %d not in pool" % value_wanted)
    def find_or_add_int(value_wanted):
        for i, entry in enumerate(ints):
            if _gv(entry) == value_wanted:
                return i
        new_value = copy.deepcopy(ints[0])          # clone a wrapper, retype to val
        if hasattr(new_value, "value"): new_value.value = value_wanted
        else: new_value = value_wanted
        ints.append(new_value)
        return len(ints) - 1

    global_text = {}
    for constant in (getattr(game, "constants", None) or []):
        global_index = _gv(getattr(constant, "global", getattr(constant, "_global", None)))
        fld = getattr(constant, "fields", None)
        if global_index is None or not fld:
            continue
        try: global_text[global_index] = game.strings.value[_gv(fld[0])]
        except Exception: pass

    def tpl(name):
        for func in game.functions:
            for op in getattr(func, "ops", None) or []:
                if op.op == name:
                    return op
        raise RuntimeError("no template op %r" % name)

    # index of the Dyn type (HDYN kind == 9), for boxing ints via ToDyn
    _types = getattr(game, "types", None)
    _types = _types.value if hasattr(_types, "value") else _types
    dyn_ti = None
    for i, one_type in enumerate(_types or []):
        if _gv(getattr(one_type, "kind", None)) == 9:
            dyn_ti = i
            break

    # the six keys, spelled as strings: the contract between this resolver and every change
    return {
        "funcs": funcs,                       # target functions by label; a number's pool place
        "int_index": find_int,
        "int_index_or_add": find_or_add_int,  # the same, adding it; the text a global holds
        "global_text": global_text,
        "template": tpl,                      # a first instruction to clone; the boxing type
        "boxed_type": dyn_ti,
    }



class Anchors:
    """Find a place in a game function by what is THERE, refusing unless exactly one matches."""

    def __init__(self, patched, text_map, where):
        self.code = patched.ops
        self.text_of = text_map
        self.where = where

    def _only(self, hits, described):
        if len(hits) != 1:
            raise RuntimeError("LAYOUT GUARD FAILED: %s -- %s matches %d places, wanted exactly 1"
                               % (self.where, described, len(hits)))
        return hits[0]

    def global_holding(self, text):
        """The one instruction that loads the global holding exactly this text."""
        hits = [i for i, o in enumerate(self.code)
                if o.op == "GetGlobal"
                and self.text_of.get(_gv((o.df or {}).get("global"))) == text]
        return self._only(hits, "the global holding %r" % text)

    def first(self, op_name, after=-1):
        """The first instruction of that kind, optionally past a place already found."""
        for i in range(after + 1, len(self.code)):
            if self.code[i].op == op_name:
                return i
        raise RuntimeError("LAYOUT GUARD FAILED: %s -- no %s after %d"
                           % (self.where, op_name, after))

    def first_global_holding(self, text):
        """The FIRST instruction loading that text, where the game loads it more than once."""
        for i, o in enumerate(self.code):
            if o.op == "GetGlobal" and self.text_of.get(_gv((o.df or {}).get("global"))) == text:
                return i
        raise RuntimeError("LAYOUT GUARD FAILED: %s -- nothing loads %r" % (self.where, text))

    def calling(self, findex, after=-1):
        """The first call to that particular function, whichever call instruction it uses."""
        for i in range(after + 1, len(self.code)):
            o = self.code[i]
            if o.op.startswith("Call") and _gv((o.df or {}).get("fun")) == findex:
                return i
        raise RuntimeError("LAYOUT GUARD FAILED: %s -- nothing calls f@%s" % (self.where, findex))

    def run_of(self, op_names, after=-1):
        """Where the one consecutive run of those instruction kinds begins: a place by SHAPE."""
        hits = []
        for i in range(after + 1, len(self.code) - len(op_names) + 1):
            if all(self.code[i + n].op == want for n, want in enumerate(op_names)):
                hits.append(i)
        return self._only(hits, "the run %s" % " then ".join(op_names))

    def checking(self, op_name, register, after=-1):
        """The first instruction of that kind asking about the register named."""
        for i in range(after + 1, len(self.code)):
            o = self.code[i]
            if o.op == op_name and _gv((o.df or {}).get("reg")) == register:
                return i
        raise RuntimeError("LAYOUT GUARD FAILED: %s -- no %s asking about r%s"
                           % (self.where, op_name, register))

    def before(self, op_name, index, dst=None):
        """The nearest instruction of that kind ahead of a place; `dst` names the one FEEDING it."""
        for i in range(index - 1, -1, -1):
            o = self.code[i]
            if o.op == op_name:
                if dst is not None and _gv((o.df or {}).get("dst")) != dst:
                    continue
                return i
        raise RuntimeError("LAYOUT GUARD FAILED: %s -- no %s before %d"
                           % (self.where, op_name, index))

    def last(self, op_name):
        """The last instruction of that kind -- a function's real return, for instance."""
        for i in range(len(self.code) - 1, -1, -1):
            if self.code[i].op == op_name:
                return i
        raise RuntimeError("LAYOUT GUARD FAILED: %s -- no %s at all" % (self.where, op_name))

    def reading(self, op_name, register, after=-1, field=None):
        """The first instruction of that kind reading the register named, `field` narrowing it."""
        for i in range(after + 1, len(self.code)):
            o = self.code[i]
            if o.op == op_name and _gv((o.df or {}).get("obj")) == register:
                if field is not None and _gv((o.df or {}).get("field")) != field:
                    continue
                return i
        raise RuntimeError("LAYOUT GUARD FAILED: %s -- no %s reading r%s"
                           % (self.where, op_name, register))

    def says(self, index):
        """What the global at that place holds, for a check worth writing down."""
        return self.text_of.get(_gv((self.code[index].df or {}).get("global")))


# the game file the context below was worked out on, and that context
_for = None
_resolved = None


def context(game):
    """Every target resolved out of THIS game file, kept against it by identity, never `id()`."""
    global _for, _resolved
    if game is not _for:
        _for, _resolved = game, resolve(game)
    return _resolved
