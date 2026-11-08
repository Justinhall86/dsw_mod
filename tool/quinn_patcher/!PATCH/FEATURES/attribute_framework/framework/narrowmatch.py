#!/usr/bin/env python3
"""Which narrowing words an id spelled, each in whole numbers of its own; the gate asks them."""
from tools.project import guard
from tools.hlcode import function_named, number, returns_type, template, text_object, written
from framework import names as vocab
from framework.names import module_of, vocabulary
from framework.pieceword import OWNER_HAND, SHARES_ITS_PLAIN, owners_taken, spellings
from framework.names import ways_of_writing
from framework.rowreader import reader_for
from framework.turned import HAND

# the folder whose files declare a narrowing word
FAMILY = "narrowing"
# what such a file calls its bit: the word every family declares its number under
DECLARES = vocab.DECLARES
# the one thing this works out: whether the id spelled each narrowing word, 1 or 0
NAMED = "narrowing"
# and where each one's own named thing sits in the row's list, counted from 1
AT_COLUMN = "narrowing column"
# and the owner word written in front of one (`EnemyHasTRes`): that owner word's number
OWNER = "narrowing owner"
# and the comparison following one (`HasTRes_OrLess`): that comparison's number
COMPARED = "narrowing comparison"
# and the negation glued into one (`NotHasTDev`): where it sat
NEGATED = "narrowing negated"
# ⛔ A WHOLE NUMBER PER WORD AND THING, never bits of a shared one: `_rules.py kept number`
KEPT_BITS = 31
WIDEST = (1 << KEPT_BITS) - 1


def chunk_name(name, slot):
    """The kept number of one word's `name`: the first word's is `name`, each further numbered."""
    return name if slot == 0 else "%s %d" % (name, slot + 1)


def chunk_names(name, count):
    """Every kept number of `name` that `count` words fill, the first always among them."""
    return tuple(chunk_name(name, k) for k in range(max(1, count)))


def _slots_spelled():
    """One past the highest bit a narrowing file or Ask row claims, read as text: no importing."""
    import ast
    import glob
    import os
    every = [node.value.value for path in glob.glob(os.path.join(
        os.path.dirname(os.path.abspath(__file__)), FAMILY, "*.py"))
        for node in ast.parse(open(path, encoding="utf-8").read()).body
        if isinstance(node, ast.Assign) and [getattr(t, "id", None) for t in node.targets]
        == [vocab.DECLARES] and isinstance(node.value, ast.Constant)]
    from framework import questions
    return max(max(every) + 1 if every else 1, questions.bits())


SPELLED = _slots_spelled()
SUBJECT = tuple((name, vocab.NUMBER_KEPT_IN) for name in
                sum((chunk_names(one, SPELLED)
                     for one in (NAMED, AT_COLUMN, OWNER, COMPARED, NEGATED)), ()))
OWN = tuple(name for name, _kind in SUBJECT)
# ⛔ THE SAME FOUR, SPELLED AFTER A TRIGGER: those narrow the place the trigger fired in
AFTER_THE_TRIGGER = "%s, after the trigger"
TRIGGERED = tuple((AFTER_THE_TRIGGER % name, kind) for name, kind in SUBJECT)
TRIGGER_PARTS = tuple(name for name, _kind in TRIGGERED)
FOUND = SUBJECT + TRIGGERED
PARTS = tuple(name for name, _kind in FOUND)
# while an id is read: one past the slot of the last narrowing a comparison may follow, 0 for none
LAST = "the narrowing a comparison follows"
# and what it holds when that is an Of modifier, past any slot: the comparison is only filed
MODIFIED = 1 << 30
# while a piece is read: one past the bit of a narrowing whose marked column waits to be kept
PENDING, NONE_PENDING = "the narrowing a marked column waits on", 0
# where a walk's places hand over the row's list every word's number is folded onto
KEPT_HAND = "the row's list at the bake"
# what the place holds when none was spelled, and what a slot holds when no column was marked
NOTHING_SPELLED = 0
NO_COLUMN = 0
# what a slot holds when its marked column names nothing: past every place the list can reach
NAMES_NOTHING = WIDEST
# declared per narrowing word: True when `EnemyHasTRes` may be written
OWNERS_PICK_BY = "OWNERS_PICK"
# and True when it is written after, as the word's object: `BordersEnemy`
OWNER_AFTER_BY = "OWNER_AFTER"
# or the start it goes straight after, inside the spelling: `Borders` of `BordersEnemyRegions`
OWNER_STEM_BY = "OWNER_STEM"
# each narrowing's check, a function of its own calling the next, and the one that ends them
CHECK, LAST_CHECK = "narrowing check, %s", "narrowing check, nothing more"
# what a check answers: the thing passes every narrowing the row spelled, or one refused it
PASSES, REFUSED = 1, 0
# a yes-or-no word after a trigger (`EndedByDuration`): what its file says it answers
FLAG_BY = "FLAG"
# ⛔ IN THE ROW'S NARROWING LIST: such a word's mark, then this one when `Not` was glued in
FLAG_MARK, FLAG_LEFT_OUT = "|flagged by %s", "|flag left out"


def registers(bc, fn, reader=None):
    """One place, and the row's list: ⛔ no place per word, each number is folded onto the list."""
    from framework.parsed import Kept
    reader = reader or reader_for(bc)
    return {LAST: reader.borrow_register(bc, fn, vocab.NUMBER_KEPT_IN),
            PENDING: reader.borrow_register(bc, fn, vocab.NUMBER_KEPT_IN),
            KEPT_HAND: Kept(bc, fn, reader)}


def only_narrowings(words):
    """The vocabulary narrowed to the narrowing words. THE ONE PLACE that narrowing is written."""
    return {spelling: word for spelling, word in words.items() if word.family == FAMILY}


def checked(claims):
    """Every claim against the rules a narrowing's bit has, read in a settled order."""
    out = {}
    for spelling in sorted(claims):
        claimed = claims[spelling]
        guard(isinstance(claimed, int) and not isinstance(claimed, bool) and claimed >= 0,
              "`%s` says its %s is %r, and a narrowing's is a whole one counted from zero"
              % (spelling, DECLARES, claimed))
        taken = [already for already, n in out.items() if n == claimed]
        guard(not taken,
              "`%s` and `%s` both claim bit %d, and a narrowing's bit is its own"
              % (taken[0] if taken else "?", spelling, claimed))
        out[spelling] = claimed
    guard(out, "no narrowing declares a bit, so no row could ever spell one")
    return out


def bits(words=None):
    """Every narrowing word and the bit its own file writes out for it."""
    words = vocabulary() if words is None else words
    return checked({spelling: getattr(module_of(word), DECLARES, None)
                    for spelling, word in only_narrowings(words).items()})


def bit_of(narrowing, words=None):
    """The VALUE one narrowing's bit is, asked for BY THE WORD a modder types."""
    every = bits(words)
    guard(narrowing in every,
          "`%s` is not a narrowing this build knows: %s"
          % (narrowing, ", ".join(sorted(every))))
    return 1 << every[narrowing]


def owners_pick(word):
    """Does an owner word in front of this narrowing pick the factions it asks?"""
    return bool(getattr(module_of(word), OWNERS_PICK_BY, False))


def owners_after(word):
    """Is this word's owner word written after it (`BordersEnemy`) rather than in front?"""
    return bool(getattr(module_of(word), OWNER_AFTER_BY, False))


def owner_stem(word):
    """The start of this word's spelling its owner word and mark go after, inside it; or None."""
    stem = getattr(module_of(word), OWNER_STEM_BY, None)
    guard(stem is None or (word.spelling.startswith(stem) and word.spelling != stem),
          "`%s` puts its owner word after `%s`, which does not start it" % (word.spelling, stem))
    return stem


def owner_mask(_bit):
    """What of one word's owner number is its owner word: all of it."""
    return WIDEST


def owner_at(_bit, owner_number):
    """One owner word's number, as one word's owner number holds it: itself."""
    guard(0 < owner_number <= WIDEST, "owner number %d is not a whole one" % owner_number)
    return owner_number


def set_bit(_bit):
    """What one narrowing's own spelled number holds once the id spelled it."""
    return 1


def emit_forget(bc, r, listed):
    """Empty every place, before an id is read. The other end of the latch the branches are."""
    return [written(template(bc, "Int"), dst=r[LAST], ptr=number(bc, NOTHING_SPELLED)),
            written(template(bc, "Int"), dst=r[PENDING], ptr=number(bc, NONE_PENDING)),
            written(template(bc, "Null"), dst=listed)]


def emit_at_a_trigger(bc, r):
    """A trigger read: every narrowing spelled from here on is the trigger's own."""
    return r[KEPT_HAND].emit_after_a_trigger() + [
        written(template(bc, "Int"), dst=r[LAST], ptr=number(bc, NOTHING_SPELLED))]


def slot_of(_bit):
    """What a place in the list is multiplied by to sit in one narrowing's own number: 1."""
    return 1


def _kept_in_its_slot(bc, r, bit, column, spare, listed, hands):
    """The marked column's thing pushed onto the row's list, and where it landed put in its slot."""
    from framework import tray
    from framework.parammatch import emit_pushed
    from framework.parsed import OR
    named = hands["place"](reader_for(bc).text_kind)
    at = hands["place"](returns_type(function_named(bc, tray.PUSH), tray.PUSH))
    nothing = "the narrowing column named nothing, at %d" % named
    return hands["resolve"](column, named) + [
        written(template(bc, "Int"), dst=at, ptr=number(bc, NAMES_NOTHING)),
        (written(template(bc, "JNull"), reg=named), nothing),
    ] + emit_pushed(bc, named, listed, hands, length=at) + [
        nothing + ":", written(template(bc, "Label"))] + r[KEPT_HAND].fold(
            chunk_name(AT_COLUMN, bit), OR, at)


def _slot(place, kept, _bit, into, _spare):
    """One narrowing's own kept number, read out into `into`."""
    return [place.op("Mov", dst=into, src=kept)]


def kept_for(place, name, bit):
    """The row's kept number of `name` for one narrowing word, looked up off the row's list."""
    from framework.parsed import kept_number
    return kept_number(place, chunk_name(name, bit))


def spelled_in(place, bit):
    """The row's kept number saying whether it spelled one narrowing word."""
    return kept_for(place, NAMED, bit)


def emit_its_own_column(place, bit):
    """At the gate: one narrowing's column slot, what that column names, and its comparison."""
    from framework.columns import PART_FOR_NARROWING, emit_entry
    from framework.rowreader import READ_COLUMN
    slots, listed = kept_for(place, AT_COLUMN, bit), place.row[PART_FOR_NARROWING]
    marked, which, spare = (place.scratch_like(slots) for _ in range(3))
    named = place.scratch_arg(READ_COLUMN, 1)
    unnamed = place.here("narrowing bit %d names nothing" % bit)
    return _slot(place, kept_for(place, COMPARED, bit), bit, which, spare) + _slot(
        place, slots, bit, marked, spare) + [
            place.op("Null", dst=named),
            place.op("Int", dst=spare, ptr=place.number(NO_COLUMN)),
            (place.op("JEq", a=marked, b=spare), unnamed),
            place.op("Int", dst=spare, ptr=place.number(1)),
            place.op("Sub", dst=spare, a=marked, b=spare),
            ] + emit_entry(place, listed, spare, named, unnamed) + [
            unnamed + ":", place.op("Label")], marked, named, which


def emit_asked_apart(place, holder, spelling, words, bit, like):
    """One narrowing's column and question, in a function of its own per kind of holder."""
    from framework import forwhom, turned

    def asked(at, thing):
        its_own, at_column, named, which = emit_its_own_column(at, bit)
        return its_own + turned.emit_asked(at, thing, spelling, words, bit, named, at_column,
                                           which)
    return forwhom.apart(place, ("narrowing", spelling, bit), asked, like, [holder])


def emit_its_negation(place, bit):
    """At the gate: where a negation sat in one narrowing's piece, 0 when none was glued in."""
    negated = place.scratch_like(kept_for(place, NEGATED, bit))
    spare = place.scratch_like(negated)
    return _slot(place, kept_for(place, NEGATED, bit), bit, negated, spare), negated


def branches(bc, r, words, column, spare, listed, hands):
    """One branch per narrowing spelling: its bit ORed in (never written over), a marked column."""
    from framework.compmatch import only_comparisons
    from framework.parsed import OR
    from framework.trailing import needs_of, offers_of
    every = bits(words)
    compared = {kind for word in only_comparisons(words).values() for kind in needs_of(word)}
    # ⛔ OFF THE WHOLE VOCABULARY: narrowed first, it holds no owner word to glue in front
    written_as = [one for one in spellings(words) if one.word.family == FAMILY
                  and one.with_owner is None]
    guard(written_as, "no narrowing has a spelling, so no piece could ever match one")
    out, kept = [], r[KEPT_HAND]
    guard(set_bit(0) == 1 and slot_of(0) == 1, "a narrowing's own number holds more than itself")
    shared = _sharing(written_as, words)
    for one in written_as:
        bit = every[one.word.spelling]
        block = kept.fold(chunk_name(NAMED, bit), OR)
        # ⛔ A COMPARISON TAKES THE NEAREST ON ITS LEFT: `HasTRes_OrLess_HasTTraitStacks`
        if compared & set(offers_of(one.word)):
            block += [written(template(bc, "Int"), dst=r[LAST], ptr=number(bc, bit + 1))]
        block += _its_column(bc, r, one, bit, (shared, lambda b: _kept_in_its_slot(
            bc, r, b, column, spare, listed, hands)))
        # ⛔ ORed, never written over: `EnemyHasTRes_OwnHasTDev` keeps both owners
        if owners_taken(one, words):
            block += kept.fold(chunk_name(OWNER, bit), OR, hands[OWNER_HAND])
        # where the piece's negation sat, 0 for none
        if hands.get(HAND) is not None:
            block += kept.fold(chunk_name(NEGATED, bit), OR, hands[HAND])
        out.append((one, block))
    hands["listing"] += _kept_when_marked(bc, r, shared, (column, listed), hands)
    return out


def _its_column(bc, r, one, bit, ways):
    """Where a spelling's marked column goes: kept once the piece is read, or in its own branch."""
    shared, its_own = ways
    # ⛔ ONE WORD, ONE BRANCH: a shared word's marked way runs its plain one's branch
    if one.word.spelling in shared:
        if one.targeted:
            SHARES_ITS_PLAIN.add(one.text)
        return [written(template(bc, "Int"), dst=r[PENDING], ptr=number(bc, bit + 1))]
    # ⛔ ITS OWN SLOT, never the row's one column: `HasTRes2_HasTTrait3` reads 2 and 3
    return its_own(bit) if one.targeted else []


def _sharing(written_as, words):
    """Each word written both plain and marked (`T` taken off) whose marked way runs the plain."""
    marked = {one.word.spelling for one in written_as
              if one.targeted and one.text in ways_of_writing(one.word.spelling)[1:]}
    plain = {one.word.spelling for one in written_as if not one.targeted}
    return marked & plain


def _kept_when_marked(bc, r, shared, at_list, hands):
    """Once a piece is read: a shared branch's marked column kept in its narrowing's own slot."""
    from framework import tray
    from framework.parammatch import emit_pushed
    from framework.parsed import OR, RECORDED
    if not shared:
        return []
    column, listed = at_list
    first = RECORDED.index(AT_COLUMN)
    guard(all(RECORDED.index(chunk_name(AT_COLUMN, k)) == first + k for k in range(SPELLED)),
          "a narrowing's column slots are not side by side on the row's list")
    named = hands["place"](reader_for(bc).text_kind)
    at = hands["place"](returns_type(function_named(bc, tray.PUSH), tray.PUSH))
    idle, unmarked, given, nothing = ("a narrowing's marked column, %s" % w for w in (
        "none waiting", "not marked", "given", "names nothing"))

    def op(name, **operands):
        return written(template(bc, name), **operands)
    # ⛔ A TARGETED WORD WRITTEN WITH NO NUMBER MEANS COLUMN ONE, as its own branch said
    return [(op("JEq", a=r[PENDING], b=hands["zero"]), idle),
            (op("JEq", a=hands["marked"], b=hands["zero"]), unmarked),
            (op("JNotEq", a=column, b=hands["zero"]), given),
            op("Mov", dst=column, src=hands["one"]),
            given + ":", op("Label")] + hands["resolve"](column, named) + [
        op("Int", dst=at, ptr=number(bc, NAMES_NOTHING)),
        (op("JNull", reg=named), nothing)] + emit_pushed(bc, named, listed, hands, length=at) + [
        nothing + ":", op("Label"),
        op("Decr", dst=r[PENDING])] + r[KEPT_HAND].fold(AT_COLUMN, OR, at, at=r[PENDING]) + [
        unmarked + ":", op("Label"),
        op("Int", dst=r[PENDING], ptr=number(bc, NONE_PENDING)),
        idle + ":", op("Label")]


def unwalled(bc, r, words, spare, listed, hands):
    """What no effect walls off: each comparison's branch, then each Of modifier's."""
    from framework import compmatch
    return compmatch.branches(bc, r, words, spare, listed, hands) + modified(
        bc, r, words, listed, hands)


def modified(bc, r, words, listed, hands):
    """One branch per Of modifier's spelling: its mark and its name behind the act it trails."""
    from framework.compmatch import only_comparisons
    from framework.acts.start_quest import emit_filed, emit_kind_left_out, filed_by
    from framework.trailing import needs_of, offers_of
    compared = {kind for word in only_comparisons(words).values() for kind in needs_of(word)}
    out = []
    for one in spellings(words):
        if one.with_owner is None and flag_of(one.word):
            out.append((one, emit_flag_filed(bc, one, listed, hands)))
            continue
        if one.with_owner is not None or filed_by(one.word) is None:
            continue
        # ⛔ A COMPARISON AFTER IT FILES ITS CODE, and weighs no narrowing's slot
        weighs = [written(template(bc, "Int"), dst=r[LAST], ptr=number(bc, MODIFIED))]
        out.append((one, weighs * bool(compared & set(offers_of(one.word)))
                    + emit_filed(bc, one.word, listed, hands)
                    + emit_kind_left_out(bc, one, listed, hands)))
    return out


def flag_of(word):
    """What a modifier says yes or no of its trigger's event; None for any other word."""
    return getattr(module_of(word), FLAG_BY, None) if word.family == "modifiers" else None


def emit_flag_filed(bc, one, listed, hands):
    """At the bake: a yes-or-no word's mark onto the row's list, then the `Not` mark if turned."""
    from framework.parammatch import emit_pushed
    from framework.turned import emit_left_out
    if listed is None:
        return []
    reader = reader_for(bc)
    mark, left = hands["place"](reader.text_kind), hands["place"](reader.text_kind)
    spare = hands["place"](reader.count_kind)

    def got(into, text):
        return [written(template(bc, "GetGlobal"), **{"dst": into,
                                                       "global": text_object(bc, text)})]
    return got(mark, FLAG_MARK % one.word.spelling) + emit_pushed(bc, mark, listed, hands) + (
        emit_left_out(bc, hands, spare, spare, got(left, FLAG_LEFT_OUT) + emit_pushed(
            bc, left, listed, hands), "%s filed" % one.text))


def emit_checked(place, holder, spelled):
    """Every narrowing the row spelled asked of `holder`, by one call; inline on a Void road."""
    words = vocabulary()
    every = sorted(bits(words).items())
    parts = [p for p in place.row if place.row[p] is not None]
    kinds = [place.kind_of(0), place.kind_of(holder)] + [place.kind_of(place.row[p])
                                                         for p in parts]
    if 0 in kinds:
        return [op for spelling, bit in every
                for op in emit_check(place, holder, spelling, words, bit, spelled)]
    answer, none = place.scratch_like(spelled), place.scratch_like(spelled)
    return _calling_the_check(place, holder, parts, kinds, every, words, answer) + [
        place.op("Int", dst=none, ptr=place.number(REFUSED)),
        (place.op("JEq", a=answer, b=none), place.refused)]


def _calling_the_check(place, holder, parts, kinds, every, words, answer):
    """A call to the first narrowing's function, or the last one, handed the thing and the row."""
    from tools.hlcode import assemble
    from framework.parsed import loaded
    from framework.pipeline import Place
    renamed = place.looked["renamed"]
    named = CHECK % every[0][0] if every else LAST_CHECK
    key = (named, "after the trigger" if renamed else "") + tuple(kinds)

    def body(hands):
        made = Place(named, {p: 2 + i for i, p in enumerate(parts)}, {}, None, None, None,
                     "%s: refused" % named, hands)
        made.looked["renamed"] = renamed
        said, none = made.scratch_of("I32"), made.scratch_of("I32")
        ops = []
        if every:
            spelling, bit = every[0]
            ops = emit_check(made, 1, spelling, words, bit, said) + _calling_the_check(
                made, 1, parts, kinds, every[1:], words, said) + [
                made.op("Int", dst=none, ptr=made.number(REFUSED)),
                (made.op("JEq", a=said, b=none), made.refused)]
        return assemble(loaded(made, ops) + [
            made.op("Int", dst=said, ptr=made.number(PASSES)), made.op("Ret", ret=said),
            made.refused + ":", made.op("Label"),
            made.op("Int", dst=said, ptr=made.number(REFUSED)), made.op("Ret", ret=said)])
    shared = place._hands["shared"](key, kinds, place.kind_of(answer), body)
    return [place.op("CallN", dst=answer, fun=shared,
                     args=[0, holder] + [place.row[p] for p in parts])]


def emit_check(place, holder, spelling, words, bit, spelled):
    """If the row spelled this narrowing, the thing answers its question; else it is passed by."""
    word = module_of(words[spelling])
    asks, through = getattr(word, "ASKS", None), getattr(word, "THROUGH", None)
    against, at_least = getattr(word, "AGAINST", None), getattr(word, "AT_LEAST", None)
    emits = getattr(word, "EMITS", None)
    guard(asks and (through or against or at_least or emits), "`%s` narrows nothing" % spelling)
    spare = place.scratch_like(spelled)
    # a place of its own for the nothing, never a scratch the last stage left
    none = place.scratch_like(spelled)
    past = place.here("this row does not narrow by %s" % spelling)
    return [place.op("Int", dst=spare, ptr=place.number(set_bit(bit))),
            place.op("And", dst=spare, a=spelled_in(place, bit), b=spare),
            place.op("Int", dst=none, ptr=place.number(0)),
            (place.op("JEq", a=spare, b=none), past)] + emit_asked_apart(
        place, holder, spelling, words, bit, spelled) + [past + ":", place.op("Label")]


def install(bc):
    """Read every narrowing's bit out of its own file, and put those numbers in the pool."""
    every = bits()
    for claimed in sorted(set_bit(n) for n in every.values()):
        number(bc, claimed)
    for value in (NOTHING_SPELLED, NAMES_NOTHING):
        number(bc, value)
    return ("NARROW MATCH: %d narrowing(s), each with whole numbers of its own -- %s -- so a row "
            "may spell none, one or all of them, and the vocabulary has no ceiling"
            % (len(every), ", ".join("`%s` is %d" % pair for pair in sorted(every.items()))))
