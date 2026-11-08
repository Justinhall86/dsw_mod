#!/usr/bin/env python3
"""`add-trait-stacks` -- stacks of a named trait: an evented row pays on top, others hold."""
# NO: `ForMe` and `ForAll` on a trait effect do nothing and never will; the user settled it
from tools.project import guard
from tools.hlcode import argument_kinds, assemble, template
from framework import answer, eventpay, reach, running, sayonce
from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON
from framework.acts.gain_res import WHICH
from framework.triggermatch import NOTHING_NAMED
from framework.scopematch import HOLDER
from framework.foreignwalk import EVERY_ONE, FROM_FOREIGN, HOW_MANY, WHOSE_RULE
from framework.ridermatch import NAMED as RIDER, NOTHING_SPELLED, stamped
from framework import forwhom

# what this act is called on a road, and which act it is as a number of ours
STAGE = "add-trait-stacks"
NUMBER = 2
# the game's own way of setting how many stacks of a trait come from one attribute
GRANT = "logic.TraitsManager.setTraitStacksFromAtb"
# and its own way of counting what one source already put there, so this can add to it
COUNT = "logic.TraitsManager.getTraitTotalStacksCount"
# how many arguments each takes past the manager
TAKES = 7
COUNTS_WITH = 5
# the accessor whose first instruction names the field this must read for itself
from standalone.buildingtraits import ASKS_FOR_TRAITS as MANAGER
# the kind a thing is, named once where the holder is: the kind a re-hosted holder arrives as
THING_IS = reach.EVERY_HOLDER
# our own bucket, NEGATIVE so it can never be a real attribute index; one per granting act
OUR_OWN_BUCKET = -6101
# a negative as the file holds it: stored unsigned, read back signed
AS_THE_FILE_HOLDS_IT = OUR_OWN_BUCKET & 0xFFFFFFFF

# A BUCKET OF ITS OWN FOR WHAT AN EVENT PAID, which the settling's reconcile never takes back
OUR_EVENT_BUCKET = -6102
EVENTS_AS_THE_FILE_HOLDS_IT = OUR_EVENT_BUCKET & 0xFFFFFFFF

# ⛔ a road whose holder is its own payee gets its own bucket; roads with an owner share one
ROADS_FROM = -7000


def bucket_for(road):
    """The bucket one road settles, as the file holds it."""
    import zlib
    from framework.names import vocabulary
    from framework.storewalk import ITSELF, OWNER_BY, _declared, scopes_with_roads
    def of(word):
        if _declared(word, OWNER_BY, vocabulary()) != ITSELF:
            return OUR_OWN_BUCKET
        return ROADS_FROM - zlib.crc32(word.encode()) % 1000000
    taken = [of(word) for word in scopes_with_roads(vocabulary()) if of(word) != OUR_OWN_BUCKET]
    guard(len(set(taken)) == len(taken), "two roads spell one trait bucket")
    return of(road) & 0xFFFFFFFF
# the engine's source-enum shape for an attribute grant; counting builds the same one
SOURCE_IS_AN_ATTRIBUTE = 0
# what the road hands over, by name
TRIGGER = "name.hook"
# and whether the spelling means ONE of whatever it grants, rather than the number a modder wrote
JUST_ONE = forwhom.JUST_ONE
# the engine's own lookup, one of its answers, and the field its own sum adds up
EVERY = "logic.TraitsManager.getAll"
AN_APPLICATION = answer.HOLDS
STACKS_ON = "stackCount"
# where one application says it came from, which is what the counting call FILTERS by
SOURCE_ON = "src"
# the record's part naming the holder's KIND, which the road hands over for a reading
WHOSE = "reader"
# AND WHICH ONE: `__uid`, on the kind every holder shares, so a re-hosted holder answers too
WHICH_ONE_ON = "__uid"
# the row parts read, with the rider, the faction HOLDING the rule and every multiplier's count
READS = (HOLDER, "columns.named", "value", WHICH, TRIGGER, JUST_ONE, WHOSE, FROM_FOREIGN,
         "name.%s" % RIDER, WHOSE_RULE, EVERY_ONE, HOW_MANY)
# a trait stays on the road's thing: only `StampedTo…` speaks here, as a credit; no payee moves
RIDER_SETTLED = True
# the words said where the act turns a row away
NO_TRAITS = "SPINE that thing carries no traits at all"
NO_MANAGER = "SPINE that thing would not hand over its traits"
# ⚠ INSTRUMENT: every stack of the trait on the thing, base game included, said as minted text
from framework.acts.gain_res import AS_TEXT  # noqa: E402
HOW_MANY = tuple((n, "SPINE stacks now %d" % n) for n in range(0, 9))
MORE_THAN = "SPINE stacks now more than 8"
# ⚠ and the same reading taken BEFORE the grant
BEFORE = tuple((n, "SPINE stacks were %d" % n) for n in range(0, 9))
WERE_MORE = "SPINE stacks were more than 8"
ASKS_WITH = ((NO_TRAITS, NO_MANAGER, MORE_THAN, WERE_MORE)
             + tuple(word for _n, word in HOW_MANY)
             + tuple(word for _n, word in BEFORE))


def check_what_we_borrow(bc):
    """The two borrowed functions take what this is about to hand them."""
    # counted PAST the thing each is called on, which is what `argument_kinds` answers
    kinds = argument_kinds(bc, GRANT)
    guard(len(kinds) == TAKES,
          "%s takes %d argument(s) past the manager and this hands it %d"
          % (GRANT, len(kinds), TAKES))
    counting = argument_kinds(bc, COUNT)
    guard(len(counting) == COUNTS_WITH,
          "%s takes %d argument(s) past the manager and this hands it %d"
          % (COUNT, len(counting), COUNTS_WITH))
    # the enum is copied from one the file has, which needs room for an argument
    made = template(bc, "MakeEnum")
    guard(getattr(made.df["args"], "value", None),
          "the file's first `MakeEnum` carries no argument, so our source cannot be built from it")


def emit_act(place):
    """If the row named THIS act: hold its number, or add to what is held when an event fired."""
    mine = place.scratch_like(place.row[WHICH])
    past = place.here("this row names another act")
    holding = place.here("this row names no event, so it holds its number")
    totalled = place.here("this row's number is settled")
    has_traits = place.here("the thing carries traits")
    has_manager = place.here("the thing handed its traits over")
    reads_the_row = place.here("this spelling takes the number the row wrote")
    # NO NARROWING HERE: every holder arrives as the kind this act wants; the gates narrow
    thing = place.row[HOLDER]
    # the field the accessor itself reads first, and the kind it holds
    at, carried = place.field_of(THING_IS, "_traits")

    manager = place.scratch_return(MANAGER)
    # each asked for by WHICH argument it is, so nothing here names a kind it cannot check
    counted = place.scratch_arg(GRANT, 2)
    bucket = place.scratch_arg(GRANT, 2)
    wanted = place.scratch_arg(GRANT, 2)
    # and the places the counting call needs, each taken from that call's own argument
    reads = place.scratch_return(COUNT)
    was = place.scratch_return(COUNT)
    none = place.scratch_like(place.row[TRIGGER])
    single = place.scratch_like(place.row[JUST_ONE])
    # places for saying the trait this act was ENTERED for
    aloud_at_entry = place.scratch_arg(sayonce.COMPLAIN, 0)
    thrown_away = place.scratch_return(sayonce.COMPLAIN)
    return [
        # ⛔ NO ENTRY WORD: in front of the act test it would speak on every row, every tick
        place.op("Int", dst=mine, ptr=place.number(NUMBER)),
        (place.op("JNotEq", a=place.row[WHICH], b=mine), past),
        # ⛔ read for ourselves: the accessor has no null check and faults on a thing with none
        place.op("Field", dst=carried, obj=thing, field=at),
        (place.op("JNotNull", reg=carried), has_traits),
    ] + place.said_now(NO_TRAITS) + [
        (place.op("JAlways"), past),
        has_traits + ":", place.op("Label"),
        place.op("Call1", dst=manager, fun=place.named_function(MANAGER), arg0=thing),
        (place.op("JNotNull", reg=manager), has_manager),
    ] + place.said_now(NO_MANAGER) + [
        (place.op("JAlways"), past),
        has_manager + ":", place.op("Label"),
        # our own bucket, as a number and as the shape the counting call is asked in
        place.op("Int", dst=bucket, ptr=place.number(AS_THE_FILE_HOLDS_IT)),
        # what the row is worth; a spelling that means ONE ignores the value entirely
        place.op("ToInt", dst=counted, src=place.row["value"]),
        place.op("Int", dst=single, ptr=place.number(1)),
        (place.op("JNotEq", a=place.row[JUST_ONE], b=single), reads_the_row),
        place.op("Mov", dst=counted, src=single),
        reads_the_row + ":", place.op("Label"),
        # SCALED ON BOTH ROADS, an event's payment and a held number alike
    ] + forwhom.scaled(place, counted) + [
        place.op("Mov", dst=wanted, src=counted),
        # did an event fire this row? One that names none HOLDS its number, never adds to it
        place.op("Int", dst=none, ptr=place.number(NOTHING_NAMED)),
        (place.op("JEq", a=place.row[TRIGGER], b=none), holding),
        # it did, so this is a payment: read what our own bucket already holds and pay on top
    ] + eventpay.emit(place, manager, counted, wanted, bucket) + [
        (place.op("JAlways"), totalled),
        holding + ":", place.op("Label"),
        # A HELD ROW ADDS TO THIS PASS'S TOTAL for the receiver and trait; the TOTAL is settled
    ] + _held(place, thing, counted, wanted) + [
        totalled + ":", place.op("Label"),
    ] + _credit_the_rider(place, thing) + _say_which(place) + _say_one(
        place, lambda: _count_them_all(place, manager, thing, was, "before"),
        was, BEFORE, WERE_MORE, "before") + _say_one(
        place, lambda: _count_them_all(place, manager, thing, reads, "after"),
        reads, HOW_MANY, MORE_THAN, "after", thing=thing) + [
        past + ":", place.op("Label"),
    ]


# ⛔ ONE SHARED CALL, never inline: every road's act would carry the stamped branch otherwise
HELD = "a held row's total, a stamp to its holder kept apart"
# `StampedTo<Owner>`'s walk: the next faction, and one the owner word does not pick
LOOPS = 2


def _held(place, thing, counted, wanted):
    """A held row's total; one stamped to the rule's holder under a key of its own, never merged."""
    from framework.pipeline import Place
    # ⛔ THE FACTION COUNT BY ITS OWN NAME: `HOW_MANY` here is the readings' words
    from framework.foreignwalk import HOW_MANY as FACTIONS
    handed = [thing, place.row["columns.named"], counted, place.row["name.%s" % RIDER],
              place.row[WHOSE_RULE], place.row[EVERY_ONE], place.row[FACTIONS]]
    kinds = [place.kind_of(r) for r in handed]
    if 0 in kinds + [place.kind_of(wanted)]:
        return running.emit_add(place, thing, handed[1], counted, wanted)

    def body(hands):
        at = Place(HELD, {}, {}, None, None, None, "%s: done" % HELD, hands)
        total, every_stamp, spare = at.scratch_like(2), at.scratch_like(2), at.scratch_like(3)
        key, every = at.scratch_like(1), at.scratch_like(1)
        plain = at.here("this held row is not stamped to its holder")
        return assemble([at.op("Int", dst=total, ptr=at.number(0))]
                        + _for_each_picked(at, total, plain)
                        + [at.op("Int", dst=spare, ptr=at.number(stamped("me"))),
                         (at.op("JNotEq", a=3, b=spare), plain)]
                        + running.emit_stamped_keys(at, 1, 4, key, every)
                        + running.emit_add(at, 0, key, 2, total)
                        + running.emit_add(at, 0, every, 2, every_stamp)
                        + running.emit_credit(at, 0, key, 4, "stamped to its holder", plain=False)
                        + [at.op("Ret", ret=total), plain + ":", at.op("Label")]
                        + running.emit_add(at, 0, 1, 2, total) + [at.op("Ret", ret=total)])
    made = place._hands["shared"]((HELD,) + tuple(kinds), kinds, place.kind_of(wanted), body)
    return [place.op("CallN", dst=wanted, fun=made, args=handed)]


def _for_each_picked(at, total, plain):
    """`StampedTo<Owner>`: a copy's total per faction the owner word picks, each under its key."""
    from framework.ownermatch import ASKED_AS
    from framework.ridermatch import CREDIT_MASK, OWNER_SHIFT, emit_taken
    low, owner, i = at.scratch_like(3), at.scratch_like(3), at.scratch_like(6)
    item, picked = at.scratch_of("Dyn"), at.scratch_of(ASKED_AS)
    key, every, every_stamp = at.scratch_like(1), at.scratch_like(1), at.scratch_like(2)
    loop, walked = at.here("the next faction to stamp"), at.here("every picked faction stamped")
    return [
        at.op("Int", dst=low, ptr=at.number(CREDIT_MASK)),
        at.op("And", dst=low, a=3, b=low),
        at.op("Int", dst=owner, ptr=at.number(stamped("all"))),
        (at.op("JNotEq", a=low, b=owner), "%s past the picked" % plain),
        at.op("Int", dst=low, ptr=at.number(OWNER_SHIFT)),
        at.op("SShr", dst=owner, a=3, b=low),
        at.op("Int", dst=low, ptr=at.number(0)),
        # a bare `StampedTo` names no owner word, so it is `StampedToAll`'s, settled as before
        (at.op("JEq", a=owner, b=low), "%s past the picked" % plain),
        at.op("Int", dst=i, ptr=at.number(0)),
        loop + ":", at.op("Label"),
        (at.op("JSGte", a=i, b=6), walked),
        at.op("GetArray", dst=item, array=5, index=i),
        at.op("Incr", dst=i),
    ] + emit_taken(at, (3, 4, item), picked) + [
        (at.op("JNull", reg=picked), loop),
    ] + running.emit_stamped_keys(at, 1, picked, key, every) + running.emit_add(
        at, 0, key, 2, total) + running.emit_add(at, 0, every, 2, every_stamp) + (
        running.emit_credit(at, 0, key, picked, "stamped to a picked faction", plain=False)) + [
        (at.op("JAlways"), loop),
        walked + ":", at.op("Label"),
        at.op("Ret", ret=total),
        "%s past the picked:" % plain, at.op("Label"),
    ]


def _credit_the_rider(place, thing):
    """WHO THIS GRANT COUNTS FOR, branched ON THE CREDIT: `me` and `all` write, `target` doesn't."""
    rider = place.row["name.%s" % RIDER]
    spare = place.scratch_like(rider)
    for_me = place.here("this row credits the faction holding the rule")
    for_all = place.here("this row credits nobody, so every faction counts it")
    done = place.here("this row's credit is written")
    return [
        place.op("Int", dst=spare, ptr=place.number(NOTHING_SPELLED)),
        (place.op("JEq", a=rider, b=spare), done),
        place.op("Int", dst=spare, ptr=place.number(stamped("me"))),
        (place.op("JEq", a=rider, b=spare), for_me),
        place.op("Int", dst=spare, ptr=place.number(stamped("all"))),
        (place.op("JEq", a=rider, b=spare), for_all),
        (place.op("JAlways"), done),
        for_me + ":", place.op("Label"),
        # a held row stamped to its holder wrote its credit under its own key, in `_held`
        place.op("Int", dst=spare, ptr=place.number(NOTHING_NAMED)),
        (place.op("JEq", a=place.row[TRIGGER], b=spare), done),
    ] + running.emit_credit(place, thing, place.row["columns.named"],
                            place.row[WHOSE_RULE], "for me", plain=False) + [
        (place.op("JAlways"), done),
        for_all + ":", place.op("Label"),
        # the rider's own number goes in: any value that is not a faction says `nobody`
    ] + running.emit_credit(place, thing, place.row["columns.named"],
                            rider, "for all", plain=True) + [
        done + ":", place.op("Label"),
    ]


def _count_them_all(place, manager, thing, into, when):
    """EVERY application of this trait on this thing, summed by us into an array of OURS."""
    answering = place.scratch_of(ARRAY_OF_ENTRIES)
    got = place.scratch_of(ARRAY_OF_ENTRIES)
    # past the manager: trait 0, source 1, style 2, faction 3, thing 4, ref 5, spare 6
    nosource = place.scratch_arg(EVERY, 1)
    nostyle = place.scratch_arg(EVERY, 2)
    nofaction = place.scratch_arg(EVERY, 3)
    noref = place.scratch_arg(EVERY, 5)
    nothing = place.scratch_arg(EVERY, 6)
    # what goes in the object slot, filtered exactly as the write fills it
    asking_about = place.scratch_arg(EVERY, 4)
    at = place.scratch_arg(GRANT, 2)
    many = place.scratch_arg(GRANT, 2)
    one = place.scratch_arg(GRANT, 2)
    # an item's kind comes off the lookup's own return -- `Dyn` names hundreds of kinds here
    item = place.scratch_return(EVERY)
    app = place.scratch_of(AN_APPLICATION)
    counted_at, _c = place.field_of(ARRAY_OF_ENTRIES, COUNT_ON)
    backing_at, backing = place.field_of(ARRAY_OF_ENTRIES, BACKING_ON)
    stacks_at, stacks = place.field_of(AN_APPLICATION, STACKS_ON)
    loop, step, done = (place.here("the next application %s" % when),
                        place.here("on to the next %s" % when),
                        place.here("every application counted %s" % when))
    return [
        place.op("GetGlobal", **{"dst": answering, "global": place.slot(answer.SLOT)}),
        place.op("Int", dst=into, ptr=place.number(0)),
        (place.op("JNull", reg=answering), done),
        place.op("Null", dst=nosource),
        place.op("Null", dst=nostyle),
        place.op("Null", dst=nofaction),
        place.op("Null", dst=noref),
        place.op("Null", dst=nothing),
        # ⛔ THE SLOT STAYS EMPTY: the write passes NULL there, and the read must filter alike
        place.op("Null", dst=asking_about),
        place.op("CallN", dst=got, fun=place.named_function(EVERY),
                 args=[manager, place.row["columns.named"], nosource, nostyle, nofaction,
                       asking_about, noref, nothing, answering]),
        (place.op("JNull", reg=got), done),
        place.op("Int", dst=at, ptr=place.number(0)),
        place.op("Int", dst=one, ptr=place.number(1)),
        loop + ":", place.op("Label"),
        # the length EVERY time round, never once before the loop
        place.op("Field", dst=many, obj=got, field=counted_at),
        (place.op("JSGte", a=at, b=many), done),
        place.op("Field", dst=backing, obj=got, field=backing_at),
        place.op("GetArray", dst=item, array=backing, index=at),
        (place.op("JNull", reg=item), step),
        place.op("UnsafeCast", dst=app, src=item),
        place.op("Field", dst=stacks, obj=app, field=stacks_at),
        place.op("Add", dst=into, a=into, b=stacks),
        step + ":", place.op("Label"),
        place.op("Add", dst=at, a=at, b=one),
        (place.op("JAlways"), loop),
        done + ":", place.op("Label"),
    ]


def _say_which(place):
    """WHICH THING and WHICH TRAIT this reading is about, said as the text each already is."""
    # ⛔ nothing when the count is off: these lines only LABEL it
    if not saying_the_count():
        return []
    # the holder's kind comes from the road: the shared kind a holder arrives as has no name
    aloud = place.scratch_arg(sayonce.COMPLAIN, 0)
    discarded = place.scratch_return(sayonce.COMPLAIN)
    boxed = place.scratch_arg(AS_TEXT, 0)
    # the holder's own uid, by name, into a place typed by the field itself
    uid_at, which_one = place.field_of(THING_IS, WHICH_ONE_ON)
    return place.said("stackcount", lambda: [
        place.op("UnsafeCast", dst=aloud, src=place.row[WHOSE]),
        place.op("Call1", dst=discarded, fun=place.named_function(sayonce.COMPLAIN),
                 arg0=aloud),
        place.op("UnsafeCast", dst=aloud, src=place.row["columns.named"]),
        place.op("Call1", dst=discarded, fun=place.named_function(sayonce.COMPLAIN),
                 arg0=aloud),
        # ⛔ WHICH ONE goes PAST the trait: `game/bench/_series.py` pairs the two lines above
        place.op("Field", dst=which_one, obj=place.row[HOLDER], field=uid_at),
        place.op("ToDyn", dst=boxed, src=which_one),
        place.op("Call1", dst=aloud, fun=place.named_function(AS_TEXT), arg0=boxed),
        place.op("Call1", dst=discarded, fun=place.named_function(sayonce.COMPLAIN),
                 arg0=aloud),
        # and which side the row was found on: 0 the thing's own store, 1 another faction's
        place.op("ToDyn", dst=boxed, src=place.row[FROM_FOREIGN]),
        place.op("Call1", dst=aloud, fun=place.named_function(AS_TEXT), arg0=boxed),
        place.op("Call1", dst=discarded, fun=place.named_function(sayonce.COMPLAIN),
                 arg0=aloud),
    ])


def saying_the_count():
    """Is the count on a thing in this build? `standalone/onoff.py` holds the switch."""
    from standalone import onoff
    return onoff.on("stackcount")


# the last number said per thing and trait, so a reading is said ONLY when it moves
SAID_BEFORE = "the count last said for each thing and trait"


def _only_when_it_moves(place, thing, reads, skip):
    """Leave for `skip` when this number is the one already said for this thing and this trait."""
    from framework.oneshot import MAKE, MAP, TELL
    from framework.parsed import READ
    from framework.running import GET, INNER, PER_RECEIVER, SET
    outer = place.scratch_of(MAP)
    inner = place.scratch_of(INNER)
    made = place.scratch_return(MAKE)
    built = place.scratch_return(PER_RECEIVER)
    got = place.scratch_return(READ)
    had = place.scratch_return(GET)
    told = place.scratch_return(TELL)
    put = place.scratch_return(SET)
    boxed = place.scratch_return(READ)
    seen = place.scratch_arg(GRANT, 2)
    trait = place.row["columns.named"]
    has_outer = place.here("the last-said map is there")
    has_inner = place.here("this thing has a last-said map")
    say_it = place.here("this number has moved")
    return [
        (place.op("JNull", reg=thing), say_it),
        place.op("GetGlobal", **{"dst": outer, "global": place.slot(SAID_BEFORE)}),
        (place.op("JNotNull", reg=outer), has_outer),
        place.op("New", dst=outer),
        place.op("Call1", dst=made, fun=place.named_function(MAKE), arg0=outer),
        place.op("SetGlobal", **{"global": place.slot(SAID_BEFORE), "src": outer}),
        has_outer + ":", place.op("Label"),
        place.op("Call2", dst=got, fun=place.named_function(READ), arg0=outer, arg1=thing),
        place.op("SafeCast", dst=inner, src=got),
        (place.op("JNotNull", reg=inner), has_inner),
        place.op("New", dst=inner),
        place.op("Call1", dst=built, fun=place.named_function(PER_RECEIVER), arg0=inner),
        place.op("Call3", dst=told, fun=place.named_function(TELL),
                 arg0=outer, arg1=thing, arg2=inner),
        has_inner + ":", place.op("Label"),
        place.op("Call2", dst=had, fun=place.named_function(GET), arg0=inner, arg1=trait),
        (place.op("JNull", reg=had), say_it),
        place.op("SafeCast", dst=seen, src=had),
        # the same number as last time: nothing has happened, so nothing is said
        (place.op("JEq", a=seen, b=reads), skip),
        say_it + ":", place.op("Label"),
        place.op("ToDyn", dst=boxed, src=reads),
        place.op("Call3", dst=put, fun=place.named_function(SET),
                 arg0=inner, arg1=trait, arg2=boxed),
    ]


def _say_one(place, counting, reads, words, otherwise, when, thing=None):
    """The number as a minted word, COUNTED only inside the word's gate: off, nothing walks."""
    if not saying_the_count():
        return []
    wanted, done = place.scratch_return(COUNT), place.here("the count has been said %s" % when)

    def block():
        out = list(counting())
        # and nothing when the number has not moved
        out += _only_when_it_moves(place, thing, reads, done) if thing is not None else []
        for value, word in words:
            past = place.here("the count is not %d %s" % (value, when))
            out += [place.op("Int", dst=wanted, ptr=place.number(value)),
                    (place.op("JNotEq", a=reads, b=wanted), past)] + place.said_now(word)
            out += [(place.op("JAlways"), done), past + ":", place.op("Label")]
        return out + place.said_now(otherwise) + [done + ":", place.op("Label")]
    return place.said("stackcount", block)


def install(bc):
    """Check the two functions this borrows. THE ROAD RUNS THEM IN THE GAME."""
    check_what_we_borrow(bc)
    from tools.hlcode import kind_named, slot_global
    from framework.oneshot import MAP
    slot_global(bc, SAID_BEFORE, kind_named(bc, MAP))
    return ("ADD TRAIT STACKS: a row naming an event is paid on top of what our bucket holds, "
            "read back through `%s`; a row naming none holds its own number" % COUNT)
