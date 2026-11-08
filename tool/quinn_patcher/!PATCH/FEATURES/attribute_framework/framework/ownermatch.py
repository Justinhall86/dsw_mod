#!/usr/bin/env python3
"""Which things may ACCEPT a rule, judged against the faction that holds it: who, never where."""
from tools.project import guard
from tools.hlcode import number, template, written
from framework import names as vocab
from framework.names import module_of, vocabulary
from framework.pieceword import spellings
from framework.rowreader import reader_for

# the folder a word of this kind sits in, which is what says what it IS
FAMILY = "owners"
# what this works out, kept on the row; ⛔ NOT `owner`, which the record uses for the payee
NAMED = "owner word"
FOUND = ((NAMED, vocab.NUMBER_KEPT_IN),)
# what that place holds when a name carried no owner word at all. The gate reads this and leaves
NOTHING_NAMED = 0
# declared per word -- OWNED: yes/no/either; SAME: True/False/None
OWNED_BY = "OWNED"
SAME_BY = "SAME"
# ASKS: ((the game's question, the answer it wants), ...), or asked of the game's running state
ASKS_BY = "ASKS"
ASKS_OF_STATE_BY = "ASKS_OF_STATE"
# OWNER_HAS: (a field on the owning faction, must it be there); OR_SAME: own things pass unasked
OWNER_HAS_BY = "OWNER_HAS"
OR_SAME_BY = "OR_SAME"
OWNED_ANSWERS = ("yes", "no", "either")
# HOW A WORD REACHES THE GAME'S DIPLOMACY: a TRUCE lives in the game's state, not in `ASKS`
THE_GAME_CLASS, THE_GAME_ON, THE_STATE_ON = "$Game", "inst", "state"
# and the kind the state's questions take: `areAtPeace` is about two FACTIONS
ASKED_AS = "ent.Faction"
# the game's own question for who owns a thing, asked here of a CANDIDATE
OWNER_OF = "ent.Entity.get_owner"
ASKED_ON = "ent.Entity"
# and what tells one thing from another: the identity every networked object carries
THE_ID_ON = "__uid"
# what this gate is called, so the pipeline and its case mean the same stage
GATE = "may this thing accept the rule"


def registers(bc, fn, reader=None):
    """The one place this needs, on `fn`, typed from a borrowed signature."""
    reader = reader or reader_for(bc)
    return {name: reader.borrow_register(bc, fn, kind) for name, kind in FOUND}


def only_owners(words):
    """The vocabulary narrowed to the owner words. THE ONE PLACE that narrowing is written."""
    return {spelling: word for spelling, word in words.items() if word.family == FAMILY}


def numbers(words=None):
    """Every owner word and the number its own file writes out for it."""
    words = vocabulary() if words is None else words
    mine, out = only_owners(words), {}
    for spelling in sorted(mine):
        claimed = getattr(module_of(mine[spelling]), vocab.DECLARES, None)
        guard(isinstance(claimed, int) and not isinstance(claimed, bool)
              and claimed != NOTHING_NAMED,
              "`%s` says its %s is %r, and an owner word's number is a whole one that is not %d"
              % (spelling, vocab.DECLARES, claimed, NOTHING_NAMED))
        taken = [already for already, n in out.items() if n == claimed]
        guard(not taken, "`%s` and `%s` both claim the number %d, and a word's number is its own"
              % (taken[0] if taken else "?", spelling, claimed))
        out[spelling] = claimed
    return out


def number_of(word, words=None):
    """The number one owner word's file writes out for it, asked for BY THE WORD a modder types."""
    every = numbers(words)
    guard(word in every,
          "`%s` is not an owner word this build knows: %s" % (word, ", ".join(sorted(every))))
    return every[word]


def says(spelling, what, words=None):
    """One declaration off one word's own file, or nothing when it declares none."""
    words = vocabulary() if words is None else words
    return getattr(module_of(only_owners(words)[spelling]), what, None)


def checked(words=None):
    """Every word's declarations, refused here rather than discovered in a silent bench run."""
    words = vocabulary() if words is None else words
    out = {}
    for spelling in sorted(only_owners(words)):
        owned = says(spelling, OWNED_BY, words)
        guard(owned in OWNED_ANSWERS,
              "`%s` says its %s is %r, and it is one of %s"
              % (spelling, OWNED_BY, owned, ", ".join(OWNED_ANSWERS)))
        same = says(spelling, SAME_BY, words)
        guard(same in (True, False, None),
              "`%s` says its %s is %r, and it is True, False or nothing"
              % (spelling, SAME_BY, same))
        asks = says(spelling, ASKS_BY, words) or ()
        of_state = says(spelling, ASKS_OF_STATE_BY, words) or ()
        for one in tuple(asks) + tuple(of_state):
            guard(isinstance(one, tuple) and len(one) == 2 and isinstance(one[1], bool),
                  "`%s` asks %r, and a question is a pair of a name and the answer it wants"
                  % (spelling, one))
        has = says(spelling, OWNER_HAS_BY, words)
        guard(has is None or (isinstance(has, tuple) and len(has) == 2
                              and isinstance(has[0], str) and isinstance(has[1], bool)),
              "`%s` says its %s is %r, and it is a field name and whether it must be there"
              % (spelling, OWNER_HAS_BY, has))
        # ⛔ A WORD THAT ASKS NOTHING ACCEPTS EVERYTHING: legal only for one that says so
        guard(asks or of_state or has or same is not None or owned != "either"
              or says(spelling, "EVERYONE", words),
              "`%s` tests nothing at all, and does not say it means everyone" % spelling)
        out[spelling] = {"owned": owned, "same": same, "asks": tuple(asks),
                         "asks_of_state": tuple(of_state), "owner_has": has,
                         "or_same": bool(says(spelling, OR_SAME_BY, words))}
    return out


def _owns_itself(road):
    """Is this road's own thing already a faction? The scope word's `OWNER` says (read lazily)."""
    from framework import scopematch
    from framework.storewalk import ITSELF, OWNER_BY
    words = scopematch.only_scopes(vocabulary())
    if road not in words:
        return False
    return getattr(module_of(words[road]), OWNER_BY, None) == ITSELF


def _asked_once(place, road):
    """The thing's owner as the road asked it once, where its scope names its own question."""
    from framework import scopematch
    from framework.storewalk import ITSELF, OWNER_BY
    words = scopematch.only_scopes(vocabulary())
    said = getattr(module_of(words[road]), OWNER_BY, None) if road in words else None
    if said in (None, ITSELF, OWNER_OF):
        return None
    return place.row.get(scopematch.PAYEE)


def _unworded_off_a_region(place, region_part, mine, theirs, asking):
    """An unworded row off a REGION's store reaches only things the rule's faction owns."""
    # ⛔ A ROAD THAT MAKES NO REGION PASS CARRIES NO PLACE FOR THE FLAG, so emits no test
    if region_part is None or place.row.get(region_part) is None:
        return []
    past = place.here("not the region's pass, and unworded")
    its_own = place.scratch_like(place.row[region_part])
    return ([place.op("Int", dst=its_own, ptr=place.number(1)),
             (place.op("JNotEq", a=place.row[region_part], b=its_own), past)]
            + asking
            + [(place.op("JNull", reg=theirs), place.refused),
               (place.op("JNotEq", a=theirs, b=mine), place.refused),
               past + ":", place.op("Label")])


def gate_for(part, holder_part, payee_part, foreign_part, words=None, road="a", row_part=None,
             region_part=None):
    """The stage: will this row's owner word accept the candidate, against the rule's faction?"""
    checked(words)

    def emit_gate(place):
        through = place.here("the owner word accepts this thing")
        # the candidate, narrowed; and who owns it (nothing, for what `Neutral` names)
        candidate, narrowing = place.narrowed(place.row[holder_part], place.scratch_of(ASKED_ON))
        mine, to_mine = place.narrowed(place.row[payee_part], place.scratch_of(ASKED_ON))
        theirs = place.scratch_return(OWNER_OF)
        # a road with its own owner question (a region, an agent) asked it once: its payee
        asked = _asked_once(place, road)
        if asked is not None:
            narrowing = []
            asking = [place.op("Mov", dst=theirs, src=asked)]
        else:
            asking = [place.op("Call1", dst=theirs, fun=place.named_function(OWNER_OF),
                               arg0=candidate)]
        wanted = place.scratch_like(place.row[part])
        # ⛔ AN UNWORDED ROW FROM A FOREIGN STORE IS REFUSED, and says so
        out = [place.op("Int", dst=wanted, ptr=place.number(NOTHING_NAMED)),
               (place.op("JNotEq", a=place.row[part], b=wanted), place.here("it carries a word")),
               (place.op("JEq", a=place.row[foreign_part], b=wanted),
                place.here("its own pass, and unworded"))]
        out += []
        # ⛔ THE ROW CANNOT BE NAMED HERE; `framework/saidrow.py` names it from the ROAD
        out += [
               (place.op("JAlways"), place.refused),
               place.here("its own pass, and unworded") + ":", place.op("Label")]
        # and one pass of its own is not the holder's store at all, however unforeign it is
        out += _unworded_off_a_region(place, region_part, mine, theirs,
                                      narrowing + to_mine + asking)
        out += [(place.op("JAlways"), through),
                place.here("it carries a word") + ":", place.op("Label")]
        # WHOSE THE CANDIDATE IS; a scope with `OWNER = "itself"` is its own faction, asks nobody
        if _owns_itself(road):
            as_faction, to_faction = place.narrowed(place.row[holder_part],
                                                    place.scratch_of(ASKED_AS))
            reaching = to_faction + [place.op("Mov", dst=theirs, src=as_faction)]
        else:
            reaching = asking
        out += narrowing + to_mine + reaching + emit_judged(place, place.row[part], mine, theirs)
        return out + [through + ":", place.op("Label")]
    return emit_gate


# the one function every owner word is judged by, the table it reads, and one word's own test
JUDGED = "does the owner word take this faction"
TABLE, WORD_TEST = "the owner words' tests, %s", "the owner word `%s`, judged"


def _answered(made, taken, answer):
    """Taken answers 1, refused 0; no `taken` answers only the refusal."""
    return [one for ends, n in ((taken, 1), (made.refused, 0)) if ends for one in (
        ends + ":", made.op("Label"), made.op("Int", dst=answer, ptr=made.number(n)),
        made.op("Ret", ret=answer))]


def emit_judged(place, owner, mine, theirs):
    """Past this the owner word numbered `owner` takes `theirs` against `mine`; else refused."""
    from tools.hlcode import assemble, kind_named
    from framework import scopechain
    from framework.pipeline import Place
    kinds = [place.kind_of(owner), place.kind_of(mine), place.kind_of(theirs)]
    # ⛔ A CASE'S ROAD OVER VOID PLACES: a judge made for it would land in the game file
    if 0 in kinds:
        return []
    road, every, i32 = (JUDGED,) + tuple(kinds), checked(), kind_named(place._hands["bc"](), "I32")

    def test(spelling):
        def body(hands):
            made = Place(WORD_TEST % spelling, {}, {}, None, None, None, None, hands)
            made.refused, taken = made.here("refused"), made.here("taken")
            return assemble(_one_word(made, every[spelling], 0, 1, taken, spelling)
                            + _answered(made, taken, made.scratch_of("I32")))
        key = (WORD_TEST % spelling,) + road
        return scopechain.one_shape(place, road, key,
                                    place._hands["shared"](key, kinds[1:], i32, body))
    # ⛔ EACH WORD'S TEST IS FILED BY ITS NUMBER: the judge looks one up, and grows with none
    table = scopechain.table_of(place, road, TABLE % (kinds,),
                                sorted(numbers().items()), test)

    def body(hands):
        made = Place(JUDGED, {}, {}, None, None, None, None, hands)
        made.refused, said = made.here("refused"), made.scratch_of("I32")
        # a number this build does not know is a row we cannot judge, and it is turned away
        got, finding = scopechain.emit_entry(made, table, 0, made.refused)
        return assemble(finding + scopechain.emit_called(made, road, got, said, [1, 2]) + [
            made.op("Ret", ret=said)] + _answered(made, None, said))
    judge = place._hands["shared"](road, kinds, i32, body)
    answer, none = place.scratch_of("I32"), place.scratch_of("I32")
    return [place.op("CallN", dst=answer, fun=judge, args=[owner, mine, theirs]),
            place.op("Int", dst=none, ptr=place.number(0)),
            (place.op("JEq", a=answer, b=none), place.refused)]


# ⚠ INSTRUMENT: each test says WHICH word died on WHICH test, latched
REFUSED_ON = "SPINE `%s` refused%s: %s"
# ⛔ AND WHICH PASS IT WAS ON, own or foreign
ON_ITS_OWN, ON_A_FOREIGN = "", " on a foreign pass"
# and a row with no owner word at all, reached on somebody else's store
UNWORDED_FOREIGN = "SPINE the `%s` road refused an unworded row for arriving on a foreign pass"
# what an application calls the row it is about, as text. The same field `saidrow` names one by
THE_ROW_IS_CALLED = "kind"


def _one_word(place, says_it, mine, theirs, through, spelling):
    """One word's own test, written from what its file declares and from nothing else."""
    out = []

    def refuse(_why):
        return place.refused

    # `Friendly` FIRST: the holder's own things pass without any question
    if says_it["or_same"]:
        out += _same_faction(place, mine, theirs, goes_to=through, when_same=True,
                             naming="%s, its own" % spelling)
    if says_it["owned"] == "no":
        out += [(place.op("JNotNull", reg=theirs), refuse("it is owned"))]
        return out + [(place.op("JAlways"), through)]
    if says_it["owned"] == "yes":
        out += [(place.op("JNull", reg=theirs), refuse("nobody owns it"))]
    # WHETHER A PLAYER IS BEHIND THE OWNER: an unplayed faction has no line-up seat field
    if says_it["owner_has"]:
        field, must = says_it["owner_has"]
        at, seat = place.field_of(ASKED_AS, field)
        nobody = place.here("`%s`: nobody owns it, so no player is behind it" % spelling)
        out += [(place.op("JNull", reg=theirs),
                 nobody if not must else refuse("nobody owns it, so it has no `%s`" % field)),
                place.op("Field", dst=seat, obj=theirs, field=at),
                (place.op("JNotNull" if not must else "JNull", reg=seat),
                 refuse("its owner %s a `%s`" % ("has" if not must else "has no", field))),
                nobody + ":", place.op("Label")]
    if says_it["same"] is not None:
        out += _same_faction(place, mine, theirs,
                             goes_to=refuse("the faction is %s the holder's"
                                            % ("not" if says_it["same"] else "")),
                             when_same=not says_it["same"], naming=spelling)
    # ⛔ NAMED BY THE QUESTION, not the answer: `InTruce` asks two
    for named, want in says_it["asks"]:
        answer = place.scratch_return(named)
        out += [place.op("Call2", dst=answer, fun=place.named_function(named),
                         arg0=mine, arg1=theirs),
                (place.op("JTrue" if not want else "JFalse", cond=answer),
                 refuse("`%s` answered %s" % (named, "yes" if not want else "no")))]
    # and the ones the game answers about two FACTIONS, through its running state
    for named, want in says_it["asks_of_state"]:
        out += _through_the_state(place, named, want, mine, theirs, refuse)
    return out + [(place.op("JAlways"), through)]


def _through_the_state(place, named, want, mine, theirs, refuse):
    """One question the GAME'S STATE answers about two factions (diplomacy, not team alliance)."""
    holding = place.scratch_of(THE_GAME_CLASS)
    at_game, game = place.field_of(THE_GAME_CLASS, THE_GAME_ON)
    at_state, state = place.field_of(game, THE_STATE_ON)
    # both sides as the kind the question takes
    ours, to_ours = place.narrowed(mine, place.scratch_of(ASKED_AS),
                                   goes_to=refuse("the holder is not a faction"))
    thing, to_thing = place.narrowed(theirs, place.scratch_of(ASKED_AS),
                                     goes_to=refuse("its owner is not a faction"))
    answer = place.scratch_return(named)
    return [place.op("GetGlobal", dst=holding,
                     **{"global": place.the_one_global(THE_GAME_CLASS)}),
            place.op("Field", dst=game, obj=holding, field=at_game),
            (place.op("JNull", reg=game), refuse("no game is running")),
            place.op("Field", dst=state, obj=game, field=at_state),
            (place.op("JNull", reg=state), refuse("the game keeps no state yet"))
            ] + to_ours + to_thing + [
            place.op("Call3", dst=answer, fun=place.named_function(named),
                     arg0=state, arg1=ours, arg2=thing),
            (place.op("JTrue" if not want else "JFalse", cond=answer),
             refuse("`%s` answered %s" % (named, "yes" if not want else "no")))]


def _same_faction(place, mine, theirs, goes_to, when_same, naming):
    """Jump when the candidate's faction IS the holder's (by identity); `when_same` flips it."""
    at, ours = place.field_of(ASKED_ON, THE_ID_ON)
    _again, other = place.field_of(ASKED_ON, THE_ID_ON)
    nobody = place.here("%s: nobody owns it, so it is not the holder's" % naming)
    return [(place.op("JNull", reg=theirs), nobody if when_same else goes_to),
            place.op("Field", dst=ours, obj=mine, field=at),
            place.op("Field", dst=other, obj=theirs, field=at),
            (place.op("JEq" if when_same else "JNotEq", a=ours, b=other), goes_to),
            nobody + ":", place.op("Label")]


def emit_forget(bc, r):
    """Empty the place, before an id is read. The other end of the latch the branches are."""
    return [written(template(bc, "Int"), dst=r[NAMED], ptr=number(bc, NOTHING_NAMED))]


def highest(words=None):
    """The highest owner number; each from 1 up to it is a word's, so a tally sits per number."""
    every = sorted(numbers(words).values())
    guard(every == list(range(1, len(every) + 1)),
          "the owner words' numbers are %s, and a tally per number needs 1 to %d with no gap"
          % (every, len(every)))
    return len(every)


# ⛔ A GROUP'S OWNER WORD IS HOW MANY OF THESE STAND IN FRONT OF ITS MARK: one text for every word
OWNED_ONCE = "|owned, once"


def emit_owner_marks(bc, owner, spare, listed, hands, tag):
    """`OWNED_ONCE` pushed onto the row's names as many times as the owner number in `owner`."""
    from framework.parammatch import emit_pushed
    from tools.hlcode import text_object
    held = hands["place"](reader_for(bc).text_kind)
    zero = hands["place"](reader_for(bc).count_kind)
    again, done = "%s: one more owner mark" % tag, "%s: its owner marked" % tag
    return [written(template(bc, "Mov"), dst=spare, src=owner),
            written(template(bc, "Int"), dst=zero, ptr=number(bc, 0)),
            again + ":", written(template(bc, "Label")),
            (written(template(bc, "JSGte"), a=zero, b=spare), done),
            written(template(bc, "GetGlobal"), **{"dst": held,
                                                   "global": text_object(bc, OWNED_ONCE)})] + (
        emit_pushed(bc, held, listed, hands)) + [
            written(template(bc, "Decr"), dst=spare),
            (written(template(bc, "JAlways")), again),
            done + ":", written(template(bc, "Label"))]


def emit_owner_counted(place, tag, name, kept, mark, onwards):
    """An owner mark in `name` counted into `kept`, then `onwards`; any other entry falls on."""
    other = place.here("%s, not an owner mark" % tag)
    return [(place.op("JNotEq", a=name, b=mark), other),
            place.op("Incr", dst=kept),
            (place.op("JAlways"), onwards),
            other + ":", place.op("Label")]


def emit_tallied(bc, owner, spare, tag, tally_at):
    """`tally_at(owner)`'s count up, at the place the number `owner` holds says; none for 0."""
    past = "%s: no owner word" % tag
    return [written(template(bc, "Int"), dst=spare, ptr=number(bc, NOTHING_NAMED)),
            (written(template(bc, "JEq"), a=owner, b=spare), past)] + tally_at(owner) + [
            past + ":", written(template(bc, "Label"))]


def branches(bc, r, words=None, hands=None):
    """One branch per scope an owner word may be glued to: the number cut off it, written down."""
    from framework.pieceword import OWNER_HAND, owners_taken
    words = vocabulary() if words is None else words
    owner = (hands or {}).get(OWNER_HAND)
    guard(owner is not None, "the scope branches were handed no place for the owner word cut off")
    guard(NOTHING_NAMED == 0, "none cut off is 0, and %d is what no owner word reads as"
          % NOTHING_NAMED)
    # ⛔ MERGED INTO THE SCOPE'S OWN BRANCH: `EnemyUnit` is `Unit` with `Enemy` cut off its front
    return [(one, [written(template(bc, "Mov"), dst=r[NAMED], src=owner)])
            for one in spellings(words)
            if one.word.family == "scopes" and owners_taken(one, words)]
