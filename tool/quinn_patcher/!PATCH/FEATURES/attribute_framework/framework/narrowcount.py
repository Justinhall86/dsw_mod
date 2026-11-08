#!/usr/bin/env python3
"""A word narrowing the multiplier on its left: its count is what the game lists per name."""
from types import SimpleNamespace

from tools.project import gv, guard
from tools.hlcode import function_named, number, returns_type, template, text_object, written
from framework import columns, turned
from framework.names import module_of, vocabulary
from framework.rowreader import READ_COLUMN

# a narrower is a modifier: a trailing word changing the list of the word on its left
FAMILY = "modifiers"
# what its file names: the game's list of what matches one name, whose length is the count
LISTS_BY = "LISTS"
# its tally and what it asks, kept under the same names a multiplier's are
TIMES, COUNTED = "times %s", "counted"
# whether the multiplier on its left is still unnarrowed, and a place to compare against
BARE, SPARE = "bare before %s", "a spare for the narrowers"
NOTHING, SPELLED = 0, 1
# ⛔ ONE LIST PER ROW, IN GROUPS: a narrowed count opens on its word's mark; its names follow
GROUP = "|counted by %s"
# and a narrowing word's own group (`HasDevs_OfTDomain2`): names it weighs, never a multiplier's
WEIGHED, WEIGHS = "|weighed by %s", "weighed before %s"
# and an effect's (`GainDevs_OfTDomain2`): names it picks from, never a trigger's or a narrowing's
PICKED, PICKING = "|picked by %s", 2
# and a trigger's (`OnDev_OfTDomain2`): weighed like a narrowing's, and it may leave its names out
FIRING = 3
# right after a group's mark when `Not` was glued in (`PerDev_NotOfTDomain2`): names left out
LEFT_OUT = "|left out by %s"
# whether the group last opened by a word was turned, so a turned name joins only a turned group
TURNS = "turned before %s"
# said once a game per word, where an amount was scaled, by a multiplier or a narrowed count
SCALED = "SPINE an amount was scaled by %s"
# said once a game per word, at the gate its name passed: a count of its own, or the last one's
OPENED = "SPINE `%s` opened a count of its own"
ADDED = "SPINE `%s` added a name to the count on its left"


def lists_of(word):
    """The game's list a word asks per name, or nothing for a word that narrows nothing."""
    return getattr(module_of(word), LISTS_BY, None)


def narrowers_of(words=None):
    """Every narrowing word, in a settled order."""
    words = vocabulary() if words is None else words
    return tuple(sorted(s for s, w in words.items() if w.family == FAMILY and lists_of(w)))


def lists_named(spelling):
    """The game's list one narrower, by its spelling, asks."""
    return lists_of(vocabulary()[spelling])


def fed_by(narrower, words=None):
    """The one multiplier whose count a narrower narrows by list: it offers what it needs."""
    from framework import membercount, multmatch, trailing
    words = vocabulary() if words is None else words
    needed = set(trailing.needs_of(words[narrower]))
    # a count taken member by member is narrowed member by member, never by the game's list
    feeders = [s for s in multmatch.words_of(words) if s not in membercount.counters(words)
               and needed & set(trailing.offers_of(words[s]))]
    guard(len(feeders) == 1, "`%s` needs %s, and %d multiplier(s) offer it: %s"
          % (narrower, needed, len(feeders), ", ".join(feeders)))
    return feeders[0]


NAMES = tuple(TIMES % word for word in narrowers_of())
READS = tuple("%s.%s" % (COUNTED, word) for word in narrowers_of()) + (columns.PART_FOR_COUNT,)
PLACES = tuple(BARE % word for word in narrowers_of()) + tuple(
    WEIGHS % word for word in narrowers_of()) + tuple(
    TURNS % word for word in narrowers_of()) + (SPARE,)


def _op(bc, name, **operands):
    """One instruction of the game's own shape."""
    return written(template(bc, name), **operands)


def emit_forget(bc, r, listed=None):
    """Every narrower's multiplier unmarked and the row's names emptied, before an id is read."""
    emptied = [] if listed is None else [_op(bc, "Null", dst=listed)]
    return [_op(bc, "Int", dst=r[place % word], ptr=number(bc, NOTHING))
            for word in narrowers_of() for place in (BARE, WEIGHS, TURNS)] + emptied


def emit_feeding(bc, r, word):
    """A multiplier just spelled: each narrower it feeds may now narrow that one."""
    return [_op(bc, "Int", dst=r[place % narrower], ptr=number(bc, value))
            for narrower in narrowers_of() if fed_by(narrower) == word
            for place, value in ((BARE, SPELLED), (WEIGHS, NOTHING))]


def weighed_by(word, family="narrowing"):
    """The narrowers a NARROWING word feeds: those whose need it offers."""
    from framework import trailing
    if word.family != family:
        return ()
    offered = trailing.offers_of(word)
    return tuple(n for n in narrowers_of()
                 if set(trailing.needs_of(vocabulary()[n])) & set(offered))


def emit_weighing(bc, r, word):
    """A narrowing, trigger or effect word just spelled: each narrower it feeds opens a group."""
    opened = [(n, SPELLED) for n in weighed_by(word)] + [
        (n, FIRING) for n in weighed_by(word, "triggers")] + [
        (n, PICKING) for n in weighed_by(word, "effects")]
    return [_op(bc, "Int", dst=r[place % narrower], ptr=number(bc, value))
            for narrower, opens in opened
            for place, value in ((WEIGHS, opens), (BARE, NOTHING))]


def _marked(bc, word, listed, hands, group=GROUP):
    """The word's group mark pushed onto the row's names: the names after it are its count's."""
    from framework.parammatch import emit_pushed
    from framework.rowreader import reader_for
    held = hands["place"](reader_for(bc).text_kind)
    mark = text_object(bc, group % word)
    return [_op(bc, "GetGlobal", **{"dst": held, "global": mark})] + (
        emit_pushed(bc, held, listed, hands))


def multmatch_unclaimed(bc, r, fed, tag):
    """The narrowed copy's owner word tally given back, through the two spares."""
    from framework.membercount import SPARE as OTHER
    from framework.multmatch import emit_unclaimed
    return emit_unclaimed(bc, r, fed, tag, r[SPARE], r[OTHER])


def owners_of(word):
    """Every owner word a group of `word` may carry; none when its count takes no owner word."""
    from framework.multmatch import pickers
    from framework.ownermatch import numbers
    return sorted(numbers()) if fed_by(word) in pickers() else []


def owner_read(bc, r, word, into, spare):
    """The owner word kept for `word`'s latest copy, read off the row's list into `into`."""
    from framework.multmatch import owner_kept, pickers
    from framework.narrowmatch import KEPT_HAND, owner_mask
    return r[KEPT_HAND].get(owner_kept(word), into) + [
        _op(bc, "Int", dst=spare, ptr=number(bc, owner_mask(pickers()[word]))),
        _op(bc, "And", dst=into, a=into, b=spare)]


def _marked_owned(bc, r, word, listed, hands, tag):
    """The group's mark, after the owner word on the copy it narrows when there is one."""
    from framework.membercount import SPARE as OTHER
    from framework.ownermatch import emit_owner_marks
    if not owners_of(word):
        return _marked(bc, word, listed, hands)
    return owner_read(bc, r, fed_by(word), r[SPARE], r[OTHER]) + emit_owner_marks(
        bc, r[SPARE], r[OTHER], listed, hands, tag) + _marked(bc, word, listed, hands)


def keyed(word, block):
    """A narrower's block, keyed by the kind it narrows by list when it needs several kinds."""
    from framework import membercount, trailing
    needed = trailing.needs_of(word)
    if len(needed) == 1:
        return block
    by_list = [k for k in needed if k not in membercount.narrows_too(module_of(word))]
    guard(len(by_list) == 1, "`%s` needs %s, and one is narrowed by list" % (word, needed))
    return {by_list[0]: block}


def branch(bc, r, one, column, listed, hands):
    """A narrower spelled: a bare multiplier on its left opens a group; else the last grows."""
    from framework.multmatch import tallied
    from framework.parammatch import emit_added
    from framework.parsed import TAKE
    word = one.word.spelling
    fed = fed_by(word)
    listing = one.targeted and listed is not None
    already = "%s: its multiplier is narrowed already" % one.text
    named = "%s: its name listed" % one.text

    def opens(group, where, mark=None):
        """The group's mark, its `Not` mark when turned, and whether it was turned kept."""
        return (mark or _marked(bc, word, listed, hands, group)) + turned.emit_left_out(
            bc, hands, r[SPARE], r[SPARE], _marked(bc, word, listed, hands, LEFT_OUT),
            "%s %s" % (one.text, where)) + turned.emit_kept(
            bc, hands, r[SPARE], r[TURNS % word], "%s %s" % (one.text, where))
    opened = opens(GROUP, "opened", _marked_owned(bc, r, word, listed, hands, one.text) + hands[
        "say"](OPENED % word)) if listing else []
    added = turned.emit_unturnable(bc, hands, r[SPARE], word, one.text + " added", r[
        TURNS % word]) + hands["say"](ADDED % word) if listing else []
    counted = "%s: no narrowing word on its left" % one.text
    weighed = opens(WEIGHED, "weighed") if listing else []
    picked = opens(PICKED, "picked") if listing else []
    picking = "%s: an effect picks from its names" % one.text
    fired = opens(WEIGHED, "fired") if listing else []
    firing = "%s: a trigger fires on its names" % one.text
    return [_op(bc, "Int", dst=r[SPARE], ptr=number(bc, NOTHING)),
            (_op(bc, "JEq", a=r[WEIGHS % word], b=r[SPARE]), counted),
            _op(bc, "Int", dst=r[SPARE], ptr=number(bc, PICKING)),
            (_op(bc, "JEq", a=r[WEIGHS % word], b=r[SPARE]), picking),
            _op(bc, "Int", dst=r[SPARE], ptr=number(bc, FIRING)),
            (_op(bc, "JEq", a=r[WEIGHS % word], b=r[SPARE]), firing),
            _op(bc, "Int", dst=r[WEIGHS % word], ptr=number(bc, NOTHING))] + weighed + [
            (_op(bc, "JAlways"), named),
            firing + ":", _op(bc, "Label"),
            _op(bc, "Int", dst=r[WEIGHS % word], ptr=number(bc, NOTHING))] + fired + [
            (_op(bc, "JAlways"), named),
            picking + ":", _op(bc, "Label"),
            _op(bc, "Int", dst=r[WEIGHS % word], ptr=number(bc, NOTHING))] + picked + [
            (_op(bc, "JAlways"), named),
            counted + ":", _op(bc, "Label"),
            (_op(bc, "JEq", a=r[BARE % word], b=r[SPARE]), already),
            ] + tallied(r, TIMES % fed, TAKE) + multmatch_unclaimed(bc, r, fed, one.text) + tallied(
            r, TIMES % word) + [
            _op(bc, "Int", dst=r[BARE % word], ptr=number(bc, NOTHING))] + opened + [
        (_op(bc, "JAlways"), named),
        already + ":", _op(bc, "Label")] + added + [named + ":", _op(bc, "Label")] + (
        emit_added(bc, column, listed, hands) if listing else [])


def emit_reached(bc, fn, op, site, into, owner, here):
    """What each narrower asks its list of, once a pass, reached the way its multiplier counts."""
    from framework import multmatch
    from framework.parsed import a_new_place
    out = []
    for word in narrowers_of():
        wanted = gv(list(function_named(bc, lists_named(word)).regs)[0])
        into[word] = a_new_place(bc, fn, wanted)
        out.append(op("Null", dst=into[word]))
        fed = fed_by(word)
        if fed not in here:
            continue
        at, past = (0 if here[fed] else owner), "%s: %s has nothing to ask" % (site.word, word)
        out += [] if at == 0 else [(op("JNull", reg=at), past)]
        for hop in multmatch.declared(fed)[1]:
            if gv(list(fn.regs)[at]) == wanted:
                break
            guard("." in hop, "`%s` reaches its list through the field `%s`" % (word, hop))
            door = function_named(bc, hop)
            got = a_new_place(bc, fn, returns_type(door, hop))
            out += [op("Call1", dst=got, fun=gv(door.findex), arg0=at),
                    (op("JNull", reg=got), past)]
            at = got
        guard(gv(list(fn.regs)[at]) == wanted,
              "`%s` never reaches a t@%s on the way `%s` counts" % (word, wanted, fed))
        out += [op("Mov", dst=into[word], src=at), past + ":", op("Label")]
    return out


def emit_narrowed(place, amount):
    """`amount` times each narrower's count, once for every multiplier the row narrowed with it."""
    out = []
    for word in narrowers_of():
        out += _one_narrower(place, amount, word)
    return out


def _one_narrower(place, amount, word):
    """Each of one narrower's groups summed over its names, the amount times every group's sum."""
    from framework import rescount
    from framework.ownermatch import OWNED_ONCE, emit_owner_counted
    from framework.tray import ARRAY_OF_ENTRIES as A_LIST, BACKING_ON, COUNT_ON
    from framework.parsed import kept_number
    times = kept_number(place, TIMES % word)
    listed, asks = place.row[columns.PART_FOR_COUNT], lists_named(word)
    s = SimpleNamespace(word=word, asks=asks, on=place.row["%s.%s" % (COUNTED, word)])
    zero, start, s.at, s.count, s.turned = (place.scratch_like(times) for _ in range(5))
    s.name, s.owned = place.scratch_arg(asks, 0), place.scratch_return(asks)
    s.zero, s.left_out, s.fed = zero, place.scratch_like(s.name), fed_by(word)
    marks = {w: place.scratch_like(s.name) for w in narrowers_of()}
    stops = {w: place.scratch_like(s.name) for w in narrowers_of()}
    owned = {OWNED_ONCE: place.scratch_like(s.name)}
    held = {text: place.scratch_like(s.name) for text in rescount.every_mark()}
    s.ends = [mark for _w, mark in sorted(marks.items()) + sorted(stops.items())
              + sorted(owned.items()) + sorted(held.items())]
    s.kept = place.scratch_like(times)
    s.got = place.scratch_return(READ_COLUMN)
    names_at, s.how_many = place.field_of(A_LIST, COUNT_ON)
    backing_at, s.backing = place.field_of(A_LIST, BACKING_ON)
    s.owned_at, s.owned_many = place.field_of(A_LIST, COUNT_ON)
    done, group, past, summed, onwards = (place.here("%s, %s" % (word, what)) for what in (
        "scaled", "the next group", "past this group", "summed", "owner counted"))
    by, made = s.count, []
    if place.kind_of(amount) != place.kind_of(s.count):
        by = place.scratch_like(amount)
        made = [place.op("ToSFloat", dst=by, src=s.count)]
    return [
        place.op("Int", dst=zero, ptr=place.number(NOTHING)),
        (place.op("JSGte", a=zero, b=times), done),
        (place.op("JNull", reg=listed), done),
    ] + [place.op("GetGlobal", **{"dst": mark, "global": place.text_object(GROUP % w)})
         for w, mark in sorted(marks.items())] + [
        place.op("GetGlobal", **{"dst": stop, "global": place.text_object(WEIGHED % w)})
        for w, stop in sorted(stops.items())] + [
        place.op("GetGlobal", **{"dst": mark, "global": place.text_object(text)})
        for text, mark in sorted(owned.items())] + [
        place.op("GetGlobal", **{"dst": mark, "global": place.text_object(text)})
        for text, mark in sorted(held.items())] + [
        place.op("GetGlobal", **{"dst": s.left_out,
                                 "global": place.text_object(LEFT_OUT % word)}),
        place.op("Int", dst=s.at, ptr=place.number(NOTHING)),
        place.op("Field", dst=s.how_many, obj=listed, field=names_at),
        place.op("Field", dst=s.backing, obj=listed, field=backing_at),
        place.op("Int", dst=s.kept, ptr=place.number(NOTHING)),
        group + ":", place.op("Label"),
        (place.op("JSGte", a=s.at, b=s.how_many), done),
        place.op("GetArray", dst=s.got, array=s.backing, index=s.at),
        place.op("Incr", dst=s.at),
        (place.op("JNull", reg=s.got), past),
        place.op("UnsafeCast", dst=s.name, src=s.got),
    ] + emit_owner_counted(place, word, s.name, s.kept, owned[OWNED_ONCE], onwards) + [
        (place.op("JNotEq", a=s.name, b=marks[word]), past),
        place.op("Int", dst=s.count, ptr=place.number(NOTHING)),
    ] + turned.emit_group_left_out(place, s) + _picked_names(place, s, start, summed) + (
        turned.emit_from_all(place, s, lambda p: [p.op("Mov", dst=s.count, src=place.row[
            "%s.%s" % (COUNTED, s.fed)])])) + _names(place, s, s.on, summed) + (
        turned.emit_never_below(place, s)) + made + [
        place.op("Mul", dst=amount, a=amount, b=by),
    ] + place.said("respath", lambda: place.said_now(SCALED % word)) + [
        past + ":", place.op("Label"),
        place.op("Int", dst=s.kept, ptr=place.number(NOTHING)),
        onwards + ":", place.op("Label"),
        (place.op("JAlways"), group),
        done + ":", place.op("Label")]


def _names(place, s, on, summed):
    """The group's names from `s.at` on, each one's listed length on `on` added to `s.count`."""
    name_at, stepped = (place.here("%s, %s" % (s.word, what))
                        for what in ("the next name", "past this name"))
    return [
        name_at + ":", place.op("Label"),
        (place.op("JSGte", a=s.at, b=s.how_many), summed),
        place.op("GetArray", dst=s.got, array=s.backing, index=s.at),
        (place.op("JNull", reg=s.got), stepped),
        place.op("UnsafeCast", dst=s.name, src=s.got),
    ] + [(place.op("JEq", a=s.name, b=mark), summed) for mark in s.ends] + [
        (place.op("JNull", reg=on), stepped),
        place.op("Call2", dst=s.owned, fun=place.named_function(s.asks), arg0=on, arg1=s.name),
        (place.op("JNull", reg=s.owned), stepped),
        place.op("Field", dst=s.owned_many, obj=s.owned, field=s.owned_at),
    ] + turned.emit_added_or_taken(place, s, s.owned_many) + [
        stepped + ":", place.op("Label"),
        place.op("Incr", dst=s.at),
        (place.op("JAlways"), name_at),
        summed + ":", place.op("Label")]


def _picked_names(place, s, start, summed):
    """With an owner word on the count it narrows (`PerEnemyDev_OfTDomain2`): per faction picked."""
    from framework import multmatch
    fed = fed_by(s.word)
    if fed not in multmatch.pickers():
        return []
    unpicked = place.here("%s, no owner word" % s.word)

    def per_faction(asked, faction):
        # ⛔ THE KIND ITS LIST IS ASKED OF, by the question's own class: a row's place is not one
        wanted = asked.kind_of(asked.scratch_of(s.asks.rsplit(".", 1)[0]))
        at, out = faction, []
        for hop in multmatch.declared(fed)[1]:
            if asked.kind_of(at) == wanted:
                break
            guard("." in hop, "`%s` reaches its list through the field `%s`" % (s.word, hop))
            got = asked.scratch_return(hop)
            out += [asked.op("Call1", dst=got, fun=asked.named_function(hop), arg0=at),
                    (asked.op("JNull", reg=got), asked.refused)]
            at = got
        guard(asked.kind_of(at) == wanted,
              "`%s` never reaches what it asks on the way `%s` counts" % (s.word, fed))
        from framework.multmatch import emit_counted_on
        return out + [asked.op("Mov", dst=s.at, src=start)] + turned.emit_from_all(
            asked, s, lambda p: emit_counted_on(p, fed, faction, s.count)) + _names(
            asked, s, at, asked.here("%s, summed" % s.word))

    return [place.op("Mov", dst=start, src=s.at)] + multmatch.emit_each_picked(
        place, s.word, fed, unpicked, per_faction, kept=s.kept) + [
        (place.op("JAlways"), summed), unpicked + ":", place.op("Label")]


def every_group_mark():
    """Every text that opens a group in a row's count list; member counts have a list apart."""
    from framework import rescount
    from framework.ownermatch import OWNED_ONCE
    return sorted({g % w for w in narrowers_of() for g in (GROUP, WEIGHED, PICKED, LEFT_OUT)}
                  | {OWNED_ONCE} | set(rescount.every_mark()))


def emit_weighed(place, word, listed, on, count, counted, everything):
    """The row's group by `word` summed into `count`; turned, `everything` less that sum."""
    from framework.tray import ARRAY_OF_ENTRIES as A_LIST, BACKING_ON, COUNT_ON
    asks = lists_named(word)
    at, whole, is_turned = (place.scratch_like(count) for _ in range(3))
    name, owned = place.scratch_arg(asks, 0), place.scratch_return(asks)
    mine, left = place.scratch_like(name), place.scratch_like(name)
    stops = [(text, place.scratch_like(name)) for text in every_group_mark()]
    got = place.scratch_return(READ_COLUMN)
    names_at, how_many = place.field_of(A_LIST, COUNT_ON)
    backing_at, backing = place.field_of(A_LIST, BACKING_ON)
    owned_at, owned_many = place.field_of(A_LIST, COUNT_ON)
    none, seek, skip, found, name_at, stepped, summed, plain, kept = (
        place.here("%s weighed, %s" % (word, what)) for what in (
            "no group", "the next entry", "not its mark", "its mark", "the next name",
            "past this name", "summed", "its names", "as summed"))
    return [
        (place.op("JNull", reg=listed), none),
        place.op("GetGlobal", **{"dst": mine, "global": place.text_object(WEIGHED % word)}),
        place.op("GetGlobal", **{"dst": left, "global": place.text_object(LEFT_OUT % word)}),
    ] + [place.op("GetGlobal", **{"dst": stop, "global": place.text_object(text)})
         for text, stop in stops] + [
        place.op("Int", dst=at, ptr=place.number(NOTHING)),
        place.op("Field", dst=how_many, obj=listed, field=names_at),
        place.op("Field", dst=backing, obj=listed, field=backing_at),
        seek + ":", place.op("Label"),
        (place.op("JSGte", a=at, b=how_many), none),
        place.op("GetArray", dst=got, array=backing, index=at),
        place.op("Incr", dst=at),
        (place.op("JNull", reg=got), skip),
        place.op("UnsafeCast", dst=name, src=got),
        (place.op("JEq", a=name, b=mine), found),
        skip + ":", place.op("Label"),
        (place.op("JAlways"), seek),
        found + ":", place.op("Label"),
        place.op("Int", dst=count, ptr=place.number(NOTHING)),
        place.op("Int", dst=is_turned, ptr=place.number(NOTHING)),
        (place.op("JSGte", a=at, b=how_many), plain),
        place.op("GetArray", dst=got, array=backing, index=at),
        (place.op("JNull", reg=got), plain),
        place.op("UnsafeCast", dst=name, src=got),
        (place.op("JNotEq", a=name, b=left), plain),
        place.op("Int", dst=is_turned, ptr=place.number(1)),
        place.op("Incr", dst=at),
        plain + ":", place.op("Label"),
        name_at + ":", place.op("Label"),
        (place.op("JSGte", a=at, b=how_many), summed),
        place.op("GetArray", dst=got, array=backing, index=at),
        (place.op("JNull", reg=got), stepped),
        place.op("UnsafeCast", dst=name, src=got),
    ] + [(place.op("JEq", a=name, b=stop), summed) for _text, stop in stops] + [
        place.op("Call2", dst=owned, fun=place.named_function(asks), arg0=on, arg1=name),
        (place.op("JNull", reg=owned), stepped),
        place.op("Field", dst=owned_many, obj=owned, field=owned_at),
        place.op("Add", dst=count, a=count, b=owned_many),
        stepped + ":", place.op("Label"),
        place.op("Incr", dst=at),
        (place.op("JAlways"), name_at),
        summed + ":", place.op("Label"),
        place.op("Int", dst=whole, ptr=place.number(NOTHING)),
        (place.op("JEq", a=is_turned, b=whole), kept),
    ] + everything(place, whole) + [
        place.op("Sub", dst=count, a=whole, b=count),
        place.op("Int", dst=whole, ptr=place.number(NOTHING)),
        (place.op("JSGte", a=count, b=whole), kept),
        place.op("Int", dst=count, ptr=place.number(NOTHING)),
        kept + ":", place.op("Label"),
        (place.op("JAlways"), counted),
        none + ":", place.op("Label")]


def install(bc):
    """Check each narrower's list and the one multiplier it narrows, before any road asks."""
    for word in narrowers_of():
        asked = function_named(bc, lists_named(word))
        guard(len(asked.regs) >= 2, "%s takes no name to list by" % lists_named(word))
        fed_by(word)
        text_object(bc, GROUP % word)
        text_object(bc, WEIGHED % word)
        text_object(bc, PICKED % word)
        text_object(bc, LEFT_OUT % word)
    from framework.ownermatch import OWNED_ONCE
    text_object(bc, OWNED_ONCE)
    for value in (NOTHING, SPELLED, PICKING, FIRING):
        number(bc, value)
    return ("NARROWED COUNTS: %d narrower(s) -- %s -- each opens a group of names on the bare "
            "multiplier on its left, or adds to the last; each group scales the amount once"
            % (len(narrowers_of()), ", ".join("`%s` narrows `%s` by %s" % (
                word, fed_by(word), lists_named(word)) for word in narrowers_of())))
