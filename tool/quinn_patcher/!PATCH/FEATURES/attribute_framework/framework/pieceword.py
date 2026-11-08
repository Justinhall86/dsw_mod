#!/usr/bin/env python3
"""Which word one piece of an authored id is: one comparison per word, compared by value."""
from tools.project import gv, guard
from tools.hlcode import function_named, minted_text, number, template, text_object, written
from framework.names import NEVER, TARGET_MARK, module_of, ways_of_writing

# what a word's file calls its own marked spelling's tail, when the mark sits after the word
MARKED_BY = "MARKED_SPELLING"
# what a plural effect's spelling ends in, cut off to read its singular's
PLURAL_MARK = "s"
# the game's own upper-casing, so a `T` before a capital letter is the mark and no other `T`
UPPER = "String.toUpperCase"
# what an effect pair must agree on but its number: the act, the part, the sign, how it repeats
SAME_IN_A_PAIR = ("part", "behaviour", "sign", "repeat", "stamp")
# what an owner word's file calls the one kind of word it may be glued to, when it has one
ONLY_BEFORE = "ONLY_BEFORE"
# what a word's file calls the owner words it alone takes glued on, then those it never takes
ONLY_OWNERS, NOT_OWNERS = "ONLY_OWNERS", "NOT_OWNERS"
from framework.rowreader import reader_for

# the registers needed, kinds off a borrowed signature (`column`: the number the digits spell)
WANTED = (("plen", "count_kind"),
          ("slen", "count_kind"),
          ("at", "count_kind"),
          ("first", "count_kind"),
          ("one", "count_kind"),
          ("zero", "count_kind"),
          ("column", "count_kind"),
          ("maybe", "number_kind"),
          ("ch", "text_kind"),
          ("tail", "text_kind"),
          ("stem", "text_kind"),
          ("word", "text_kind"),
          ("wlen", "count_kind"),
          ("found", "count_kind"),
          ("nothing", "optional_kind"),
          ("boxed", "optional_kind"),
          ("owner", "count_kind"),
          ("owner_where", "count_kind"),
          ("owner_only", "count_kind"),
          ("marked", "count_kind"),
          ("plural", "count_kind"))
# the hand a word's branch reads the owner word cut off its piece from: its number, 0 for none
OWNER_HAND = "owner"
# where that owner word sat: in front (`EnemyUnit`), after (`BordersEnemy`) or inside one
IN_FRONT, AFTER, WITHIN = 1, 2, 3
# the families an owner word is glued to; `owner_only` holds one's place here plus one, 0 for any
TAKES_OWNERS = ("scopes", "narrowing", "multipliers", "riders")


# what the classifier hands on past its block from the SPELLING, with the place kind it wants
FOUND = (("column", "count_kind"),)


class Spelling:
    """One way one of our words may be written, and what taking that branch would mean."""

    __slots__ = ("text", "word", "targeted", "with_owner")

    def __init__(self, text, word, targeted, with_owner=None):
        self.text = text
        self.word = word
        self.targeted = targeted
        # AND THE OWNER WORD THIS PIECE ALSO CARRIES: `EnemyUnit` is ONE piece
        self.with_owner = with_owner

    def __repr__(self):
        return "%s(%s%s%s)" % (self.text, self.word.spelling,
                               " targeted" if self.targeted else "",
                               " +%s" % self.with_owner.spelling if self.with_owner else "")


def spellings(words):
    """Every way every word may be written; a word with target `never` gets no marked spelling."""
    out = []
    for spelling in sorted(words):
        word = words[spelling]
        # a word may say where its mark goes instead: `Borders` is marked as `BordersTFaction`
        tail = getattr(module_of(word), MARKED_BY, None)
        for written_as in [spelling, glued(word, tail)] if tail else ways_of_writing(spelling):
            marked = written_as != spelling
            if marked and word.target == NEVER:
                continue
            out.append(Spelling(written_as, word, marked))
    return out + _owned_ways(words, out)


def _owned_ways(words, already):
    """Each owner word glued to a scope (`EnemyUnit`) or a faction-asking word, after if it says."""
    # inside after its stem, a way not starting with it (`TPerAgt`) takes none: `PerEnemyTAgt`
    return [Spelling(glued(one.word, owner.spelling, one.text), one.word, one.targeted,
                     with_owner=owner) for one in already for owner in owners_taken(one, words)
            if glued(one.word, "", one.text) == one.text]


def where_of(word):
    """Where an owner word sits on this word: in front, after, or inside after its stem."""
    from framework.narrowmatch import owner_stem, owners_after
    return WITHIN if owner_stem(word) else AFTER if owners_after(word) else IN_FRONT


def glued(word, piece, text=None):
    """`text` (the word's own spelling unless given) with `piece` where an owner word sits on it."""
    from framework.narrowmatch import owner_stem
    text, where = text or word.spelling, where_of(word)
    if where == WITHIN:
        stem = owner_stem(word)
        return stem + piece + text[len(stem):]
    return text + piece if where == AFTER else piece + text


def owners_taken(one, words):
    """The owner words one plain spelling may carry glued on; none for most."""
    from framework.narrowmatch import owners_after, owners_pick
    if one.with_owner is not None or (one.targeted and owners_after(one.word)):
        return []
    if one.word.family not in TAKES_OWNERS or (one.word.family != "scopes"
                                               and not owners_pick(one.word)):
        return []
    # `Any` stands only before a narrowing; an owner word saying nothing goes anywhere
    mine = module_of(one.word)
    only = getattr(mine, ONLY_OWNERS, None) or set(words) - set(getattr(mine, NOT_OWNERS, ()))
    return [words[s] for s in sorted(words) if words[s].family == "owners" and s in only
            and getattr(module_of(words[s]), ONLY_BEFORE, one.word.family) == one.word.family]


def read_whole(words):
    """The spellings a piece is compared with; an owner word glued on is cut off and read apart."""
    every = spellings(words)
    plain = {one.text for one in every if one.with_owner is None}
    clash = sorted(one.text for one in every if one.with_owner is not None and one.text in plain)
    guard(not clash, "a word is spelled as an owner word glued to another: %s" % clash)
    return [one for one in every if one.with_owner is None]


def mint(bc, words):
    """Put every one of those spellings into the game file, as real text to compare against."""
    every = spellings(words)
    for one in every:
        text_object(bc, one.text)
    return every


def registers(bc, fn, reader=None):
    """Every register this needs, on `fn`, each typed from a borrowed signature."""
    reader = reader or reader_for(bc)
    return {name: reader.borrow_register(bc, fn, kind) for name, kind in WANTED}


def emit_digits_off(bc, r, reader, piece_reg, places):
    """Take the trailing digits off the piece: `stem` is what is left, `column` is the number."""
    def op(name, **operands):
        return written(template(bc, name), **operands)

    def to(place):
        return "%s %s" % (places, place)

    return [
        op("Int", dst=r["zero"], ptr=reader.zero),
        op("Int", dst=r["one"], ptr=reader.one),
        op("Int", dst=r["column"], ptr=reader.zero),
        op("Null", dst=r["nothing"]),
        op("Field", dst=r["plen"], obj=piece_reg, field=reader.text_length_field),
        # no digits until one is found, so the stem is the whole piece
        op("Mov", dst=r["first"], src=r["plen"]),
        op("Sub", dst=r["at"], a=r["plen"], b=r["one"]),
        to("BACK") + ":",
        op("Label"),
        (op("JSLt", a=r["at"], b=r["zero"]), to("CUT")),
        # ONE character, asked on its own: a whole tail would read `Res3x` as `Res` and a 3
        op("ToDyn", dst=r["boxed"], src=r["one"]),
        op("Call3", dst=r["ch"], fun=gv(reader.tailing.findex),
           arg0=piece_reg, arg1=r["at"], arg2=r["boxed"]),
        op("Call1", dst=r["maybe"], fun=gv(reader.numbering.findex), arg0=r["ch"]),
        (op("JNull", reg=r["maybe"]), to("CUT")),
        op("Mov", dst=r["first"], src=r["at"]),
        op("Sub", dst=r["at"], a=r["at"], b=r["one"]),
        (op("JAlways"), to("BACK")),
        to("CUT") + ":",
        op("Label"),
        # the stem is everything in front of the digits, and it may be the whole piece
        op("ToDyn", dst=r["boxed"], src=r["first"]),
        op("Call3", dst=r["stem"], fun=gv(reader.tailing.findex),
           arg0=piece_reg, arg1=r["zero"], arg2=r["boxed"]),
        # ONCE: the stem is the same for every comparison below, so its length is too
        op("Field", dst=r["slen"], obj=r["stem"], field=reader.text_length_field),
        # and the digits themselves are a number, when there were any
        (op("JEq", a=r["first"], b=r["plen"]), to("NONUMBER")),
        op("Call3", dst=r["tail"], fun=gv(reader.tailing.findex),
           arg0=piece_reg, arg1=r["first"], arg2=r["nothing"]),
        op("Call1", dst=r["maybe"], fun=gv(reader.numbering.findex), arg0=r["tail"]),
        (op("JNull", reg=r["maybe"]), to("NONUMBER")),
        op("SafeCast", dst=r["column"], src=r["maybe"]),
        to("NONUMBER") + ":",
        op("Label"),
    ]


def _owner_fits(bc, r, spelling, words, past, tag):
    """Past this the owner word cut off the piece, if any, is one this spelling may carry there."""
    def op(name, **operands):
        return written(template(bc, name), **operands)
    if not owners_taken(spelling, words):
        return [(op("JNotEq", a=r["owner"], b=r["zero"]), past)]
    from framework.wordtable import kept_to
    fits, its, kept = "%s OWNER FITS" % tag, TAKES_OWNERS.index(spelling.word.family) + 1, kept_to()
    # ⛔ ASKED ONLY AS FAR AS IT CAN FAIL: no owner word kept to another family, no family test
    family = [] if not kept - {its} else [(op("JNotEq", a=r["owner_only"], b=r["zero"]), past)] if (
        its not in kept) else [(op("JEq", a=r["owner_only"], b=r["zero"]), fits),
                               op("Int", dst=r["at"], ptr=number(bc, its)),
                               (op("JNotEq", a=r["owner_only"], b=r["at"]), past)]
    return [(op("JEq", a=r["owner"], b=r["zero"]), fits),
            op("Int", dst=r["at"], ptr=number(bc, where_of(spelling.word))),
            (op("JNotEq", a=r["owner_where"], b=r["at"]), past)] + family + [
        fits + ":", op("Label")]


def emit_classify(bc, *, fn, piece_reg, regs, known, reader=None, unknown=(), places="a piece",
                  negated=None, cut=True, table=False):
    """Which word this piece is: one comparison per word, or one look-up for a `table` family."""
    from framework import turned, wordtable
    from framework.names import vocabulary
    r, reader = regs, (reader or reader_for(bc))
    guard(gv(list(fn.regs)[piece_reg]) == reader.text_kind,
          "register %d holds t@%s, not the text a piece is"
          % (piece_reg, gv(list(fn.regs)[piece_reg])))
    guard(known, "no spelling was given, so every piece would be unknown")
    words = vocabulary()
    groups = grouped(known, words)
    looked = wordtable.looked_up(groups) if table else []
    steps = wordtable.steps(groups, looked)
    # a negation is read once, off the piece, and the turnable words alone are asked again
    narrowing = [i for i, step in enumerate(steps)
                 if any(turned.turnable(one) for g in (looked if step is None else [step])
                        for one, _ in g.slots.values())]
    guard(narrowing or negated is None, "no spelling takes a negation")

    def fits(one, past, tag):
        return _owner_fits(bc, r, one, words, past, tag)
    block = emit_digits_off(bc, r, reader, piece_reg, places)
    block += [] if negated is None else turned.emit_none_yet(bc, negated)
    block += [written(template(bc, "Int"), dst=r[flag], ptr=reader.zero)
              for flag in ("owner", "owner_where", "owner_only", "marked", "plural")]
    block += ["%s ASKED AGAIN" % places + ":", written(template(bc, "Label"))]
    for which, group in enumerate(steps):
        if negated is not None and which == narrowing[0]:
            block += turned.emit_again_here(bc, places)
        block += (wordtable.emit_looked_up(bc, fn, r, reader, looked, places, negated, fits)
                  if group is None else
                  _emit_group(bc, r, reader, group, places, groups.index(group), negated, fits))
        if negated is not None and which == narrowing[-1]:
            block += turned.emit_only_narrowings(bc, r, negated, places)
    # ⛔ `Not` OFF BEFORE THE MARK: cut first, `NotWithTFaction` leaves `WithFaction`, no word
    if negated is not None:
        block += turned.emit_taken_off(bc, fn, r, reader, negated, places)
    if cut:
        block += _emit_mark_off(bc, r, reader, places, groups, negated)
        block += emit_owner_off(bc, fn, r, reader, places, negated, [o for o, _ in known], words)
        # ⛔ LAST: an `s` cut first loses the end of `EnemyHasTRes`, read as `HasRe`
        block += _emit_plural_off(bc, r, reader, places, groups)
    return block + list(unknown) + ["%s DONE" % places + ":",
                                    written(template(bc, "Label"))]


def owners_cut(known, words):
    """Each place an owner word may be cut off, with the owner words in the order they are tried."""
    sides = {IN_FRONT: set(), AFTER: set(), WITHIN: set()}
    for one in known:
        sides[where_of(one.word)].update(w.spelling for w in owners_taken(one, words))
    # ⛔ THE LONGEST FIRST: `AllyUnit` is `Ally` + `Unit`, never `All` + `yUnit`
    return [(where, sorted(sides[where], key=lambda s: (-len(s), s)))
            for where in (IN_FRONT, AFTER, WITHIN)]


def stems(known):
    """Each start of a spelling an owner word may sit straight after, inside it."""
    from framework.narrowmatch import owner_stem
    return sorted({owner_stem(one.word) for one in known if where_of(one.word) == WITHIN})


def emit_owner_off(bc, fn, r, reader, places, negated, known, words):
    """Read no word: cut the longest owner word on the table off, once, and ask the rest again."""
    from framework.wordtable import emit_cut_owner
    uncut, again = "%s OWNER UNCUT" % places, "%s OWNER CUT" % places
    out = [(_op(bc, "JNotEq", a=r["owner"], b=r["zero"]), uncut)] + emit_cut_owner(
        bc, fn, r, reader, places, [w for w, owners in owners_cut(known, words) if owners], again,
        stems(known))
    out += [(_op(bc, "JAlways"), uncut), again + ":", _op(bc, "Label")]
    # a piece a negation was taken off is asked again of the turnable spellings alone
    if negated is not None:
        out += [(_op(bc, "JNotEq", a=negated, b=r["zero"]), "%s TURNED AGAIN" % places)]
    return out + [(_op(bc, "JAlways"), "%s ASKED AGAIN" % places), uncut + ":", _op(bc, "Label")]


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def plurals(words):
    """Every plural effect whose singular is an effect alike in all but its number: {s: one}."""
    from framework.effecttable import table
    from framework.trailing import needs_of, offers_of
    rows, out = table(words), {}
    for one in sorted(rows):
        many = one + PLURAL_MARK
        if many not in rows or words[one].target != words[many].target:
            continue
        if all(getattr(rows[one], f, None) == getattr(rows[many], f, None)
               for f in SAME_IN_A_PAIR) and offers_of(words[one]) == offers_of(words[many]) \
                and needs_of(words[one]) == needs_of(words[many]):
            out[many] = one
    return out


# the marked spellings running their plain one's branch, and the plain effects that read the mark
SHARES_ITS_PLAIN, SHARED_PLAINS = set(), set()


def slotted(group, slot):
    """The (spelling, branch) a slot runs: a marked one sharing its plain one's runs that."""
    one, block = group.slots[slot]
    if one.text in SHARES_ITS_PLAIN:
        guard((False, slot[1]) in group.slots, "`%s` is marked with no plain way" % one.text)
        return group.slots[(False, slot[1])]
    return one, block


class Group:
    """One word's comparison: its text, and the branch for each way it was written."""

    def __init__(self, text, literal):
        self.text, self.literal, self.slots = text, literal, {}


def grouped(known, words):
    """`known` folded to one group per word; a `T` anywhere and a plural `s` become slots."""
    pairs, groups, out = plurals(words), {}, []
    for one, block in known:
        word = one.word.spelling
        literal = one.targeted and one.text not in ways_of_writing(word)[1:]
        text = one.text if literal else pairs.get(word, word)
        slot = (False, False) if literal else (bool(one.targeted), word in pairs)
        if (text, literal) not in groups:
            groups[(text, literal)] = Group(text, literal)
            out.append(groups[(text, literal)])
        groups[(text, literal)].slots.setdefault(slot, (one, block))
    return out


def _emit_group(bc, r, reader, group, places, which, negated, fits):
    """The group's text compared once; then the branch its `T` and `s` say, else past it."""
    minted = minted_text(bc, group.text)
    guard(minted is not None, "`%s` is not in this file yet -- mint the spellings first"
          % group.text)
    past = "%s NOT %d" % (places, which)
    out = [_op(bc, "GetGlobal", **{"dst": r["word"], "global": minted}),
           _op(bc, "Call3", dst=r["found"], fun=gv(reader.finding.findex),
               arg0=r["stem"], arg1=r["word"], arg2=r["nothing"]),
           # at the front AND the same length: a stem that merely starts with it is another word
           (_op(bc, "JNotEq", a=r["found"], b=r["zero"]), past),
           _op(bc, "Field", dst=r["wlen"], obj=r["word"], field=reader.text_length_field),
           (_op(bc, "JNotEq", a=r["slen"], b=r["wlen"]), past)]

    def branch(slot):
        if slot not in group.slots:
            return [(_op(bc, "JAlways"), past)]
        return emit_branch(bc, r, group.slots[slot], "%s %d %d%d" % (places, which, *slot),
                           past, places, negated, fits)
    marked, plural, both = ("%s %d %s" % (places, which, w) for w in ("MARKED", "PLURAL", "BOTH"))
    return out + [(_op(bc, "JNotEq", a=r["marked"], b=r["zero"]), marked),
                  (_op(bc, "JNotEq", a=r["plural"], b=r["zero"]), plural)] + branch(
        (False, False)) + [plural + ":", _op(bc, "Label")] + branch((False, True)) + [
        marked + ":", _op(bc, "Label"),
        (_op(bc, "JNotEq", a=r["plural"], b=r["zero"]), both)] + branch((True, False)) + [
        both + ":", _op(bc, "Label")] + branch((True, True)) + [past + ":", _op(bc, "Label")]


def emit_branch(bc, r, slotted, tag, past, places, negated, fits):
    """One way of writing one word: its owner word and negation checked, then its block."""
    from framework.turned import turnable
    one, block = slotted
    bare = "%s WRITTEN WITH A NUMBER" % tag
    turned = [] if negated is None or turnable(one) else [
        (_op(bc, "JNotEq", a=negated, b=r["zero"]), past)]
    if turned and _marked_shares(one):
        # ⛔ ITS MARKED WAY RUNS THIS BRANCH: `Not` in front (1) passes once a column is named (1)
        turned = [(_op(bc, "JSGt", a=negated, b=r["marked"]), past)]
    shared = " TABLE " in tag and one.text in SHARED_PLAINS  # the word table's own branches
    return fits(one, past, tag) + turned + ([
        (_op(bc, "JEq", a=r["marked"], b=r["zero"]), bare)] if shared else []) + ([
        # A TARGETED WORD WRITTEN WITH NO NUMBER MEANS COLUMN ONE (`zero`, `one` set above)
        (_op(bc, "JNotEq", a=r["column"], b=r["zero"]), bare),
        _op(bc, "Mov", dst=r["column"], src=r["one"]),
        bare + ":", _op(bc, "Label")] if one.targeted or shared else []) + list(block) + [
        (_op(bc, "JAlways"), "%s DONE" % places)]


def _marked_shares(one):
    """Does a marked way of this plain spelling run its branch, and take `Not` there?"""
    from framework.turned import turned_after, where_they_sit
    guard(where_they_sit() == [1], "`Not` in front must be 1, the value a named column marks")
    return turned_after(one.word) is not None and any(
        text in SHARES_ITS_PLAIN for text in ways_of_writing(one.word.spelling)[1:])


def _emit_mark_off(bc, r, reader, places, groups, negated=None):
    """Read no word: take out the first `T` standing before a capital letter, and ask again."""
    # a piece a negation was taken off is asked again of the turnable spellings alone
    turned = [] if negated is None else [
        (_op(bc, "JNotEq", a=negated, b=r["zero"]), "%s TURNED AGAIN" % places)]
    if not any(slot[0] for g in groups for slot in g.slots):
        return []
    skip, again = "%s NO MARK" % places, "%s NEXT T" % places
    upper, joined = function_named(bc, UPPER), function_named(bc, "$String.__add__")
    return [(_op(bc, "JNotEq", a=r["marked"], b=r["zero"]), skip),
            _op(bc, "Mov", dst=r["at"], src=r["zero"]),
            again + ":", _op(bc, "Label"),
            _op(bc, "GetGlobal", **{"dst": r["tail"], "global": text_object(bc, TARGET_MARK)}),
            _op(bc, "ToDyn", dst=r["boxed"], src=r["at"]),
            _op(bc, "Call3", dst=r["found"], fun=gv(reader.finding.findex),
                arg0=r["stem"], arg1=r["tail"], arg2=r["boxed"]),
            (_op(bc, "JSLt", a=r["found"], b=r["zero"]), skip),
            _op(bc, "Mov", dst=r["first"], src=r["found"]),
            _op(bc, "Add", dst=r["at"], a=r["found"], b=r["one"]),
            (_op(bc, "JSGte", a=r["at"], b=r["slen"]), skip),
            # the letter after it, and whether upper-casing leaves it as it is
            _op(bc, "ToDyn", dst=r["boxed"], src=r["one"]),
            _op(bc, "Call3", dst=r["ch"], fun=gv(reader.tailing.findex),
                arg0=r["stem"], arg1=r["at"], arg2=r["boxed"]),
            _op(bc, "Call1", dst=r["word"], fun=gv(upper.findex), arg0=r["ch"]),
            _op(bc, "Call3", dst=r["found"], fun=gv(reader.finding.findex),
                arg0=r["word"], arg1=r["ch"], arg2=r["nothing"]),
            (_op(bc, "JNotEq", a=r["found"], b=r["zero"]), again),
            # what is in front of it and what is after it, joined into the stem asked again
            _op(bc, "ToDyn", dst=r["boxed"], src=r["first"]),
            _op(bc, "Call3", dst=r["word"], fun=gv(reader.tailing.findex),
                arg0=r["stem"], arg1=r["zero"], arg2=r["boxed"]),
            _op(bc, "Call3", dst=r["tail"], fun=gv(reader.tailing.findex),
                arg0=r["stem"], arg1=r["at"], arg2=r["nothing"]),
            _op(bc, "Call2", dst=r["stem"], fun=gv(joined.findex), arg0=r["word"],
                arg1=r["tail"]),
            _op(bc, "Field", dst=r["slen"], obj=r["stem"], field=reader.text_length_field),
            _op(bc, "Mov", dst=r["marked"], src=r["one"])] + turned + [
            (_op(bc, "JAlways"), "%s ASKED AGAIN" % places),
            skip + ":", _op(bc, "Label")]


def _emit_plural_off(bc, r, reader, places, groups):
    """Read no word: take a last `s` off, and ask again for a word whose plural that is."""
    if not any(slot[1] for g in groups for slot in g.slots):
        return []
    skip = "%s NO PLURAL" % places
    return [(_op(bc, "JNotEq", a=r["plural"], b=r["zero"]), skip),
            (_op(bc, "JSGte", a=r["one"], b=r["slen"]), skip),
            _op(bc, "Sub", dst=r["at"], a=r["slen"], b=r["one"]),
            _op(bc, "Call3", dst=r["tail"], fun=gv(reader.tailing.findex),
                arg0=r["stem"], arg1=r["at"], arg2=r["nothing"]),
            _op(bc, "GetGlobal", **{"dst": r["word"], "global": text_object(bc, PLURAL_MARK)}),
            _op(bc, "Call3", dst=r["found"], fun=gv(reader.finding.findex),
                arg0=r["tail"], arg1=r["word"], arg2=r["nothing"]),
            (_op(bc, "JNotEq", a=r["found"], b=r["zero"]), skip),
            _op(bc, "ToDyn", dst=r["boxed"], src=r["at"]),
            _op(bc, "Call3", dst=r["stem"], fun=gv(reader.tailing.findex),
                arg0=r["stem"], arg1=r["zero"], arg2=r["boxed"]),
            _op(bc, "Field", dst=r["slen"], obj=r["stem"], field=reader.text_length_field),
            _op(bc, "Mov", dst=r["plural"], src=r["one"]),
            (_op(bc, "JAlways"), "%s ASKED AGAIN" % places),
            skip + ":", _op(bc, "Label")]


def _cuts_checked(words, every):
    """The cuts read every spelling back as it was written, or the build stops."""
    plain = {one.text for one in every if not one.targeted and one.with_owner is None}
    natural = sorted(t for t in plain if any(
        t[i] == TARGET_MARK and t[i + 1].isupper() for i in range(len(t) - 1)))
    guard(not natural, "a word's own spelling holds a `T` before a capital, so the mark "
          "cannot be told from it: %s" % natural)
    for value in (TARGET_MARK, PLURAL_MARK):
        guard(value not in plain, "`%s` is a word, and it is also what is cut off" % value)
    return plurals(words)


def install(bc):
    """Mint every spelling of every word we ship; the bake asks it of every authored id's pieces."""
    from framework.names import vocabulary
    words = vocabulary()
    every = mint(bc, words)
    read_whole(words)
    pairs = _cuts_checked(words, every)
    for value in (TARGET_MARK, PLURAL_MARK):
        text_object(bc, value)
    for value in (1, IN_FRONT, AFTER, WITHIN):
        number(bc, value)
    for stem in stems(read_whole(words)):
        text_object(bc, stem)
    marked = len([one for one in every if one.targeted])
    return ("PIECE WORD: %d spelling(s) of %d word(s), %d carrying `%s`, read as one comparison "
            "per word: the mark, a plural `s` and an owner word are cut off; plurals %s"
            % (len(every), len(words), marked, TARGET_MARK,
               ", ".join("`%s` of `%s`" % p for p in sorted(pairs.items()))))
