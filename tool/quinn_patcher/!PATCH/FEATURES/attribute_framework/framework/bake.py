#!/usr/bin/env python3
"""Where the game files an authored row against its wearer: id, row number and application meet."""
from crashlink import disasm

from tools.project import gv, guard
from tools.hlcode import (argument_kind, assemble, call_sites, field_by_name, fields_of,
                          function_named, kind_named, number,
                          returns_type, shared_function, template, written)
from tools.splice import insert
from framework import boundary, columns, effectdata, triggermatch, idwalk, mark, ownermatch, parsed
from framework import (multmatch, narrowmatch, parammatch, pieceword, reach,
                   ridermatch, sayonce, trailing)
from framework import membercount, narrowcount, sayonce, scopematch, scopeturn, tray
from framework import questpick, traps, turned
from framework.oneshot import MAP
from framework.names import vocabulary
from framework.parsed import HELD_BY, a_new_place
from framework.rowreader import PREFIX, reader_for

# the game's own filing of one application, and what it is about -- both checked by name
SITE = "logic.AttributesManager.addRawApplication"
# where the block leaves when the row is not ours, and the two walks' own places
DONE = "the bake is done"
THE_ID, THE_PIECE = "the bake's id", "the bake's piece"
# what the kept column holds when no effect named one: the classifier's own emptiness
NO_COLUMN = 0
# what this splice is called; its own record answers to it (the place cannot be found twice)
SPLICE = "the bake"
# the key of the one bake the game's filing and every road's restore call
SHARED_BAKE = "a row's bake"
# the one trigger whose own place in the game is HERE, and where its raising leaves
ON_THIS = "OnThis"
NOT_ON_THIS, THE_MAP_IS_THERE = "this row is not OnThis", "there is a map of marks"
# ⛔ NO WORD AT THIS DOOR: it is walked about a hundred thousand times a match


def site(bc):
    """The game's own filing of an application, found by name."""
    return function_named(bc, SITE)


def what_is_in_hand(bc, fn):
    """Where the site asks which row an id names, found by the call, and its three registers."""
    lookup = function_named(bc, boundary.LOOKUP)
    asked = call_sites(fn, lookup)
    guard(len(asked) == 1,
          "%s asks %s %d time(s), and this reads the one" % (SITE, boundary.LOOKUP, len(asked)))
    at = asked[0]
    call = fn.ops[at]
    id_reg, row_reg = gv(call.df["arg0"]), gv(call.df["dst"])
    # the id was read off something a moment earlier, and that something is the application
    read = [i for i in range(at)
            if fn.ops[i].op == "Field" and gv(fn.ops[i].df["dst"]) == id_reg]
    guard(read, "nothing in %s reads the id off anything, so there is no application" % SITE)
    application = gv(fn.ops[read[-1]].df["obj"])
    found = disasm.type_name(bc, list(fn.regs)[application].resolve(bc))
    guard(found == HELD_BY,
          "the id in %s is read off a %s, and this keeps things under a %s"
          % (SITE, found, HELD_BY))
    guard(gv(list(fn.regs)[id_reg]) == reader_for(bc).text_kind,
          "the id handed to %s is not the text a modder wrote" % boundary.LOOKUP)
    return at + 1, id_reg, row_reg, application


def _effects(bc, fn, effect_row, words, kept_column, hands, which_multiplier):
    """Each effect's branch, keeping its column and its `Not`; a count offered opens a group."""
    from framework.questtimer import emit_in_use
    column, handed = hands["column"], dict(effect_row, **{effectdata.NEGATED: hands[turned.HAND]})
    return [(one, block + [written(template(bc, "Mov"), dst=kept_column, src=column)]
             + narrowcount.emit_weighing(bc, which_multiplier, one.word)
             + emit_in_use(bc, fn, one.word.spelling))
            for one, block in effectdata.known_effects(bc, handed, pieceword.spellings(words))]


def emit(bc, fn, *, id_reg, row_reg, application, reader=None):
    """The shared bake's body: read the id, keep what it said, and hand back the trigger named."""
    reader = reader or reader_for(bc)
    words = vocabulary()

    def op(name, **operands):
        return written(template(bc, name), **operands)

    effect_row = effectdata.registers(bc, fn, reader)
    which_scope = scopematch.registers(bc, fn, reader)
    which_hook, which_reach = (m.registers(bc, fn, reader) for m in (triggermatch, reach))
    # and WHO may accept the row (an owner word), and WHO its result counts for (a rider)
    which_owner = ownermatch.registers(bc, fn, reader)
    which_rider = ridermatch.registers(bc, fn, reader)
    # and WHICH NARROWING WORDS: a SET, bits of one number each branch ORs its own into
    which_narrowing = narrowmatch.registers(bc, fn, reader)
    which_parameter = parammatch.registers(bc, fn, reader)
    which_multiplier = multmatch.registers(bc, fn, reader)
    listed = which_multiplier[narrowmatch.KEPT_HAND] = which_narrowing[narrowmatch.KEPT_HAND]
    a_bit, walking = a_new_place(bc, fn, reader.count_kind), idwalk.registers(bc, fn, reader)
    classifying = pieceword.registers(bc, fn, reader)
    # the column we KEEP (the effect's, not the last piece's), and what each kept column NAMES
    kept_column = classifying["effect column"] = a_new_place(bc, fn, reader.count_kind)
    kept_named, kept_hook_named, kept_scope_named = (
        a_new_place(bc, fn, reader.text_kind) for _ in range(3))
    kept_narrow_named, kept_param_named, kept_count_named, kept_member_named = (
        reader.borrow_register(bc, fn, "listing_kind") for _ in range(4))
    # which numbered columns the application carries of its own, asked of the application
    carried = _the_columns_the_game_itself_carries(bc)

    making, maps = parsed.emit_ready(bc, fn)
    hands = _hands(bc, fn, classifying, reader, row_reg, application, carried, words, which_scope)
    known = _effects(bc, fn, effect_row, words, kept_column, hands, which_multiplier)
    # a marked SCOPE keeps its own column too (`TUnit_OnTSiegeAction_GainT3Res`)
    known += scopematch.branches(bc, which_scope, words, classifying["column"], hands[turned.HAND])
    # a marked TRIGGER keeps its column; narrowings past it are its own, and a group it opens
    known += triggermatch.branches(bc, which_hook, words, classifying["column"], which_multiplier,
                                then=narrowmatch.emit_at_a_trigger(bc, which_narrowing),
                                hands=hands)
    # ⛔ MERGED INTO THE SCOPE'S BRANCH: the classifier takes the FIRST match, same text
    owned = {one.text: block for one, block in ownermatch.branches(bc, which_owner, words, hands)}
    known = [(one, block + owned.get(one.text, [])) for one, block in known if not one.with_owner]
    # APPENDED, SAFELY: a rider is a piece of its own (`_ForMe`) no branch above claims
    known += ridermatch.branches(bc, which_rider, words, hands)
    # a narrowing is a piece of its own or narrows a unit count; an effect ends its reach
    narrowed = narrowmatch.branches(bc, which_narrowing, words, classifying["column"], a_bit,
                                    kept_narrow_named, hands)
    known = membercount.narrowing(bc, which_multiplier, known + narrowed, classifying["column"],
                                  kept_member_named, hands) + narrowmatch.unwalled(
        bc, which_narrowing, words, a_bit, kept_narrow_named, hands)
    for match, r, kept in ((multmatch, which_multiplier, kept_count_named),
                           (membercount, which_multiplier, kept_member_named),
                           (parammatch, which_parameter, kept_param_named)):
        known += match.branches(bc, r, words, classifying["column"], kept, hands)
    known, offered = trailing.gate(bc, fn, known, a_bit, THE_PIECE, reader, filing=lambda word: (
        questpick.emit_head(bc, word, kept_narrow_named, hands)))
    found = dict(effect_row, column=kept_column,
                 **{columns.PART: kept_named, columns.PART_FOR_HOOK: kept_hook_named,
                    columns.PART_FOR_SCOPE: kept_scope_named,
                    columns.PART_FOR_NARROWING: kept_narrow_named,
                    columns.PART_FOR_PARAMETER: kept_param_named,
                    columns.PART_FOR_COUNT: kept_count_named,
                    columns.PART_FOR_MEMBERS: kept_member_named},
                 **_what_the_words_said(which_scope, which_hook, which_reach, which_owner,
                                        which_rider, which_narrowing, which_parameter),
                 **which_multiplier)

    return assemble(
        making + hands["apart"] + listed.emit_new()
        # the other end of all THREE latches: only a branch that IS one writes anything below
        + effectdata.emit_forget(bc, effect_row)
        + scopematch.emit_forget(bc, which_scope) + scopeturn.emit_forget(bc, which_scope)
        + triggermatch.emit_forget(bc, which_hook)
        + ownermatch.emit_forget(bc, which_owner)
        + ridermatch.emit_forget(bc, which_rider)
        + narrowmatch.emit_forget(bc, which_narrowing, kept_narrow_named)
        + parammatch.emit_forget(bc, which_parameter, kept_param_named)
        + multmatch.emit_forget(bc, which_multiplier, kept_count_named) + offered
        + membercount.emit_forget(bc, which_multiplier, kept_member_named)
        + emit_forget_the_column(bc, op, kept_column)
        + idwalk.emit_walk(bc, fn=fn, id_reg=id_reg, regs=walking, reader=reader,
                           places=THE_ID,
                           body=pieceword.emit_classify(bc, places=THE_PIECE,
                               fn=fn, piece_reg=walking["piece"], regs=classifying, known=known,
                               reader=reader, unknown=_unread(bc, fn, which_scope),
                               negated=hands[turned.HAND], table=True) + hands["listing"])
        # THE IDS THE COLUMNS NAME, by the row's position; ⛔ the reach is read by the road instead
        + _what_a_column_names(bc, fn, op, reader, row_reg=row_reg, wanted=kept_column,
                               into=kept_named, application=application, carried=carried)
        + _what_a_column_names(bc, fn, op, reader, row_reg=row_reg, into=kept_hook_named,
                               wanted=which_hook[triggermatch.AT_COLUMN],
                               application=application, carried=carried)
        # and the scope's own, when the scope was marked. A third read of the same list
        + _what_a_column_names(bc, fn, op, reader, row_reg=row_reg, into=kept_scope_named,
                               wanted=which_scope[scopematch.AT_COLUMN],
                               application=application, carried=carried)
        + parsed.emit_writing(bc, fn, application, found, maps, listed, reader)
        + [DONE + ":", op("Label"), op("Ret", ret=which_hook[triggermatch.NAMED])])


def emit_call(bc, fn, row_id, row, application, reader):
    """One bake for the game's filing and each road's restore; it hands back the trigger."""
    kinds = [gv(list(fn.regs)[r]) for r in (row_id, row, application)]

    def body(made):
        out = list(emit(bc, made, id_reg=0, row_reg=1, application=2, reader=reader))
        guard(gv(list(made.regs)[gv(out[-1].df["ret"])]) == reader.count_kind,
              "the bake's trigger is not kept as a count, so it cannot be handed back as one")
        return out
    shared = shared_function(bc, fn, lambda _bc, made: made, (SHARED_BAKE,) + tuple(kinds),
                             kinds, reader.count_kind, body)
    hook = a_new_place(bc, fn, reader.count_kind)
    return [written(template(bc, "Call3"), dst=hook, fun=shared,
                    arg0=row_id, arg1=row, arg2=application)], hook


def _hands(bc, fn, classifying, reader, row_reg, application, carried, words, which_scope):
    """What a word's branch may reach for: a place, a column read, a line said, a negation, a no."""
    def op(name, **operands):
        return written(template(bc, name), **operands)
    return {"place": lambda k: a_new_place(bc, fn, k), "resolve": lambda wanted, into:
            _what_a_column_names(bc, fn, op, reader, row_reg=row_reg, wanted=wanted,
                                 into=into, application=application, carried=carried),
            "say": lambda word: sayonce.emit(bc, fn, word, even_when_quiet=True),
            turned.HAND: turned.place_for(bc, fn, reader, words),
            pieceword.OWNER_HAND: classifying["owner"],
            # whether the piece was marked, its column, the effect's, and the classifier's 0 and 1
            **{k: classifying[k] for k in ("marked", "column", "effect column", "zero", "one")},
            "refuse": lambda: _unread(bc, fn, which_scope), "apart": [], "listing": []}


def _unread(bc, fn, which_scope):
    """A piece no word reads turns the whole row away, rather than running it without that word."""
    return [written(template(bc, "Int"), dst=which_scope[scopematch.NAMED],
                    ptr=number(bc, scopematch.NOT_OURS))]


def _what_the_words_said(scope, hook, reach_of, owner, rider, narrowing, parameter):
    """What each word's match keeps for the row: which one it was, and the column it marked."""
    return {scopematch.NAMED: scope[scopematch.NAMED],
            scopematch.AT_COLUMN: scope[scopematch.AT_COLUMN],
            scopeturn.TURNED: scope[scopeturn.TURNED],
            triggermatch.NAMED: hook[triggermatch.NAMED],
            triggermatch.AT_COLUMN: hook[triggermatch.AT_COLUMN],
            triggermatch.TURNED: hook[triggermatch.TURNED],
            reach.NAMED: reach_of[reach.NAMED], ownermatch.NAMED: owner[ownermatch.NAMED],
            ridermatch.NAMED: rider[ridermatch.NAMED],
            parammatch.NAMED: parameter[parammatch.NAMED],
            parammatch.AT_COLUMN: parameter[parammatch.AT_COLUMN]}


def _the_columns_the_game_itself_carries(bc):
    """Which numbered columns an application carries of its own (right per USE), by asking IT."""
    names, _fields = fields_of(bc, kind_named(bc, HELD_BY), "one application")
    carried = {}
    for name in names:
        if not name.startswith(PREFIX):
            continue
        rest = name[len(PREFIX):]
        which = int(rest) if rest.isdigit() else (1 if rest == "" else None)
        if which is not None:
            carried[which] = field_by_name(bc, kind_named(bc, HELD_BY), name, "one application")
    return carried


def _off_the_application(bc, fn, op, carried, wanted, application, into, done):
    """Take the column off the application when the game carries that number there."""
    out = []
    for which, (at, kind) in sorted(carried.items()):
        mine = a_new_place(bc, fn, kind)
        asked = a_new_place(bc, fn, reader_for(bc).count_kind)
        past = "%s is not column %d" % (done, which)
        out += [op("Int", dst=asked, ptr=number(bc, which)),
                (op("JNotEq", a=wanted, b=asked), past),
                op("Field", dst=mine, obj=application, field=at),
                (op("JNull", reg=mine), done),
                # every target kind carries its id as text in its own first payload
                op("EnumField", dst=into, value=mine, construct=0, field=0),
                (op("JAlways"), done),
                past + ":",
                op("Label")]
    return out


def _unless_the_number_matches(op, in_list, wanted, places, goes_to):
    """Take the entry at `places["at"]` out of `in_list` and leave unless its number is `wanted`."""
    return [op("Field", dst=places["backing"], obj=in_list, field=places["held_in"]),
            op("GetArray", dst=places["got"], array=places["backing"], index=places["at"]),
            (op("JNull", reg=places["got"]), goes_to),
            op("UnsafeCast", dst=places["holding"], src=places["got"]),
            op("Field", dst=places["number"], obj=places["holding"],
               field=places["amount_at"]),
            (op("JNotEq", a=places["number"], b=wanted), goes_to)]


def _holds_them(bc):
    """The kind a list keeps what it holds in, asked of the list's own field."""
    _f, kind = field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES), tray.BACKING_ON, "a list")
    return kind


def _what_a_column_names(bc, fn, op, reader, *, row_reg, wanted, into, application, carried):
    """What column `wanted` names: off the application, else the load's record; else nothing."""
    counted, _c = field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES), tray.COUNT_ON, "a list")
    held_in, holds_them = field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES),
                                        tray.BACKING_ON, "a list")
    made = tray.recipe(bc)
    amount_at = made["amount"]
    val_at, _v = field_by_name(bc, kind_named(bc, HELD_BY), columns.WHICH_USE, "one application")
    lists = a_new_place(bc, fn, kind_named(bc, tray.ARRAY_OF_ENTRIES))
    attrs = a_new_place(bc, fn, kind_named(bc, tray.ARRAY_OF_ENTRIES))
    uses = a_new_place(bc, fn, kind_named(bc, tray.ARRAY_OF_ENTRIES))
    holding = a_new_place(bc, fn, made["entry"])
    holds_number = a_new_place(bc, fn, made["of"]["held"])
    want_attr = a_new_place(bc, fn, made["of"]["held"])
    want_use = a_new_place(bc, fn, made["of"]["held"])
    mine = a_new_place(bc, fn, kind_named(bc, tray.ARRAY_OF_ENTRIES))
    backing = a_new_place(bc, fn, holds_them)
    got = a_new_place(bc, fn, reader.value_kind)
    how_many = a_new_place(bc, fn, reader.count_kind)
    at = a_new_place(bc, fn, reader.count_kind)
    floor = a_new_place(bc, fn, reader.count_kind)
    done = "the column numbered for the place at %d is settled" % into
    scanning = "looking for this row among the ones kept, at %d" % into
    not_this_one = "that kept row is another use, at %d" % into
    this_one = "that kept row is this use, at %d" % into
    # the places the two comparisons below both read through, named once
    places = {"backing": backing, "got": got, "holding": holding, "number": holds_number,
              "at": at, "held_in": held_in, "amount_at": amount_at}
    return [
        op("Null", dst=into),
    ] + _off_the_application(bc, fn, op, carried, wanted, application, into, done) + [
        # THE LOAD'S THREE LISTS (attribute, use, columns); a row is this one when both match
        op("GetGlobal", **{"dst": attrs, "global": columns.slot(bc, columns.WHICH_ATTRIBUTE)}),
        (op("JNull", reg=attrs), done),
        op("GetGlobal", **{"dst": uses, "global": columns.slot(bc, columns.WHICH_USE_OF_IT)}),
        (op("JNull", reg=uses), done),
        op("GetGlobal", **{"dst": lists, "global": columns.slot(bc, columns.KEPT_COLUMNS)}),
        (op("JNull", reg=lists), done),
        # what this application is a use of, and which use of it -- both as the entries carry them
        op("ToSFloat", dst=want_attr, src=row_reg),
        op("Field", dst=want_use, obj=application, field=val_at),
        op("Int", dst=at, ptr=number(bc, 0)),
        op("Field", dst=how_many, obj=attrs, field=counted),
        scanning + ":",
        op("Label"),
        (op("JSGte", a=at, b=how_many), done),
    ] + _unless_the_number_matches(op, attrs, want_attr, places, not_this_one) + [
    ] + _unless_the_number_matches(op, uses, want_use, places, not_this_one) + [
        # both matched, so this row's own columns are the ones to read
        op("Field", dst=backing, obj=lists, field=held_in),
        op("GetArray", dst=got, array=backing, index=at),
        (op("JNull", reg=got), done),
        op("UnsafeCast", dst=mine, src=got),
        (op("JAlways"), this_one),
        not_this_one + ":",
        op("Label"),
        op("Incr", dst=at),
        (op("JAlways"), scanning),
        this_one + ":",
        op("Label"),
        # the column's own number less one is where its id sits, gaps filled in so it is exact
        op("Mov", dst=at, src=wanted),
        op("Decr", dst=at),
        op("Int", dst=floor, ptr=number(bc, 0)),
        (op("JSLt", a=at, b=floor), done),
        op("Field", dst=how_many, obj=mine, field=counted),
        (op("JSGte", a=at, b=how_many), done),
        op("Field", dst=backing, obj=mine, field=held_in),
        op("GetArray", dst=got, array=backing, index=at),
        (op("JNull", reg=got), done),
        # ⛔ REINTERPRETED, NOT CHECKED-AND-CONVERTED (a checked cast hands back nonsense)
        op("UnsafeCast", dst=into, src=got),
    ] + [
        done + ":",
        op("Label"),
    ]


def emit_raise_on_this(bc, fn, op, hook, application, reader):
    """`OnThis` MEANS ONCE WHEN THE ROW IS APPLIED; ⛔ a load files nothing, a reloaddb re-files."""
    made, holds = mark_ready(bc, fn)
    wanted = a_new_place(bc, fn, reader.count_kind)
    return made + [
        op("Int", dst=wanted, ptr=number(bc, triggermatch.number_of(ON_THIS))),
        (op("JNotEq", a=hook, b=wanted), NOT_ON_THIS),
    ] + mark.emit_raise(bc, fn, holds, application, reader) + [
        NOT_ON_THIS + ":",
        op("Label"),
    ]


def mark_ready(bc, fn):
    """The marks map, read into a place of its own; `framework/mark.py` owns how."""
    return mark.ready(bc, fn)


def emit_forget_the_column(bc, op, kept_column):
    """Empty the column before an id is read: the other end of the effect branches' latch."""
    return [op("Int", dst=kept_column, ptr=number(bc, NO_COLUMN))]


def _skip_what_is_not_ours(bc, fn, op, row_reg):
    """Ask the game where the sentinel sits, and leave unless this row is below it."""
    lookup = function_named(bc, boundary.LOOKUP)
    minted = boundary.minted(bc)
    guard(minted is not None, "the sentinel is not in this file yet -- the boundary goes first")
    holds_text = a_new_place(bc, fn, argument_kind(bc, boundary.LOOKUP))
    holds_boundary = a_new_place(bc, fn, returns_type(lookup, boundary.LOOKUP))
    return (boundary.emit_ask(op, gv(lookup.findex), minted, holds_text, holds_boundary)
            + boundary.emit_below(op, holds_boundary, row_reg, DONE))


def install(bc):
    """Write the block into the game. THE FIRST THING OF OURS THAT RUNS WHEN THE GAME DOES."""
    fn = site(bc)
    at, id_reg, row_reg, application = what_is_in_hand(bc, fn)
    reader = reader_for(bc)

    def op(name, **operands):
        return written(template(bc, name), **operands)
    called, hook = emit_call(bc, fn, id_reg, row_reg, application, reader)
    # ⛔ THE BOUNDARY IS ASKED HERE; `OnThis` is raised only where the game filed the row
    block = assemble(_skip_what_is_not_ours(bc, fn, op, row_reg) + called
                     + emit_raise_on_this(bc, fn, op, hook, application, reader)
                     + [DONE + ":", op("Label")])
    went_in = insert(bc, fn, at, block, SPLICE, traps.AT_AUTHORED_DATA)
    return ("BAKE: %d instruction(s) spliced into %s, just past the one place it asks which row "
            "an id names -- an id is read there once per application, and what it says is kept "
            "under that application" % (went_in, SITE))
