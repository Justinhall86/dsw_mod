#!/usr/bin/env python3
"""A count of the thing a column names: whole `val`s of a resource held, or treaties of a kind."""
from types import SimpleNamespace

from tools.project import guard
from tools.hlcode import function_named, number, template, text_object, written
from framework import columns
from framework.boundary import BY_VALUE as NAME_FROM
from framework.names import module_of, vocabulary
from framework.narrowcount import TIMES
from framework.scopematch import HOLDER, PAYEE

# what a word's file names: the row part its held amount is divided by; or what reads it, per one
HELD_PER_BY, HELD_BY_BY = "HELD_PER", "HELD_READ_BY"
# or the question its marked spelling counts the named kind by, the count times the amount
NAMED_COUNT_BY, TALLIES = "NAMED_COUNT", "TALLIES"
# ⛔ IN THE ROW'S COUNT LIST: owner marks, ONE mark for every word, the word, then what it named
GROUP = "|counted by what it names"
# right after what it named when `Not` turned the word (`PerNotTTreaty2`): every kind but that one
LEFT_OUT = "|counted by what it leaves out"
# each word's own scaling, a function of its own calling the next, and the one that ends them
LINK, LAST_LINK = "counted by %s", "counted by nothing more"
# what the act's amount becomes on a row spelling one of these words
ONE = 1
READS = (columns.PART_FOR_COUNT, PAYEE)
# THE PROBE'S LINE, built of the game's own text joins: the faction's name, the count as text
JOINS, NAMED_BY, AS_TEXT = "$String.__add__", "ent.Faction.get_name", "$Std.string"
PLAIN_HEAD, PLAIN_HOLDS, PROBE = "%s counted: ", " holds ", "treatycount"


def held_of(words=None):
    """Every word whose count is an amount held (whole `val`s, or stacks), in a settled order."""
    words = vocabulary() if words is None else words
    return tuple(sorted(s for s, w in words.items() if getattr(module_of(w), HELD_PER_BY, None)
                        or getattr(module_of(w), HELD_BY_BY, None)))


def _divided(word):
    """Is `val` the word's divisor (`PerRes`), the act's amount then 1? Else `val` is per one."""
    return bool(getattr(module_of(vocabulary()[word]), HELD_PER_BY, None))


def named_of(words=None):
    """Every word whose marked spelling counts the kind its column names, in a settled order."""
    words = vocabulary() if words is None else words
    return tuple(sorted(s for s, w in words.items()
                        if getattr(module_of(w), NAMED_COUNT_BY, None)))


def words_of(words=None):
    """Every word whose group this lists and scales by."""
    return tuple(sorted(held_of(words) + named_of(words)))


def _question(word):
    """The question module a named count's file names."""
    import importlib
    return importlib.import_module(getattr(module_of(vocabulary()[word]), NAMED_COUNT_BY))


# one tally per held word, kept on the row: an act reads it to know its amount is 1
NAMES = tuple(TIMES % word for word in held_of())
ACT_READS = ("name.numbers",)


def claims(one):
    """Is this spelling's branch written here? A named count's takes its bare spelling's route."""
    return one.word.spelling in held_of()


def reads():
    """The list, the payee, each held word's divisor; a per-one word's holder and granted trait."""
    return READS + tuple(sorted({p for w in held_of() for p in ((getattr(module_of(vocabulary()[
        w]), HELD_PER_BY),) if _divided(w) else (HOLDER, columns.PART))}))


def every_mark():
    """Every text that opens one of these groups in the row's count list."""
    from framework.ownermatch import OWNED_ONCE
    return sorted(({GROUP} if words_of() else set()) | {OWNED_ONCE})


def asked():
    """Every game function the factor asks: the sheet's lookup, and each word's own question."""
    return (NAME_FROM,) * bool(held_of()) + tuple(
        module_of(vocabulary()[w]).ASKS for w in held_of()) + tuple(
        module_of(vocabulary()[w]).THROUGH for w in held_of() if not _divided(w)) + tuple(
        getattr(_question(w), TALLIES) for w in named_of())


def walks():
    """The walks added per act: the list once, per held word its factions, per partnered kind."""
    from framework.forwhom import PARTNERED_BY
    return (1 + len(held_of())) * bool(held_of()) + sum(
        bool(getattr(module_of(vocabulary()[w]), PARTNERED_BY, None)) for w in named_of())


def walks_once():
    """The walks every act shares: one per kind named, where its marked spelling named it."""
    return len(named_of())


def _op(bc, name, **operands):
    """One instruction of the game's own shape."""
    return written(template(bc, name), **operands)


def branches(bc, r, words=None, column=None, listed=None, hands=None, known=()):
    """`known`, a marked named count's branch also listing its kind; each held word's own after."""
    out, extra = _branches(bc, r, words, column, listed, hands)
    unmet = set(extra) - {one.text for one, _ in known}
    guard(not unmet, "no branch is written as %s, so its count is never listed" % sorted(unmet))
    return [(one, block + extra[one.text] if one.text in extra else block)
            for one, block in known] + out


def _branches(bc, r, words, column, listed, hands):
    """A marked spelling counts its tally and lists its mark and resource; else it refuses."""
    from framework.multmatch import tallied, written_ways
    from framework.pieceword import SHARES_ITS_PLAIN
    words = vocabulary() if words is None else words
    for said in [PLAIN_HEAD % w for w in named_of(words)] + [PLAIN_HOLDS, " "]:
        text_object(bc, said)
    mine, out, extra = words_of(words), [], {}
    t = _held_for(bc, hands)
    t.column, t.listed = column, listed

    def put(one, block):
        if one.word.spelling in held_of(words):
            out.append((one, block))
        else:
            extra[one.text] = block
    for one in written_ways(words):
        word = one.word.spelling
        if word not in mine or not (claims(one) or one.targeted):
            continue
        if not one.targeted or listed is None:
            put(one, _plain(bc, t, one, words, hands))
            continue
        if not _divided(word):
            # ⛔ ONE WORD, ONE BRANCH: the marked spelling runs its plain one's code, in its own slot
            SHARES_ITS_PLAIN.add(one.text)
            put(one, [])
            continue
        marked = _owned_mark(bc, t, one, words, hands) + [
            _op(bc, "GetGlobal", **{"dst": t.which, "global": text_object(bc, word)})] + (
            tallied(r, TIMES % word) if word in held_of(words) else [])
        put(one, marked + [_op(bc, "Mov", dst=t.pending, src=hands["one"])])
    if listed is not None:
        extra.update(_plain_ways(bc, t, column, hands, words))
    # ⛔ ONE PIECE, IN NO WORD'S CODE: run after the piece's word, its numbers never a table's
    hands["apart"] += [_op(bc, "Int", dst=t.pending, ptr=number(bc, 0))]
    hands["listing"] += _listing(bc, t, column, listed, hands) if listed is not None else []
    return out, extra


def _held_for(bc, hands):
    """The places the one listing writes, and whether the piece just read asks for it."""
    from framework.rowreader import reader_for
    text, count = reader_for(bc).text_kind, reader_for(bc).count_kind
    return SimpleNamespace(named=hands["place"](text), mark=hands["place"](text),
                           which=hands["place"](text), left=hands["place"](text),
                           spare=hands["place"](count), pending=hands["place"](count),
                           zero=hands["place"](count))


def _plain_ways(bc, t, column, hands, words):
    """{plain spelling: what it adds}: its word named, and a marked piece asking for the listing."""
    from framework.pieceword import OWNER_HAND
    out = {}
    for word in [w for w in named_of(words) if w not in held_of(words)]:
        tail, past = ("%s: %s, %s" % (GROUP, word, w) for w in ("a marked named count", "plainly"))
        # a marked piece written with no number means column one, as a marked way's own does
        defaulted = "%s: its column" % tail
        out[word] = [_op(bc, "GetGlobal", **{"dst": t.which, "global": text_object(bc, word)}),
                     (_op(bc, "JNotEq", a=hands["marked"], b=hands["zero"]), tail),
                     (_op(bc, "JAlways"), past), tail + ":", _op(bc, "Label"),
                     (_op(bc, "JNotEq", a=column, b=hands["zero"]), defaulted),
                     _op(bc, "Mov", dst=column, src=hands["one"]),
                     defaulted + ":", _op(bc, "Label"),
                     _op(bc, "Mov", dst=t.spare, src=hands[OWNER_HAND]),
                     _op(bc, "Mov", dst=t.pending, src=hands["one"]),
                     past + ":", _op(bc, "Label")]
    return out


def _listing(bc, t, column, listed, hands):
    """The kind a marked count names, listed after its owner marks, its mark and its word."""
    from framework.ownermatch import emit_owner_marks
    from framework.parammatch import emit_pushed
    from framework.turned import emit_left_out
    nothing, done = ("%s: %s" % (GROUP, what) for what in ("names nothing", "listed"))
    return [_op(bc, "Int", dst=t.zero, ptr=number(bc, 0)),
            (_op(bc, "JEq", a=t.pending, b=t.zero), done),
            _op(bc, "Mov", dst=t.pending, src=t.zero)] + hands["resolve"](column, t.named) + [
        (_op(bc, "JNull", reg=t.named), nothing)] + emit_owner_marks(
        bc, t.spare, t.spare, listed, hands, GROUP) + [
        _op(bc, "GetGlobal", **{"dst": t.mark, "global": text_object(bc, GROUP)})] + emit_pushed(
        bc, t.mark, listed, hands) + emit_pushed(bc, t.which, listed, hands) + emit_pushed(
        bc, t.named, listed, hands) + emit_left_out(
        bc, hands, t.spare, t.spare, [_op(bc, "GetGlobal", **{
            "dst": t.left, "global": text_object(bc, LEFT_OUT)})] + emit_pushed(
            bc, t.left, listed, hands), "%s: left out" % GROUP) + [
        (_op(bc, "JAlways"), done), nothing + ":", _op(bc, "Label")] + hands["refuse"]() + [
        done + ":", _op(bc, "Label")]


def _plain(bc, t, one, words, hands):
    """A held word's bare spelling: refused, or `PerTrait`'s one branch, its marked one's too."""
    from framework.stacksheld import one_branch
    if t.listed is None or _divided(one.word.spelling):
        return hands["refuse"]()
    return one_branch(bc, t, one, hands, _owned_mark(bc, t, one, words, hands))


def _owned_mark(bc, t, one, words, hands):
    """The owner number cut off the piece into `t.spare` when it may carry one; else 0."""
    from framework.pieceword import OWNER_HAND, owners_taken
    if owners_taken(one, words):
        return [_op(bc, "Mov", dst=t.spare, src=hands[OWNER_HAND])]
    return [_op(bc, "Int", dst=t.spare, ptr=number(bc, 0))]


def emit_scaled(place, factor):
    """The factor times each group's count; a row with no group leaves it alone."""
    return _the_walk(place, factor) if held_of() else []


def emit_one(place, amount):
    """In an act: the amount set to 1 when the row spelled a held count, before the factor."""
    from framework.parsed import kept_number
    out = []
    for name in [TIMES % w for w in held_of() if _divided(w)]:
        tally = kept_number(place, name)
        zero, spare = place.scratch_like(tally), place.scratch_like(tally)
        kept = place.here("%s: never spelled" % name)
        out += [place.op("Int", dst=zero, ptr=place.number(0)),
                (place.op("JSGte", a=zero, b=tally), kept)] + _set_to_one(
            place, amount, spare) + [kept + ":", place.op("Label")]
    return out


def _set_to_one(place, amount, spare):
    """`amount` set to 1, whatever kind of number it is."""
    if place.kind_of(amount) == place.kind_of(spare):
        return [place.op("Int", dst=amount, ptr=place.number(ONE))]
    return [place.op("Int", dst=spare, ptr=place.number(ONE)),
            place.op("ToSFloat", dst=amount, src=spare)]


def _places(place, tag=GROUP):
    """Every place the one walk over the row's list uses."""
    from framework.rowreader import READ_COLUMN
    from framework.tray import ARRAY_OF_ENTRIES as A_LIST, BACKING_ON, COUNT_ON
    s = SimpleNamespace(listed=place.row[columns.PART_FOR_COUNT])
    s.names_at, s.how_many = place.field_of(A_LIST, COUNT_ON)
    s.backing_at, s.backing = place.field_of(A_LIST, BACKING_ON)
    s.at, s.kept = (place.scratch_like(s.how_many) for _ in range(2))
    s.got, s.name = place.scratch_return(READ_COLUMN), place.scratch_arg(NAME_FROM, 0)
    s.plain, s.mark, s.which = (place.scratch_like(s.name) for _ in range(3))
    for what in ("seek", "past", "onwards", "done"):
        setattr(s, what, place.here("%s, %s" % (tag, what)))
    return s


def _next_entry(place, s, into):
    """The list's next entry into `into`; the end is `s.done`, an empty one `s.past`."""
    return [(place.op("JSGte", a=s.at, b=s.how_many), s.done),
            place.op("GetArray", dst=s.got, array=s.backing, index=s.at),
            place.op("Incr", dst=s.at),
            (place.op("JNull", reg=s.got), s.past),
            place.op("UnsafeCast", dst=into, src=s.got)]


def counts_every_kind(word):
    """True when the word's named count, handed no kind, counts every kind as its plain one."""
    return word in named_of() and hasattr(_question(word), "emit_named")


def every_kind(place, word, named, out):
    """An emptied place like `named`, onto `out`, for every kind; none when the word has none."""
    if named is None or not counts_every_kind(word):
        return None
    none = place.scratch_like(named)
    out.append(place.op("Null", dst=none))
    return none


def one_count(bc, fn, op, site, reader, word, count, start):
    """⛔ ONE WORD, ONE COUNT: a named count's word is handed no kind, so the act's is the one."""
    from tools.hlcode import argument_kind
    from framework.forwhom import LINK as BY
    from framework.multmatch import _calling_the_count as calling
    from framework.parsed import a_new_place
    if not counts_every_kind(word):
        return calling(bc, fn, op, site, reader, word, count, start)
    named = a_new_place(bc, fn, argument_kind(bc, NAME_FROM, 0))
    return [op("Null", dst=named)] + calling(
        bc, fn, op, SimpleNamespace(word=BY % word, named=1), reader, word, count, start, named)


def _the_walk(place, factor):
    """⛔ ONE WALK FOR EVERY WORD: each group's mark, its word, what it named, handed on."""
    from framework.ownermatch import OWNED_ONCE, emit_owner_counted
    s = _places(place)
    return [(place.op("JNull", reg=s.listed), s.done),
            place.op("GetGlobal", **{"dst": s.plain, "global": place.text_object(GROUP)}),
            place.op("GetGlobal", **{"dst": s.mark, "global": place.text_object(OWNED_ONCE)}),
            place.op("Int", dst=s.at, ptr=place.number(0)),
            place.op("Int", dst=s.kept, ptr=place.number(0)),
            place.op("Field", dst=s.how_many, obj=s.listed, field=s.names_at),
            place.op("Field", dst=s.backing, obj=s.listed, field=s.backing_at),
            s.seek + ":", place.op("Label")] + _next_entry(place, s, s.name) + (
        emit_owner_counted(place, GROUP, s.name, s.kept, s.mark, s.onwards)) + [
        (place.op("JNotEq", a=s.name, b=s.plain), s.past)] + _next_entry(
        place, s, s.which) + _next_entry(place, s, s.name) + _linked(
        place, factor, s.which, s.name, s.kept) + [
        s.past + ":", place.op("Label"),
        place.op("Int", dst=s.kept, ptr=place.number(0)),
        s.onwards + ":", place.op("Label"),
        (place.op("JAlways"), s.seek),
        s.done + ":", place.op("Label")]


def _linked(place, factor, which, named, kept):
    """The group handed to the first word's function, which asks the next; inline on Void."""
    parts = list(place.row)
    kinds = [place.kind_of(place.row[p]) for p in parts]
    if 0 in kinds:
        out = []
        for word in held_of():
            other = place.here("%s, not %s" % (GROUP, word))
            out += _if_this_word(place, word, which, other) + _one_word(
                place, factor, word, named, kept) + [other + ":", place.op("Label")]
        return out
    return _calling_the_link(place, parts, kinds, [factor, which, named, kept], held_of())


def _calling_the_link(place, parts, kinds, handed, words):
    """A call to `words[0]`'s function, or the last one, handed the row's parts and the group."""
    from framework.parsed import loaded
    from framework.pipeline import Place
    from tools.hlcode import assemble
    taken = kinds + [place.kind_of(at) for at in handed]
    named = LINK % words[0] if words else LAST_LINK

    def body(hands):
        made = Place(named, {p: i for i, p in enumerate(parts)}, {}, None, None, None,
                     "%s: not this word" % named, hands)
        at = list(range(len(parts), len(parts) + len(handed)))
        ops = []
        if words:
            ops = _if_this_word(made, words[0], at[1], made.refused) + _one_word(
                made, at[0], words[0], at[2], at[3]) + [
                (made.op("JAlways"), "%s: scaled" % named),
                made.refused + ":", made.op("Label")] + _calling_the_link(
                made, parts, kinds, at, words[1:]) + ["%s: scaled:" % named, made.op("Label")]
        return assemble(loaded(made, ops) + [made.op("Ret", ret=at[0])])
    shared = place._hands["shared"]((named,) + tuple(taken), taken, taken[len(kinds)], body)
    return [place.op("CallN", dst=handed[0], fun=shared,
                     args=[place.row[p] for p in parts] + list(handed))]


def _if_this_word(place, word, which, other):
    """A jump to `other` unless the group's word is `word`."""
    this = place.scratch_like(which)
    return [place.op("GetGlobal", **{"dst": this, "global": place.text_object(word)}),
            (place.op("JNotEq", a=which, b=this), other)]


def _one_word(place, factor, word, named, kept):
    """One group of held `word`: the resource it named held, the factor scaled by it."""
    from framework.stacksheld import emit_per_one
    s = SimpleNamespace(word=word, module=module_of(vocabulary()[word]), name=named, kept=kept)
    s.spare, s.whole = (place.scratch_like(kept) for _ in range(2))
    s.divides = _divided(word)
    s.per = place.row[getattr(s.module, HELD_PER_BY)] if s.divides else kept
    s.total, s.nought, s.share = (place.scratch_like(s.per) for _ in range(3))
    for what in ("unpicked", "summed", "scaled"):
        setattr(s, what, place.here("%s, %s" % (word, what)))
    return _held(place, s) + (_scaled if s.divides else emit_per_one)(place, factor, s)


def _held(place, s):
    """What is held into `s.total`: the holder's (a resource: its faction's), or each picked's."""
    import importlib
    from framework.multmatch import emit_each_picked
    from framework.questions.owns_development import owning_faction
    reader = getattr(s.module, HELD_BY_BY, "framework.resheld")
    emit_held = importlib.import_module(reader).emit_held

    def asked(at, faction):
        held, asking = emit_held(at, s.module, s.name, faction, at.refused)
        return asking + [at.op("Add", dst=s.total, a=s.total, b=held)]

    faction, to_faction = owning_faction(place, None, s.summed) if s.divides else (
        place.row[HOLDER], [(place.op("JNull", reg=place.row[HOLDER]), s.summed)])
    held, holding = emit_held(place, s.module, s.name, faction, s.summed)
    guard(place.kind_of(held) == place.kind_of(s.per), "`%s` adds a t@%s to a t@%s"
          % (s.word, place.kind_of(held), place.kind_of(s.per)))
    start = [place.op("Mov", dst=s.total, src=s.spare)] if not s.divides else [
        place.op(how, dst=to, src=s.spare) for how, to in (("ToSFloat", s.total),
                                                            ("ToSFloat", s.nought))]
    return [place.op("Int", dst=s.spare, ptr=place.number(0))] + start + emit_each_picked(
        place, s.word, s.word, s.unpicked, asked, kept=s.kept) + [
        (place.op("JAlways"), s.summed),
        s.unpicked + ":", place.op("Label")] + to_faction + holding + [
        place.op("Add", dst=s.total, a=s.total, b=held),
        s.summed + ":", place.op("Label")]


def emit_kind_named(place, word):
    """(kind, turned, steps): the kind the marked `word` named, else none; 1 when `Not` turned."""
    s = _places(place, "%s named" % word)
    into, turned = place.scratch_like(s.name), place.scratch_like(s.at)
    left, found = place.scratch_like(s.name), place.scratch_like(s.at)
    blank = [place.op("Null", dst=into), place.op("Int", dst=turned, ptr=place.number(0))]
    if place.kind_of(s.listed) == 0:
        # a row carrying no count list names nothing, and its walk would read a place of no kind
        return into, turned, blank
    # ⛔ ONE WALK PER WORD: its shared walk says where the kind sits; here it is only read
    return into, turned, blank + [(place.op("JNull", reg=s.listed), s.done)] + _the_named_entry(
        place, word, s.listed, found) + [
        place.op("Int", dst=s.at, ptr=place.number(0)),
        (place.op("JSGte", a=s.at, b=found), s.done),
        place.op("Field", dst=s.how_many, obj=s.listed, field=s.names_at),
        place.op("Field", dst=s.backing, obj=s.listed, field=s.backing_at),
        place.op("Int", dst=s.kept, ptr=place.number(1)),
        place.op("Sub", dst=s.kept, a=found, b=s.kept),
        place.op("GetArray", dst=s.got, array=s.backing, index=s.kept),
        (place.op("JNull", reg=s.got), s.done),
        place.op("UnsafeCast", dst=into, src=s.got),
        (place.op("JSGte", a=found, b=s.how_many), s.done),
        place.op("GetArray", dst=s.got, array=s.backing, index=found),
        (place.op("JNull", reg=s.got), s.done),
        place.op("UnsafeCast", dst=s.name, src=s.got),
        place.op("GetGlobal", **{"dst": left, "global": place.text_object(LEFT_OUT)}),
        (place.op("JNotEq", a=s.name, b=left), s.done),
        place.op("Int", dst=turned, ptr=place.number(1)),
        s.done + ":", place.op("Label")]


def _the_named_entry(place, word, listed, found):
    """A call to `word`'s one walk: just past the last kind its marked spelling named, else 0."""
    from framework.pipeline import Place
    from tools.hlcode import assemble
    kinds = [place.kind_of(listed)]
    tag = "%s, where it named" % word

    def body(hands):
        made = Place(tag, {columns.PART_FOR_COUNT: 0}, {}, None, None, None, tag + ": none",
                     hands)
        s = _places(made, tag)
        this = made.scratch_like(s.name)
        return assemble([
            made.op("Int", dst=s.kept, ptr=made.number(0)),
            made.op("GetGlobal", **{"dst": s.plain, "global": made.text_object(GROUP)}),
            made.op("GetGlobal", **{"dst": this, "global": made.text_object(word)}),
            made.op("Int", dst=s.at, ptr=made.number(0)),
            made.op("Field", dst=s.how_many, obj=s.listed, field=s.names_at),
            made.op("Field", dst=s.backing, obj=s.listed, field=s.backing_at),
            s.seek + ":", made.op("Label")] + _next_entry(made, s, s.name) + [
            (made.op("JNotEq", a=s.name, b=s.plain), s.past)] + _next_entry(made, s, s.which) + [
            (made.op("JNotEq", a=s.which, b=this), s.past)] + _next_entry(made, s, s.name) + [
            made.op("Mov", dst=s.kept, src=s.at),
            s.past + ":", made.op("Label"), (made.op("JAlways"), s.seek),
            s.done + ":", made.op("Label"), made.refused + ":", made.op("Label"),
            made.op("Ret", ret=s.kept)])
    shared = place._hands["shared"]((tag,) + tuple(kinds), kinds, place.kind_of(found), body)
    return [place.op("CallN", dst=found, fun=shared, args=[listed])]


def _scaled(place, factor, s):
    """`factor` times the whole `val`s in `s.total`: none for a `val` of 0 or less, or none held."""
    by, made = s.whole, []
    if place.kind_of(factor) != place.kind_of(s.whole):
        by = place.scratch_like(factor)
        made = [place.op("ToSFloat", dst=by, src=s.whole)]
    return [place.op("Int", dst=s.whole, ptr=place.number(0)),
            (place.op("JSGte", a=s.nought, b=s.per), s.scaled),
            (place.op("JSGte", a=s.nought, b=s.total), s.scaled),
            place.op("SDiv", dst=s.share, a=s.total, b=s.per),
            place.op("ToInt", dst=s.whole, src=s.share),
            s.scaled + ":", place.op("Label")] + made + [
        place.op("Mul", dst=factor, a=factor, b=by)]


def install(bc):
    """Mint each group's marks and check the questions the factor asks, before any road asks."""
    for mark in every_mark() + list(words_of()) + [LEFT_OUT] * bool(named_of()):
        text_object(bc, mark)
    for named in asked():
        function_named(bc, named)
    for value in (0, ONE):
        number(bc, value)
    return ("HELD COUNTS: %s -- the act's amount is 1 times the whole `val`s of the resource "
            "named, held by the faction or summed over those an owner word picks; none for `val` 0"
            "; NAMED COUNTS: %s -- the amount times the count of the kind named"
            % (", ".join("`%s`" % w for w in held_of()) or "none",
               ", ".join("`%s`" % w for w in named_of()) or "none"))
