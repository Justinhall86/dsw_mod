"""A trigger's event: walk each faction's rows and its things', weighing the faction that acted."""
from tools.project import gv, guard
from tools.hlcode import (assemble, field_by_name, function_named, kind_named, number,
                          returns_type, template, written)
from framework import (columns, boundary, firedin, foreignwalk, triggermatch, mark, ownermatch,
                   parsed, sayonce, scopematch, storewalk, tray)
from framework import scopes
from framework.parsed import a_new_place
from framework.reach import EVERY_HOLDER as AN_OBJECT
from framework.rowreader import reader_for

# where the walk's two loops turn; `%s` is the raise's own noun, as its file names it
ROW, APP = "the %s's next row", "the %s's next application"
NEXT_ROW, NEXT_APP = "past this row", "past this application"
# AND THE OUTER WALK'S OWN TWO. A row about the actor need not be HELD by the actor
HOLDER, NEXT_HOLDER = "the next faction whose rows to weigh", "past this faction's rows"
# what the gate is called here, which is what makes its places its own
WEIGHING = "the %s's owner word"
# where the own-pass test rejoins, and where the whole block leaves
ITS_OWN = "whose pass this is, settled"
DONE = "the %s has said what it found"
# a raiser's other words its event raises too, and where a row bearing any of them rejoins
ALSO, TRIGGERED = "ALSO", "the %s's row bears one of its triggers"
# where a marked row's name that is not the event's goes, to be weighed against its `Not`
OTHER = "the %s's row names another"
# what a raiser names the test of a group its trigger opens, when it has one
FIRED = "emit_fired"
# and the walk's place holding the event's other side, when it has one (a treaty's partner)
PARTNER_BY = "PARTNER"
# and, from a raise whose event has two things (a kill), each by the name its trigger gives it
SIDES_BY = "SIDES"
# a raiser walking one side of its event: the scopes it keeps, its family test, its own actor
SCOPED, ALSO_NAMED, ACTOR = "emit_scoped", "emit_also_named", "emit_actor"
# where a name that is not the thing's own goes to ask its family, and where its family matched
MISSED, NAMED_ONE = "the %s's row names another than its own", "the %s's row names this one"
OWNED_ON = scopes.OWNED_ON
# where a store's walk begins, where it ends, and past every source of this faction
WALK, WALKED = "read this holder's rows", "this holder's rows are read"
SOURCE, LEVEL = "the %s walks the %%s things", "the %s list %d, next member"
# said once a game per source, behind the quiet switch: the raise read a thing of this scope
WALKED_ONE = "SPINE the %s read a %%s's rows"


def owned_sources(bc, faction_kind):
    """Each scope's declared hops from a faction to its things, as (spelling, steps) by name."""
    from framework.names import module_of, vocabulary
    scopes = scopematch.only_scopes(vocabulary())
    guard(set(OWNED_ON) <= set(scopes), "OWNED_ON names %s, which no scope spells"
          % sorted(set(OWNED_ON) - set(scopes)))
    declared = {tuple(hops): (spelling, module_of(scopes[spelling]).ENTITY)
                for spelling, hops in OWNED_ON.items()}
    a_list = foreignwalk.the_list_kind(bc)
    out = []
    for hops, (spelling, entity) in sorted(declared.items(), key=lambda kv: kv[1][0]):
        kind, steps = faction_kind, []
        for depth, hop in enumerate(hops):
            if "." in hop:
                fun = function_named(bc, hop)
                kind = returns_type(fun, hop)
                steps.append(("call", gv(fun.findex), kind))
                continue
            at, kind = field_by_name(bc, kind, hop, "what `%s` things hang off" % spelling)
            if kind != a_list:
                steps.append(("field", at, kind))
                continue
            # a list mid-path holds the things of the scope that declares exactly that far
            member = entity if depth == len(hops) - 1 else declared.get(hops[:depth + 1],
                                                                         (None, None))[1]
            guard(member is not None, "`%s` walks `%s`, and no scope says what it holds"
                  % (spelling, hop))
            kind = kind_named(bc, member)
            steps.append(("list", at, kind))
        guard(steps and steps[-1][0] == "list", "`%s` declares no list at its end" % spelling)
        out.append((spelling, steps))
    return out


class Places:
    """Every place the walk reads and writes, made once on the splice's function."""

    def __init__(self, bc, fn, raiser):
        self.reader = reader = reader_for(bc)
        self.faction_kind, thing_kind, running_kind = raiser.kinds(bc)
        self.keeps = keeps = storewalk.Store(bc, kind_named(bc, AN_OBJECT))
        self.faction = a_new_place(bc, fn, self.faction_kind)
        # AND THE FACTION WHOSE STORE IS WALKED, off the list the road's foreign walk reads
        self.factions = a_new_place(bc, fn, foreignwalk.the_list_kind(bc))
        # and its members, unwrapped once, for an owner word a narrowing past the trigger carries
        self.every = a_new_place(bc, fn, foreignwalk.the_backing_kind(bc))
        self.value_at, value_kind = field_by_name(bc, kind_named(bc, parsed.HELD_BY),
                                                  storewalk.THE_VALUE, "one application")
        self.value = a_new_place(bc, fn, value_kind)
        self.holder = a_new_place(bc, fn, self.faction_kind)
        # the holder whose store is read, and which source handed it over (0: the faction)
        self.held = a_new_place(bc, fn, kind_named(bc, AN_OBJECT))
        self.source = a_new_place(bc, fn, reader.count_kind)
        self.thing = a_new_place(bc, fn, thing_kind)
        self.store = a_new_place(bc, fn, keeps.store_kind)
        self.buckets = a_new_place(bc, fn, keeps.buckets_kind)
        self.bucket = a_new_place(bc, fn, keeps.bucket_kind)
        self.holds = a_new_place(bc, fn, keeps.holds_kind)
        self.boxed = a_new_place(bc, fn, reader.row_kind)
        self.application = a_new_place(bc, fn, kind_named(bc, parsed.HELD_BY))
        self.sentinel_text = a_new_place(bc, fn, reader.text_kind)
        # what a marked row is weighed with: what the event is about, and the text it is called
        self.running = a_new_place(bc, fn, running_kind)
        self.acting = a_new_place(bc, fn, reader.text_kind)
        # what the trigger's own column names, worked out at the load, kept under the application
        self.named = a_new_place(bc, fn, reader.text_kind)
        self.nothing = a_new_place(bc, fn, reader.optional_kind)
        self.count = {name: reader.borrow_register(bc, fn, "count_kind")
                      for name in ("rows", "howmany", "apps", "at", "wanted", "sentinel",
                                   "zero", "found", "mine", "theirs",
                                   "holders", "holder", "foreign", "held_id", "besieger_id")}
        self.into = parsed.places_for(bc, fn, reader)
        # where the number floats: the thing, unless the raiser's own places say elsewhere
        self.where = self.thing
        # and the key a raise files its counts under, when the raiser says whose it is per row
        self.actor = a_new_place(bc, fn, kind_named(bc, AN_OBJECT)) if hasattr(
            raiser, ACTOR) else None
        if hasattr(raiser, "places"):
            raiser.places(bc, fn, self)


def emit(bc, fn, raiser):
    """The raiser's opening puts the actor, the thing and the text in hand; then every row."""
    at = Places(bc, fn, raiser)
    count, noun = at.count, raiser.NOUN
    uid_at = field_by_name(bc, at.faction_kind, ownermatch.THE_ID_ON, "a faction")[0]
    making, maps = parsed.emit_ready(bc, fn)
    ready, marks = mark.ready(bc, fn)
    placing, places = mark.ready(bc, fn, tray.PER_EVENT)

    def op(name, **operands):
        return written(template(bc, name), **operands)

    done = DONE % noun
    return assemble(
        raiser.opening(bc, fn, op, at, done)
        # the game's own list of factions, opened once in front of the walk
        + foreignwalk.emit_the_list(bc, fn, at.factions, done)
        + foreignwalk.emit_the_backing(bc, fn, at.factions, at.every, count["holders"], done)
        + making
        + ready
        + placing
        # a modder's rows begin one below the sentinel, asked for the way every other place asks
        + boundary.emit_ask(op, gv(boundary.id_lookup(bc).findex), boundary.minted(bc),
                            at.sentinel_text, count["sentinel"])
        # ONE PASS PER FACTION, in any order: the gate judges the actor against THIS holder
        + [op("Int", dst=count["holder"], ptr=number(bc, 0)),
           HOLDER + ":",
           op("Label"),
           (op("JSGte", a=count["holder"], b=count["holders"]), done)]
        + foreignwalk.emit_the_faction_at(bc, fn, at.factions, count["holder"], at.holder,
                                          NEXT_HOLDER)
        + [(op("JNull", reg=at.holder), NEXT_HOLDER),
           # whose pass this is, by networked identity -- two places may hold one faction
           op("Int", dst=count["foreign"], ptr=number(bc, 1)),
           op("Field", dst=count["held_id"], obj=at.holder, field=uid_at),
           op("Field", dst=count["besieger_id"], obj=at.faction, field=uid_at),
           (op("JNotEq", a=count["held_id"], b=count["besieger_id"]), ITS_OWN),
           op("Int", dst=count["foreign"], ptr=number(bc, 0)),
           ITS_OWN + ":",
           op("Label"),
           # the faction's own store first, then each of its things' (the sources below)
           op("UnsafeCast", dst=at.held, src=at.holder),
           op("Int", dst=at.source, ptr=number(bc, 0))]
        + _the_rows(bc, fn, op, at, maps, marks, places, raiser)
        + _the_sources(bc, fn, op, at, owned_sources(bc, at.faction_kind), noun)
        + [NEXT_HOLDER + ":",
           op("Incr", dst=count["holder"]),
           (op("JAlways"), HOLDER),
           done + ":",
           op("Label")])


def _the_rows(bc, fn, op, at, maps, marks, places, raiser):
    """One holder's store: every row, every application, a mark on each that fires for the event."""
    count, into, keeps, reader = at.count, at.into, at.keeps, at.reader
    word, row, app = raiser.word, ROW % raiser.NOUN, APP % raiser.NOUN
    return (
        [WALK + ":",
         op("Label"),
         op("Field", dst=at.store, obj=at.held, field=keeps.store_at),
         (op("JNull", reg=at.store), WALKED),
         op("Field", dst=at.buckets, obj=at.store, field=keeps.buckets_at),
         (op("JNull", reg=at.buckets), WALKED),
         op("Field", dst=count["howmany"], obj=at.buckets, field=keeps.count_at),
         op("Mov", dst=count["rows"], src=count["sentinel"]),
         op("Incr", dst=count["rows"]),
         row + ":",
         op("Label"),
         (op("JSGte", a=count["rows"], b=count["howmany"]), WALKED),
         op("Call2", dst=at.bucket, fun=gv(function_named(bc, storewalk.BUCKETS).findex),
            arg0=at.store, arg1=count["rows"]),
         (op("JNull", reg=at.bucket), NEXT_ROW),
         op("Field", dst=count["apps"], obj=at.bucket, field=keeps.bucket_count_at),
         op("Field", dst=at.holds, obj=at.bucket, field=keeps.holds_at),
         (op("JNull", reg=at.holds), NEXT_ROW),
         op("Int", dst=count["at"], ptr=number(bc, 0)),
         app + ":",
         op("Label"),
         (op("JSGte", a=count["at"], b=count["apps"]), NEXT_ROW),
         op("GetArray", dst=at.boxed, array=at.holds, index=count["at"]),
         (op("JNull", reg=at.boxed), NEXT_APP),
         op("SafeCast", dst=at.application, src=at.boxed),
         (op("JNull", reg=at.application), NEXT_APP)]
        # what the bake kept about this row comes back, and only its trigger is weighed
        + parsed.emit_reading(bc, fn, at.application, into, maps, reader)
        + _the_triggers(bc, op, count["wanted"], into[triggermatch.NAMED], raiser)
        # AND WHICH SIDE: a raise walking one side of its event keeps the rows of that side's scopes
        + (raiser.emit_scoped(bc, fn, at, into, NEXT_APP) if hasattr(raiser, SCOPED) else [])
        + _which_one(bc, fn, at, into, raiser)
        # AND A GROUP THE TRIGGER OPENS (`OnDev_OfTDomain`), asked by the raiser that has one
        + (raiser.emit_fired(bc, fn, at, into, NEXT_APP) if hasattr(raiser, FIRED) else [])
        # AND WHOSE ROW IT IS: the road's own gate, with the ACTOR as the candidate
        + _weighing_the_actor(into, at.faction, at.holder, count["foreign"], raiser.NOUN,
                              bc, fn)
        # AND IN WHAT: the thing, as it stands now, asked each narrowing past the trigger
        + [op("Field", dst=at.value, obj=at.application, field=at.value_at)]
        + firedin.emit(bc, fn, word, dict(into, **{
            firedin.VALUE: at.value, foreignwalk.WHOSE_RULE: at.holder,
            foreignwalk.FROM_FOREIGN: count["foreign"], foreignwalk.EVERY_ONE: at.every,
            foreignwalk.HOW_MANY: count["holders"]}, **({firedin.PARTNER: getattr(
                raiser, PARTNER_BY)} if hasattr(raiser, PARTNER_BY) else {}),
            **getattr(raiser, SIDES_BY, {})), at.thing, NEXT_APP)
        # ⛔ RAISED FOR THE ACTOR: only its own things may collect it, or the one thing that acted
        + (raiser.emit_actor(bc, fn, at, into) if hasattr(raiser, ACTOR) else [])
        + mark.emit_raise(bc, fn, marks, at.application, reader,
                          actor=at.actor if hasattr(raiser, ACTOR) else at.faction)
        # AND WHERE: the road pays a tick later, so the raise writes its thing beside the mark
        + _kept_where(bc, fn, (places, at.application, at.where, at.thing))
        + sayonce.emit_word_always(bc, fn, raiser.RAISED, even_when_quiet=True)
        + [NEXT_APP + ":",
           op("Incr", dst=count["at"]),
           (op("JAlways"), app),
           NEXT_ROW + ":",
           op("Incr", dst=count["rows"]),
           (op("JAlways"), row)])


def _kept_where(bc, fn, handed):
    """⛔ IN A FUNCTION OF OURS: the event's spot, for its number and for the act alike."""
    from tools.hlcode import shared_function
    kinds = [gv(list(fn.regs)[r]) for r in handed]
    counted = tray.recipe(bc)["of"]["counted"]

    def body(made):
        back = a_new_place(bc, made, counted)
        # ⛔ THE SPOT, NOT THE THING: an elimination's thing is a faction, its spot the base
        return assemble(tray.emit_publish(bc, made, 0, 1, 2) + mark.emit_fired_at(bc, made, 1, 2)
                        + [written(template(bc, "Int"), dst=back, ptr=number(bc, 0)),
                           written(template(bc, "Ret"), ret=back)])
    shared = shared_function(bc, fn, lambda _bc, made: made, ("where an event is kept",)
                             + tuple(kinds), kinds, counted, body)
    return [written(template(bc, "Call4"), dst=a_new_place(bc, fn, counted), fun=shared,
                    **{"arg%d" % i: r for i, r in enumerate(handed)})]


def _which_one(bc, fn, at, into, raiser):
    """An unmarked row fires on all; a marked one on what it names, or its family (`Not` turns)."""
    count, reader, noun = at.count, at.reader, raiser.NOUN

    def op(name, **operands):
        return written(template(bc, name), **operands)

    missed = MISSED % noun if hasattr(raiser, ALSO_NAMED) else OTHER % noun
    family = ([(op("JAlways"), NAMED_ONE % noun), missed + ":", op("Label")]
              + raiser.emit_also_named(bc, fn, at, NAMED_ONE % noun)
              + [(op("JAlways"), OTHER % noun), NAMED_ONE % noun + ":", op("Label")]
              if hasattr(raiser, ALSO_NAMED) else [])
    return (
        [op("Int", dst=count["zero"], ptr=number(bc, triggermatch.NO_COLUMN)),
         (op("JEq", a=into[triggermatch.AT_COLUMN], b=count["zero"]), raiser.FIRES),
         op("Mov", dst=at.named, src=into[columns.PART_FOR_HOOK]),
         (op("JNull", reg=at.named), NEXT_APP),
         (op("JNull", reg=at.acting), missed if family else NEXT_APP),
         # the same text, which is the front of one and the whole of both
         op("Null", dst=at.nothing),
         op("Call3", dst=count["found"], fun=gv(reader.finding.findex),
            arg0=at.acting, arg1=at.named, arg2=at.nothing),
         (op("JNotEq", a=count["found"], b=count["zero"]), missed),
         op("Field", dst=count["mine"], obj=at.acting, field=reader.text_length_field),
         op("Field", dst=count["theirs"], obj=at.named, field=reader.text_length_field),
         (op("JNotEq", a=count["mine"], b=count["theirs"]), missed)]
        + family
        # the one named: it fires unless `Not` was glued in, and anything else only if it was
        + [(op("JNotEq", a=into[triggermatch.TURNED], b=count["zero"]), NEXT_APP),
           (op("JAlways"), raiser.FIRES),
           OTHER % noun + ":",
           op("Label"),
           (op("JEq", a=into[triggermatch.TURNED], b=count["zero"]), NEXT_APP),
           raiser.FIRES + ":",
           op("Label")])


def _the_triggers(bc, op, wanted, named, raiser):
    """The raiser's own trigger, and each word in its `ALSO` the same event raises too."""
    words = [raiser.word] + list(getattr(raiser, ALSO, ()))
    out, mine = [], TRIGGERED % raiser.NOUN
    for one in words[:-1]:
        out += [op("Int", dst=wanted, ptr=number(bc, triggermatch.number_of(one.WORD))),
                (op("JEq", a=named, b=wanted), mine)]
    out += [op("Int", dst=wanted, ptr=number(bc, triggermatch.number_of(words[-1].WORD))),
            (op("JNotEq", a=named, b=wanted), NEXT_APP)]
    return out + ([mine + ":", op("Label")] if len(words) > 1 else [])


def _the_sources(bc, fn, op, at, sources, noun):
    """After a store: back into the source that handed it over, else on to the first source."""
    source = SOURCE % noun
    blocks, resumes = [], []
    for s, (spelling, steps) in enumerate(sources, start=1):
        after = source % sources[s][0] if s < len(sources) else NEXT_HOLDER
        block, resume = _one_source(bc, fn, op, at, s, spelling, steps, after, noun)
        blocks += block
        resumes.append((s, resume))
    which = at.count["wanted"]
    dispatch = [WALKED + ":", op("Label")]
    for s, resume in resumes:
        dispatch += [op("Int", dst=which, ptr=number(bc, s)),
                     (op("JEq", a=at.source, b=which), resume)]
    first = source % sources[0][0] if sources else NEXT_HOLDER
    return dispatch + [(op("JAlways"), first)] + blocks


def _one_source(bc, fn, op, at, s, spelling, steps, after, noun):
    """One scope's things: its list(s) off this faction, each member's store handed to the walk."""
    out = [SOURCE % noun % spelling + ":", op("Label")]
    cur, leave, resume = at.holder, after, None
    for depth, (how, what, kind) in enumerate(steps):
        got = a_new_place(bc, fn, kind if how != "list" else foreignwalk.the_list_kind(bc))
        if how == "call":
            out += [op("Call1", dst=got, fun=what, arg0=cur), (op("JNull", reg=got), leave)]
            cur = got
            continue
        out += [op("Field", dst=got, obj=cur, field=what), (op("JNull", reg=got), leave)]
        if how == "field":
            cur = got
            continue
        length = a_new_place(bc, fn, at.reader.count_kind)
        index = a_new_place(bc, fn, at.reader.count_kind)
        member = a_new_place(bc, fn, kind)
        loop = LEVEL % (spelling, depth)
        out += (foreignwalk.emit_the_length(bc, fn, got, length, leave)
                + [op("Int", dst=index, ptr=number(bc, 0)),
                   loop + ":",
                   op("Label"),
                   (op("JSGte", a=index, b=length), leave)]
                + foreignwalk.emit_the_faction_at(bc, fn, got, index, member, leave)
                + [op("Incr", dst=index),
                   (op("JNull", reg=member), loop)])
        cur, leave, resume = member, loop, loop
    return (out + sayonce.emit(bc, fn, WALKED_ONE % noun % spelling, even_when_quiet=True)
            + [op("UnsafeCast", dst=at.held, src=cur),
               op("Int", dst=at.source, ptr=number(bc, s)),
               (op("JAlways"), WALK)]), resume


def _weighing_the_actor(into, actor, holder, foreign, noun, bc, fn):
    """Is this row about the actor? ⛔ The FACTION road's gate is CALLED here, never copied."""
    from framework.pipeline import Place, hands_for
    from framework.scopes import faction as the_faction_word
    place = Place(name=WEIGHING % noun,
                  row={ownermatch.NAMED: into[ownermatch.NAMED],
                       scopematch.HOLDER: actor,
                       foreignwalk.WHOSE_RULE: holder,
                       foreignwalk.FROM_FOREIGN: foreign},
                  notes={}, note=None, kept=None, store=None,
                  refused=NEXT_APP, hands=hands_for(bc, fn))
    return ownermatch.gate_for(ownermatch.NAMED, scopematch.HOLDER, foreignwalk.WHOSE_RULE,
                               foreignwalk.FROM_FOREIGN,
                               road=the_faction_word.WORD)(place)


def emit_flagged(place, word, listed, held, refused):
    """Past this, the row spelled no `word`, or `held` (1 or 0) is what it says; else refused."""
    from framework.narrowmatch import FLAG_LEFT_OUT, FLAG_MARK
    from framework.rowreader import READ_COLUMN, STARTS_AT
    from framework.tray import ARRAY_OF_ENTRIES as A_LIST, BACKING_ON, COUNT_ON
    got = place.scratch_return(READ_COLUMN)
    name, mine, left = (place.scratch_arg(STARTS_AT, 0) for _ in range(3))
    at = place.scratch_return(STARTS_AT)
    turned = place.scratch_like(at)
    count_at, how_many = place.field_of(A_LIST, COUNT_ON)
    backing_at, backing = place.field_of(A_LIST, BACKING_ON)
    passed, seek, weigh = (place.here("%s flagged, %s" % (word, what))
                           for what in ("passed", "the next entry", "weighed"))
    return [
        (place.op("JNull", reg=listed), passed),
        place.op("GetGlobal", **{"dst": mine, "global": place.text_object(FLAG_MARK % word)}),
        place.op("GetGlobal", **{"dst": left, "global": place.text_object(FLAG_LEFT_OUT)}),
        place.op("Int", dst=at, ptr=place.number(0)),
        place.op("Int", dst=turned, ptr=place.number(0)),
        place.op("Field", dst=how_many, obj=listed, field=count_at),
        place.op("Field", dst=backing, obj=listed, field=backing_at),
        seek + ":", place.op("Label"),
        (place.op("JSGte", a=at, b=how_many), passed),
        place.op("GetArray", dst=got, array=backing, index=at),
        place.op("Incr", dst=at),
        (place.op("JNull", reg=got), seek),
        place.op("UnsafeCast", dst=name, src=got),
        (place.op("JNotEq", a=name, b=mine), seek),
        # SPELLED: turned when the very next entry is the `Not` mark
        (place.op("JSGte", a=at, b=how_many), weigh),
        place.op("GetArray", dst=got, array=backing, index=at),
        (place.op("JNull", reg=got), weigh),
        place.op("UnsafeCast", dst=name, src=got),
        (place.op("JNotEq", a=name, b=left), weigh),
        place.op("Int", dst=turned, ptr=place.number(1)),
        weigh + ":", place.op("Label"),
        (place.op("JEq", a=held, b=turned), refused),
        passed + ":", place.op("Label")]


def emit_listed(place, word, listed, text, refused):
    """Past this, the row opened no group by `word`, or `text` is named (left out, when turned)."""
    from framework.narrowcount import LEFT_OUT, NOTHING, WEIGHED, every_group_mark
    from framework.rowreader import READ_COLUMN, STARTS_AT
    from framework.tray import ARRAY_OF_ENTRIES as A_LIST, BACKING_ON, COUNT_ON
    got = place.scratch_return(READ_COLUMN)
    name, mine, left = (place.scratch_like(text) for _ in range(3))
    stops = [(mark, place.scratch_like(text)) for mark in every_group_mark()]
    at, found = place.scratch_return(STARTS_AT), place.scratch_return(STARTS_AT)
    zero, theirs, turned = (place.scratch_like(at) for _ in range(3))
    nothing = place.scratch_arg(STARTS_AT, 1)
    length_at, ours = place.field_of(text, COUNT_ON)
    names_at, how_many = place.field_of(A_LIST, COUNT_ON)
    backing_at, backing = place.field_of(A_LIST, BACKING_ON)
    passed, seek, group, names, name_at, unnamed = (place.here("%s listed, %s" % (word, what))
                                                    for what in (
        "passed", "the next entry", "its group", "its names", "the next name", "not named"))
    return [
        (place.op("JNull", reg=listed), passed),
        place.op("GetGlobal", **{"dst": mine, "global": place.text_object(WEIGHED % word)}),
        place.op("GetGlobal", **{"dst": left, "global": place.text_object(LEFT_OUT % word)}),
    ] + [place.op("GetGlobal", **{"dst": stop, "global": place.text_object(mark)})
         for mark, stop in stops] + [
        place.op("Int", dst=at, ptr=place.number(NOTHING)),
        place.op("Int", dst=zero, ptr=place.number(NOTHING)),
        place.op("Field", dst=how_many, obj=listed, field=names_at),
        place.op("Field", dst=backing, obj=listed, field=backing_at),
        seek + ":", place.op("Label"),
        (place.op("JSGte", a=at, b=how_many), passed),
        place.op("GetArray", dst=got, array=backing, index=at),
        place.op("Incr", dst=at),
        (place.op("JNull", reg=got), seek),
        place.op("UnsafeCast", dst=name, src=got),
        (place.op("JEq", a=name, b=mine), group),
        (place.op("JAlways"), seek),
        # A GROUP IS SPELLED: its `Not` mark, when there is one, comes right after its own
        group + ":", place.op("Label"),
        place.op("Int", dst=turned, ptr=place.number(NOTHING)),
        (place.op("JSGte", a=at, b=how_many), names),
        place.op("GetArray", dst=got, array=backing, index=at),
        (place.op("JNull", reg=got), names),
        place.op("UnsafeCast", dst=name, src=got),
        (place.op("JNotEq", a=name, b=left), names),
        place.op("Incr", dst=turned),
        place.op("Incr", dst=at),
        names + ":", place.op("Label"),
        (place.op("JNull", reg=text), unnamed),
        place.op("Field", dst=ours, obj=text, field=length_at),
        name_at + ":", place.op("Label"),
        (place.op("JSGte", a=at, b=how_many), unnamed),
        place.op("GetArray", dst=got, array=backing, index=at),
        place.op("Incr", dst=at),
        (place.op("JNull", reg=got), name_at),
        place.op("UnsafeCast", dst=name, src=got),
    ] + [(place.op("JEq", a=name, b=stop), unnamed) for _mark, stop in stops] + [
        place.op("Null", dst=nothing),
        place.op("Call3", dst=found, fun=place.named_function(STARTS_AT), arg0=text, arg1=name,
                 arg2=nothing),
        (place.op("JNotEq", a=found, b=zero), name_at),
        place.op("Field", dst=theirs, obj=name, field=length_at),
        (place.op("JNotEq", a=ours, b=theirs), name_at),
        # named: it passes unless its names are left out; unnamed, only if they are
        (place.op("JEq", a=turned, b=zero), passed),
        (place.op("JAlways"), refused),
        unnamed + ":", place.op("Label"),
        (place.op("JEq", a=turned, b=zero), refused),
        passed + ":", place.op("Label")]
