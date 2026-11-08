#!/usr/bin/env python3
"""The member counts' scaling: each group of the row's list walked over its word's members."""
import copy
import importlib
from types import SimpleNamespace

from tools.project import guard
from framework import columns, questions
from framework.membercount import (GROUP, LISTED_BY, MEMBER_BY, SCALED, TRAIT, TURNED, UNLESS_BY,
                                   UNTYPED,
                                   counters, each_of, emit_asked, entity_of, inner_hops, kind_of,
                                   matched_by_unit, member_questions, module, narrowers,
                                   narrowers_on)
from framework.memberchain import chained, chained_on
from framework.names import module_of, vocabulary
from framework.ownermatch import OWNED_ONCE, emit_owner_counted
from framework.rowreader import READ_COLUMN, STARTS_AT


def _turned_to(place, exit, name):
    """The same place, its refusals leaving at `exit` and its own places named after `name`."""
    turned = copy.copy(place)
    turned.refused, turned.name = exit, place.here(name)
    return turned


def _shared(place):
    """The places every counting word's walk shares: the row's list, its marks, one name read."""
    from framework import scopematch
    from framework.tray import ARRAY_OF_ENTRIES as A_LIST, BACKING_ON, COUNT_ON
    s = SimpleNamespace(listed=place.row[columns.PART_FOR_MEMBERS])
    s.g = place.scratch_of("I32")
    s.zero, s.one, s.kept = (place.scratch_like(s.g) for _ in range(3))
    s.entries_at, s.entries = place.field_of(A_LIST, COUNT_ON)
    s.backing_at, s.backing = place.field_of(A_LIST, BACKING_ON)
    s.got = place.scratch_return(READ_COLUMN)
    s.name = place.scratch_arg(scopematch.BASE_KIND_MATCHES, 0)
    s.groups = {c: place.scratch_like(s.name) for c in counters()}
    s.marks = {n: place.scratch_like(s.name) for n in narrowers() if not chained(n)}
    s.turned = {n: place.scratch_like(s.name) for n in s.marks}
    s.owned = {OWNED_ONCE: place.scratch_like(s.name)}
    s.untyped = place.scratch_like(s.name)
    s.outer, s.outer_next, s.onwards, s.done = (place.here("counts, %s" % what) for what in (
        "the next group", "past this group", "owner counted", "scaled"))
    return s


def _places(place, word, shared):
    """Every place one counting word's walk uses, and every exit it jumps to, made once."""
    s = copy.copy(shared)
    s.word, s.only = word, member_questions(module(word))
    # the list it counts is reached off the payee when its group is met, never once a pass
    s.members = s.length = None
    (s.j, s.m, s.count, s.typed, s.matched) = (place.scratch_of("I32") for _ in range(5))
    s.member = place.scratch_return(READ_COLUMN)
    member = getattr(module(word), MEMBER_BY, None)
    s.unit = place.scratch_of(entity_of(word)) if member is None else (
        place.scratch_arg(*member))
    (s.opened, s.walking, s.member_next, s.counted, s.entry, s.entry_next, s.judged,
     s.passes) = (place.here("%s, %s" % (word, what)) for what in (
        "a group opens", "the next member", "past this member", "counted", "the next name",
        "past this name", "judged", "counted this member"))
    inline = [n for n in narrowers_on(word) if not (chained(n) or chained_on(word, n))]
    s.at = {n: place.here("%s, %s" % (word, n)) for n in inline}
    s.not_at = {n: place.here("%s, not %s" % (word, n)) for n in inline}
    s.not_of = place.here("%s, not of the type" % word)
    s.own_marks = {n: s.marks[n] for n in inline}
    s.own_turned = {n: s.turned[n] for n in inline}
    return s


def _the_next(place, s, at, missing, empty):
    """The name at `at`, stepped past: past the end leaves at `missing`, nothing at `empty`."""
    return [(place.op("JSGte", a=at, b=s.entries), missing),
            place.op("GetArray", dst=s.got, array=s.backing, index=at),
            place.op("Incr", dst=at),
            (place.op("JNull", reg=s.got), empty),
            place.op("UnsafeCast", dst=s.name, src=s.got)]


def _same_text(place, ours, theirs, differ):
    """Past this, the two texts read the same, by the game's own search; else on to `differ`."""
    from framework.tray import COUNT_ON
    found = place.scratch_return(STARTS_AT)
    zero, nothing = place.scratch_like(found), place.scratch_arg(STARTS_AT, 1)
    length_at, long = place.field_of(ours, COUNT_ON)
    other = place.scratch_like(long)
    return [place.op("Int", dst=zero, ptr=place.number(0)),
            place.op("Null", dst=nothing),
            place.op("Call3", dst=found, fun=place.named_function(STARTS_AT), arg0=ours,
                     arg1=theirs, arg2=nothing),
            (place.op("JNotEq", a=found, b=zero), differ),
            place.op("Field", dst=long, obj=ours, field=length_at),
            place.op("Field", dst=other, obj=theirs, field=length_at),
            (place.op("JNotEq", a=long, b=other), differ)]


def _matches(place, s):
    """Past this, the member is of the type `s.name` names; else on to `place.refused`."""
    from framework import scopematch
    if matched_by_unit(s.word):
        return scopematch.emit_the_named_unit_matches(place, s.unit, s.name, s.one)
    marked = _marked_scope(s)
    # a count of things never named (`PerZone`) has no type a member could be of
    if module(s.word).TARGET == "never":
        return [(place.op("JAlways"), place.refused)]
    if getattr(marked, "MARKED_ASKS", None):
        return scopematch.emit_the_named_trait_is_carried(
            place, s.unit, s.name, s.one, marked.MARKED_ASKS, marked.MARKED_THROUGH, s.word)
    id_at, its_id = place.field_of(s.unit, _marked_scope(s).MARKED_ID)
    return [place.op("Field", dst=its_id, obj=s.unit, field=id_at),
            (place.op("JNull", reg=its_id), place.refused)] + _same_text(
        place, its_id, s.name, place.refused)


def _marked_scope(s):
    """The scope whose marked spelling a counting word's own matches a type the way of."""
    return module_of(vocabulary()[module(s.word).MARKED_AS])


def _traits(place, s):
    """Each narrowing on the group asked of the member ONCE: a no drops it; turned, a yes does."""
    words, out, turned = vocabulary(), [], place.scratch_of("I32")
    # ⛔ ONE YES AND ONE NO PER GROUP, every narrowing's answer joining them: a word costs its ask
    yes, no = (place.here("%s asks, %s" % (s.word, what)) for what in ("yes", "no"))
    for word in sorted(s.own_marks):
        tag = "%s asks %s" % (s.word, word)
        ask = place.here("%s, asked" % tag)
        # nothing named passes it, turned or not, as a yes would
        asked = questions.one_narrowing(place, s, module_of(words[word]),
                                        (_turned_to(place, no, tag), yes, tag), words[word].target)
        out += [s.at[word] + ":", place.op("Label"), place.op("Int", dst=turned, ptr=place.number(
            0)), (place.op("JAlways"), ask), s.not_at[word] + ":", place.op("Label"),
                place.op("Int", dst=turned, ptr=place.number(1)), ask + ":", place.op("Label")
                ] + asked + [(place.op("JAlways"), yes)]
    return out and out + [
        yes + ":", place.op("Label"), (place.op("JEq", a=turned, b=s.zero), s.entry_next),
        (place.op("JAlways"), s.member_next), no + ":", place.op("Label"),
        (place.op("JEq", a=turned, b=s.zero), s.member_next),
        (place.op("JAlways"), s.entry_next)]


def _chained(place, s):
    """The chained narrowings asked of the member by one call: passed, on; refused, dropped."""
    from framework import memberchain
    guard((memberchain.PASSES, memberchain.REFUSED) == (1, 2), "the chain's answers moved")
    verdict = place.scratch_of("I32")
    return memberchain.emit_asked(place, s.unit, s.name, verdict) + [
        (place.op("JEq", a=verdict, b=s.one), s.entry_next),
        (place.op("JSGt", a=verdict, b=s.one), s.member_next)] + memberchain.owners(place, s)


def _per_name(place, s):
    """One member against its group's names: of ANY type named, carrying EVERY trait named."""
    # a type left out: a member of it is dropped, any other goes on to the next name
    left_out = [s.not_of + ":", place.op("Label")] + _the_next(
        place, s, s.j, s.judged, s.member_next) + _matches(
        _turned_to(place, s.entry_next, "%s not of the type" % s.word), s) + [
        (place.op("JAlways"), s.member_next)]
    return [place.op("Int", dst=s.typed, ptr=place.number(0)),
            place.op("Int", dst=s.matched, ptr=place.number(0)),
            place.op("Mov", dst=s.j, src=s.g),
            s.entry + ":", place.op("Label")] + _the_next(
        place, s, s.j, s.judged, s.entry_next) + [
        (place.op("JEq", a=s.name, b=mark), s.judged) for _c, mark in sorted(s.groups.items())
    ] + [
        (place.op("JEq", a=s.name, b=mark), s.judged) for _o, mark in sorted(s.owned.items())
    ] + [
        (place.op("JEq", a=s.name, b=mark), s.at[word])
        for word, mark in sorted(s.own_marks.items())
    ] + [
        (place.op("JEq", a=s.name, b=mark), s.not_at[word])
        for word, mark in sorted(s.own_turned.items())
    ] + _chained(place, s) + [(place.op("JEq", a=s.name, b=s.untyped), s.not_of),
         place.op("Int", dst=s.typed, ptr=place.number(1)),
         (place.op("JNotEq", a=s.matched, b=s.zero), s.entry_next)
         ] + _matches(_turned_to(place, s.entry_next, "%s of the type" % s.word), s) + [
        place.op("Int", dst=s.matched, ptr=place.number(1)),
        (place.op("JAlways"), s.entry_next)] + _traits(place, s) + left_out + [
        s.entry_next + ":", place.op("Label"),
        (place.op("JAlways"), s.entry),
        s.judged + ":", place.op("Label"),
        (place.op("JEq", a=s.typed, b=s.zero), s.passes),
        (place.op("JEq", a=s.matched, b=s.zero), s.member_next),
        s.passes + ":", place.op("Label")]


def _the_member(place, s):
    """The member read as what the game takes it for; a member it would not count is passed."""
    if getattr(module(s.word), MEMBER_BY, None) is not None:
        return [place.op("ToVirtual", dst=s.unit, src=s.member)]
    out = [place.op("UnsafeCast", dst=s.unit, src=s.member)]
    for named in getattr(module(s.word), UNLESS_BY, ()):
        said = place.scratch_return(named)
        out += [place.op("Call1", dst=said, fun=place.named_function(named), arg0=s.unit),
                (place.op("JTrue", cond=said), s.member_next)]
    return out + _judged(place, s) + _its_words_questions(place, s)


def _its_words_questions(place, s):
    """The questions of the word whose group this is (`PerVillage`: a village?); a no passes it."""
    onlys, no = getattr(s, "onlys", [s.only]), _turned_to(place, s.member_next, "%s asked" % s.word)
    if len(set(onlys)) == 1:
        return emit_asked(no, s.unit, onlys[0])
    spare, done = place.scratch_of("I32"), place.here("%s, its word's questions asked" % s.word)
    out = []
    for k, only in enumerate(onlys):
        other = place.here("%s, not its word %d" % (s.word, k))
        out += [place.op("Int", dst=spare, ptr=place.number(k)),
                (place.op("JNotEq", a=s.which, b=spare), other)] + emit_asked(
            _turned_to(no, s.member_next, "%s, word %d" % (s.word, k)), s.unit, only) + [
            (place.op("JAlways"), done), other + ":", place.op("Label")]
    return out + [done + ":", place.op("Label")]


def _per_member(place, s, fresh=True, counted=None):
    """Every member of the counted list the word counts, counted when it answers its group."""
    counted = s.counted if counted is None else counted
    return [place.op("Int", dst=s.count, ptr=place.number(0))] * fresh + [
            place.op("Int", dst=s.m, ptr=place.number(0)),
            s.walking + ":", place.op("Label"),
            (place.op("JNull", reg=s.members), counted),
            (place.op("JSGte", a=s.m, b=s.length), counted),
            place.op("GetArray", dst=s.member, array=s.members, index=s.m),
            place.op("Incr", dst=s.m),
            (place.op("JNull", reg=s.member), s.member_next)] + _the_member(
        place, s) + _per_name(place, s) + [
        place.op("Incr", dst=s.count),
        s.member_next + ":", place.op("Label"),
        (place.op("JAlways"), s.walking),
        counted + ":", place.op("Label")]


def _per_each(place, s, fresh=True):
    """A word whose members are held per thing it owns: each thing's own list walked in turn."""
    from framework.foreignwalk import emit_unwrapped
    each = place.scratch_of(each_of(s.word))
    one, k = place.scratch_return(READ_COLUMN), place.scratch_like(s.length)
    walking, past, inner = (place.here("%s, %s" % (s.word, what)) for what in (
        "the next one it is held per", "past that one", "its members counted"))
    out = [place.op("Int", dst=s.count, ptr=place.number(0))] * fresh + [
           place.op("Int", dst=k, ptr=place.number(0)),
           walking + ":", place.op("Label"),
           (place.op("JNull", reg=s.members), s.counted),
           (place.op("JSGte", a=k, b=s.length), s.counted),
           place.op("GetArray", dst=one, array=s.members, index=k),
           place.op("Incr", dst=k),
           (place.op("JNull", reg=one), past),
           place.op("UnsafeCast", dst=each, src=one)]
    at = each
    for hop in inner_hops(s.word):
        where, got = place.field_of(at, hop)
        out += [place.op("Field", dst=got, obj=at, field=where),
                (place.op("JNull", reg=got), past)]
        at = got
    inside = copy.copy(s)
    inside.members, inside.length, unwrapping = emit_unwrapped(place, at, past)
    return out + unwrapping + _per_member(place, inside, fresh=False, counted=inner) + [
        past + ":", place.op("Label"),
        (place.op("JAlways"), walking),
        s.counted + ":", place.op("Label")]


def _picked_members(place, s):
    """With an owner word on the counting word (`PerEnemyTUnit2`): a group counted per faction."""
    from framework import multmatch
    from framework.foreignwalk import emit_unwrapped
    word = s.word
    if word not in multmatch.pickers():
        return []
    if questions.picked_counts_itself(word):
        return _judging(place, s)
    unpicked = place.here("%s, no owner word" % word)
    hops = multmatch.declared(word)[1]

    def per_faction(asked, faction):
        turned = _turned_to(asked, asked.refused, word)
        each = _places(turned, word, _shared(turned))
        for kept in ("g", "groups", "marks", "turned", "own_marks", "own_turned", "untyped",
                     "owned", "zero", "one", "entries", "backing", "count", "onlys", "which"):
            if hasattr(s, kept):
                setattr(each, kept, getattr(s, kept))
        at, out = faction, []
        for hop in hops[:len(hops) - len(inner_hops(word))]:
            if "." in hop:
                got = asked.scratch_return(hop)
                out.append(asked.op("Call1", dst=got, fun=asked.named_function(hop), arg0=at))
            else:
                where, got = asked.field_of(at, hop)
                out.append(asked.op("Field", dst=got, obj=at, field=where))
            out.append((asked.op("JNull", reg=got), asked.refused))
            at = got
        each.members, each.length, unwrapping = emit_unwrapped(asked, at, asked.refused)
        walked = _per_each if each_of(word) else _per_member
        return out + unwrapping + walked(turned, each, fresh=False)

    return [place.op("Int", dst=s.count, ptr=place.number(0))] + multmatch.emit_each_picked(
        place, word, word, unpicked, per_faction, kept=s.kept) + [
        (place.op("JAlways"), s.counted), unpicked + ":", place.op("Label")]


def _judging(place, s):
    """`PerEnemyFaction_HasTDev2`: the game's list walked ONCE, each member judged by the word."""
    from framework.foreignwalk import WHOSE_RULE
    from framework.multmatch import pickers
    from framework.narrowmatch import owner_mask
    from framework.ownermatch import ASKED_ON
    s.this = place.scratch_like(s.kept)
    unowned = place.here("%s, no owner word" % s.word)
    s.mine, to_mine = place.narrowed(place.row[WHOSE_RULE], place.scratch_of(ASKED_ON),
                                     goes_to=s.counted)
    return [place.op("Int", dst=s.this, ptr=place.number(owner_mask(pickers()[s.word]))),
            place.op("And", dst=s.this, a=s.kept, b=s.this),
            (place.op("JEq", a=s.this, b=s.zero), unowned)] + to_mine + [
        unowned + ":", place.op("Label")]


def _judged(place, s):
    """Past this, a member the owner word on its count picks, judged against the writer."""
    from framework.ownermatch import emit_judged
    if getattr(s, "this", None) is None:
        return []
    picked = place.here("%s, a member its owner word picks" % s.word)
    return [(place.op("JEq", a=s.this, b=s.zero), picked)] + emit_judged(
        _turned_to(place, s.member_next, "%s, its owner word" % s.word), s.this, s.mine,
        s.unit) + [
        picked + ":", place.op("Label")]


def _reached(place, s):
    """The word's list reached off the payee into `s.members`; with none, a count of 0."""
    from framework import multmatch
    from framework.foreignwalk import emit_unwrapped
    from framework.scopematch import PAYEE
    asked, hops = multmatch.declared(s.word)[:2]
    out, payee = [place.op("Int", dst=s.count, ptr=place.number(0))], place.row.get(PAYEE)
    # a word counting the game's own list (`PerFaction`) reaches it off the game, not the payee
    if getattr(module(s.word), LISTED_BY, None):
        s.members, s.length, every = importlib.import_module(
            getattr(module(s.word), LISTED_BY)).emit_every(place, s.counted)
        return out + every
    if payee is None:
        return out + [(place.op("JAlways"), s.counted)]
    at, cast = place.narrowed(payee, place.scratch_of(asked), goes_to=s.counted)
    out += [(place.op("JNull", reg=payee), s.counted)] + list(cast)
    for hop in hops[:len(hops) - len(inner_hops(s.word))]:
        if "." in hop:
            got = place.scratch_return(hop)
            out.append(place.op("Call1", dst=got, fun=place.named_function(hop), arg0=at))
        else:
            where, got = place.field_of(at, hop)
            out.append(place.op("Field", dst=got, obj=at, field=where))
        out.append((place.op("JNull", reg=got), s.counted))
        at = got
    s.members, s.length, unwrapping = emit_unwrapped(place, at, s.counted)
    return out + unwrapping


def _one_word(place, s, count, end):
    """One counting word's group counted into `count`: per picked faction, else the payee's."""
    # the owner word first: a word judging its members (`PerFaction`) says so to its walk
    picked = _picked_members(place, s)
    reaching = _reached(place, s)
    walked = _per_each(place, s) if each_of(s.word) else _per_member(place, s)
    return [s.opened + ":", place.op("Label")] + picked + reaching + walked + [
        place.op("Mov", dst=count, src=s.count), (place.op("JAlways"), end)]


def _marks(place, shared):
    """Every mark the walk compares a name against, read once."""
    texts = [(shared.groups[w], GROUP % kind_of(w)) for w in sorted(shared.groups)] + [
        (shared.marks[w], TRAIT % w) for w in sorted(shared.marks)] + [
        (shared.turned[w], TURNED % w) for w in sorted(shared.turned)] + [
        (mark, text) for text, mark in sorted(shared.owned.items())] + [
        (shared.untyped, UNTYPED)]
    return [place.op("GetGlobal", **{"dst": mark, "global": place.text_object(text)})
            for mark, text in texts]


def _same_walk(word):
    """What two counting words share walking one list one way; only their questions differ."""
    from framework.multmatch import declared, pickers
    own = module(word)
    return (declared(word)[1], each_of(word), getattr(own, MEMBER_BY, None), narrowers_on(word),
            own.MARKED_AS, own.TARGET, word in pickers())


_TEAMS = {}


def teams():
    """{the first counting word of each walk: every word walking it}, in a settled order."""
    # worked out once per word list: each ask reads every word's file again
    key = tuple(counters())
    if key not in _TEAMS:
        out = {}
        for word in key:
            out.setdefault(_same_walk(word), []).append(word)
        _TEAMS[key] = {team[0]: tuple(team) for team in out.values()}
    return dict(_TEAMS[key])


def walks():
    """Jumps back: a group's, per walk its loops, then each shared owner-after narrowing's."""
    return 1 + sum(2 + bool(each_of(lead)) for lead in teams()) + sum(
        1 + getattr(module(n), "WALKS", 0) * (1 + bool(getattr(module(n), "BARE_ASKS_ITSELF", 0)))
        for n in narrowers() if getattr(module(n), "OWNER_AFTER", False))


def _dispatched(place, s, count):
    """The group `s.name` opens counted into `count`; -1 when the name opens no group."""
    # ⛔ ONE WALK PER LIST: `PerVillage` enters `PerStructure`'s, saying which word it is
    which = place.scratch_of("I32")
    met = {w: place.here("%s, its group met" % w) for w in counters()}
    each, stubs = {lead: _places(place, lead, s) for lead in teams()}, []
    for lead, team in teams().items():
        each[lead].onlys, each[lead].which = [member_questions(module(w)) for w in team], which
        stubs += [op for k, w in enumerate(team) for op in [
            met[w] + ":", place.op("Label"), place.op("Int", dst=which, ptr=place.number(k)),
            (place.op("JAlways"), each[lead].opened)]]
    end = place.here("counts, this group counted")
    return _marks(place, s) + [
        place.op("Int", dst=s.zero, ptr=place.number(0)),
        place.op("Int", dst=s.one, ptr=place.number(1)),
        place.op("Field", dst=s.entries, obj=s.listed, field=s.entries_at),
        place.op("Field", dst=s.backing, obj=s.listed, field=s.backing_at)] + [
        (place.op("JEq", a=s.name, b=s.groups[word]), met[word]) for word in counters()] + [
        place.op("Int", dst=count, ptr=place.number(0)), place.op("Decr", dst=count),
        (place.op("JAlways"), end)] + stubs + [
        op for lead in teams() for op in _one_word(place, each[lead], count, end)] + [
        end + ":", place.op("Label")]


# the one function counting a group of the row's list, whichever counting word opened it
GROUP_COUNTED = "a member group counted"
# a faction handed to it goes as the thing any road hands there, so all roads share that function
NARROW_AS, PAYEE_AS = "ent.Faction", "ent.Object"


def _group_count(place, shared, count):
    """The group at the name just read counted, by one function every road shares; -1 for none."""
    from framework.parsed import loaded
    from framework.pipeline import Place
    from tools.hlcode import assemble
    parts = list(place.row)
    args = [place.row[p] for p in parts]
    kinds = [place.kind_of(a) for a in args]
    if 0 in kinds:
        return _dispatched(place, shared, count)
    # ⛔ ONE COPY FOR EVERY ROAD: a faction handed as the thing other roads hand there
    narrow, wide = place.kind_of(place.scratch_of(NARROW_AS)), place.scratch_of(PAYEE_AS)
    widening = []
    for at in [i for i, k in enumerate(kinds) if k == narrow]:
        widened = place.scratch_like(wide)
        widening.append(place.op("UnsafeCast", dst=widened, src=args[at]))
        args[at], kinds[at] = widened, place.kind_of(widened)
    handed = kinds + [place.kind_of(r) for r in (shared.g, shared.kept, shared.name)]

    def body(hands):
        n = len(parts)
        made = Place(GROUP_COUNTED, {p: i for i, p in enumerate(parts)}, {}, None, None, None,
                     "%s: refused" % GROUP_COUNTED, hands)
        s = _shared(made)
        s.g, s.kept, s.name = n, n + 1, n + 2
        held = made.scratch_of("I32")
        return assemble(loaded(made, _dispatched(made, s, held)) + [
            made.op("Ret", ret=held), made.refused + ":", made.op("Label"),
            made.op("Int", dst=held, ptr=made.number(0)), made.op("Ret", ret=held)])
    shared_fn = place._hands["shared"]((GROUP_COUNTED,) + tuple(handed), handed,
                                       place.kind_of(count), body)
    return widening + [place.op("CallN", dst=count, fun=shared_fn, args=args + [
        shared.g, shared.kept, shared.name])]


def emit_scaled(place, amount):
    """`amount` times each group's count, once per group the row's list holds."""
    shared = _shared(place)
    count, by = place.scratch_of("I32"), place.scratch_like(amount)
    widened = [place.op("ToSFloat", dst=by, src=count)] if (
        place.kind_of(amount) != place.kind_of(count)) else [place.op("Mov", dst=by, src=count)]
    owned = shared.owned[OWNED_ONCE]
    return [(place.op("JNull", reg=shared.listed), shared.done),
            place.op("GetGlobal", **{"dst": owned, "global": place.text_object(OWNED_ONCE)}),
            place.op("Int", dst=shared.zero, ptr=place.number(0)),
            place.op("Int", dst=shared.g, ptr=place.number(0)),
            place.op("Field", dst=shared.entries, obj=shared.listed, field=shared.entries_at),
            place.op("Field", dst=shared.backing, obj=shared.listed, field=shared.backing_at),
            place.op("Int", dst=shared.kept, ptr=place.number(0)),
            shared.outer + ":", place.op("Label"),
            ] + _the_next(place, shared, shared.g, shared.done, shared.outer_next) + (
        emit_owner_counted(place, "counts", shared.name, shared.kept, owned, shared.onwards)
    ) + _group_count(place, shared, count) + [
        (place.op("JSLt", a=count, b=shared.zero), shared.outer_next)] + widened + [
        place.op("Mul", dst=amount, a=amount, b=by),
    ] + place.said("respath", lambda: place.said_now(SCALED)) + [
        shared.outer_next + ":", place.op("Label"),
        place.op("Int", dst=shared.kept, ptr=place.number(0)),
        shared.onwards + ":", place.op("Label"),
        (place.op("JAlways"), shared.outer),
        shared.done + ":", place.op("Label")]
