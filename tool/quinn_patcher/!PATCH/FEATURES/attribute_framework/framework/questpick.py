#!/usr/bin/env python3
"""A quest word's quests weighed by the Of words filed after it, up to the next quest word."""
import itertools

from framework.acts import start_quest as pick
from framework.boundary import BY_VALUE
from framework.columns import PART_FOR_NARROWING
from framework.trailing import OFFERS, offers_of, owed_of

OFFERED = "a quest pick"
HEAD_MARK = pick.HEAD_MARK
# the quest sheet, its rows by id and all of them, and the cells read off a row
DATA, SHEET_KIND, SHEET, BY_ID, ALL = "$Data", "cdb.IndexId", "quest", "byId", "all"
TYPE, ID = "type", "id"
# what the shared weighing answers: refused, kept, or no Of word spelled after that word
REFUSED, KEPT, UNSPELLED = 0, 1, 2
VALUE = "value"
_SEEN = itertools.count()


def _here(place, what):
    """A place of the stage's own, numbered: one emitter may run several times in a function."""
    return place.here("%s #%d" % (what, next(_SEEN)))


def emit_head(bc, word, listed, hands):
    """At the bake: a word handing over (or owing) its quests files its mark and name."""
    if listed is None or OFFERED not in offers_of(word) + tuple(owed_of(word, OFFERS)):
        return []
    return pick._filed(bc, (HEAD_MARK, word.spelling), listed, hands) + _filed_target(
        bc, word, listed, hands)


def _filed_target(bc, word, listed, hands):
    """`TQuestDuration3`: column 3's quest filed as one more pick (`Not`: left out), unmarked."""
    from tools.hlcode import number, template, text_object, written
    from framework.effecttable import held_named
    from framework.names import ways_of_writing
    from framework.parammatch import emit_pushed
    from framework.pieceword import SHARES_ITS_PLAIN
    from framework.rowreader import reader_for
    from framework.turned import HAND, turned_after
    negated = hands[HAND] if turned_after(word) is not None else None
    if not getattr(held_named(word.spelling), "filed", None):
        return []
    # ⛔ ONE WORD, ONE BRANCH: what the mark changes is asked here, while the piece is read
    SHARES_ITS_PLAIN.update(ways_of_writing(word.spelling)[1:])
    column, seen = hands["column"], next(_SEEN)
    named, mark = (hands["place"](reader_for(bc).text_kind) for _ in range(2))
    unmarked, given, kept = ("%s filed, %s #%d" % (word.spelling, w, seen)
                             for w in ("none", "given", "kept"))

    def op(name, **operands):
        return written(template(bc, name), **operands)
    out = [] if negated is None else [
        (op("JEq", a=negated, b=hands["zero"]), kept),
        op("GetGlobal", **{"dst": mark, "global": text_object(bc, pick.ID_OUT_MARK)})]
    return [(op("JEq", a=hands["marked"], b=hands["zero"]), unmarked),
            (op("JNotEq", a=column, b=hands["zero"]), given),
            op("Mov", dst=column, src=hands["one"]),
            given + ":", op("Label")] + hands["resolve"](column, named) + [
        (op("JNull", reg=named), unmarked),
        op("GetGlobal", **{"dst": mark, "global": text_object(bc, pick.ID_MARK)})] + out + [
        kept + ":", op("Label")] + emit_pushed(
        bc, mark, listed, hands) + emit_pushed(bc, named, listed, hands) + [
        # the game is told no target: the row's attribute is the one every quest reads
        op("Int", dst=hands["effect column"], ptr=number(bc, 0)),
        unmarked + ":", op("Label")]


def heads():
    """Every word handing over or owing its quests, by its spelling, in a settled order."""
    from framework.names import vocabulary
    return tuple(sorted(s for s, w in vocabulary().items()
                        if OFFERED in offers_of(w) + tuple(owed_of(w, OFFERS))))


def word_doing(does):
    """The effects tab's word doing one game action, by its `does` cell."""
    from framework.effecttable import sheet_rows
    return next(one.word for one in sheet_rows() if getattr(one, "does", None) == does)


def _weighing(hands):
    """(row, names, val, word) -> refused, kept, or unspelled: the row against its Of words."""
    from tools.hlcode import assemble
    from framework.pipeline import Place
    at = Place("quest kept", {}, {}, None, None, None, "quest kept: done", hands)
    r = {w: at.scratch_of("I32") for w in ("zero", "one", "e", "compared", "kinds", "any",
                                          "same", "skips", "start", "end", "found")}
    r["got"], r["name"], r["cell"] = (at.scratch_of("Dyn"), at.scratch_arg(pick.FIELD, 1),
                                      at.scratch_arg(pick.FIELD, 1))
    answer, number = at.scratch_of("I32"), at.scratch_of("I32")
    cell, value = at.scratch_arg(pick.FIELD, 1), at.scratch_return(pick.FIELD)
    named = at.scratch_return(pick.KIND_NAME)
    unspelled, refused, kinded = (at.here(w) for w in ("no Of word", "refused", "its kind read"))
    return assemble([
        at.op("Int", dst=r["zero"], ptr=at.number(0)),
        at.op("Int", dst=r["one"], ptr=at.number(1)),
        at.op("Int", dst=r["kinds"], ptr=at.number(0)),
        at.op("Int", dst=r["any"], ptr=at.number(0)),
        at.op("Int", dst=r["skips"], ptr=at.number(0)),
        at.op("Int", dst=r["compared"], ptr=at.number(0)),
        at.op("Null", dst=r["cell"])]
        + pick._marks(at, r, unspelled) + pick._section(at, r, 3)
        + pick._spelled(at, r, unspelled) + [
        (at.op("JNull", reg=0), refused),
        (at.op("JEq", a=r["kinds"], b=r["zero"]), kinded),
        at.op("GetGlobal", **{"dst": cell, "global": at.text_object(TYPE)}),
        at.op("Call2", dst=value, fun=at.named_function(pick.FIELD), arg0=0, arg1=cell),
        (at.op("JNull", reg=value), refused),
        at.op("SafeCast", dst=number, src=value),
        at.op("Call1", dst=named, fun=at.named_function(pick.KIND_NAME), arg0=number),
        (at.op("JNull", reg=named), refused)]
        + pick._kind_kept(at, r, named, refused) + [kinded + ":", at.op("Label")]
        + _id_kept(at, r, refused) + pick._weighed(at, r, 0, 2, refused) + [
        at.op("Int", dst=answer, ptr=at.number(KEPT)), at.op("Ret", ret=answer),
        refused + ":", at.op("Label"),
        at.op("Int", dst=answer, ptr=at.number(REFUSED)), at.op("Ret", ret=answer),
        unspelled + ":", at.op("Label"),
        at.op("Int", dst=answer, ptr=at.number(UNSPELLED)), at.op("Ret", ret=answer)])


def _id_kept(at, r, refused):
    """Past this, the row is the one quest the column named, or none was named; else refused."""
    kept = at.here("the quest named, or none")
    cell, value = at.scratch_arg(pick.FIELD, 1), at.scratch_return(pick.FIELD)
    its_id = at.scratch_like(r["name"])
    # `NotTQuestDuration`, `CompleteNotTQuest`: the quest named is the one refused
    out = at.here("the quest named, left out")
    return [(at.op("JNull", reg=r["id"]), kept),
            at.op("GetGlobal", **{"dst": cell, "global": at.text_object(ID)}),
            at.op("Call2", dst=value, fun=at.named_function(pick.FIELD), arg0=0, arg1=cell),
            (at.op("JNull", reg=value), refused),
            at.op("SafeCast", dst=its_id, src=value),
            at.op("Call2", dst=r["same"], fun=at.named_function(pick.SAME), arg0=its_id,
                  arg1=r["id"]),
            (at.op("JNotEq", a=r["out"], b=r["zero"]), out),
            (at.op("JNotEq", a=r["same"], b=r["zero"]), refused),
            (at.op("JAlways"), kept),
            out + ":", at.op("Label"),
            (at.op("JEq", a=r["same"], b=r["zero"]), refused),
            kept + ":", at.op("Label")]


def names_of(place):
    """The row's filed names and its `val`, or None when this place carries no names."""
    names, val = place.row.get(PART_FOR_NARROWING), place.row.get(VALUE)
    return None if names is None or val is None or place.kind_of(names) == 0 else (names, val)


def _head_in(place, head):
    """(steps, register): the quest word's name in a place; a register already holding it as is."""
    if isinstance(head, int):
        return [], head
    held = place.scratch_arg(pick.SAME, 0)
    return [place.op("GetGlobal", **{"dst": held, "global": place.text_object(head)})], held


def emit_answer(place, head, row, answer, names=None):
    """The one weighing of the quest row `row`, a Dyn (None: is anything spelled?), for `head`."""
    names, val = names or names_of(place)
    held = place.scratch_of("Dyn") if row is None else row
    naming, named = _head_in(place, head)
    args = [held, names, val, named]
    kinds = [place.kind_of(a) for a in args]
    weigh = place._hands["shared"](("quest kept",) + tuple(kinds), kinds,
                                   place.kind_of(answer), _weighing)
    return naming + [place.op("Null", dst=held)] * (row is None) + [
        place.op("CallN", dst=answer, fun=weigh, args=args)]


def emit_row(place, quest_id, into, missing):
    """The quest sheet's row whose id is `quest_id`, into `into` (a Dyn); none, to `missing`."""
    data = place.scratch_of(DATA)
    sheet_at, sheet = place.field_of(DATA, SHEET)
    by_id_at, by_id = place.field_of(SHEET_KIND, BY_ID)
    return [(place.op("JNull", reg=quest_id), missing),
            place.op("GetGlobal", **{"dst": data, "global": place.the_one_global(DATA)}),
            place.op("Field", dst=sheet, obj=data, field=sheet_at),
            (place.op("JNull", reg=sheet), missing),
            place.op("Field", dst=by_id, obj=sheet, field=by_id_at),
            (place.op("JNull", reg=by_id), missing),
            place.op("Call2", dst=into, fun=place.named_function(BY_VALUE), arg0=by_id,
                     arg1=quest_id),
            (place.op("JNull", reg=into), missing)]


def emit_kept(place, head, quest_id, refused, unspelled=None, names=None):
    """Past this, the quest `quest_id` names is one `head`'s Of words keep, or none was spelled."""
    names = names or names_of(place)
    if names is None:
        return [(place.op("JAlways"), unspelled)] if unspelled else []
    row, answer, spare = place.scratch_of("Dyn"), place.scratch_of("I32"), place.scratch_of("I32")
    gone, weighed = _here(place, "%s: no such quest" % head), _here(place, "%s: weighed" % head)
    return [place.op("Null", dst=row)] + emit_row(place, quest_id, row, gone) + [
        gone + ":", place.op("Label")] + emit_answer(place, head, row, answer, names) + [
        place.op("Int", dst=spare, ptr=place.number(REFUSED)),
        (place.op("JEq", a=answer, b=spare), refused)] + ([
            place.op("Int", dst=spare, ptr=place.number(UNSPELLED)),
            (place.op("JEq", a=answer, b=spare), unspelled)] if unspelled else []) + [
        weighed + ":", place.op("Label")]


def emit_each_row(place, body, over):
    """`body(row, following)` per row of the quest sheet, then on to `over`."""
    from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON
    data = place.scratch_of(DATA)
    sheet_at, sheet = place.field_of(DATA, SHEET)
    all_at, every = place.field_of(SHEET_KIND, ALL)
    rows = place.scratch_of(ARRAY_OF_ENTRIES)
    count_at, count = place.field_of(ARRAY_OF_ENTRIES, COUNT_ON)
    backing_at, backing = place.field_of(ARRAY_OF_ENTRIES, BACKING_ON)
    at, step, row = place.scratch_like(count), place.scratch_like(count), place.scratch_of("Dyn")
    again, following = _here(place, "each quest row"), _here(place, "past this quest row")
    return [place.op("GetGlobal", **{"dst": data, "global": place.the_one_global(DATA)}),
            place.op("Field", dst=sheet, obj=data, field=sheet_at),
            (place.op("JNull", reg=sheet), over),
            place.op("Field", dst=every, obj=sheet, field=all_at),
            (place.op("JNull", reg=every), over),
            place.op("SafeCast", dst=rows, src=every),
            place.op("Field", dst=count, obj=rows, field=count_at),
            place.op("Field", dst=backing, obj=rows, field=backing_at),
            place.op("Int", dst=at, ptr=place.number(0)),
            place.op("Int", dst=step, ptr=place.number(1)),
            again + ":", place.op("Label"),
            (place.op("JSGte", a=at, b=count), over),
            place.op("GetArray", dst=row, array=backing, index=at),
            place.op("Add", dst=at, a=at, b=step),
            (place.op("JNull", reg=row), following)] + body(row, following) + [
            following + ":", place.op("Label"),
            (place.op("JAlways"), again)]


def _apart(place, head, quests, total, tag, walk):
    """`walk` in a function of its own, handed the quests, names and `val`; its count added."""
    from tools.hlcode import assemble
    from framework.pipeline import Place
    names, val = names_of(place)
    naming, named = _head_in(place, head)
    args = [quests, names, val, named]
    kinds = [place.kind_of(a) for a in args]

    def body(hands):
        none = "quests %s: none" % tag
        at = Place("quests %s" % tag, {PART_FOR_NARROWING: 1, VALUE: 2}, {}, None, None,
                   None, none, hands)
        held = at.scratch_of("I32")
        return assemble([at.op("Int", dst=held, ptr=at.number(0))] + walk(at, 3, 0, held) + [
            none + ":", at.op("Label"), at.op("Ret", ret=held)])
    counted = place._hands["shared"](("quests %s" % tag,) + tuple(kinds), kinds,
                                     place.kind_of(total), body)
    got = place.scratch_like(total)
    return naming + [place.op("CallN", dst=got, fun=counted, args=args),
            place.op("Add", dst=total, a=total, b=got)]


def emit_tally_kept(place, head, quests, total, kept_as=None):
    """Each quest the Of words keep: its count in the faction's tally, in a function apart."""
    return _apart(place, head, quests, total, "tallied %s" % kept_as, lambda at, h, q, t: (
        _tally_walk(at, h, q, t, kept_as)))


def emit_running_kept(place, head, quests, total):
    """Each running quest the Of words keep, counted in a function apart."""
    return _apart(place, head, quests, total, "running", _running_walk)


def _tally_walk(place, head, quests, total, kept_as=None):
    """Each quest the Of words keep: its count in the faction's tally (`kept_as` after its id)."""
    from framework.questions.quests_done import emit_map
    names = names_of(place)
    as_map, reaching = emit_map(place, quests, place.refused)
    answer, spare = place.scratch_of("I32"), place.scratch_of("I32")
    key, mark = place.scratch_arg(BY_VALUE, 0), place.scratch_arg(BY_VALUE, 0)
    got, one = place.scratch_return(BY_VALUE), place.scratch_like(total)
    cell, value = place.scratch_arg(pick.FIELD, 1), place.scratch_return(pick.FIELD)
    walked = _here(place, "%s: every quest row weighed" % head)

    def body(row, following):
        joined = [] if kept_as is None else [
            place.op("GetGlobal", **{"dst": mark, "global": place.text_object(kept_as)}),
            place.op("Call2", dst=key, fun=place.named_function("$String.__add__"), arg0=key,
                     arg1=mark)]
        return emit_answer(place, head, row, answer, names) + [
            place.op("Int", dst=spare, ptr=place.number(KEPT)),
            (place.op("JNotEq", a=answer, b=spare), following),
            place.op("GetGlobal", **{"dst": cell, "global": place.text_object(ID)}),
            place.op("Call2", dst=value, fun=place.named_function(pick.FIELD), arg0=row,
                     arg1=cell),
            (place.op("JNull", reg=value), following),
            place.op("UnsafeCast", dst=key, src=value)] + joined + [
            place.op("Call2", dst=got, fun=place.named_function(BY_VALUE), arg0=as_map,
                     arg1=key),
            (place.op("JNull", reg=got), following),
            place.op("SafeCast", dst=one, src=got),
            place.op("Add", dst=total, a=total, b=one)]
    return reaching + emit_each_row(place, body, walked) + [walked + ":", place.op("Label")]


def _running_walk(place, head, quests, total):
    """Each running quest the Of words keep, counted into `total`."""
    from framework.acts.complete_quest import QUEST, QUESTS, RUNNING, KIND, _each
    names = names_of(place)
    running_at, running = place.field_of(QUESTS, RUNNING)
    walked = _here(place, "%s: every running quest weighed" % head)

    def body(item, following):
        kind_at, kind = place.field_of(QUEST, KIND)
        return [place.op("Field", dst=kind, obj=item, field=kind_at)] + emit_kept(
            place, head, kind, following, names=names) + [place.op("Incr", dst=total)]
    return [place.op("Field", dst=running, obj=quests, field=running_at)] + _each(
        place, running, QUEST, "%s running" % head, body, walked) + [walked + ":",
                                                                   place.op("Label")]


def emit_either(place, head, plain, kept):
    """`plain` with no Of word after `head` on this row, else `kept`: both lists of steps."""
    if names_of(place) is None:
        return plain
    weighed, joined = _here(place, "%s: Of words" % head), _here(place, "%s: counted" % head)
    return emit_spelled_or(place, head, weighed) + plain + [
        (place.op("JAlways"), joined), weighed + ":", place.op("Label")] + kept + [
        joined + ":", place.op("Label")]


def narrowed(head, plain, kept):
    """A question's total: `plain` with no Of word after `head`, else `kept` quest by quest."""
    def total_of(place, quests, total, named=None):
        counted = (lambda: plain(place, quests, total)) if named is None else (
            lambda: plain(place, quests, total, named=named))
        if names_of(place) is None:
            return counted()
        return emit_either(place, head, counted(),
                           kept(place, head, quests, total))
    return total_of


def _kept_walk(word):
    """The quest-by-quest count a multiplier's summing question keeps; None for any other."""
    from framework.questions import summing
    return getattr(summing(word), "emit_kept", None) if summing(word) else None


def emit_summed(place, word, at, total, plain):
    """A multiplier's summed count on the quests `at` (`plain()`), quest by quest past Of words."""
    walk = _kept_walk(word)
    if walk is None or names_of(place) is None:
        return plain()
    return emit_either(place, word, plain(), [
        (place.op("JNull", reg=at), place.refused)] + walk(place, word, at, total))


def emit_named_stands(place, word, named, plain, either):
    """`either`, unless `named` holds a quest: a marked count is never recounted past Of words."""
    if named is None or _kept_walk(word) is None or names_of(place) is None:
        return either
    past, done = (_here(place, "%s: its quest named, %s" % (word, w)) for w in ("no", "summed"))
    return [(place.op("JNull", reg=named), past)] + plain() + [
        (place.op("JAlways"), done), past + ":", place.op("Label")] + either + [
        done + ":", place.op("Label")]


def recounted(place, word, count, on, none=None):
    """(steps, count): a multiplier's pass count, counted again on `on` when Of words follow it."""
    from copy import copy
    from tools.hlcode import kind_named
    from framework.multmatch import declared, emit_counted_on
    if on is None or _kept_walk(word) is None or names_of(place) is None:
        return [], count
    bc = place._hands["bc"]()
    if place.kind_of(on) != kind_named(bc, declared(word)[0]):
        return [], count
    kept, inner = place.scratch_like(count), copy(place)
    spelled, inner.refused = _here(place, "%s: counted again" % word), _here(
        place, "%s: as passed" % word)
    return [place.op("Mov", dst=kept, src=count)] + emit_spelled_or(place, word, spelled) + [
        (place.op("JAlways"), inner.refused), spelled + ":", place.op("Label"),
        place.op("Int", dst=kept, ptr=place.number(0))] + emit_counted_on(
        inner, word, on, kept, none) + [inner.refused + ":", place.op("Label")], kept


def raised_by(place, word, held, amount, plain):
    """`amount` times the count `held` names, recounted past Of words unless its quest is named."""
    from framework.multmatch import _raised
    count, on, none, named = held
    again, kept = recounted(place, word, count, on, none)
    # ⛔ a marked spelling already counted only the quest its column names: that count stands
    if again and named is not None:
        past = _here(place, "%s: its quest named, counted once" % word)
        again = again[:1] + [(place.op("JNotNull", reg=named), past)] + again[1:] + [
            past + ":", place.op("Label")]
    return again + _raised(place, amount, kept, plain, word)


def reads_too(reads, extra):
    """`extra`, and the row's names and `val` when a multiplier counts quests and reads neither."""
    from framework.multmatch import words_of
    wanted = (PART_FOR_NARROWING, VALUE) if any(_kept_walk(w) for w in words_of()) else ()
    return tuple(extra) + tuple(p for p in wanted if p not in tuple(reads) + tuple(extra))


def emit_spelled_or(place, head, spelled):
    """To `spelled` when `head` has an Of word on this row; else on."""
    answer, spare = place.scratch_of("I32"), place.scratch_of("I32")
    return emit_answer(place, head, None, answer) + [
        place.op("Int", dst=spare, ptr=place.number(UNSPELLED)),
        (place.op("JNotEq", a=answer, b=spare), spelled)]


def fired_by(word):
    """A quest trigger's raiser hook: past it, its Of words keep the quest it fired on."""
    def emit_fired(bc, fn, at, into, refused):
        from framework.pipeline import Place, hands_for
        place = Place(name="%s, its Of words" % word.WORD, row=dict(into, **{VALUE: at.value}),
                      notes={}, note=None, kept=None, store=None, refused=refused,
                      hands=hands_for(bc, fn))
        return [place.op("Field", dst=at.value, obj=at.application, field=at.value_at)
                ] + emit_kept(place, word.WORD, at.acting, refused)
    return emit_fired
