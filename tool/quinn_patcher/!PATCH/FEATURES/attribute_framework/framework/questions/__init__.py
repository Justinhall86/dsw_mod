"""One file per game question; an Ask word is its own file in `narrowing` naming the question."""
import importlib
import types

from tools.project import guard, remembered

# the folder every Ask word's own file sits in
FOLDER = "narrowing"
# what only the word's file says; everything else the word declares is its question's
OWN = ("WORD", "PHRASE", "HOLDER", "SMALLER", "TARGET", "NUMBER", "QUESTION", "BARE",
       "HOLDER_BARE", "NOT_BEFORE_PHRASE", "NOT_BEFORE_HOLDER", "SIDE")
# what a multiplier's file names when its count is a sum: the question module that sums it
SUMMED_BY = "SUMMED_BY"
# what a question file names when it reads a text of ours: minted once, ahead of every rule
MINTS = "MINTS"


class Ask:
    """One Ask word: the question it asks, its bit, and what the editor says."""

    def __init__(self, word, asks, number, wording, holding, smaller, target, bare, source):
        self.bare, self.holding_bare = bare
        self.word, self.source = word, source
        self.asks = asks
        self.number = number
        self.wording = wording
        self.holding = holding
        self.smaller = smaller
        self.target = target


def questions():
    """Every question file here, by the plain name it declares; read once a run."""
    if not _ASKED:
        _ASKED.append(_questions())
    return dict(_ASKED[0])


# the question files do not change during a run, so they are read out of the folder once
_ASKED = []


def _questions():
    from framework.names import members
    out = {}
    for name in members(__name__):
        module = importlib.import_module("%s.%s" % (__name__, name))
        said = getattr(module, "QUESTION", None)
        guard(said and said not in out, "questions/%s.py declares the question %r" % (name, said))
        out[said] = module
    return out


_ROWS = []


def rows():
    """Every Ask word's file, in bit order, read once per build."""
    if not _ROWS:
        _ROWS.append(_read(questions()))
    return _ROWS[0]


def bits():
    """One past the highest bit a row takes, read without opening a question: they loop back."""
    return max([a.number for a in _read(None)] or [0]) + 1


def _read(known):
    """Every Ask word's own file; each one's question checked against `known` unless None."""
    from framework.names import dummy_asks, members
    from framework.trailing import forms
    out = []
    for name in members("framework.%s" % FOLDER):
        where = "%s/%s.py" % (FOLDER, name)
        for file in forms(importlib.import_module("framework.%s.%s" % (FOLDER, name)), where,
                          OWN + ("ASKS",)):
            out.append(_ask(file, where, known, out))
    return dummy_asks(tuple(sorted(out, key=lambda a: a.number)))


def _ask(file, where, known, out):
    """One Ask word off one form of its file, its question and its bit checked."""
    said = lambda n: getattr(file, n, None)
    for one in ("WORD", "ASKS", "NUMBER", "PHRASE", "HOLDER", "TARGET"):
        guard(said(one) is not None, "%s declares no `%s`" % (where, one))
    guard(known is None or said("ASKS") in known, "%s asks `%s`, and the questions are %s"
          % (where, said("ASKS"), ", ".join(sorted(known or ()))))
    number = said("NUMBER")
    guard(isinstance(number, int) and number not in [a.number for a in out],
          "%s takes bit %r, and so does `%s`"
          % (where, number, next((a.word for a in out if a.number == number), "?")))
    ask = Ask(said("WORD"), said("ASKS"), number, said("PHRASE"), said("HOLDER"),
              said("SMALLER"), said("TARGET"), (said("BARE"), said("HOLDER_BARE")), where)
    # `By`: which side of a trigger with two it asks about, the killer or the one killed
    ask.side = said("SIDE")
    return ask


def module_for(word):
    """What an Ask word's file would declare: its question's, and its own row's on top."""
    one = next((a for a in rows() if a.word == word), None)
    guard(one is not None, "`%s` has no file in `%s`" % (word, FOLDER))
    question = questions()[one.asks]
    module = types.ModuleType("framework.narrowing.%s" % word)
    for name in dir(question):
        if name.isupper() and name not in OWN:
            setattr(module, name, getattr(question, name))
    module.WORD, module.PHRASE, module.HOLDER = one.word, one.wording, one.holding
    module.TARGET, module.NUMBER = one.target, one.number
    if one.smaller:
        module.SMALLER = one.smaller
    if getattr(one, "side", None):
        module.SIDE = one.side
    if one.bare:
        module.BARE, module.HOLDER_BARE = one.bare, one.holding_bare
    return module


def install(bc):
    """Every text a question file says it reads (`MINTS`), in the file before any rule asks it."""
    from tools.hlcode import text_object
    said = sorted({text for module in questions().values() for text in getattr(module, MINTS, ())})
    for text in said:
        text_object(bc, text)
    return "QUESTION TEXTS: %d minted -- %s" % (len(said), ", ".join(said) or "none")


def summing(word):
    """The question a multiplier's `SUMMED_BY` names to sum its count; None for a plain count."""
    from framework.names import module_of, vocabulary
    named = getattr(module_of(vocabulary()[word]), SUMMED_BY, None)
    return importlib.import_module(named) if named else None


def picked_counts_itself(word):
    """Does a faction an owner word picks count itself (`PerEnemyFaction`), its sum unwalked?"""
    return bool(getattr(summing(word), "PICKED_COUNTS_ITSELF", False))


def emit_summed(place, word, at, total, named=None):
    """`word`'s sum on what its way reached, quest by quest when Of words follow it on the row."""
    from framework.questpick import emit_summed as kept, emit_named_stands
    if picked_counts_itself(word):
        return [place.op("Incr", dst=total)]
    plain = lambda: _summed(place, word, at, total, named)  # noqa: E731
    return emit_named_stands(place, word, named, plain, kept(place, word, at, total, plain))


def _summed(place, word, at, total, named=None):
    """`word`'s sum on what its way reached, added to `total`, by one function every road calls."""
    from framework.pipeline import Place
    from tools.hlcode import assemble
    handed = [at] + ([] if named is None else [named])
    kinds, sum_kind = [place.kind_of(one) for one in handed], place.kind_of(total)

    def body(hands):
        made = Place("%s summed" % word, {}, {}, None, None, None, "summed: none", hands)
        held = made.scratch_of(summing(word).COUNTED_AS)
        guard(made.kind_of(held) == sum_kind, "`%s` sums into t@%s and is added to a t@%s"
              % (word, made.kind_of(held), sum_kind))
        return assemble([made.op("Int", dst=held, ptr=made.number(0))] + summing(
            word).emit_total(made, 0, held, *([] if named is None else [1])) + [
            "summed: none:", made.op("Label"), made.op("Ret", ret=held)])
    shared = place._hands["shared"](("summed", word) + tuple(kinds), kinds, sum_kind, body)
    got = place.scratch_like(total)
    return [(place.op("JNull", reg=at), place.refused),
            place.op("CallN", dst=got, fun=shared, args=handed),
            place.op("Add", dst=total, a=total, b=got)]


def emit_summed_raw(bc, fn, word, at, count, nothing, site=None):
    """The same inside a road's shared count, of the kind the site names if any, to `nothing`."""
    from framework.pipeline import Place, hands_for
    place = Place("%s summed" % word, {}, {}, None, None, None, nothing, hands_for(bc, fn))
    named, partner = getattr(site, "named", None), getattr(site, "partner", None)
    return [(place.op("JNull", reg=at), nothing)] + summing(word).emit_total(
        place, at, count, *([] if named is None is partner else [named, partner])) + [
        nothing + ":", place.op("Label")]


# what a modifier names: the counts on its left it narrows; a narrowing works its own out
NARROWS_TOO_BY = "NARROWS_TOO"
# why a narrowing narrows no count, when the class it is asked of pairs it with none
NARROWS_OWED_BY = "NARROWS_OWED"
# a word whose owner word names the other side (`OfEnemy`, `WithAlly`): no member is asked it
OWNER_AFTER_BY = "OWNER_AFTER"
# the class a faction asked by its walk is, and the one weighed words are handed as `picked`
FACTION = "ent.Faction"


def member_class(word):
    """The game's class a counting word's walk holds each member as, by its own file."""
    from framework.membercount import MEMBER_BY, entity_of, module
    member = getattr(module(word), MEMBER_BY, None)
    if member is None:
        return entity_of(word)
    guard(member[1] == 0, "`%s` holds its member as argument %d of %s, and only the first "
          "argument of a method is its own class" % (word, member[1], member[0]))
    return member[0].rsplit(".", 1)[0]


def asked_of(of):
    """The class a narrowing's question is asked of: declared, or the class its way in is on."""
    if not getattr(of, "ASKS", None) or getattr(of, OWNER_AFTER_BY, False):
        return None
    through = getattr(of, "THROUGH", None)
    return getattr(of, "ASKED_OF", None) or (through.rsplit(".", 1)[0] if through else None)


def on_one_line(one, other):
    """Is either class the other, or above it? A member may then be asked, narrowed if it must."""
    from framework.trailing import ABOVE
    return one == other or other in ABOVE.get(one, ()) or one in ABOVE.get(other, ())


def narrows_too(of):
    """The counts a word narrows: a modifier's own list, else each its question can be asked of."""
    from framework.membercount import counters, module
    from framework.memberchain import owned
    said = getattr(of, NARROWS_TOO_BY, None)
    if said:
        return (said,) if isinstance(said, str) else tuple(said)
    asked = asked_of(of)
    if asked is None or getattr(of, NARROWS_OWED_BY, None):
        return ()
    # a faction's question also narrows each count whose member has an owning faction to ask
    return tuple(sorted({module(c).OFFERS[0] for c in counters()
                         if on_one_line(member_class(c), asked) or owned(c, of)}))


def _every_word():
    """The vocabulary's spellings, which settle what `narrowers` remembers."""
    from framework.names import vocabulary
    return tuple(vocabulary())


@remembered(_every_word)
def narrowers(words=None):
    """Every narrowing word and modifier narrowing a count on its left, in a settled order."""
    from framework.names import module_of, vocabulary
    words = vocabulary() if words is None else words
    guard(not unlined(), "%s is on no line: add it to ABOVE" % (unlined(),))
    return tuple(sorted(s for s, w in words.items() if w.family in ("narrowing", "modifiers")
                        and narrows_too(module_of(w))))


def unlined():
    """Each class a count's member or a narrowing is asked of that the line does not hold."""
    from framework.membercount import counters
    from framework.names import module_of, vocabulary
    from framework.trailing import ABOVE
    asked = {member_class(c) for c in counters()} | {
        asked_of(module_of(w)) for w in vocabulary().values() if w.family == "narrowing"}
    return sorted(asked - {None} - set(ABOVE))


def weighs(of):
    """Is this narrowing weighed by its own file against `val`, handed the member it asks?"""
    return bool(getattr(of, "AT_LEAST", None))


def check_pairs(bc):
    """Each class on the line as the game declares it; each narrowing pairs, or says why not."""
    from tools.hlcode import classes_above
    from framework.names import module_of, vocabulary
    from framework.trailing import ABOVE
    for one, above in ABOVE.items():
        guard(classes_above(bc, one) == above, "`%s` derives from %s in the game file, and the "
              "line says %s" % (one, classes_above(bc, one), above))
    words = vocabulary()
    for one in unlined():
        guard(False, "`%s` is on no line: add it to ABOVE with %s" % (one, classes_above(bc, one)))
    for s, w in sorted(words.items()):
        if w.family == "narrowing" and not narrows_too(module_of(w)):
            guard(getattr(module_of(w), NARROWS_OWED_BY, None),
                  "`%s` narrows no count and says no %s" % (s, NARROWS_OWED_BY))
    return narrowers()


# what a faction's question reads of its road beyond `val` and the count's names
READS_TOO_BY = "READS_TOO"


def modifiers_read():
    """The row parts a count hands every chained narrowing's check, word or none."""
    from framework.memberchain import PARTS, owner_parts
    return PARTS + tuple(p for p in owner_parts() if p not in PARTS)


class _Handed(dict):
    """A shared question's parts; reading one its asker held but never handed stops the build."""

    def __init__(self, handed, held, word):
        dict.__init__(self, handed)
        self._held, self._word = held, word.WORD

    def _check(self, part):
        guard(dict.__contains__(self, part) or part not in self._held,
              "`%s` reads `%s` of its road; add it to its %s" % (self._word, part, READS_TOO_BY))

    def __getitem__(self, part):
        self._check(part)
        return dict.__getitem__(self, part)

    def get(self, part, default=None):
        self._check(part)
        return dict.get(self, part, default)

    def __contains__(self, part):
        self._check(part)
        return dict.__contains__(self, part)


def shares_its_ask(word):
    """Is this a weighed question asked of a faction in hand, so one copy serves every asker?"""
    return weighs(word) and asked_of(word) == FACTION


def emit_asked_of(place, word, faction, named, which):
    """`word` weighed on `faction`, by ONE function every road and count calls; a no refuses."""
    from framework.parsed import loaded
    from framework.pipeline import Place
    from tools.hlcode import assemble
    from framework import columns
    weigh = importlib.import_module(word.WEIGHED_BY).emit
    guard(None not in (faction, named, which), "`%s` is asked of a faction with a part missing"
          % word.WORD)
    # ⛔ ONLY WHAT IT READS, so every road and count hands the same and shares the one copy
    wanted = (word.AT_LEAST, columns.PART_FOR_COUNT) + tuple(getattr(word, READS_TOO_BY, ()))
    parts = [p for p in wanted if p in place.row]
    handed = [faction, named, which] + [place.row[p] for p in parts]
    kinds = [place.kind_of(one) for one in handed]
    if 0 in kinds or any(p not in place.row for p in getattr(word, READS_TOO_BY, ())):
        return weigh(place, None, named, word, which, picked=faction)
    answer = place.scratch_of("I32")
    title = "%s asked of a faction" % word.WORD

    def body(hands):
        made = Place(title, _Handed({p: 3 + k for k, p in enumerate(parts)}, place.row, word),
                     {}, None, None, None, "%s: no" % title, hands)
        said = made.scratch_of("I32")
        return assemble(loaded(made, weigh(made, None, 1, word, 2, picked=0) + [
            made.op("Int", dst=said, ptr=made.number(1)), made.op("Ret", ret=said),
            made.refused + ":", made.op("Label"),
            made.op("Int", dst=said, ptr=made.number(0)), made.op("Ret", ret=said)]))
    shared = place._hands["shared"]((title,) + tuple(kinds), kinds, place.kind_of(answer), body)
    none = place.scratch_like(answer)
    return [place.op("CallN", dst=answer, fun=shared, args=handed),
            place.op("Int", dst=none, ptr=place.number(0)),
            (place.op("JEq", a=answer, b=none), place.refused)]


# a thing any count holds, handed as the class above them all so every count shares one copy
THING = "ent.Object"


def _asked_of_a_thing(place, word, s, named, which):
    """`word`, its owner word after it, asked of the member by ONE function; a name stepped past."""
    from framework.narrowmatch import bits
    from framework.ownerpicks import READS, TOOK_THE_NAME, emit_took, weighed
    from framework.parsed import loaded
    from framework.pipeline import Place
    from framework.scopematch import PAYEE
    from tools.hlcode import assemble
    bit, title = bits()[word.WORD], "%s asked of a thing" % word.WORD
    answer, two, none = (place.scratch_of("I32") for _ in range(3))
    kept = place.here("%s, its name not read" % title)
    # ⛔ ONE STEP PAST THE NAME, only when it was `BordersTFaction2`'s: no owner word was kept
    stepped = [place.op("Int", dst=two, ptr=place.number(TOOK_THE_NAME)),
               place.op("And", dst=two, a=answer, b=two),
               place.op("Int", dst=none, ptr=place.number(0)),
               (place.op("JEq", a=two, b=none), kept), place.op("Incr", dst=s.j),
               kept + ":", place.op("Label")]
    if any(p not in place.row for p in (word.AT_LEAST,) + READS):
        return [place.op("Int", dst=answer, ptr=place.number(0))] + emit_took(
            place, bit, answer, title) + stepped + _unturned(place, word, bit, lambda at, no: (
                weighed(at, s.unit, named, word, which, bit, negated=no)))
    parts = [p for p in (word.AT_LEAST, PAYEE) + READS if p in place.row]
    held = place.scratch_of(THING)
    handed = [held, named, which] + [place.row[p] for p in parts]
    kinds = [place.kind_of(one) for one in handed]

    def body(hands):
        made = Place(title, _Handed({p: 3 + k for k, p in enumerate(parts)}, place.row, word),
                     {}, None, None, None, "%s: no" % title, hands)
        said = made.scratch_of("I32")
        yes, no = ([made.op("Int", dst=said, ptr=made.number(n))] + emit_took(
            made, bit, said, "%s, %s" % (title, w)) + [made.op("Ret", ret=said)]
            for n, w in ((1, "yes"), (0, "no")))
        asked = _unturned(made, word, bit, lambda at, no: weighed(at, 0, 1, word, 2, bit, no))
        return assemble(loaded(made, asked + yes + [made.refused + ":", made.op("Label")] + no))
    shared = place._hands["shared"]((title,) + tuple(kinds), kinds, place.kind_of(answer), body)
    return [place.op("UnsafeCast", dst=held, src=s.unit),
            place.op("CallN", dst=answer, fun=shared, args=handed)] + stepped + [
        place.op("Int", dst=two, ptr=place.number(1)),
        place.op("And", dst=answer, a=answer, b=two),
        (place.op("JEq", a=answer, b=none), place.refused)]


def _unturned(place, word, bit, ask):
    """`ask(place, negated)`; `BordersNotEnemy`'s turned mark turned back, as it picks the rest."""
    from copy import copy
    from framework.narrowmatch import emit_its_negation
    from framework.turned import NOT_BEFORE_BY, _sent, where_they_sit
    if not getattr(word, NOT_BEFORE_BY, False):
        return ask(place, None)
    turning, negated = emit_its_negation(place, bit)
    # ⛔ ONLY BEFORE THE OWNER: the member's turned mark flips any `Not`, and this one picks
    only = where_they_sit(at="BEFORE_THE_OWNER")
    asking, passed = copy(place), place.here("%s, turned back" % word.WORD)
    asking.refused = place.here("%s, said no" % word.WORD)
    return turning + ask(asking, negated) + _sent(place, negated, only, place.refused) + [
        (place.op("JAlways"), passed), asking.refused + ":", place.op("Label")] + _sent(
        place, negated, only, passed) + [
        (place.op("JAlways"), place.refused), passed + ":", place.op("Label")]


def one_narrowing(place, s, its, ways, target="required"):
    """One narrowing asked of a count's member the way its file says: `ways` is (no, none, tag)."""
    from framework import scopematch
    from framework.memberwalk import _the_next
    failed, empty, tag = ways
    if weighs(its):
        return _weighed(place, s, its, ways, target)
    if getattr(its, "AGAINST", None):
        return scopematch.emit_it_is_at_its_own_maximum(
            failed, s.unit, its.ASKS, its.AGAINST, its.ASKED_OF, tag,
            requires=getattr(its, "REQUIRES", None))
    if getattr(its, "EMITS", None):
        return importlib.import_module(its.EMITS).emit(failed, s.unit, tag)
    if getattr(its, "SHEET", None):
        return _the_next(place, s, s.j, s.judged, empty) + _its_row_names(failed, s, its)
    return _the_next(place, s, s.j, s.judged, empty) + (
        scopematch.emit_the_named_trait_is_carried(
            failed, s.unit, s.name, s.one, its.ASKS, its.THROUGH, tag))


def _weighed(place, s, its, ways, target):
    """A weighed narrowing on the member: a faction is the one it asks; any other thing, held."""
    from framework.compmatch import NONE_GIVEN
    from framework.membercount import entity_of
    from framework.memberwalk import _the_next
    from framework.ownerpicks import emit_count_peek
    failed, empty, tag = ways
    which = place.scratch_of("I32")
    named = s.name
    out = [place.op("Int", dst=which, ptr=place.number(NONE_GIVEN))]
    # an owner word after it (`BordersEnemy`) names the other side; `BordersTFaction2` a name
    if getattr(its, OWNER_AFTER_BY, False):
        reading, named = emit_count_peek(place, s, tag)
        return out + reading + _asked_of_a_thing(failed, its, s, named, which)
    if target == "never":
        named = place.scratch_like(s.name)
        out.append(place.op("Null", dst=named))
    else:
        out += _the_next(place, s, s.j, s.judged, empty)
    weigh = importlib.import_module(its.WEIGHED_BY).emit
    if asked_of(its) != FACTION:
        return out + weigh(failed, s.unit, named, its, which)
    guard(entity_of(s.word) == FACTION, "`%s` asks a faction, and `%s` holds a %s"
          % (its.WORD, s.word, entity_of(s.word)))
    return out + emit_asked_of(failed, its, s.unit, named, which)


def _its_row_names(place, s, its):
    """Past this, the member's own sheet row names in its word's column what `s.name` holds."""
    from framework.boundary import BY_VALUE as LOOK_UP
    from framework.memberwalk import _marked_scope, _same_text
    from framework.resheld import DATA, SHEET_KIND
    data = place.scratch_of(DATA)
    sheet_at, sheet = place.field_of(DATA, its.SHEET)
    by_id_at, by_id = place.field_of(SHEET_KIND, its.BY_ID)
    kind_at, kind = place.field_of(s.unit, _marked_scope(s).MARKED_ID)
    found, row = place.scratch_return(LOOK_UP), place.scratch_arg(*its.ROW_OF)
    named_at, named = place.field_of(row, its.IN_COLUMN)
    return [place.op("GetGlobal", **{"dst": data, "global": place.the_one_global(DATA)}),
            place.op("Field", dst=sheet, obj=data, field=sheet_at),
            (place.op("JNull", reg=sheet), place.refused),
            place.op("Field", dst=by_id, obj=sheet, field=by_id_at),
            (place.op("JNull", reg=by_id), place.refused),
            place.op("Field", dst=kind, obj=s.unit, field=kind_at),
            (place.op("JNull", reg=kind), place.refused),
            place.op("Call2", dst=found, fun=place.named_function(LOOK_UP), arg0=by_id,
                     arg1=kind),
            (place.op("JNull", reg=found), place.refused),
            place.op("ToVirtual", dst=row, src=found),
            place.op("Field", dst=named, obj=row, field=named_at),
            (place.op("JNull", reg=named), place.refused)] + _same_text(
        place, named, s.name, place.refused)
