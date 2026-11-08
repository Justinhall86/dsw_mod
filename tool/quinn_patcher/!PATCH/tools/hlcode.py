#!/usr/bin/env python3
"""Finding things in the game's compiled code BY NAME, and writing new code into it."""
import re
import sys
from copy import deepcopy

from crashlink import disasm
from crashlink.opcodes import opcodes

from tools.project import gv, guard, on_path

# the kept fixes carry the one proven way to put a real text object into the file
on_path()
from abilitykeys import _int_pool_ref, _mint_string_global     # noqa: E402

# where a file's minted text is remembered: ON the file, so two files cannot share an answer
MINTED_ON = "_spine_minted_text"
# the functions of our own that every road calls, one per key, kept ON the file
SHARED_ON = "_spine_shared_functions"


# ---- THE FILE READ ONCE, NOT ONCE PER LOOKUP; ⚠ rebuilt whenever the file grows a function ----
NAMED_ON = "_spine_named"


def _how_it_is_called(header):
    """Every name a function answers to, out of its header; ⛔ a static one answers to both."""
    if not header or " " not in header:
        return ()
    rest = header.split(" ", 1)[1]
    is_static = rest.startswith("static ")
    if is_static:
        rest = rest[len("static "):]
    if " (" not in rest:
        return ()
    name = rest.split(" (", 1)[0]
    return (name, "static " + name) if is_static else (name,)


def _called(bc):
    """Every function by the name it is called, kept ON the file and moved only where it changed."""
    from tools import byname

    def names_of(f):
        try:
            return _how_it_is_called(disasm.func_header(bc, f))
        except Exception:
            return ()                     # it throws on stripped bytecode; such a one has no name
    return byname.on(bc, NAMED_ON, names_of).current(bc.functions)


def _the_names_in(bc):
    """Every function by the name it is called: the first so called, and how many are."""
    held = _called(bc)
    return {"by_name": {n: e[0][1] for n, e in held.items()},
            "twice": {n: len(e) for n, e in held.items()}}


def function_named(bc, name):
    """The one function with this name. A static one prints `static` first; both are accepted."""
    found = _called(bc).get(name, ())
    # there must be exactly one; two would mean we are about to read or change the wrong one
    guard(len(found) == 1, "%s resolved %d times, expected 1" % (name, len(found)))
    return found[0][1]


def native_named(bc, lib, name):
    """The one native the game declares under that library and name: called, never read."""
    found = [n for n in bc.natives
             if str(n.lib.resolve(bc)) == lib and str(n.name.resolve(bc)) == name]
    guard(len(found) == 1, "native %s.%s resolved %d times, expected 1" % (lib, name, len(found)))
    return found[0]


def native_returns(bc, lib, name):
    """The kind a named native hands back, off its declared type: it has no return to read."""
    return gv(native_named(bc, lib, name).type.resolve(bc).definition.ret)


def returns_type(fn, name="a function"):
    # the type a function hands back, taken from its own return instruction
    rets = {gv(o.df["ret"]) for o in (fn.ops or []) if o.op == "Ret"}
    guard(rets, "%s never returns, so it has no type to copy" % name)
    kinds = {gv(list(fn.regs)[r]) for r in rets}
    guard(len(kinds) == 1, "%s returns more than one kind of thing" % name)
    return kinds.pop()


def text_object(bc, word, verbose=False):
    """A real text object holding `word`, put into this game file once and remembered ON it."""
    minted = getattr(bc, MINTED_ON, None)
    if minted is None:
        minted = {}
        setattr(bc, MINTED_ON, minted)
    if word not in minted:
        minted[word] = _mint_string_global(bc, word, verbose)
    return minted[word]


def minted_text(bc, word):
    # the text this file already carries for that word, or nothing when it carries none
    return (getattr(bc, MINTED_ON, None) or {}).get(word)


def number(bc, n):
    # where the plain number `n` sits in the file's own list of numbers, added if it is not there
    return _int_pool_ref(bc, n)


def fields_of(bc, kind, what="a type"):
    """The names and declared kinds of one type's fields, in the order the file declares them."""
    definition = getattr(bc.types[kind], "definition", None)
    guard(definition is not None and hasattr(definition, "resolve_fields"),
          "%s has no fields to read" % what)
    fields = definition.resolve_fields(bc)
    return [f.name.resolve(bc) for f in fields], fields


def field_by_name(bc, kind, name, what):
    """Which field of that kind is called `name`, and what kind it holds. NEVER by counting."""
    names, fields = fields_of(bc, kind, what)
    guard(name in names, "%s has no `%s`, only %s" % (what, name, ", ".join(names)))
    at = names.index(name)
    return at, gv(fields[at].type)


def method_slot(bc, kind, name, what="a type"):
    """Which SLOT a method answers on, by name every build, so an override gets its say."""
    definition = getattr(bc.types[gv(kind)], "definition", None)
    protos = list(getattr(definition, "protos", None) or [])
    found = [p for p in protos if p.name.resolve(bc) == name]
    guard(found, "%s declares no `%s`, only: %s"
          % (what, name, ", ".join(sorted(p.name.resolve(bc) for p in protos)) or "nothing"))
    slot = gv(found[0].pindex)
    guard(slot >= 0, "%s's `%s` answers on no slot (%d), so it cannot be called on one"
          % (what, name, slot))
    return slot


def _filed(bc, under, size, make):
    """One map per file, made once and remade only when the list behind it has grown."""
    have = bc.__dict__.setdefault("_filed_by_name", {})
    got = have.get(under)
    if got is None or got[0] != size:
        got = (size, make(bc))
        have[under] = got
    return got[1]


def _kinds_by_name(bc):
    """Every kind in the file by what it prints as, kept ON it and moved only where it changed."""
    from tools import byname
    return byname.on(bc, "_spine_kinds", lambda kind: (disasm.type_name(bc, kind),)).current(
        bc.types)


def _class_globals_by_name(bc):
    """Every global, filed under what the kind it holds prints as."""
    out = {}
    for at, holds in enumerate(bc.global_types):
        try:
            out.setdefault(disasm.type_name(bc, bc.types[gv(holds)]), []).append(at)
        except Exception:
            continue
    return out


def kind_named(bc, name):
    """The one kind that PRINTS as `name`; ⚠ only a class is unique, so a primitive refuses."""
    found = [at for at, _ in _kinds_by_name(bc).get(name, ())]
    guard(found, "no kind in the file is called `%s`" % name)
    guard(len(found) == 1,
          "%d kinds in the file are called `%s`, so naming one picks nothing -- take the kind "
          "off the function that will be handed it instead" % (len(found), name))
    return found[0]


def classes_above(bc, name):
    """Every class the class `name` derives from, nearest first, as the game file declares them."""
    out, at = [], bc.types[kind_named(bc, name)].definition
    while getattr(at, "super", None) is not None and gv(at.super) >= 0:
        at = at.super.resolve(bc).definition
        out.append(at.name.resolve(bc))
    return tuple(out)


def kind_or_argument(bc, name):
    """A class by name, or, for `argument N of <function>`, the kind that argument is."""
    asked = re.match(r"argument (\d+) of (.+)$", name)
    return argument_kind(bc, asked.group(2), int(asked.group(1))) if asked else kind_named(bc, name)


def name_of_kind(bc, kind):
    """What one kind PRINTS as, which is the only handle on it that survives the other loader."""
    return disasm.type_name(bc, bc.types[gv(kind)])


def class_global(bc, kind):
    """The place holding one kind's CLASS OBJECT, typed `ent.$Building` for `ent.Building`."""
    name = name_of_kind(bc, kind)
    head, _dot, tail = name.rpartition(".")
    wanted = ("%s.$%s" % (head, tail)) if head else ("$%s" % tail)
    found = _filed(bc, "class globals", len(bc.global_types),
                   _class_globals_by_name).get(wanted, ())
    guard(found, "the file keeps no class object for `%s`, so nothing can ask what a thing IS"
                 % name)
    guard(len(found) == 1,
          "%d places hold a class object typed `%s`, so naming one picks nothing"
          % (len(found), wanted))
    return found[0]


def enum_case(bc, enum, case):
    """Which case of a game-declared enum is called `case`, by name and never counted."""
    kind = bc.types[kind_named(bc, enum)]
    cases = getattr(kind.definition, "constructs", None)
    guard(cases is not None, "`%s` is not an enum, so it has no cases to name" % enum)
    named = [one.name.resolve(bc) for one in cases]
    guard(named.count(case) == 1,
          "`%s` has %d case(s) called `%s` -- its cases are %s"
          % (enum, named.count(case), case, ", ".join(named)))
    return named.index(case)


def is_static(bc, fn):
    # a static function prints `static` before its name, and one that is not opens with `this`
    return (disasm.func_header(bc, fn) or "").split()[1:2] == ["static"]


def argument_kinds(bc, name):
    """The kinds a named function's ARGUMENTS are, off its declared type, `this` dropped."""
    fn = function_named(bc, name)
    declared = [gv(a) for a in fn.type.resolve(bc).definition.args]
    # anything that is not static is handed the thing it is about first, and that is not an argument
    return declared if is_static(bc, fn) else declared[1:]


def argument_kind(bc, name, which=0):
    """The kind of one argument, so a caller can ask for a primitive it could never name."""
    kinds = argument_kinds(bc, name)
    guard(which < len(kinds),
          "%s takes %d argument(s), and %d was asked for" % (name, len(kinds), which))
    return kinds[which]


# and the same for a borrowed place; ⛔ only the plain form is kept, as `prefer` changes the answer
LIKE_ON = "_spine_like"


def register_like(bc, kind, prefer=()):
    """A register of that kind, borrowed from a function that already declares one."""
    kept = getattr(bc, LIKE_ON, None)
    if kept is None:
        kept = {}
        setattr(bc, LIKE_ON, kept)
    if not prefer and kind in kept:
        return kept[kind]
    # the functions we already have in hand first, since the rarer kinds live in them
    for fn in list(prefer) + list(bc.functions):
        for reg in (fn.regs or []):
            if gv(reg) == kind:
                if not prefer:
                    kept[kind] = reg
                return reg
    guard(False, "no function in the file declares a register of kind t@%s" % kind)


# where a file's slots are remembered: ON the file, beside its minted text
SLOTS_ON = "_spine_slots"


def slot_global(bc, name, kind):
    """A place of that kind for one named thing, made once per file; it starts as nothing."""
    slots = getattr(bc, SLOTS_ON, None)
    if slots is None:
        slots = {}
        setattr(bc, SLOTS_ON, slots)
    if name not in slots:
        # the KIND is copied from a register the game itself declares, never from a number of ours
        slots[name] = len(bc.global_types)
        bc.global_types.append(deepcopy(register_like(bc, kind)))
        if getattr(bc, "nglobals", None) is not None:
            bc.nglobals.value = len(bc.global_types)
    return slots[name]


def calls(op, target):
    # true when this one instruction is a call to that function
    return op.op.startswith("Call") and "fun" in op.df and gv(op.df["fun"]) == gv(target.findex)


def call_sites(caller, target):
    # the positions inside `caller` where it calls `target`
    return [i for i, op in enumerate(caller.ops) if calls(op, target)]


def lands_at(jump, index):
    # where a jump sitting at `index` sends control
    return index + 1 + gv(jump.df["offset"])


def make_nop(op):
    # turn an instruction into a do-nothing, leaving every position around it unchanged
    op.op, op.df = "Nop", {}


FEEDS = {}
# READS: what each frame of ours read off a word (`Word.NAME`), and each step's frames of ours
READ_BY, STACKS, _LAST_STACK = {}, {}, [()]


from tools.quick import (bodiless as _bodiless, copied as _copied, ours as _ours,  # noqa: E402
                         read_into as _read_into)


def feeding(skip=2):
    """FEEDS: the framework files on the stack, past `tools/` and the build itself."""
    return frozenset(p for _f, p in _ours(sys._getframe(skip)))


def read(key):
    """READS: every frame of ours now running has read `key` off a word."""
    _read_into(READ_BY, key, sys._getframe(1))


def _stack_of(op, frames):
    """READS: the frames of ours writing `op`, shared with the step before when they match."""
    keys = tuple((id(f), f.f_code) for f, _p in frames)
    if keys != _LAST_STACK[0]:
        _LAST_STACK[0] = keys
    STACKS[id(op)] = _LAST_STACK[0]


def reads_of(ops):
    """READS: everything the frames writing `ops` read off the words, sorted."""
    frames = {k for op in ops for k in STACKS.get(id(op), ())}
    return sorted({key for k in frames for key in READ_BY.get(k, ())})


def template(bc, name):
    # the file's own instruction of that kind, to be copied whenever we write one
    have = _filed(bc, "templates", len(bc.functions), lambda _bc: {})
    found = have.get(name)
    if found is None or found.op != name:
        found = next((o for f in bc.functions for o in (f.ops or []) if o.op == name), None)
        # none of its own (the game has no JSGt): a renamed copy of one shaped the same
        twin = found or next((o for f in bc.functions for o in (f.ops or [])
                              if opcodes.get(o.op) == opcodes.get(name)), None)
        found = found or (twin and deepcopy(twin))
        found and setattr(found, "op", name)
        have[name] = found
    guard(found is not None, "no %s anywhere in the file to copy" % name)
    return found


def written(tpl, **operands):
    """A copy of that instruction with our operands; ⚠ a list operand keeps one wrapper each."""
    op, frames = _copied(tpl), _ours(sys._getframe(1))
    FEEDS[id(op)] = frozenset(p for _f, p in frames)
    _stack_of(op, frames)
    for name, value in operands.items():
        guard(name in op.df, "%s has no operand %r" % (op.op, name))
        slot = op.df[name]
        if isinstance(value, (list, tuple)):
            guard(getattr(slot, "value", None),
                  "%s's %r has nothing to copy a wrapper from" % (op.op, name))
            slot.value = [_copied(slot.value[0]) for _ in value]
            for wrapped, one in zip(slot.value, value):
                wrapped.value = one
            if getattr(slot, "n", None) is not None:
                slot.n.value = len(value)
        else:
            slot.value = value
    return op


def new_function(bc, arg_kinds, ret_kind, like):
    """A function of our own taking `arg_kinds` and answering `ret_kind`; its body comes later."""
    # the game reads a function's argument count as one byte our writer spells past 127 in two
    guard(len(arg_kinds) <= 127, "a function of %d arguments will not load" % len(arg_kinds))
    fun = deepcopy(bc.types[gv(like.type)])
    fun.definition.args = [deepcopy(register_like(bc, kind)) for kind in arg_kinds]
    fun.definition.nargs.value = len(arg_kinds)
    fun.definition.ret = deepcopy(register_like(bc, ret_kind))
    bc.types.append(fun)
    bc.ntypes.value = len(bc.types)
    count = len(bc.functions) + len(bc.natives)
    # the whole walk only when something other than this has grown the lists since the last one
    if bc.__dict__.get("_spine_holeless") != count:
        taken = [gv(f.findex) for f in bc.functions] + [gv(n.findex) for n in bc.natives]
        guard(max(taken) + 1 == count, "the function numbers have a hole, so a new one is unsafe")
    fn = _bodiless(like)
    fn.type.value, fn.findex.value = len(bc.types) - 1, count
    bc.__dict__["_spine_holeless"] = count + 1
    fn.regs[:] = [deepcopy(register_like(bc, kind)) for kind in arg_kinds]
    fn.nregs.value = len(fn.regs)
    bc.functions.append(fn)
    bc.nfunctions.value = len(bc.functions)
    getattr(bc, "invalidate_findex_cache", lambda: None)()
    return fn


def shared_function(bc, fn, hands_of, key, arg_kinds, ret_kind, body):
    """One function per `key` in the file, written once by `body(hands)`; every caller shares it."""
    made = getattr(bc, SHARED_ON, None)
    if made is None:
        made = {}
        setattr(bc, SHARED_ON, made)
    if key not in made:
        made[key] = new_function(bc, arg_kinds, ret_kind, like=fn)
        replace_body(made[key], body(hands_of(bc, made[key])))
    return gv(made[key].findex)


def calls_into(bc, block, findex):
    """Where `block` calls `findex`, itself or through a shared function of ours that does."""
    shared = {gv(f.findex): f for f in (getattr(bc, SHARED_ON, None) or {}).values()}

    def reaches(fun, seen=()):
        return fun == findex or (fun in shared and fun not in seen and any(
            reaches(gv(o.df["fun"]), seen + (fun,)) for o in shared[fun].ops
            if o.op.startswith("Call") and "fun" in o.df))
    return [i for i, o in enumerate(block)
            if o.op.startswith("Call") and "fun" in o.df and reaches(gv(o.df["fun"]))]


def replace_body(fn, ops):
    """Put a new body into a function, and keep the bookkeeping that travels with it honest."""
    fn.ops[:] = list(ops)
    # the function states how long it is, and the file is unreadable if that disagrees
    if getattr(fn, "nops", None) is not None:
        fn.nops.value = len(fn.ops)
    # every instruction needs a line to blame in a stack trace; the old first line serves for all
    marks = getattr(getattr(fn, "debuginfo", None), "value", None)
    if marks:
        marks[:] = [marks[0]] * len(fn.ops)
    # and the old notes about which register holds what describe nothing in the new body
    if getattr(fn, "assigns", None) is not None:
        fn.assigns[:] = []
        if getattr(fn, "nassigns", None) is not None:
            fn.nassigns.value = 0
    return fn


def _switched(op, goes_to, places, after):
    """A switch takes its cases' places in order; a value past them goes on to the next op."""
    guard(all(g in places for g in goes_to), "a switch case has no place in %r" % (goes_to,))
    cases = getattr(op.df["offsets"], "value", op.df["offsets"])
    for k, g in enumerate(goes_to):
        if hasattr(cases[k], "value"):
            cases[k].value = places[g] - after
        else:
            cases[k] = places[g] - after


def assemble(items):
    """Instructions, `"NAME:"` places and `(jump, "NAME")` pairs in; instructions out."""
    # first pass: where each named place lands, counting only real instructions
    at, places = 0, {}
    for item in items:
        if isinstance(item, str):
            guard(item.endswith(":"), "%r is neither an instruction nor a place" % item)
            guard(item[:-1] not in places, "the place %r is named twice" % item[:-1])
            places[item[:-1]] = at
        else:
            at += 1
    # second pass: fill each jump's distance in, now that every place is known
    out = []
    for item in items:
        if isinstance(item, str):
            continue
        op, goes_to = item if isinstance(item, tuple) else (item, None)
        if op.op == "Switch":
            _switched(op, goes_to, places, len(out) + 1)
        elif goes_to is not None:
            guard(goes_to in places, "no place named %r for the %s to go to" % (goes_to, op.op))
            guard("offset" in op.df, "%s cannot go anywhere -- it is not a jump" % op.op)
            op.df["offset"].value = places[goes_to] - (len(out) + 1)
        out.append(op)
    return out
