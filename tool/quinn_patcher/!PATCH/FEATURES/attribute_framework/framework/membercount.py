#!/usr/bin/env python3
"""A count a row narrows by type or trait, per counting word: groups of names, per member."""
from tools.project import gv, guard, remembered
from tools.hlcode import (field_by_name, function_named, kind_named, number, returns_type,
                          template, text_object, written)
from framework import columns, memberchain, narrowcount, triggermatch, turned
from framework.names import module_of, vocabulary, ways_of_writing
from framework.trailing import SAYS_NO
from framework.narrowcount import COUNTED
from framework.questions import NARROWS_TOO_BY, narrowers, narrows_too, weighs  # noqa: F401
from framework.parammatch import emit_pushed
from framework.rowreader import STARTS_AT, reader_for

# what a word's file says: the scope its marked spelling matches a type the way of
MARKED_AS_BY = "MARKED_AS"
# what a widening word names: the counting word whose types it adds one to
ADDS_TO_BY = "ADDS_TO"
# what a member must NOT answer yes to: a faction the game says is dead is never counted
UNLESS_BY = "UNLESS"
# the file listing a word's members off the game itself, when no payee holds them
LISTED_BY = "LISTED_BY"
# a counting word whose list is held per thing it owns names that thing, and what a member is
EACH_BY, MEMBER_BY = "EACH", "MEMBER"
# what a member must say yes to: a question, or `(question, field)`; `SAYS_NO` as field: say no
ONLY_BY = "ONLY"
# ⛔ ONE LIST PER ROW: a group opens on its counting word's kind; a trait follows its word's mark
GROUP, TRAIT = "|%s", "|%s"
# a narrowing with `Not` glued in: each member counted is one it refuses
TURNED = "|%s, turned"
# in front of a type the turned counter names (`PerNotTUnit2`): members of it are not counted
UNTYPED = "|not of the type"
# the nearest count of each counting word on the left: none, bare, a group, or past another
NONE, BARE, GROUPED, PAST = 0, 1, 2, 3
CROSSES = ("effects",)
# ⛔ A TRIGGER STARTS OVER: what follows narrows the place it fired in, never a count before it
STARTS_OVER = triggermatch.FAMILY
TYPED, SPARE = "the last group names a type", "a group spare"
# what the nearest count on the left counts (0: none), and how near: one place each
NEAR, HOW = "the nearest count", "how near the nearest count is"
# the nearest count's own: its tally's and owner tally's offsets, its owner word, and a sum
LAST = ("its tally, further on", "its owner tally, further on", "its owner word", "a sum")
# what waits for the piece's end: none, a narrowing, one naming a column, or a group to open
PENDING, WAITS, WAITS_NAMED, OPENS = "a group waits", 1, 2, 3
MARK_HAND, GROUP_HAND = "a waiting narrowing's mark", "the nearest count's group mark"
PIECE_END = "the piece's end is written"
# ⛔ A WORD COSTS NOTHING: a narrowing names the kinds it fits, one bit each; the end does the rest
FITS, NEEDS_A_NAME = "the kinds a narrowing just read fits", 1 << 30
# said once a game, at each gate a row's word passed or was refused at
OPENED = "SPINE `%s` opened a count of the type it names"
WIDENED = "SPINE `%s` added a type to the count"
UNWIDENED = "SPINE `%s` refused: the last count of its word names no type"
NARROWED = "SPINE a narrowing narrowed the count on its left"
CROSSED = "SPINE a narrowing skipped: something lies between it and all it could narrow"
UNFIT = "SPINE `%s` skipped: it narrows only the row's subject, and something lies between"
SCALED = "SPINE an amount was scaled by a narrowed count"


@remembered(lambda: tuple(vocabulary()))
def _with(attribute, words=None):
    """Every word whose own file declares that attribute, in a settled order."""
    words = vocabulary() if words is None else words
    return tuple(sorted(s for s, w in words.items() if getattr(module_of(w), attribute, None)))


def counters(words=None):
    """Every counting word whose marked spelling counts a named type."""
    return _with(MARKED_AS_BY, words)


def module(word):
    """The file of one word, by its spelling."""
    return module_of(vocabulary()[word])


def kind_of(word):
    """What a counting word's groups are marked by: its own spelling, as words may share a kind."""
    return word


def member_questions(of):
    """Each question a counted member must answer yes to, as (game function, field asked of)."""
    only = getattr(of, ONLY_BY, None)
    said = () if only is None else (only,) if isinstance(only, str) else tuple(only)
    out = tuple((one, None) if isinstance(one, str) else tuple(one) for one in said)
    guard(all(len(one) == 2 and isinstance(one[0], str) and "." in one[0] for one in out),
          "%s is %r, and each of its questions is a game function by name" % (ONLY_BY, only))
    return out


def emit_asked(place, member, asked):
    """Past this, `member` answered every question in `asked` as wanted; else at the refusal."""
    out = []
    for named, field in asked:
        at = member
        if field not in (None, SAYS_NO):
            where, at = place.field_of(member, field)
            out += [place.op("Field", dst=at, obj=member, field=where),
                    (place.op("JNull", reg=at), place.refused)]
        answer = place.scratch_return(named)
        out += [place.op("Call1", dst=answer, fun=place.named_function(named), arg0=at),
                (place.op("JTrue" if field == SAYS_NO else "JFalse", cond=answer), place.refused)]
    return out


def emit_asked_raw(bc, fn, member, asked, skip):
    """The same inside a road's own count, where there is no stage: a no jumps to `skip`."""
    from framework.pipeline import Place, hands_for
    place = Place("member asked", {}, {}, None, None, None, skip, hands_for(bc, fn))
    return emit_asked(place, member, asked)


def _marked_scope(word):
    """The scope whose marked spelling a counting word's own matches a type the way of."""
    return module_of(vocabulary()[module(word).MARKED_AS])


def entity_of(word):
    """The game's kind a counting word's members are, as the scope its mark is matched by says."""
    from framework import scopematch
    return getattr(_marked_scope(word), "ENTITY", None) or scopematch.ASKED_ON


def each_of(word):
    """What a counting word walks its list per, or None when the list is its members."""
    return getattr(module(word), EACH_BY, None)


def wideners(words=None):
    """Every word adding a type to its counting word's last group."""
    return _with(ADDS_TO_BY, words)


def counters_of(narrower):
    """Every counting word a narrower narrows: each one offering what it narrows."""
    wanted = narrows_too(module(narrower))
    found = tuple(c for c in counters() if set(wanted) & set(module(c).OFFERS))
    guard(found, "`%s` narrows %s, and no counting word offers it" % (narrower, wanted))
    return found


def narrowers_on(word):
    """Every narrowing word that narrows this counting word's groups."""
    return tuple(n for n in narrowers() if word in counters_of(n))


def claims(one, words=None):
    """Is this spelling's branch written here: a widener, or a counting word marked?"""
    return one.word.spelling in wideners(words) or (
        one.targeted and one.word.spelling in counters(words))


def matched_by_unit(word):
    """Does this counting word's member answer the game's own unit questions?"""
    from framework import scopematch
    return each_of(word) is None and getattr(module(word), MEMBER_BY, None) is None and (
        module(word).MARKED_AS == scopematch.ASKED_ON.rsplit(".", 1)[1])


def asked():
    """Every game function an act's scaling asks, per member and per faction picked."""
    from framework import multmatch, scopematch
    words = vocabulary()
    out = ()
    for word in counters():
        marked = _marked_scope(word)
        out += tuple(q for q, _f in member_questions(module(word))) + tuple(
            getattr(module(word), UNLESS_BY, ())) + (
            (scopematch.BASE_KIND_MATCHES,) if matched_by_unit(word) else (STARTS_AT,)) + tuple(
            getattr(marked, q) for q in ("MARKED_ASKS", "MARKED_THROUGH") if hasattr(marked, q))
    from framework import rescount
    from framework.boundary import BY_VALUE as LOOK_UP
    # a weighed word asks what its own file asks, wherever it is asked
    return out + rescount.asked() + tuple(
        getattr(module_of(words[n]), q) for n in narrowers()
        for q in ("REQUIRES", "ASKS", "THROUGH", "AGAINST")
        if getattr(module_of(words[n]), q, None) and not weighs(module_of(words[n]))) + tuple(
        LOOK_UP for n in narrowers() if getattr(module_of(words[n]), "SHEET", None)
        and not weighs(module_of(words[n]))) + multmatch.picked_asks()


PLACES = (NEAR, HOW, PENDING, TYPED) + LAST + (SPARE, FITS)
PARTS = ()
READS = (columns.PART_FOR_MEMBERS,)


def __getattr__(name):
    """`WALKS`, an act's scaling's jumps back, worked out by the walk that writes them."""
    if name != "WALKS":
        raise AttributeError(name)
    from framework.memberwalk import walks
    return walks()


def owners(word):
    """Every owner word a count of this word may carry; none when the word takes none."""
    from framework.multmatch import pickers
    from framework.ownermatch import numbers
    return sorted(numbers()) if word in pickers() else []


def every_mark():
    """Every text that opens or closes a group in the row's member list."""
    from framework.ownermatch import OWNED_ONCE
    return sorted({GROUP % kind_of(c) for c in counters()} | {UNTYPED}
                  | {m % s for s in narrowers() for m in (TRAIT, TURNED)} | {OWNED_ONCE})


def _op(bc, name, **operands):
    """One instruction of the game's own shape."""
    return written(template(bc, name), **operands)


def kind_number(kind):
    """What the nearest place holds for a count of this kind; 0 is none."""
    kinds = sorted({module(c).OFFERS[0] for c in counters()})
    guard(kind in kinds, "`%s` is counted by no counting word: %s" % (kind, kinds))
    return kinds.index(kind) + 1


def _now(bc, r, how, word=None, zero=None):
    """The nearest count from here on; handed `zero`, how near only: the piece's end sets what."""
    near = [] if zero is not None else [_op(bc, "Int", dst=r[NEAR], ptr=number(bc, kind_number(
        module(word).OFFERS[0]) if word else 0))]
    return [_op(bc, "Mov", dst=r[HOW], src=zero) if how == NONE and zero is not None else _op(
        bc, "Int", dst=r[HOW], ptr=number(bc, how))] + near


def emit_forget(bc, r, listed):
    """No count on the left and the row's groups emptied, before an id is read."""
    return _now(bc, r, NONE) + [_op(bc, "Int", dst=r[p], ptr=number(bc, 0)) for p in (
        TYPED, PENDING, FITS)] + [_op(bc, "Null", dst=listed)]


def emit_counted(bc, r, one, plain, where):
    """A counting word's one branch: bare, `plain` and its tally; marked, a group of the type."""
    from framework.pieceword import SHARES_ITS_PLAIN
    word, (column, listed, hands) = one.word.spelling, where
    if word not in counters():
        return plain
    if hands is None or column is None:
        return plain + _now(bc, r, BARE, word)
    kept = _now(bc, r, BARE, word) + emit_remembered(bc, r, word, where)
    if one.word.target == "never":
        return kept + plain
    SHARES_ITS_PLAIN.update(t for t in ways_of_writing(word)[1:])
    marked, done = ("%s: %s" % (one.text, w) for w in ("marked", "counted"))
    # ⛔ ONE WORD, ONE BRANCH: marked, its group opens at the piece's end, in shared code
    return kept + [(_op(bc, "JNotEq", a=hands["marked"], b=hands["zero"]), marked)] + plain + [
        (_op(bc, "JAlways"), done), marked + ":", _op(bc, "Label"),
        _op(bc, "Int", dst=r[PENDING], ptr=number(bc, OPENS)), done + ":", _op(bc, "Label")]


def _marked(bc, mark, listed, hands):
    """One of our marks pushed onto the row's groups."""
    held = hands["place"](reader_for(bc).text_kind)
    return [_op(bc, "GetGlobal", **{"dst": held, "global": text_object(bc, mark)})] + (
        emit_pushed(bc, held, listed, hands))


def _named(bc, column, hands, skipped):
    """What the piece's column names, and a jump to `skipped` when it names nothing."""
    named = hands["place"](reader_for(bc).text_kind)
    return named, hands["resolve"](column, named) + [(_op(bc, "JNull", reg=named), skipped)]


def branches(bc, r, words=None, column=None, listed=None, hands=None):
    """A widener adds a type to its word's group; a counting word marked runs its plain branch."""
    from framework.multmatch import written_ways
    words = vocabulary() if words is None else words
    out = []
    for one in written_ways(words):
        if not claims(one, words):
            continue
        word = one.word.spelling
        # ⛔ ONE WORD, ONE BRANCH: a marked counting word runs its plain one, which reads the mark
        if word in counters(words):
            out.append((one, []))
            continue
        done, refused = "%s: counted" % one.text, "%s: no typed count" % one.text
        named, reading = _named(bc, column, hands, done)
        adds = kind_number(module(getattr(module_of(words[word]), ADDS_TO_BY)).OFFERS[0])
        out.append((one, [_op(bc, "Int", dst=r[SPARE], ptr=number(bc, 0)),
                          (_op(bc, "JEq", a=r[TYPED], b=r[SPARE]), refused),
                          _op(bc, "Int", dst=r[SPARE], ptr=number(bc, adds)),
                          (_op(bc, "JNotEq", a=r[NEAR], b=r[SPARE]), refused)] + reading + (
            emit_pushed(bc, named, listed, hands)) + hands["say"](WIDENED % word) + [
            (_op(bc, "JAlways"), done), refused + ":", _op(bc, "Label")] + hands["say"](
            UNWIDENED % word) + [done + ":", _op(bc, "Label")]))
    return out + _member_blocks(bc, r, words, column, listed, hands)


def _only_on_the_subject(bc, r, one, block, hands):
    """A word that narrows no count: the row's subject with nothing on its left, else skipped."""
    subject, unfit, done = ("%s: %s" % (one.text, what) for what in (
        "narrows the subject", "something lies between", "skipped"))
    guard(NONE == 0, "no count on the left must be 0, the reading's own zero")
    return ([(_op(bc, "JNotEq", a=r[HOW], b=hands["zero"]), unfit)]
            + [(_op(bc, "JAlways"), subject), unfit + ":", _op(bc, "Label")]
            # one latch per word: an owner-in-front spelling would say the same line again
            + ([] if one.with_owner else hands["say"](UNFIT % one.word.spelling))
            + [(_op(bc, "JAlways"), done), subject + ":", _op(bc, "Label")]
            + list(block) + [done + ":", _op(bc, "Label")])


def _narrowed(bc, r, one, block, column, listed, hands):
    """A narrower's branch: its kinds and mark kept for the piece's end; else the subject."""
    subject, done = ("%s: %s" % (one.text, what) for what in ("narrows the subject", "narrowed"))
    fits = sum(1 << kind_number(k) for k in narrows_too(module(one.word.spelling)))
    from framework import ownerpicks
    fits |= NEEDS_A_NAME * ownerpicks.count_reads_a_name(one)
    owned = ownerpicks.count_kept(bc, r, one, hands, (r[FITS], r[SPARE], NEEDS_A_NAME))
    mark = _kept_mark(bc, one, _held(bc, (column, listed, hands), MARK_HAND, r), hands) + [
        (_op(bc, "JAlways"), done)]
    return [(_op(bc, "JEq", a=r[HOW], b=hands["zero"]), subject),
            _op(bc, "Int", dst=r[FITS], ptr=number(bc, fits))] + owned + mark + [
        subject + ":", _op(bc, "Label")] + list(block) + [done + ":", _op(bc, "Label")]


def _fitted(bc, r, hands):
    """Once a piece is read: a narrowing waits on the nearest count when it fits its kind."""
    past, crossed, named, waits, kept, gone, near = ("the piece's end, narrowing %s" % w for w in (
        "read", "crossed", "named", "waits", "kept", "has no count", "has its count"))
    spare = lambda value: _op(bc, "Int", dst=r[SPARE], ptr=number(bc, value))  # noqa: E731
    guard(len({module(c).OFFERS[0] for c in counters()}) < 30, "a kind's bit passes 29")
    # ⛔ PAST A CROSSING, OR WITH NONE, THE NEAREST COUNT IS 0, set here and in no branch
    return [(_op(bc, "JEq", a=r[HOW], b=hands["zero"]), gone), spare(PAST),
            (_op(bc, "JNotEq", a=r[HOW], b=r[SPARE]), near), gone + ":", _op(bc, "Label"),
            _op(bc, "Mov", dst=r[NEAR], src=hands["zero"]), near + ":", _op(bc, "Label"),
            (_op(bc, "JEq", a=r[FITS], b=hands["zero"]), past), spare(1),
            _op(bc, "Shl", dst=r[SPARE], a=r[SPARE], b=r[NEAR]),
            _op(bc, "And", dst=r[SPARE], a=r[SPARE], b=r[FITS]),
            (_op(bc, "JEq", a=r[SPARE], b=hands["zero"]), crossed), spare(NEEDS_A_NAME),
            _op(bc, "And", dst=r[SPARE], a=r[SPARE], b=r[FITS]),
            (_op(bc, "JEq", a=r[SPARE], b=hands["zero"]), named),
            (_op(bc, "JEq", a=hands["marked"], b=hands["zero"]), crossed),
            named + ":", _op(bc, "Label"), _op(bc, "Int", dst=r[PENDING], ptr=number(bc, WAITS)),
            (_op(bc, "JEq", a=hands["marked"], b=hands["zero"]), waits),
            _op(bc, "Int", dst=r[PENDING], ptr=number(bc, WAITS_NAMED)), waits + ":",
            _op(bc, "Label")] + hands["say"](NARROWED) + [
        (_op(bc, "JAlways"), kept), crossed + ":", _op(bc, "Label")] + hands["say"](CROSSED) + [
        kept + ":", _op(bc, "Label"), _op(bc, "Int", dst=r[FITS], ptr=number(bc, 0)),
        past + ":", _op(bc, "Label")]


def _kept_mark(bc, one, mark, hands):
    """The narrowing's mark, kept for the piece's end: its turned mark when `Not` was glued in."""
    spelling, hand, plain = one.word.spelling, hands.get(turned.HAND), "%s: not turned" % one.text
    kept = lambda text: [_op(bc, "GetGlobal", **{"dst": mark, "global": text_object(bc, text)})]
    if hand is None:
        return kept(TRAIT % spelling)
    return (kept(TRAIT % spelling) + [(_op(bc, "JEq", a=hand, b=hands["zero"]), plain)]
            + kept(TURNED % spelling) + [plain + ":", _op(bc, "Label")])


def _held(bc, where, key, r):
    """A text place kept in the hands under `key`; the first one made adds the piece's end."""
    hands = where[2]
    if key not in hands:
        hands[key] = hands["place"](reader_for(bc).text_kind)
    if PIECE_END not in hands:
        hands[PIECE_END] = True
        hands["listing"] += _fitted(bc, r, hands) + _piece_end(bc, r, where)
    return hands[key]


def _offset(name, word, among):
    """How far `word`'s `name` slot sits past the first of `among`'s, on the row's list."""
    from framework.parsed import RECORDED
    return RECORDED.index(name(word)) - RECORDED.index(name(among[0])) if word in among else 0


def emit_remembered(bc, r, word, where):
    """The nearest count kept for the piece's end: its slots, its owner word and its mark."""
    from framework.multmatch import OWNED, TIMES, pickers
    from framework.pieceword import OWNER_HAND
    picked, owner = [c for c in counters() if c in pickers()], where[2].get(OWNER_HAND)
    return [_op(bc, "Int", dst=r[LAST[0]], ptr=number(bc, _offset(
                lambda c: TIMES % c, word, counters()))),
            _op(bc, "Int", dst=r[LAST[1]], ptr=number(bc, _offset(
                lambda c: OWNED % (c, 0), word, picked))),
            _op(bc, "Int", dst=r[LAST[2]], ptr=number(bc, 0)) if owner is None else _op(
                bc, "Mov", dst=r[LAST[2]], src=owner),
            _op(bc, "GetGlobal", **{"dst": _held(bc, where, GROUP_HAND, r),
                                    "global": text_object(bc, GROUP % kind_of(word))})]


def _group_opened(bc, r, listed, hands, tag, given_back=True):
    """The nearest count's group marked; a bare one's tally and owner tally given back first."""
    from framework.multmatch import OWNED, TIMES, pickers, tallied
    from framework.ownermatch import emit_owner_marks, emit_tallied
    from framework.parsed import TAKE
    picked = [c for c in counters() if c in pickers()]
    owned = [_op(bc, "Add", dst=r[LAST[3]], a=r[LAST[1]], b=r[LAST[2]])] + tallied(
        r, OWNED % (picked[0], 0), 3, at=r[LAST[3]]) if picked else []
    back = tallied(r, TIMES % counters()[0], TAKE, at=r[LAST[0]]) + emit_tallied(
        bc, r[LAST[2]], r[SPARE], tag, lambda _at: owned) if given_back else []
    # a place of its own per push: the push names its steps after the place it pushes
    mark = hands["place"](reader_for(bc).text_kind)
    return back + emit_owner_marks(bc, r[LAST[2]], r[SPARE], listed, hands, tag) + [
        _op(bc, "Mov", dst=mark, src=hands[GROUP_HAND])] + emit_pushed(bc, mark, listed, hands)


def _piece_end(bc, r, where):
    """Once a piece is read: a marked count opens its typed group, a narrowing marks its count."""
    column, listed, hands = where
    _held(bc, where, MARK_HAND, r), _held(bc, where, GROUP_HAND, r)
    named = hands["place"](reader_for(bc).text_kind)
    idle, given, read, waits, grouped, unnamed, closed = ("the piece's end, %s" % w for w in (
        "nothing waits", "a column", "read", "a narrowing", "a group", "names nothing", "marked"))
    to = lambda value, label, jump="JEq": [_op(bc, "Int", dst=r[SPARE], ptr=number(  # noqa: E731
        bc, value)), (_op(bc, jump, a=r[PENDING], b=r[SPARE]), label)]
    opened = [(_op(bc, "JEq", a=r[PENDING], b=hands["zero"]), idle)] + to(WAITS, read) + [
        (_op(bc, "JNotEq", a=column, b=hands["zero"]), given),
        _op(bc, "Mov", dst=column, src=hands["one"]), given + ":", _op(bc, "Label")] + hands[
        "resolve"](column, named) + [(_op(bc, "JNull", reg=named), unnamed), read + ":", _op(
            bc, "Label")] + to(OPENS, waits, "JNotEq") + _group_opened(
        bc, r, listed, hands, "the piece's end, a typed group", given_back=False) + [
        _op(bc, "Int", dst=r[TYPED], ptr=number(bc, 1))] + turned.emit_left_out(
        bc, hands, r[TYPED], r[SPARE], _marked(bc, UNTYPED, listed, hands), "the piece's end") + [
        (_op(bc, "JAlways"), closed)]
    return opened + [waits + ":", _op(bc, "Label"),
                     _op(bc, "Int", dst=r[SPARE], ptr=number(bc, GROUPED)),
                     (_op(bc, "JEq", a=r[HOW], b=r[SPARE]), grouped)] + _group_opened(
        bc, r, listed, hands, "the piece's end, a bare count") + [
        _op(bc, "Int", dst=r[TYPED], ptr=number(bc, 0)), grouped + ":", _op(bc, "Label")
    ] + emit_pushed(bc, hands[MARK_HAND], listed, hands) + to(WAITS, unnamed) + [
        closed + ":", _op(bc, "Label")] + emit_pushed(bc, named, listed, hands) + [
        unnamed + ":", _op(bc, "Label"), _op(bc, "Int", dst=r[HOW], ptr=number(bc, GROUPED)),
        _op(bc, "Int", dst=r[PENDING], ptr=number(bc, 0)), idle + ":", _op(bc, "Label")]


def _member_blocks(bc, r, words, column, listed, hands):
    """A member count's block per kind: a list modifier's first, each of a chained modifier's."""
    from framework.pieceword import Spelling, spellings
    return [(one, {kind: _narrowed(bc, r, Spelling("%s on %s" % (one.text, kind), one.word,
        one.targeted, one.with_owner), [], column, listed, hands) for kind in narrows_too(
        module(one.word.spelling))[:1 if narrowcount.lists_of(one.word) else None]})
        for one in spellings(words) if one.with_owner is None
        and one.word.family == narrowcount.FAMILY and one.word.spelling in narrowers(words)
        and (narrowcount.lists_of(one.word) or memberchain.chained(one.word.spelling))]


def narrowing(bc, r, known, column=None, listed=None, hands=None):
    """A narrower with its count on its left narrows that count; with none, the row's subject."""
    out = []
    for one, block in known:
        if one.word.family in CROSSES or one.word.family == STARTS_OVER:
            how = PAST if one.word.family in CROSSES else NONE
            out.append((one, list(block) + _now(bc, r, how, zero=(hands or {}).get("zero"))))
        elif one.word.family != "narrowing":
            out.append((one, block))
        elif one.word.spelling not in narrowers():
            out.append((one, _only_on_the_subject(bc, r, one, block, hands)
                        + narrowcount.emit_weighing(bc, r, one.word)))
        else:
            out.append((one, _narrowed(bc, r, one, block, column, listed, hands)))
    return out


def inner_hops(word):
    """The way from one thing a counting word walks to its own list of members."""
    from framework.multmatch import declared
    hops = declared(word)[1]
    if each_of(word) is None:
        return ()
    guard(len(hops) >= 2, "`%s` walks its list per %s and names no way on"
          % (word, each_of(word)))
    return hops[1:]


def emit_scaled(place, amount):
    """`amount` times each group's count, once per group the row's list holds."""
    from framework.memberwalk import emit_scaled as scaled
    return scaled(place, amount)


def install(bc):
    """Check each counting word, its wideners and narrowers, and what the scaling asks."""
    for name in asked():
        function_named(bc, name)
    for value in (NONE, BARE, GROUPED, PAST, 0, 1):
        number(bc, value)
    for mark in every_mark():
        text_object(bc, mark)
    for word in counters():
        if each_of(word):
            kind_named(bc, each_of(word))
    for widener in wideners():
        adds = getattr(module_of(vocabulary()[widener]), ADDS_TO_BY)
        guard(adds in counters(), "`%s` adds to `%s`, and the counting words are %s"
              % (widener, adds, ", ".join(counters())))
    from framework.questions import check_pairs
    for narrower in check_pairs(bc):
        counters_of(narrower)
    return ("MEMBER COUNTS: %s marked count the members of the type each names; %s add a type "
            "(either); %s narrow the nearest count of their word on their left (every trait), "
            "else the row's subject; each group scales the amount once"
            % (", ".join("`%s`" % w for w in counters()),
               ", ".join("`%s`" % w for w in wideners()) or "none",
               ", ".join("`%s`" % n for n in narrowers()) or "none"))
