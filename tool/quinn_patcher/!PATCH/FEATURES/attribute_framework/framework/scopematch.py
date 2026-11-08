#!/usr/bin/env python3
"""Which scope an authored id named, and the gate that turns everything else away."""
from tools.project import guard
from tools.hlcode import number, template, written
from framework import columns, scopechain, scopeturn
from framework import names as vocab
from framework.names import module_of, vocabulary
from framework.pieceword import spellings
from framework.rowreader import reader_for

# the folder whose files declare a scope (what such a file says is `framework/names.py`'s)
FAMILY = "scopes"
# the one thing this works out; the store takes its list from here
NAMED = "scope"
# and which column a marked one named: `TUnit` column one, `TUnit3` column three
AT_COLUMN = "scope column"
FOUND = ((NAMED, vocab.NUMBER_KEPT_IN), (AT_COLUMN, vocab.NUMBER_KEPT_IN)) + scopeturn.FOUND
# what that place holds when the scope carried no mark at all
NO_COLUMN = 0
# the game's own two ways of matching a unit against an authored id: its own, and its base kind
ITS_OWN_ID = "kind"
BASE_KIND_MATCHES = "ent.Unit.matchesKind"
# and our third, the cdb's `inherits` column: naming a unit's parent matches its children
ITS_TYPE = "inf"
ITS_FAMILY = "inherits"
# what the place holds when no scope we know was named: the emptiness the latch above writes
NOTHING_NAMED = 0
# and what a row holds once found not ours, so the road skips it on every tick
NOT_OURS = 1 << 30
# what a NARROWER scope's file says: whose road it rides, and the game question that narrows it
NARROWS_BY = "NARROWS"
# AND A WORD RIDING ANOTHER ROAD THAT NARROWS NOTHING SAYS IT MEANS THE SAME (a synonym)
SAME_AS_BY = "SAME_AS"
# and the word that rides every road naming no kind (`Entity`)
EVERY_ROAD_BY = "EVERY_ROAD"
# a place word's hops to where a thing is and who holds it (`GRANTED_TO_BY` is its other half)
STANDS_IN_BY, HELD_BY_BY = "STANDS_IN", "HELD_BY"
# and the hops from a road's own holder to its village, declared per road's word
IN_VILLAGE_BY = "IN_VILLAGE"
# and who a row of that word is granted to when not the thing judged (default: the thing)
GRANTED_TO_BY = "GRANTED_TO"
# what the road carries the answer under, asked once per pass, as a note
HELD_REGION = "region_held_by"
ASKS_BY = "ASKS"
# and what it is asked OF, when not the thing in hand: a FIELD of the holder, by name
ASKS_OF_BY = "ASKS_OF"
# and what a road's mark asks when an id is not the question (an agent's TYPE: a trait test)
MARKED_ASKS_BY = "MARKED_ASKS"
# the id field a mark reads, and `MARKED_ON` for the kind; blank and `ELocal` stay authored
BLANK_REACH = 0
LOCAL_CASE = "ELocal"
MARKED_ID_BY = "MARKED_ID"
MARKED_ON_BY = "MARKED_ON"
# and what that question is asked THROUGH: a thing handed over first, by a named accessor
MARKED_THROUGH_BY = "MARKED_THROUGH"
# and which holder a word is for, as the game's own reach case (the reach column's only link)
REHOSTS_FROM_BY = "REHOSTS_FROM"
# and what that holder IS: the case says WHEN a row moves, this says WHERE TO
REHOSTS_ONTO_BY = "REHOSTS_ONTO"
# the kind every question here is about, for a road declaring none
ASKED_ON = "ent.Unit"
# and where the real answer comes from: the kind the road's own file names for its site
ENTITY_BY = "ENTITY"
# and what a road's OWN scope passes over entirely, asked once per row before the chain
ONLY_BY = "ONLY"
# the parts of a row a stage asks for by name
HOLDER = "holder"
PAYEE = "owner"
# what this gate is called, named here so the pipeline and the case mean the same stage
GATE = "does this scope match"
# the two words this build asks with, at the two halves of the re-hosted branch
SAW_A_REACH = "a reach moved this row"
WORD_FITS = "and its word is the word for that holder"
# the scope gate's refusal, naming its own road
NOT_OUR_WORD = "SPINE the `%s` road refused a row whose scope word is another road's"
# and its other half: the gate TOOK a row
OUR_WORD = "SPINE the `%s` road took a row whose scope word is its own"


def registers(bc, fn, reader=None):
    """The one place this needs, on `fn`, typed from a borrowed signature."""
    reader = reader or reader_for(bc)
    return {name: reader.borrow_register(bc, fn, kind) for name, kind in FOUND}


def only_scopes(words):
    """The vocabulary narrowed to the scope words. THE ONE PLACE that narrowing is written."""
    return {spelling: word for spelling, word in words.items() if word.family == FAMILY}


def checked(claims):
    """Every claim against the rules a scope's number has, read in a settled order."""
    out = {}
    for spelling in sorted(claims):
        claimed = claims[spelling]
        # a whole number that is not the emptiness, and not the `True` that reads as a 1
        guard(isinstance(claimed, int) and not isinstance(claimed, bool)
              and claimed not in (NOTHING_NAMED, NOT_OURS),
              "`%s` says its %s is %r, and a scope's number is a whole one that is neither %d "
              "nor %d" % (spelling, vocab.DECLARES, claimed, NOTHING_NAMED, NOT_OURS))
        taken = [already for already, n in out.items() if n == claimed]
        guard(not taken,
              "`%s` and `%s` both claim the number %d, and a scope's number is its own"
              % (taken[0] if taken else "?", spelling, claimed))
        out[spelling] = claimed
    guard(out, "no scope declares a number, so no road could match one")
    return out


def numbers(words=None):
    """Every scope word and the number its own file writes out for it."""
    words = vocabulary() if words is None else words
    return checked({spelling: getattr(module_of(word), vocab.DECLARES, None)
                    for spelling, word in only_scopes(words).items()})


def number_of(scope, words=None):
    """The number one scope's file writes out for it, asked for BY THE WORD a modder types."""
    every = numbers(words)
    guard(scope in every,
          "`%s` is not a scope this build knows: %s" % (scope, ", ".join(sorted(every))))
    return every[scope]


def emit_forget(bc, r):
    """Empty both places, before an id is read. The other end of the latch the branches are."""
    return [written(template(bc, "Int"), dst=r[NAMED], ptr=number(bc, NOTHING_NAMED)),
            written(template(bc, "Int"), dst=r[AT_COLUMN], ptr=number(bc, NO_COLUMN))]


def branches(bc, r, words=None, column=None, negated=None):
    """One branch per way a scope may be written: its own number, and `Not` when glued in."""
    words = vocabulary() if words is None else words
    every = numbers(words)
    return scopeturn.branches(bc, r, [(one, [written(template(bc, "Int"), dst=r[NAMED],
                           ptr=number(bc, every[one.word.spelling]))]
                  + ([written(template(bc, "Mov"), dst=r[AT_COLUMN], src=column)]
                     if one.targeted and column is not None else []))
            # filtered from the whole vocabulary: a piece may carry an owner word in front
            for one in spellings(words) if one.word.family == FAMILY], negated)


def _says(spelling, what, words=None):
    """What one scope's own file says about itself, or nothing when it says nothing."""
    from framework.names import module_of
    words = vocabulary() if words is None else words
    return getattr(module_of(words[spelling]), what, None)


def rehosts_onto(words=None):
    """{the reach case: the name of the holder that case re-hosts onto} -- each word's own file."""
    words = vocabulary() if words is None else words
    out = {}
    for spelling, word in only_scopes(words).items():
        case = _says(spelling, REHOSTS_FROM_BY, words)
        onto = _says(spelling, REHOSTS_ONTO_BY, words)
        if case is None or onto is None:
            continue
        guard(case not in out or out[case] == onto,
              "two scope words disagree about what `%s` re-hosts onto" % case)
        out[case] = onto
    return out


def granted_to(words=None):
    """{that word's own number: the name of the thing a row of it is granted to}."""
    words = vocabulary() if words is None else words
    out = {}
    for spelling in only_scopes(words):
        onto = _says(spelling, GRANTED_TO_BY, words)
        if onto is None:
            continue
        num = number_of(spelling, words)
        guard(num not in out or out[num] == onto,
              "`%s` says it is granted to two different things" % spelling)
        out[num] = onto
    return out


def narrowers_of(scope, words=None):
    """Every scope word that rides this one's road, by the spelling a modder types."""
    words = vocabulary() if words is None else words
    out = sorted(spelling for spelling in only_scopes(words)
                 if _says(spelling, NARROWS_BY, words) == scope)
    for spelling in out:
        guard(_says(spelling, ASKS_BY, words) or _says(spelling, SAME_AS_BY, words),
              "`%s` rides `%s` and names neither a question nor `%s`, so nothing says whether it "
              "is a narrower or a synonym" % (spelling, scope, SAME_AS_BY))
    return out


def on_every_road(words=None):
    """Every word that rides every road: it names no kind, so it names no site and asks nothing."""
    words = vocabulary() if words is None else words
    out = sorted(spelling for spelling in only_scopes(words)
                 if _says(spelling, EVERY_ROAD_BY, words))
    for spelling in out:
        for what in (NARROWS_BY, ASKS_BY, ASKS_OF_BY, "SITE", "ROAD"):
            guard(not _says(spelling, what, words),
                  "`%s` rides every road and also names `%s`, and it may not do both"
                  % (spelling, what))
    return out


def answers_for(scope, words=None):
    """Every scope one road answers for: its own word, its narrowers, and every-road words."""
    return [scope] + sorted(narrowers_of(scope, words) + on_every_road(words))


def _the_place_it_stands_in(place, whose):
    """Is the place this thing stands in held by the faction whose rule this row is?"""
    if place.row.get(HELD_REGION) is None:
        return [(place.op("JAlways"), place.refused)]
    return [(place.op("JNull", reg=place.row[HELD_REGION]), place.refused),
            (place.op("JNotEq", a=place.row[HELD_REGION], b=place.row[whose]), place.refused)]


def _ask_the_game(place, named, holder, of_field=None, about=ASKED_ON):
    """One question the game already answers, and where its answer is."""
    answer = place.scratch_return(named)
    # the holder is narrowed to the kind this road is about before anything asks it anything
    holder, narrowing = place.narrowed(holder, place.scratch_of(about))
    asked, reaching = holder, list(narrowing)
    if of_field is not None:
        at, asked = place.field_of(about, of_field)
        reaching = reaching + [place.op("Field", dst=asked, obj=holder, field=at),
                               (place.op("JNull", reg=asked), place.refused)]
    return answer, reaching + [
        place.op("Call1", dst=answer, fun=place.named_function(named), arg0=asked)]


def emit_the_named_unit_matches(place, holder, named, at_column):
    """Past this, the thing in hand is the unit that column named -- or the row is turned away."""
    matched = place.here("the named unit matches")
    unmarked = place.here("this scope names no unit")
    none = place.scratch_like(at_column)
    # the same narrowing the questions above take, from the kind every holder shares
    holder, narrowing = place.narrowed(holder, place.scratch_of(ASKED_ON))
    at, its_own = place.field_of(ASKED_ON, ITS_OWN_ID)
    answer = place.scratch_return(BASE_KIND_MATCHES)
    # the unit's type, and the parent id written on it -- both by name
    type_at, its_type = place.field_of(ASKED_ON, ITS_TYPE)
    family_at, its_family = place.field_of(its_type, ITS_FAMILY)
    return [
        # a scope that carried no mark is about every thing of its kind
        place.op("Int", dst=none, ptr=place.number(NO_COLUMN)),
        (place.op("JEq", a=at_column, b=none), unmarked),
        # nothing to match against is not a match
        (place.op("JNull", reg=named), place.refused),
    ] + list(narrowing) + [
        place.op("Field", dst=its_own, obj=holder, field=at),
        (place.op("JEq", a=its_own, b=named), matched),
        # the game's own family, which is `props.baseUnit` and not the cdb's `inherits`
        place.op("Call2", dst=answer, fun=place.named_function(BASE_KIND_MATCHES),
                 arg0=holder, arg1=named),
        (place.op("JTrue", cond=answer), matched),
        # then the cdb's own: the unit type's parent, one hop only
        place.op("Field", dst=its_type, obj=holder, field=type_at),
        (place.op("JNull", reg=its_type), place.refused),
        place.op("Field", dst=its_family, obj=its_type, field=family_at),
        (place.op("JNull", reg=its_family), place.refused),
        (place.op("JNotEq", a=its_family, b=named), place.refused),
        matched + ":", place.op("Label"),
        unmarked + ":", place.op("Label"),
    ]


def emit_the_named_thing_matches(place, holder, named, at_column, about, id_field):
    """Past this, the thing in hand IS the one that column named -- or the row is turned away."""
    unmarked = place.here("this scope names nothing of its own")
    none = place.scratch_like(at_column)
    holder, narrowing = place.narrowed(holder, place.scratch_of(about))
    at, its_own = place.field_of(about, id_field)
    return [
        # a scope that carried no mark is about every thing of its kind
        place.op("Int", dst=none, ptr=place.number(NO_COLUMN)),
        (place.op("JEq", a=at_column, b=none), unmarked),
        # nothing to match against is not a match
        (place.op("JNull", reg=named), place.refused),
    ] + list(narrowing) + [
        place.op("Field", dst=its_own, obj=holder, field=at),
        (place.op("JNotEq", a=its_own, b=named), place.refused),
        unmarked + ":", place.op("Label"),
    ]


def emit_the_named_trait_is_carried(place, holder, named, at_column, asks, through,
                                    tag="scope", needs_a_column=False):
    """Past this, the thing in hand CARRIES the trait that column named -- or the row is refused."""
    # `tag` names the caller: one stage asks this twice, and places must differ
    unmarked = place.here("this %s names no trait" % tag)
    none = place.scratch_like(at_column)
    manager = place.scratch_return(through)
    answer = place.scratch_return(asks)
    # the four filters past the trait, all empty: does the thing carry it at all?
    anyhow = [place.scratch_arg(asks, which) for which in (1, 2, 3, 4)]
    return [
        # no mark: every thing of its kind -- but a required-target word written bare is nobody
        place.op("Int", dst=none, ptr=place.number(NO_COLUMN)),
        (place.op("JEq", a=at_column, b=none), place.refused if needs_a_column else unmarked),
        # nothing to match against is not a match
        (place.op("JNull", reg=named), place.refused),
        place.op("Call1", dst=manager, fun=place.named_function(through), arg0=holder),
        # a thing that would not hand its traits over carries none of them
        (place.op("JNull", reg=manager), place.refused),
    ] + [place.op("Null", dst=empty) for empty in anyhow] + [
        place.op("CallN", dst=answer, fun=place.named_function(asks),
                 args=[manager, named] + anyhow),
        (place.op("JFalse", cond=answer), place.refused),
        unmarked + ":", place.op("Label"),
    ]


def first_scope(words=None):
    """Any one scope this build knows, for a caller that needs a road and does not care which."""
    every = numbers(words)
    return sorted(every)[0]


def rehosted_to(words=None):
    """{the reach case: the number of the scope word that holder is}."""
    words = vocabulary() if words is None else words
    out = {}
    for spelling, word in only_scopes(words).items():
        case = _says(spelling, REHOSTS_FROM_BY, words)
        if case is None:
            continue
        guard(case not in out or out[case] == number_of(spelling, words),
              "two scope words both say they are the holder for `%s`" % case)
        out[case] = number_of(spelling, words)
    return out


TICKED = "ticked"


def _the_reach_moved_it(place, reach_part, part, mine=None):
    """Past this, a row a reach re-hosted has been judged and the road's own gate is skipped."""
    # the kept reach is the case counted from one, so a column left alone is nobody's case
    moved = {case: place.number(place.enum_case(columns.REACH_ENUM, case) + 1)
             for case in sorted(rehosted_to())}
    if not moved:
        return None, []
    numbers = rehosted_to()
    mine = {} if mine is None else mine
    judged = place.here("this row has been judged where a reach put it")
    wanted = place.scratch_like(place.row[reach_part])
    out = []
    for case, at in moved.items():
        not_this = place.here("no reach named %s" % case)
        out += [place.op("Int", dst=wanted, ptr=at),
                (place.op("JNotEq", a=place.row[reach_part], b=wanted), not_this)]
        # two words: the road saw a reach, and the row's word fits where the reach put it
        out += []
        # ⛔ NOT REFUSED here: left for the road's own gate
        out += [place.op("Int", dst=wanted, ptr=place.number(numbers[case])),
                (place.op("JNotEq", a=place.row[part], b=wanted), not_this)]
        out += []
        # a SET reach still asks what this road answers for: the road's own word-compare stays
        from framework import reach as _reach
        if case in _reach.naming_a_set_by_value() and numbers[case] not in mine.values():
            out += [(place.op("JAlways"), place.refused),
                    not_this + ":", place.op("Label")]
            continue
        out += [(place.op("JAlways"), judged),
                not_this + ":", place.op("Label")]
    # a reach nobody has built refuses the row; blank and `ELocal` both stay where they are
    allowed = [place.number(BLANK_REACH)]
    allowed += [place.number(place.enum_case(columns.REACH_ENUM, LOCAL_CASE) + 1)]
    allowed += sorted(at for at in moved.values())
    unbuilt = place.here("this reach is one no word has built")
    for at in allowed:
        out += [place.op("Int", dst=wanted, ptr=at),
                (place.op("JEq", a=place.row[reach_part], b=wanted), unbuilt)]
    out += [(place.op("JAlways"), place.refused),
            unbuilt + ":", place.op("Label")]
    return judged, out


def the_region_question(words=None):
    """The hops to the region a thing stands in, and who holds it -- or (None, None)."""
    words = vocabulary() if words is None else words
    said = [(spelling, _says(spelling, STANDS_IN_BY, words), _says(spelling, HELD_BY_BY, words))
            for spelling in only_scopes(words)]
    asking = [(hops, held) for _s, hops, held in said if hops and held]
    if not asking:
        return None, None
    guard(len(set(asking)) == 1,
          "two words ask about the region a thing stands in and they do not agree: %s" % (asking,))
    return asking[0]


def emit_it_is_at_its_own_maximum(place, holder, asks, against, asked_of, tag,
                                  requires=None):
    """Two questions the game answers about one thing, compared: is it at its own maximum?"""
    thing, narrowing = place.narrowed(holder, place.scratch_of(asked_of))
    now = place.scratch_return(asks)
    most = place.scratch_return(against)
    # the game's own first question, if named: a level-less thing reads 0 either way
    wants = []
    if requires:
        asked = place.scratch_return(requires)
        wants = [place.op("Call1", dst=asked, fun=place.named_function(requires), arg0=thing),
                 (place.op("JFalse", cond=asked), place.refused)]
    return narrowing + wants + [
        place.op("Call1", dst=now, fun=place.named_function(asks), arg0=thing),
        place.op("Call1", dst=most, fun=place.named_function(against), arg0=thing),
        # below its maximum is the one answer that removes it; at or above keeps it
        (place.op("JSLt", a=now, b=most), place.refused),
    ]


def _the_narrowings_asked(place, holder):
    """Every narrowing word the row spelled, its question asked of the thing, by one call."""
    from framework import mark, narrowmatch
    spelled = place.scratch_of("I32")
    out, (place, leaving) = [place.op("Int", dst=spelled, ptr=place.number(0))], mark.losing(place)
    return mark.emit_lost(leaving, place, out + narrowmatch.emit_checked(place, holder, spelled))


def the_village_hops(scope, words=None):
    """The hops from THIS road's holder to the village it belongs to -- or None."""
    words = vocabulary() if words is None else words
    said = _says(scope, IN_VILLAGE_BY, words)
    return tuple(said) if said else None


def gate_for(scope, part, holder_part=HOLDER, marked_at=None, marked_names=None,
             reach_part=None, foreign_part=None, whose_part=None, turned_at=None):
    """The road's scope gate: which of this road's words the row named, and that word's question."""
    # asked HERE, at the bake: a road for an unknown scope is refused before it is written
    words = vocabulary()
    mine = {spelling: number_of(spelling, words) for spelling in answers_for(scope, words)}
    asks = {spelling: _says(spelling, ASKS_BY, words) for spelling in mine}
    # and, for a word whose question is not about the thing in hand, what it IS about
    asks_of = {spelling: _says(spelling, ASKS_OF_BY, words) for spelling in mine}
    # and, for a word about a PLACE, the hops to that place and who holds it
    stands_in = {spelling: _says(spelling, STANDS_IN_BY, words) for spelling in mine}
    held_by = {spelling: _says(spelling, HELD_BY_BY, words) for spelling in mine}
    # which of them is this road's own word under another spelling (a synonym asks nothing)
    same_as = {spelling: _says(spelling, SAME_AS_BY, words) for spelling in mine}
    # and it may not be both at once: a word that asks something is narrowing, whatever it says
    guard(not [s for s in mine if same_as[s] and asks[s]] and not asks[scope],
          "a word on the `%s` road is its own or the same as it and also asks a question, and "
          "neither may" % scope)
    # what this road passes over whichever of its words was written, declared by the road's own
    only = _says(scope, ONLY_BY, words)
    # and the kind every question below is asked of: this road's own, never a constant
    about = _says(scope, ENTITY_BY, words) or ASKED_ON
    # AND WHAT THIS ROAD'S MARK ASKS when its things have no id: both halves or neither
    marked_asks = _says(scope, MARKED_ASKS_BY, words)
    marked_through = _says(scope, MARKED_THROUGH_BY, words)
    guard((marked_asks is None) == (marked_through is None),
          "`%s` names one half of what its mark asks and not the other" % scope)
    # and the ordinary way: the field its things carry their cdb id in, and the kind to read
    marked_id = _says(scope, MARKED_ID_BY, words)
    marked_on = _says(scope, MARKED_ON_BY, words) or about
    guard(not (marked_id is not None and marked_asks is not None),
          "`%s` says its mark both asks a question and names an id, and a mark is matched one way"
          % scope)
    # a word naming no kind is about the thing the row was written on (the reach moves rows)
    rides_everything = set(on_every_road(words))

    def emit_gate(place):
        holder = place.row[holder_part]
        # a re-hosted row is decided by whether its word is the word for the reach's holder
        judged, moved = ((None, []) if reach_part is None
                         else _the_reach_moved_it(place, reach_part, part, mine=mine))
        ending = [judged + ":", place.op("Label")] if judged else []
        # nothing to chain: one word, no question, so no per-row chain
        if len(mine) == 1 and only is None and asks[scope] is None:
            wanted = place.scratch_like(place.row[part])
            return moved + [
                place.op("Int", dst=wanted, ptr=place.number(mine[scope])),
                (place.op("JNotEq", a=place.row[part], b=wanted), place.refused)] + ending
        through = place.here("this scope matches")
        out = list(moved)
        if only is not None:
            answer, asking = _ask_the_game(place, only, holder, about=about)
            out += asking + [(place.op("JFalse", cond=answer), place.refused)]
        def questions(at, spelling):
            # a synonym leaves where the road's own word does
            a_synonym = same_as[spelling] == scope
            ops = []
            if stands_in[spelling] and held_by[spelling] and whose_part and not a_synonym:
                ops += _the_place_it_stands_in(at, whose_part)
            elif spelling in rides_everything and foreign_part is not None:
                own = at.scratch_like(at.row[foreign_part])
                ops += [at.op("Int", dst=own, ptr=at.number(0)),
                        (at.op("JNotEq", a=at.row[foreign_part], b=own), at.refused)]
            return ops
        # an asking word is found in the road's table by its number; the rest are walked
        asked = [(s, mine[s], asks[s], asks_of[s]) for s in sorted(mine) if s != scope and asks[s]]
        out += scopechain.emit_asked(place, scope, part, holder, asked, about, _ask_the_game,
                                     through)
        chain = [scope] + [s for s in sorted(mine) if s != scope and not asks[s]]
        out += scopechain.emit_named(place, (scope, holder_part, whose_part, foreign_part),
                                     chain, part, mine, questions, through)
        # AND THEN, FOR A MARKED SCOPE, the one unit that column names
        if marked_at is not None and marked_names is not None:
            named, at = place.row[marked_names], place.row[marked_at]

            def matching(p):
                if marked_asks is not None:
                    return emit_the_named_trait_is_carried(p, holder, named, at, marked_asks,
                                                           marked_through)
                if marked_id is not None:
                    return emit_the_named_thing_matches(p, holder, named, at, marked_on, marked_id)
                return emit_the_named_unit_matches(p, holder, named, at)
            out += scopeturn.emit_gate(place, at, named, place.row.get(turned_at), matching)
        # then every narrowing word spelled (bits of one number), after the scope and its mark
        return out + ending + _the_narrowings_asked(place, holder)
    return emit_gate


def install(bc):
    """Read every scope's number out of its own file, and put those numbers in the file's pool."""
    every = numbers()
    for claimed in sorted(every.values()) + [NOTHING_NAMED]:
        number(bc, claimed)
    scopechain.install(bc, sorted({_says(s, NARROWS_BY) for s in every if _says(s, ASKS_BY)}))
    return ("SCOPE MATCH: %d scope(s), each with the number its own file writes out -- %s -- "
            "and a road compares against its own driver's, never against a published one"
            % (len(every), ", ".join("`%s` is %d" % pair for pair in sorted(every.items()))))
