#!/usr/bin/env python3
"""How often an id spelled each multiplier, what each counts, and an amount scaled by them all."""
from tools.project import gv, guard
from tools.hlcode import (field_by_name, function_named, kind_named, number, returns_type,
                          template, written)
from framework import membercount, narrowcount, names as vocab, questions as asked, rescount, turned
from framework.names import module_of, vocabulary
from framework.narrowcount import SCALED
from framework.pieceword import spellings
from framework.rowreader import reader_for

# the counting words; a modifier narrowing a count by list has its branch written beside theirs
FAMILY = "multipliers"


def _here(word):
    return word.family == FAMILY or (word.family == narrowcount.FAMILY
                                     and bool(narrowcount.lists_of(word)))

# what one word's tally is kept under, and the record field its count is read in
TIMES = "times %s"
COUNTED = "counted"
# what a tally holds when the word was never spelled, and a count before it is read
NOTHING_SPELLED = 0
# why a word whose list is held per thing it owns is never counted straight; `foreignwalk` does it
PER_HOLDER = "walks its list per holder; its picked count goes through `counter_for`"
# what a multiplier's file names: the kind it counts on, the way there, and its instrument
ASKED_OF, COUNTS, BANDS = "ASKED_OF", "COUNTS", "BANDS"
# and the game's own question a list member must answer yes to before it is counted
ONLY_BY = "ONLY"
# said once a game per road and word, where the count was taken off the holder's owner
ON_THE_OWNER = "SPINE the `%s` road counts %s on its owner"


def only_multipliers(words):
    """The vocabulary narrowed to the multiplier words. THE ONE PLACE that narrowing is written."""
    return {spelling: word for spelling, word in words.items() if _here(word)}


def words_of(words=None):
    """Every counting multiplier word, in a settled order; narrowers and the like are not."""
    words = only_multipliers(vocabulary() if words is None else words)
    skipped = set(membercount.wideners(words) + rescount.held_of(words))
    return tuple(sorted(s for s, w in words.items() if not narrowcount.lists_of(w)
                        and s not in skipped))


def passed_words():
    """The counting words a narrower reads the count of: counted once a pass, on the road."""
    fed = {narrowcount.fed_by(n) for n in narrowcount.narrowers_of()}
    return tuple(w for w in words_of() if w in fed)


def linked_words():
    """Every other counting word: counted in its own function, only for a row that spelled it."""
    return tuple(w for w in words_of() if w not in passed_words())


def counted_words():
    """Every part under `counted`: the passed multipliers, the narrowers, the counted members."""
    return passed_words() + narrowcount.narrowers_of() + membercount.PARTS


def written_ways(words):
    """Every way a multiplier may be written; `PerEnemyDev` is `PerDev` with `Enemy` cut off."""
    return [one for one in spellings(words) if _here(one.word) and one.with_owner is None]


def pickers(words=None):
    """Every counting word an owner word may be written into, with its slot in `OWNER`."""
    from framework.narrowmatch import owners_pick
    words = vocabulary() if words is None else words
    return {s: n for n, s in enumerate(s for s in words_of(words) if owners_pick(words[s]))}


# and the owner word after a counting word's `Per` (`PerEnemyDev`): a slot of bits per word
OWNER = "multiplier owner"
# each copy of a counting word keeps its own owner word: a tally per word and owner word
OWNED = "times %s owned by %s"


def owner_kept(word):
    """The kept number of `OWNER` that one counting word's owner slot sits in."""
    from framework.narrowmatch import chunk_name
    return chunk_name(OWNER, pickers()[word])


def owners_kept():
    """Every kept number of `OWNER` the counting words fill, the first always among them."""
    from framework.narrowmatch import chunk_names
    return chunk_names(OWNER, len(pickers()))


def owned_names():
    """Every word-and-owner tally by owner number, 0 first: one's place is the first's plus it."""
    from framework.ownermatch import highest
    return tuple(OWNED % (word, n) for word in pickers() for n in range(highest() + 1))


NAMES = (tuple(TIMES % word for word in words_of()) + narrowcount.NAMES + owners_kept()
         + owned_names() + rescount.NAMES)
FOUND = tuple((name, vocab.NUMBER_KEPT_IN) for name in NAMES)
# every part of a row the scaling reads: each tally, then each count, then what narrows them
READS = ("name.numbers",) + tuple("%s.%s" % (COUNTED, word) for word in passed_words()) + (
    narrowcount.READS + membercount.READS + rescount.reads() + asked.modifiers_read())


def registers(bc, fn, reader=None):
    """The narrowers' places, typed from a borrowed signature; every tally is on the row's list."""
    reader = reader or reader_for(bc)
    return {place: reader.borrow_register(bc, fn, vocab.NUMBER_KEPT_IN)
            for place in narrowcount.PLACES + membercount.PLACES}


def emit_forget(bc, r, listed=None):
    """The narrowers' places emptied, before an id is read; the row's list starts with no tally."""
    return narrowcount.emit_forget(bc, r, listed)


def branches(bc, r, words=None, column=None, listed=None, hands=None):
    """One branch per multiplier spelling: its own tally counted up, so a repeat scales again."""
    words = vocabulary() if words is None else words
    written_as = written_ways(words)
    guard(written_as, "no multiplier has a spelling, so no piece could ever match one")
    narrowers = narrowcount.narrowers_of(words)
    known = [(one, narrowcount.keyed(one.word, narrowcount.branch(
                bc, r, one, column, listed, hands))
             if one.word.spelling in narrowers else membercount.emit_counted(
                 bc, r, one, tallied(r, TIMES % one.word.spelling)
                 + _owned_tally(bc, r, one, hands) + emit_owner(bc, r, one, words, hands)
                 + narrowcount.emit_feeding(bc, r, one.word.spelling), (column, listed, hands)))
             for one in written_as
             if not membercount.claims(one, words) and not rescount.claims(one)]
    return rescount.branches(bc, r, words, column, listed, hands, known)


def tallied(r, name, how=0, value=None, at=None):
    """`name`'s number (`at` on) on the row's list counted up; `how`: 2 written, 3 down."""
    from framework.narrowmatch import KEPT_HAND
    return r[KEPT_HAND].fold(name, how, value, at)


def _owned_tally(bc, r, one, hands):
    """The copy's tally under the owner word cut off its piece, when one was."""
    from framework.ownermatch import emit_tallied
    from framework.pieceword import OWNER_HAND
    return [] if one.word.spelling not in pickers() else emit_tallied(
        bc, hands[OWNER_HAND], r[narrowcount.SPARE], one.text,
        lambda at: tallied(r, OWNED % (one.word.spelling, 0), at=at))


def emit_owner(bc, r, one, words=None, hands=None):
    """The latest copy's owner word in that word's slot: the one cut off its piece, or none."""
    from framework.narrowmatch import owner_at
    from framework.pieceword import OWNER_HAND
    if one.word.spelling not in pickers(words):
        return []
    guard(owner_at(0, 1) == 1, "an owner slot holds more than its number, so the cut one is not it")
    return tallied(r, owner_kept(one.word.spelling), 2, hands[OWNER_HAND])


def emit_unclaimed(bc, r, word, tag, spare, other):
    """A copy a narrower took over gives its owner word's tally back; the narrower picks now."""
    from framework.ownermatch import emit_tallied
    if word not in pickers():
        return []
    return narrowcount.owner_read(bc, r, word, spare, other) + emit_tallied(
        bc, spare, other, "%s: %s" % (tag, word), lambda at: tallied(r, OWNED % (word, 0), 3,
                                                                     at=at))


def declared(word, words=None):
    """What one multiplier's file says it counts: on what kind, the way there, and its bands."""
    words = vocabulary() if words is None else words
    module = module_of(words[word])
    asked, hops = getattr(module, ASKED_OF, None), getattr(module, COUNTS, None)
    guard(isinstance(asked, str) and asked, "`%s` names no %s to count on" % (word, ASKED_OF))
    guard(isinstance(hops, tuple) and hops and all(isinstance(h, str) and h for h in hops),
          "`%s` names no way to its count: %s is %r" % (word, COUNTS, hops))
    return asked, hops, tuple(getattr(module, BANDS, ()))


def only_of(word, words=None):
    """The game's questions a counted member must answer yes to; none for a plain length."""
    return membercount.member_questions(module_of((vocabulary() if words is None else words)[word]))


def counted_here(bc, site):
    """Each multiplier this road counts, and whether on its holder (True) or its owner (False)."""
    from framework.walkplaces import payee_kind
    owner, out = payee_kind(bc, site), {}
    for word in words_of():
        asked = kind_named(bc, declared(word)[0])
        if site.holder_kind == asked or owner == asked:
            out[word] = site.holder_kind == asked
    return out


def emit_counts(bc, fn, op, site, reader, into, owner=None):
    """Each multiplier's count, once a pass, on the holder or else its owner; 0 on neither."""
    from framework import sayonce
    out, here = [], counted_here(bc, site)
    for word in passed_words():
        _asked, hops, bands = declared(word)
        into[word] = reader.borrow_register(bc, fn, vocab.NUMBER_KEPT_IN)
        out.append(op("Int", dst=into[word], ptr=number(bc, NOTHING_SPELLED)))
        if word not in here:
            continue
        start, said = (0, []) if here[word] else (owner, sayonce.emit(
            bc, fn, ON_THE_OWNER % (site.word, word), even_when_quiet=True))
        out += list(said) + rescount.one_count(bc, fn, op, site, reader, word, into[word], start)
    return out + narrowcount.emit_reached(bc, fn, op, site, into, owner, here)


def _calling_the_count(bc, fn, op, site, reader, word, count, start, named=None, partner=None):
    """One shared function per word, the kind it counts from, any kind named, any partner."""
    from tools.hlcode import assemble, shared_function
    hops, bands = declared(word)[1:]
    handed = [start] + [one for one in (named, partner) if one is not None]
    kinds = [gv(list(fn.regs)[at]) for at in handed + [count]]

    def body(made):
        held = reader.borrow_register(bc, made, vocab.NUMBER_KEPT_IN)
        return assemble([op("Int", dst=held, ptr=number(bc, NOTHING_SPELLED))]
                        + _counted(bc, made, op, site, reader, word, hops, held, 0, (), start != 0)
                        + _banded(bc, made, op, site, reader, word, bands, held)
                        + [op("Ret", ret=held)])
    shared = shared_function(bc, fn, lambda _bc, made: made, ("count", word, start != 0) + tuple(
        kinds), kinds[:-1], kinds[-1], body)
    return [op("CallN", dst=count, fun=shared, args=handed)]


def _counted(bc, fn, op, site, reader, word, hops, count, start=0, said=(), nullable=False):
    """The way to one count from `start`: a dotted hop is asked, any other read as a field."""
    from framework import foreignwalk
    from framework.parsed import a_new_place
    nothing = "%s: %s has nothing to count" % (site.word, word)
    at, out = start, ([(op("JNull", reg=start), nothing)] if start != 0 or nullable else []) + (
        list(said))
    for step, hop in enumerate(hops):
        if at != start and gv(list(fn.regs)[at]) == foreignwalk.the_list_kind(bc):
            return out + _counted_each(bc, fn, op, site, reader, word, at, hops[step:], count,
                                       nothing) + [nothing + ":", op("Label")]
        if "." in hop:
            door = function_named(bc, hop)
            kind = returns_type(door, hop)
        else:
            where, kind = field_by_name(bc, gv(list(fn.regs)[at]), hop, "what `%s` counts" % word)
        last = step == len(hops) - 1
        got = count if last and kind == reader.count_kind else a_new_place(bc, fn, kind)
        out.append(op("Call1", dst=got, fun=gv(door.findex), arg0=at) if "." in hop
                   else op("Field", dst=got, obj=at, field=where))
        if got != count:
            out.append((op("JNull", reg=got), nothing))
        at = got
    if asked.summing(word):
        return out + asked.emit_summed_raw(bc, fn, word, at, count, nothing, site)
    only = only_of(word)
    guard(not only or at != count, "`%s` asks %s of each member, and counts no list"
          % (word, only))
    if at != count:
        guard(gv(list(fn.regs)[at]) == foreignwalk.the_list_kind(bc),
              "`%s` ends on a t@%s, neither a count nor a list" % (word, gv(list(fn.regs)[at])))
        if not only:
            backing = a_new_place(bc, fn, foreignwalk.the_backing_kind(bc))
            out += foreignwalk.emit_the_backing(bc, fn, at, backing, count, nothing)
        else:
            out += _counted_if(bc, fn, op, site, reader, word, only, at, count, nothing)
    return out + [nothing + ":", op("Label")]


def walks_of(word):
    """The walks one road's count of this word takes: one per member asked, or thing walked."""
    summed = asked.summing(word)
    if summed is not None:
        return getattr(summed, "WALKS", 0)
    return bool(only_of(word)) + bool(membercount.each_of(word))


def _counted_each(bc, fn, op, site, reader, word, holds, hops, count, past):
    """A list walked one thing at a time, the length of each one's own list added to `count`."""
    from framework import foreignwalk
    from framework.parsed import a_new_place
    each = a_new_place(bc, fn, kind_named(bc, membercount.each_of(word)))
    length, index, inner = (a_new_place(bc, fn, reader.count_kind) for _ in range(3))
    loop, skip = ("%s: %s, the next one it is held per" % (site.word, word),
                  "%s: %s, past that one" % (site.word, word))
    out = foreignwalk.emit_the_length(bc, fn, holds, length, past) + [
        op("Int", dst=index, ptr=number(bc, NOTHING_SPELLED)),
        loop + ":", op("Label"),
        (op("JSGte", a=index, b=length), past)] + foreignwalk.emit_the_faction_at(
        bc, fn, holds, index, each, past) + [op("Incr", dst=index), (op("JNull", reg=each), skip)]
    at = each
    for hop in hops:
        where, kind = field_by_name(bc, gv(list(fn.regs)[at]), hop, "what `%s` counts" % word)
        got = a_new_place(bc, fn, kind)
        out += [op("Field", dst=got, obj=at, field=where), (op("JNull", reg=got), skip)]
        at = got
    guard(gv(list(fn.regs)[at]) == foreignwalk.the_list_kind(bc),
          "`%s` ends on a t@%s, not the game's list" % (word, gv(list(fn.regs)[at])))
    only = only_of(word)
    tally = _counted_if(bc, fn, op, site, reader, word, only, at, count, skip) if only else (
        foreignwalk.emit_the_length(bc, fn, at, inner, skip) + [op("Add", dst=count, a=count,
                                                                    b=inner)])
    return out + tally + [skip + ":", op("Label"), (op("JAlways"), loop)]


def _counted_if(bc, fn, op, site, reader, word, only, holds, count, past):
    """The list walked member by member, each counted only when the game answers it yes."""
    from framework import foreignwalk
    from framework.parsed import a_new_place
    length = a_new_place(bc, fn, reader.count_kind)
    index = a_new_place(bc, fn, reader.count_kind)
    member = a_new_place(bc, fn, gv(list(function_named(bc, only[0][0]).regs)[0]))
    loop, skip = ("%s: %s, the next member" % (site.word, word),
                  "%s: %s, this member not counted" % (site.word, word))
    # ONE jump back per walk: every member not counted goes forward to the shared turn
    return (foreignwalk.emit_the_length(bc, fn, holds, length, past)
            + [op("Int", dst=index, ptr=number(bc, NOTHING_SPELLED)),
               loop + ":", op("Label"),
               (op("JSGte", a=index, b=length), past)]
            + foreignwalk.emit_the_faction_at(bc, fn, holds, index, member, past)
            + [op("Incr", dst=index),
               (op("JNull", reg=member), skip)]
            + membercount.emit_asked_raw(bc, fn, member, only, skip)
            + [op("Incr", dst=count),
               skip + ":", op("Label"),
               (op("JAlways"), loop)])


def _banded(bc, fn, op, site, reader, word, bands, count):
    """The count's instrument: each band says itself once when the count has reached it."""
    from framework import sayonce
    out = []
    for floor, band in bands:
        under = "%s: %s under %d" % (site.word, word, floor)
        edge = reader.borrow_register(bc, fn, vocab.NUMBER_KEPT_IN)
        out += ([op("Int", dst=edge, ptr=number(bc, floor)),
                 (op("JSLt", a=count, b=edge), under)]
                + sayonce.emit(bc, fn, band, even_when_quiet=True) + [under + ":", op("Label")])
    return out


def emit_scaled(place, amount):
    """`amount` times each multiplier's count, once for every time the row spelled that word."""
    from framework.forwhom import emit_linked, emit_one
    out = emit_linked(place, amount)
    for word in passed_words():
        out += emit_one(place, amount, word, place.row["%s.%s" % (COUNTED, word)])
    return out + narrowcount.emit_narrowed(place, amount) + membercount.emit_scaled(
        place, amount) + rescount.emit_scaled(place, amount)


def _raised(place, amount, count, times, tag, said=True):
    """`amount` times `count`, `times` times over."""
    left, zero = place.scratch_like(times), place.scratch_like(times)
    by, made = count, []
    if place.kind_of(amount) != place.kind_of(count):
        by = place.scratch_like(amount)
        made = [place.op("ToSFloat", dst=by, src=count)]
    again, done = place.here("times %s, again" % tag), place.here("times every %s" % tag)
    word = tag.split(" ")[0]
    return made + [
        place.op("Mov", dst=left, src=times),
        place.op("Int", dst=zero, ptr=place.number(NOTHING_SPELLED)),
        again + ":", place.op("Label"),
        (place.op("JSGte", a=zero, b=left), done),
        place.op("Mul", dst=amount, a=amount, b=by),
    ] + (place.said("respath", lambda word=word: place.said_now(SCALED % word)) if said else []) + [
        place.op("Decr", dst=left),
        (place.op("JAlways"), again),
        done + ":", place.op("Label")]


def _owned(place, amount, word, owner, tally, kinds=None):
    """`amount` times `word` summed over what the owner word numbered `owner` picks, per copy."""
    tag = "%s by its owner word" % word
    zero, total = place.scratch_like(tally), place.scratch_like(tally)
    skip = place.here("%s, never spelled" % tag)
    return [place.op("Int", dst=zero, ptr=place.number(NOTHING_SPELLED)),
            (place.op("JSGte", a=zero, b=tally), skip),
            place.op("Int", dst=total, ptr=place.number(NOTHING_SPELLED)),
            ] + emit_each_picked(place, tag, word, skip, lambda at, faction: turned.emit_owned(
                at, word, faction, total, kinds), kept=owner) + _raised(
        place, amount, total, tally, tag, said=False) + [skip + ":", place.op("Label")]


def picked_walks():
    """The walks one act's scaling adds for owner words: per picked count, its faction walk."""
    every = pickers()
    # per picked count: the walk over owner numbers, its faction walk, a member walk, its raise
    plain = sum(3 + bool(only_of(w)) + bool(membercount.each_of(w)) for w in every)
    narrowed = sum(2 for word in narrowcount.narrowers_of() if narrowcount.fed_by(word) in every)
    # picked members: the factions, then each one's members and names; a judged walk adds none
    from framework.memberwalk import teams
    from framework.questions import picked_counts_itself as itself
    members = sum(3 + bool(membercount.each_of(w)) for w in teams() if w in every and not itself(w))
    return plain + narrowed + members + rescount.walks()


def picked_asks():
    """Every game function a walk over the picked factions asks: who is dead, each owner word's."""
    from framework import ownermatch
    from framework.storewalk import IS_DEAD
    every = pickers()
    if not every:
        return ()
    owners = tuple(named for said in ownermatch.checked().values()
                   for named, _want in said["asks"] + said["asks_of_state"])
    hops = tuple(hop for word in every for hop in declared(word)[1] if "." in hop)
    return (IS_DEAD,) + owners + hops


def emit_each_picked(place, tag, word, unpicked, ask, kept=None, only=None):
    """`ask` of every faction the owner word on `word` picks, for `tag`; with none, `unpicked`."""
    from copy import copy
    from framework import ownerpicks
    from framework.parsed import kept_number
    guard(all(part in place.row for part in ownerpicks.WALKED),
          "`%s` scales by `%s`, and is handed no %s" % (place.name, word, ", ".join(
              part for part in ownerpicks.WALKED if part not in place.row)))
    picking = copy(place)
    picking.name = place.here("%s picked" % tag)
    kept = kept_number(place, owner_kept(word)) if kept is None else kept
    return ownerpicks.every_picked(picking, kept, pickers().get(word, 0), word, unpicked, ask,
                                   only)


def emit_counted_on(place, word, faction, total, named=None):
    """`word`'s count on one faction added to `total`; a missing step refuses that faction."""
    from framework.foreignwalk import emit_unwrapped
    hops = declared(word)[1]
    guard(not membercount.each_of(word), "`%s` %s" % (word, PER_HOLDER))
    # ⛔ BY THE WAY THERE, never a kind: a last question asked with no member test is the count
    answered = "." in hops[-1] and not only_of(word)
    at, out = faction, []
    for step, hop in enumerate(hops):
        if "." in hop:
            got = place.scratch_return(hop)
            out.append(place.op("Call1", dst=got, fun=place.named_function(hop), arg0=at))
        else:
            where, got = place.field_of(at, hop)
            out.append(place.op("Field", dst=got, obj=at, field=where))
        at = got
        if not (answered and step == len(hops) - 1):
            out.append((place.op("JNull", reg=at), place.refused))
    if asked.summing(word):
        return out + asked.emit_summed(place, word, at, total, named)
    if answered:
        return out + [place.op("Add", dst=total, a=total, b=at)]
    held, length, unwrapping = emit_unwrapped(place, at, place.refused)
    out += unwrapping
    if not only_of(word):
        return out + [place.op("Add", dst=total, a=total, b=length)]
    from copy import copy
    only = only_of(word)
    index, one = place.scratch_like(length), place.scratch_of("Dyn")
    member = place.scratch_of(only[0][0].rsplit(".", 1)[0])
    walking, skip, counted = (place.here("%s, %s" % (word, what)) for what in (
        "the next member", "this member not counted", "every member counted"))
    asking = copy(place)
    asking.refused = skip
    # ⛔ ONE jump back per walk: a member not counted goes forward to the shared turn
    return out + [
        place.op("Int", dst=index, ptr=place.number(NOTHING_SPELLED)),
        walking + ":", place.op("Label"),
        (place.op("JSGte", a=index, b=length), counted),
        place.op("GetArray", dst=one, array=held, index=index),
        place.op("Incr", dst=index),
        (place.op("JNull", reg=one), skip),
        place.op("UnsafeCast", dst=member, src=one)] + membercount.emit_asked(
        asking, member, only) + [place.op("Incr", dst=total),
        skip + ":", place.op("Label"),
        (place.op("JAlways"), walking),
        counted + ":", place.op("Label")]


def install(bc):
    """Check each multiplier names what it counts and the way there, before any road asks."""
    for word in words_of():
        asked, hops, bands = declared(word)
        kind_named(bc, asked)
        for hop in hops:
            if "." in hop:
                function_named(bc, hop)
        for asked, _field in only_of(word):
            function_named(bc, asked)
        for floor, _band in bands:
            number(bc, floor)
    number(bc, NOTHING_SPELLED)
    return ("MULTIPLIER MATCH: %d multiplier(s), each counting what its own file names -- %s -- "
            "on the holder, or on its owner when the holder is not what it counts on; "
            "a tally per word under the application, so a repeat scales again and every act "
            "scales by them all" % (len(words_of()), ", ".join(
                "`%s` on %s by %s%s" % ((word,) + declared(word)[:1] + (" then ".join(
                    declared(word)[1]),) + (
                    "" if not only_of(word) else ", only where %s" % " and ".join(
                        "not " * (_f == membercount.SAYS_NO) + asked
                        for asked, _f in only_of(word)),))
                for word in words_of())))
