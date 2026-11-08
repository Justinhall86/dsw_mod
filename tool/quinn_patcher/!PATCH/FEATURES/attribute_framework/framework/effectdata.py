#!/usr/bin/env python3
"""An effect's row in the game, written by each effect spelling's own classifier branch."""
from tools.project import gv, guard
from tools.hlcode import minted_text, number, template, text_object, written
from framework.effecttable import PARTS, STAMPS, table
from framework.rowreader import reader_for

# what an effect's row puts into the game: name, place kind, and the instruction that EMPTIES it
CARRIES = (("known", "count_kind", "Int"),
           # `known`: 1 once a row is written; `adds`: 1 to add, 0 to take; `part`: what it reads
           ("adds", "count_kind", "Int"),
           ("part", "text_kind", "Null"),
           # `stamp`: who is credited when no rider says; `lump`: 1 when repeating accumulates
           ("stamp", "count_kind", "Int"),
           ("lump", "count_kind", "Int"),
           # `does`: the act that carries it out; `one`: a single one, ignoring the row's value
           ("does", "count_kind", "Int"),
           ("one", "count_kind", "Int"),
           # `turned`: not 0 when `Not` turned its target (`SpawnNotTUnit`): a pick skipping it
           ("turned", "count_kind", "Int"))
# where the bake hands an effect's branches the piece's negation, beside the row's own places
NEGATED = "negated"
# which way round an effect goes, as a number of ours -- never anything read out of the cdb
ADDS = {"+": 1, "-": 0}
# where the number comes from, as a flag
FROM = {"the row": 0, "one": 1}
# what `repeat` is, as a flag: only a SUSTAINED effect may be authored with no trigger
LUMP = {"LUMP": 1, "SUSTAINED": 0, "EITHER": 0}
# which credit, as numbers WRITTEN OUT beside the words, never a word's position
STAMP_IS = {"none": 0, "me": 1, "target": 2, "all": 3}


def registers(bc, fn, reader=None):
    """Every place an effect's row is written into, on `fn`."""
    reader = reader or reader_for(bc)
    return {name: reader.borrow_register(bc, fn, kind) for name, kind, _ in CARRIES}


def words_of(rows):
    """Every part the table actually names, so only those and no others are minted."""
    return sorted({row.part for row in rows.values() if row.part})


def mint(bc, rows=None):
    """Put every part the table names into the game file, as real text to read a field by."""
    parts = words_of(rows if rows is not None else table())
    for word in parts:
        text_object(bc, word)
    return parts


def as_text(bc, word):
    """One of our own words, as the text object this build minted for it."""
    found = minted_text(bc, word)
    guard(found is not None, "`%s` has not been minted -- put the effect's words in first" % word)
    return found


def emit_forget(bc, r):
    """Empty the places before an id is read: the other end of `known`."""
    def op(name, **operands):
        return written(template(bc, name), **operands)

    # what empty LOOKS like, one way per instruction a place may declare it is emptied with
    nothing = {"Int": lambda place: op("Int", dst=place, ptr=number(bc, 0)),
               "Null": lambda place: op("Null", dst=place)}
    out = []
    for name, _, empty in CARRIES:
        guard(empty in nothing, "`%s` says it is emptied with `%s`, and emptying is %s"
              % (name, empty, ", ".join("`%s`" % how for how in sorted(nothing))))
        out.append(nothing[empty](r[name]))
    return out


def behaviours():
    """Every act (one file each) and the number it writes for itself; two claiming one refuse."""
    import importlib
    from framework.names import members
    out = {}
    for name in members("framework.acts"):
        act = importlib.import_module("framework.acts.%s" % name)
        stage, num = getattr(act, "STAGE", None), getattr(act, "NUMBER", None)
        guard(stage and isinstance(num, int) and not isinstance(num, bool) and num > 0,
              "`%s` is an act and says its stage is %r and its number %r" % (name, stage, num))
        taken = [already for already, n in out.items() if n == num]
        guard(not taken, "`%s` and `%s` both claim the number %d"
              % (taken[0] if taken else "?", stage, num))
        out[stage] = num
    guard(out, "no act declares a number, so no row could name one")
    return out


def emit_row(bc, r, row):
    """One effect's row written into its places, settled at build: a classifier branch."""
    guard(row.sign in ADDS, "`%s` signs itself %r" % (row.name, row.sign))
    guard(row.repeat in LUMP, "`%s` repeats as %r" % (row.name, row.repeat))
    guard(row.stamp in STAMP_IS, "`%s` credits %r" % (row.name, row.stamp))
    guard(row.part is None or row.part in PARTS, "`%s` reads `%s`" % (row.name, row.part))
    guard(row.amount in FROM, "`%s` takes its number from %r" % (row.name, row.amount))
    guard(row.behaviour in behaviours(), "`%s` is carried out by `%s`, and the acts are %s"
          % (row.name, row.behaviour, ", ".join(sorted(behaviours()))))

    def op(name, **operands):
        return written(template(bc, name), **operands)

    # the part may be nothing at all, and nothing is what a whole-map effect reads of a target
    part = ([op("GetGlobal", **{"dst": r["part"], "global": as_text(bc, row.part)})]
            if row.part else [op("Null", dst=r["part"])])
    # a held word is carried out by the production act under its own number, from the table
    from framework.effecttable import held_named
    held = held_named(row.name)
    does = held.number if held else behaviours()[row.behaviour]
    # `SpawnNotTUnit`: whether `Not` was taken off the piece; False, a spelling that takes none
    said = r.get(NEGATED)
    turned = [] if said is False else [op("Mov", dst=r["turned"], src=said) if said else op(
        "Int", dst=r["turned"], ptr=number(bc, 0))]
    return [
        op("Int", dst=r["known"], ptr=number(bc, 1)),
        op("Int", dst=r["adds"], ptr=number(bc, ADDS[row.sign])),
        op("Int", dst=r["lump"], ptr=number(bc, LUMP[row.repeat])),
        op("Int", dst=r["stamp"], ptr=number(bc, STAMP_IS[row.stamp])),
        op("Int", dst=r["does"], ptr=number(bc, does)),
        op("Int", dst=r["one"], ptr=number(bc, FROM[row.amount])),
    ] + turned + part


def known_effects(bc, r, spellings, rows=None):
    """Each EFFECT spelling (only effects) paired with the block that writes its own row down."""
    from framework.turned import turnable
    from framework.pieceword import SHARED_PLAINS, SHARES_ITS_PLAIN
    rows = rows if rows is not None else table()
    out, plain = [], {one.text for one in spellings if not one.targeted}
    for one in spellings:
        if one.word.family != "effects":
            continue
        guard(one.word.spelling in rows,
              "`%s` is an effect with no row in the table" % one.word.spelling)
        # ⛔ ONE WORD, ONE BRANCH: a marked way writes the same row, so it runs its plain one's
        if one.targeted and one.word.spelling in plain:
            SHARES_ITS_PLAIN.add(one.text)
            SHARED_PLAINS.add(one.word.spelling)
        # a spelling `Not` never turns (`GainTRes`) writes nothing of it: the forgetting's 0 stands
        said = r if r.get(NEGATED) is None or turnable(one) else dict(r, **{NEGATED: False})
        out.append((one, emit_row(bc, said, rows[one.word.spelling])))
    guard(out, "no effect has a spelling, so no branch would ever write a row")
    return out


def install(bc):
    """Mint the words an effect's row names; every branch is written in the bake."""
    rows = table()
    parts = mint(bc, rows)
    guard(set(STAMP_IS) == set(STAMPS), "the credits are %s and their numbers name %s"
          % (STAMPS, sorted(STAMP_IS)))
    return ("EFFECT DATA: %d row(s) reach the game as %d thing(s) each, forgotten before "
            "every id -- %s minted as parts, %d credits numbered, and not one of them is a "
            "position" % (len(rows), len(CARRIES),
                          ", ".join("`%s`" % p for p in parts) or "none", len(STAMP_IS)))
