"""The places a road's walk reads into, made once a walk and bundled by what each is about."""
from types import SimpleNamespace

from tools.project import gv
from tools.hlcode import (argument_kind, class_global, field_by_name, fields_of, function_named,
                          kind_named, number, returns_type, slot_global)
from framework import (carrierplace, foreignwalk, mark, oneline, oneshot, ownermatch, parsed, reach,
                   rederive, rehosted, running, saidrow, sayonce, scopematch, settle, tray)
from framework import answer as answer_array
from framework import prodpass
from framework.acts import gain_res, gain_ttrait_stacks
from framework.names import vocabulary
from framework.ofthekind import IS_REALLY
from framework.parsed import a_new_place
from framework.storewalk import (DONE, HOST_ALSO_BY, HOST_BY, HOST_OWNER_BY, IS_DEAD, ITSELF,
                             NAMED_BY, NESTED, NO_PAYEE, OWNER_BY, READS_REGION_BY, SOURCE_ON,
                             STAMPED_BY, THE_ID_ON, THE_VALUE, Store, _declared,
                             _say_how_many_factions, _the_stamp_a_building_state_carries,
                             named_by_for, weighing, what_it_is_drawn_over)

# the field the scope's `SHOWN_AT` call reads, empty on some (a zone with no area): then nowhere
SHOWN_NEEDS_BY = "SHOWN_NEEDS"


def ids(bc, site):
    """Where an application keeps its value and its id, and where the holder keeps its own."""
    application_kind = kind_named(bc, parsed.HELD_BY)
    found = SimpleNamespace(application_kind=application_kind)
    found.value_at, _ = field_by_name(bc, application_kind, THE_VALUE, "one application")
    # the two ids the instrument says, each checked to BE the text the complaint channel takes
    found.holder_id_at, found.holder_id_kind = field_by_name(
        bc, site.holder_kind, named_by_for(site.word), "the holder these rules are about")
    found.row_id_at, found.row_id_kind = field_by_name(bc, application_kind, NAMED_BY,
                                                       "one application")
    saidrow.says_text(bc, found.holder_id_kind, "the holder's own id")
    saidrow.says_text(bc, found.row_id_kind, "the row's own id")
    return found


def asking_if_live(bc, fn, op, site):
    """Still in the game? the update's own question, left on the answer that makes it return."""
    if site.question is None:
        return []
    nothing = a_new_place(bc, fn, argument_kind(bc, site.question))
    answer = a_new_place(bc, fn, returns_type(function_named(bc, site.question), site.question))
    return [op("Null", dst=nothing),
            op("Call2", dst=answer, fun=gv(function_named(bc, site.question).findex),
               arg0=0, arg1=nothing),
            (weighing(op, site.leave_on, answer), DONE)]


def payee_kind(bc, site):
    """What the payee is, or nothing for a holder that is its own payee."""
    named = _declared(site.word, OWNER_BY, vocabulary())
    return None if named == ITSELF else returns_type(function_named(bc, named), named)


def payee(bc, fn, op, site):
    """Who gets paid, asked once a walk; a holder that is its own payee reads ONE store."""
    named = _declared(site.word, OWNER_BY, vocabulary())
    found = SimpleNamespace(named=named, two_holders=named != ITSELF, owner=0, reaching=[],
                            store=None)
    if not found.two_holders:
        return found
    found.owner = a_new_place(bc, fn, returns_type(function_named(bc, named), named))
    has_payee = "%s: the payee is there" % site.word
    found.reaching = [
        op("Call1", dst=found.owner, fun=gv(function_named(bc, named).findex), arg0=0),
        (op("JNotNull", reg=found.owner), has_payee),
    ] + sayonce.emit(bc, fn, NO_PAYEE % site.word, even_when_quiet=True) + [
        has_payee + ":", op("Label")]
    # and its store, resolved on the OWNER's own kind
    found.store = Store(bc, gv(list(fn.regs)[found.owner]))
    return found


def region(bc, fn, op, site):
    """The holder's region and who holds it, once a pass; null (no region) the gate refuses."""
    stands_in, held_by = scopematch.the_region_question(vocabulary())
    names, _ = fields_of(bc, site.holder_kind, "the holder these rules are about")
    # only where the holder could stand in a region at all (a region has no `cell`)
    if stands_in and stands_in[0] not in names:
        stands_in = None
    # the region as a source, when declared AND the holder can stand in one
    found = SimpleNamespace(
        read=bool(_declared(site.word, READS_REGION_BY, vocabulary(), None)) and stands_in,
        held=None, the=None, reaching=[], store=None, row=None)
    if not stands_in:
        return found
    found.held = a_new_place(bc, fn, returns_type(function_named(bc, held_by), held_by))
    no_region = "%s: this holder stands in no region" % site.word
    # the region itself, which a `Region_` row grants to: a building's is its village's
    found.the = a_new_place(bc, fn, carrierplace.region_kind(bc))
    found.reaching = ([op("Null", dst=found.held)] + carrierplace.emit_region_of(
        bc, fn, op, 0, found.the, "%s holder" % site.word) + [
        (op("JNull", reg=found.the), no_region),
        op("Call1", dst=found.held,
           fun=gv(function_named(bc, held_by).findex), arg0=found.the),
        no_region + ":", op("Label")])
    # and its store, resolved on the region's own kind, read here from a thing standing in one
    found.store = Store(bc, gv(list(fn.regs)[found.the]))
    return found


class Host:
    """The host a scope names: one more store pass, gated on rows stamped with its own kind."""

    def __init__(self, bc, fn, op, site, two_holders, reader, application_kind):
        named = _declared(site.word, HOST_BY, vocabulary(), None)
        self.on = two_holders and named is not None
        self.bc, self.op, self.word = bc, op, site.word
        self.door, self.also, self.asked_before = None, None, []
        if not self.on:
            return
        # a name with a dot in it is a question, not a place, as the village hops read it
        if "." in named:
            door = function_named(bc, named)
            self.at, self.kind = None, returns_type(door, named)
            self.door = gv(door.findex)
            # and the second door, if declared: a kind and its host field, with its places
            self.also = _declared(site.word, HOST_ALSO_BY, vocabulary(), None)
            if self.also:
                also_kind = kind_named(bc, self.also[0])
                self.also_at = field_by_name(bc, also_kind, self.also[1],
                                             "the other kind this road ticks")[0]
                self.also_class = a_new_place(
                    bc, fn, gv(bc.global_types[class_global(bc, also_kind)]))
                self.also_really = a_new_place(
                    bc, fn, returns_type(function_named(bc, IS_REALLY), IS_REALLY))
                self.also_thing = a_new_place(bc, fn, also_kind)
        else:
            self.at, self.kind = field_by_name(
                bc, site.holder_kind, named, "the holder these rules are about")
        self.store = Store(bc, self.kind)
        self.place = a_new_place(bc, fn, self.kind)
        self.stamped_by = _declared(site.word, STAMPED_BY, vocabulary())
        self.stamp_at, stamp_kind = field_by_name(bc, application_kind, SOURCE_ON,
                                                  "one application")
        self.the_stamp = a_new_place(bc, fn, stamp_kind)
        self.from_host = reader.borrow_register(bc, fn, "count_kind")
        self.their_kind = a_new_place(bc, fn, field_by_name(
            bc, site.holder_kind, self.stamped_by, "the holder these rules are about")[1])
        self.stamp_names = a_new_place(bc, fn, gv(list(fn.regs)[self.their_kind]))
        self.which_stamp = reader.borrow_register(bc, fn, "count_kind")
        self.wanted_stamp = reader.borrow_register(bc, fn, "count_kind")
        # whether this row came in by the host's own door, which lets unstamped rows through
        self.by_the_door = reader.borrow_register(bc, fn, "count_kind")
        # the row's reach, read early and silently: the stamp test asks whether it names a SET
        self.set_reach = reader.borrow_register(bc, fn, "count_kind")
        self.upgrade_case = _the_stamp_a_building_state_carries(bc)
        # a host may be a carrier: its faction-reach rows are walked by things in OTHER hosts
        self.named_owner = _declared(site.word, HOST_OWNER_BY, vocabulary())
        self.klass = a_new_place(bc, fn, gv(bc.global_types[class_global(bc, self.kind)]))
        self.a_host = a_new_place(bc, fn, self.kind)
        self.owner = a_new_place(bc, fn, returns_type(
            function_named(bc, self.named_owner), self.named_owner))
        self.mine = a_new_place(bc, fn, self.kind)
        self.id_at = field_by_name(bc, self.kind, THE_ID_ON, "a holder")[0]
        self.my_id = reader.borrow_register(bc, fn, "count_kind")
        self.their_id = reader.borrow_register(bc, fn, "count_kind")

    def reaching(self, into):
        """The host of the thing being ticked, however this word says to get there."""
        bc, op = self.bc, self.op
        if self.door is None:
            return [op("Field", dst=into, obj=0, field=self.at)]
        out = [op("Call1", dst=into, fun=self.door, arg0=0)]
        if self.also is None:
            return out
        # the second door: only when the first answered nothing and the thing IS that other kind
        self.asked_before.append(1)
        done = "%s: the first door answered, %d" % (self.word, len(self.asked_before))
        return out + [
            (op("JNotNull", reg=into), done),
            op("GetGlobal", **{"dst": self.also_class,
                               "global": class_global(bc, kind_named(bc, self.also[0]))}),
            op("Call2", dst=self.also_really, fun=gv(function_named(bc, IS_REALLY).findex),
               arg0=self.also_class, arg1=0),
            (op("JFalse", cond=self.also_really), done),
            op("UnsafeCast", dst=self.also_thing, src=0),
            op("Field", dst=into, obj=self.also_thing, field=self.also_at),
            done + ":", op("Label")]


def the_walk(bc, fn, op, site, reader, ids, region):
    """The places one pass and one row are read into, made once for the whole walk."""
    walk = SimpleNamespace()
    # and whether the pass in hand is the region's, which only the reading below asks
    walk.from_region = reader.borrow_register(bc, fn, "count_kind") if region.read else None
    walk.store = a_new_place(bc, fn, site.store_kind)
    walk.buckets = a_new_place(bc, fn, site.buckets_kind)
    walk.bucket = a_new_place(bc, fn, site.bucket_kind)
    walk.holds = a_new_place(bc, fn, site.holds_kind)
    walk.boxed = a_new_place(bc, fn, reader.row_kind)
    walk.application = a_new_place(bc, fn, ids.application_kind)
    # a place nothing reads, kept so every place after it keeps its number
    a_new_place(bc, fn, argument_kind(bc, gain_res.GAIN, 0))
    walk.value = a_new_place(bc, fn, argument_kind(bc, gain_res.GAIN, 1))
    walk.holder_id = a_new_place(bc, fn, ids.holder_id_kind)
    # the places the host-pass word joins a name in, made whether or not the word is on
    walk.host_said = oneline.places(bc, fn)
    walk.row_id = a_new_place(bc, fn, ids.row_id_kind)
    # RAISED PAST THE LAST GATE, READ PAST THE EXIT: tells a refused row from an accepted one
    walk.got_past = reader.borrow_register(bc, fn, "count_kind")
    walk.over, walk.drawn_over = what_it_is_drawn_over(bc, fn, site.word, vocabulary(), op)
    walk.drawn_over = _unless_empty(bc, fn, site.word, walk, op)
    # WHO THIS ROW'S NUMBERS GO TO: the road's payee until an act says otherwise, reset per row
    walk.shown_to = a_new_place(bc, fn, kind_named(bc, ownermatch.ASKED_AS))
    asked_kind = returns_type(function_named(bc, saidrow.ASK), saidrow.ASK)
    # raised for one walk of one application, and read by every stage word on that row
    walk.is_new = a_new_place(bc, fn, asked_kind)
    # the same latch narrowed to the host pass, where the last stage named is the refusing gate
    walk.say_here = a_new_place(bc, fn, asked_kind)
    walk.count = {name: reader.borrow_register(bc, fn, "count_kind")
                  for name in ("rows", "howmany", "apps", "at", "wanted", "store")}
    return walk


def in_flight(bc, fn, op, site, reader, walk):
    """Going in and coming out: this road's count of walks under way, and the borrowed maps."""
    # one counter per road: the engine may re-enter this road mid-walk, said only when it does
    counter = slot_global(bc, "roads in flight: %s" % site.word, reader.count_kind)
    depth = reader.borrow_register(bc, fn, "count_kind")
    two = reader.borrow_register(bc, fn, "count_kind")
    alone = "this road is not inside another %d" % depth
    # where an inner pass saves the outer pass's map before borrowing the slot
    borrowed_totals = a_new_place(bc, fn, kind_named(bc, oneshot.MAP))
    # and the credits beside them, borrowed and handed back at the same two points.
    borrowed_credits = a_new_place(bc, fn, kind_named(bc, oneshot.MAP))
    # the holder as the kind every holder shares, written ONCE: the per-row record keys by it
    walk.its_thing = a_new_place(bc, fn, kind_named(bc, reach.EVERY_HOLDER))
    going_in = (running.emit_remember(bc, fn, borrowed_totals)
                + running.emit_remember_credits(bc, fn, borrowed_credits)) + [
        op("UnsafeCast", dst=walk.its_thing, src=0),
    ] + [
        op("GetGlobal", dst=depth, **{"global": counter}),
        op("Incr", dst=depth),
        op("SetGlobal", src=depth, **{"global": counter}),
        op("Int", dst=two, ptr=number(bc, 2)),
        (op("JSLt", a=depth, b=two), alone),
    ] + sayonce.emit(bc, fn, NESTED % site.word, even_when_quiet=True) + [
        # re-entry is ordinary; only the outermost walk SETTLES
        alone + ":", op("Label"),
    ]
    one = reader.borrow_register(bc, fn, "count_kind")
    coming_out = [
        op("GetGlobal", dst=depth, **{"global": counter}),
        op("Int", dst=one, ptr=number(bc, 1)),
        op("Sub", dst=depth, a=depth, b=one),
        op("SetGlobal", src=depth, **{"global": counter}),
        # and the outer pass gets its totals back, whichever way this one left
    ] + (running.emit_give_back(bc, fn, borrowed_totals)
         + running.emit_give_back_credits(bc, fn, borrowed_credits))
    return going_in, coming_out


def _of_the_payee_s_kind(bc, fn, payee):
    """A place of the owner's own kind, or of the kind every holder shares when it has none."""
    if payee.two_holders:
        return a_new_place(bc, fn, returns_type(function_named(bc, payee.named), payee.named))
    return a_new_place(bc, fn, kind_named(bc, reach.EVERY_HOLDER))


def other_stores(bc, fn, op, site, reader, ids, walk, payee):
    """The places the carrier and foreign passes read, and the carriers remembered so far."""
    carriers, factions = SimpleNamespace(), SimpleNamespace()
    shared = kind_named(bc, reach.EVERY_HOLDER)
    # the things carrying a row a reach moved, and how many: one more pass each
    carriers.list = a_new_place(bc, fn, kind_named(bc, tray.ARRAY_OF_ENTRIES))
    carriers.known = a_new_place(bc, fn, kind_named(bc, oneshot.MAP))
    # `stands`: the place each carrier stands in, needed for a SET reach match
    carriers.stands = a_new_place(bc, fn, kind_named(bc, oneshot.MAP))
    carriers.one = a_new_place(bc, fn, gv(list(fn.regs)[0]))
    # whose store this pass reads, as the shared kind: a SET reach is read against it
    walk.whose_store = a_new_place(bc, fn, shared)
    carriers.how_many = reader.borrow_register(bc, fn, "count_kind")
    # this road's own class, so a carrier off the shared list is ASKED whether it is one
    carriers.its_class = a_new_place(
        bc, fn, gv(bc.global_types[class_global(bc, gv(list(fn.regs)[0]))]))
    carriers.really_one = a_new_place(bc, fn,
                                      returns_type(function_named(bc, IS_REALLY), IS_REALLY))
    # the foreign walk: the game's list of factions, how many, and which one this pass is on
    factions.list = a_new_place(bc, fn, foreignwalk.the_list_kind(bc))
    factions.how_many = reader.borrow_register(bc, fn, "count_kind")
    # and the same list opened for the STAGES: its object array and count
    factions.a_list = a_new_place(bc, fn, foreignwalk.the_list_kind(bc))
    factions.all = a_new_place(bc, fn, foreignwalk.the_backing_kind(bc))
    factions.how_many_all = reader.borrow_register(bc, fn, "count_kind")
    factions.which = reader.borrow_register(bc, fn, "count_kind")
    # of the owner's own kind: the store and id fields are resolved on a faction
    factions.one = _of_the_payee_s_kind(bc, fn, payee)
    factions.owner_id = reader.borrow_register(bc, fn, "count_kind")
    # what a row carries to say the pass that found it was a foreign one; nothing means own side.
    walk.from_foreign = reader.borrow_register(bc, fn, "count_kind")
    # whose rule it is: an owner word is judged against the faction HOLDING the rule
    walk.whose_rule = _of_the_payee_s_kind(bc, fn, payee)
    carriers.which = reader.borrow_register(bc, fn, "count_kind")
    carriers.id = reader.borrow_register(bc, fn, "count_kind")
    carriers.owner_id = reader.borrow_register(bc, fn, "count_kind")
    walk.owner_id = reader.borrow_register(bc, fn, "count_kind")
    walk.thing_id = reader.borrow_register(bc, fn, "count_kind")
    carriers.owner = (0 if not payee.two_holders
                      else a_new_place(bc, fn, gv(list(fn.regs)[payee.owner])))
    # the identity, resolved on each kind of its own
    ids.thing_id_at = field_by_name(bc, site.holder_kind, THE_ID_ON, "a holder")[0]
    ids.owner_id_at = (0 if not payee.two_holders else field_by_name(
        bc, gv(list(fn.regs)[payee.owner]), THE_ID_ON, "a holder")[0])
    carriers.counted_at = field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES),
                                        tray.COUNT_ON, "a list")[0]
    carriers.backing_at, carriers.backing_kind = field_by_name(
        bc, kind_named(bc, tray.ARRAY_OF_ENTRIES), tray.BACKING_ON, "a list")
    remembering = (_remembering(bc, fn, op, site, carriers, factions)
                   if payee.two_holders else [])
    # a one-holder road (`Faction`) reads its own store, then each foreign one, the same field
    factions.here = a_new_place(bc, fn, gv(list(fn.regs)[0]))
    # its own place, of the kind the game is asked about, so a dead faction's store is skipped
    factions.live = a_new_place(bc, fn, kind_named(bc, ownermatch.ASKED_AS))
    factions.is_dead = a_new_place(bc, fn, returns_type(function_named(bc, IS_DEAD), IS_DEAD))
    return carriers, factions, remembering


def _remembering(bc, fn, op, site, carriers, factions):
    """The carriers remembered so far and how many, and how many factions the game has."""
    no_game = "%s: no game to ask" % site.word
    return (rehosted.emit_ready(bc, fn, carriers.list, carriers.known, site.word,
                                gv(list(fn.regs)[0]), stands_into=carriers.stands)
            + rehosted.emit_how_many(bc, fn, carriers.list, carriers.how_many,
                                     carriers.counted_at, site.word)
            # the factions, counted off the game's own list; no game leaves nothing
            + [op("Int", dst=factions.how_many, ptr=number(bc, 0))]
            + foreignwalk.emit_the_list(bc, fn, factions.list, no_game)
            + foreignwalk.emit_the_length(bc, fn, factions.list, factions.how_many, no_game)
            + [no_game + ":", op("Label")]
            # and the number itself, said once
            + _say_how_many_factions(bc, fn, op, factions.how_many, site.word))


def settling(bc, fn, op, site, reader, its_thing):
    """The pass's own totals and credits, forgotten as it starts and settled past its last row."""
    found = SimpleNamespace()
    # the running totals start each pass at nothing, so a gone row's total falls
    totals = a_new_place(bc, fn, kind_named(bc, oneshot.MAP))
    # and the credits beside them, so a gone rider falls back to the receiver's own owner
    credits = a_new_place(bc, fn, kind_named(bc, oneshot.MAP))
    # and the array the engine answers into, made once and never the manager's shared one
    answering = a_new_place(bc, fn, kind_named(bc, tray.ARRAY_OF_ENTRIES))
    found.readying = answer_array.emit_ready(bc, fn, answering, site.word)
    # our own bucket, as a number the settling hands the engine; where a thing keeps its traits
    found.the_bucket = reader.borrow_register(bc, fn, "count_kind")
    traits_at, _ = field_by_name(bc, kind_named(bc, reach.EVERY_HOLDER), "_traits",
                                 "a thing that can carry traits")
    # only its own holder settles here, each nested invocation with its own totals and credits
    found.its_own = (a_new_place(bc, fn, kind_named(bc, oneshot.MAP)),
                     a_new_place(bc, fn, kind_named(bc, tray.ARRAY_OF_ENTRIES)))
    # which rows are already counted for which RECEIVER (not THING) in this pass
    paid_here = a_new_place(bc, fn, kind_named(bc, oneshot.MAP))
    # settle the thing only if a row reached it: spliced at the sweep, so no exit settles
    minding_itself = (settle.emit_touch(bc, fn, its_thing, site.word, held=found.its_own)
                      + settle.emit_seed(bc, fn, its_thing, site.word, site.word,
                                         found.its_own))
    found.taking_back = minding_itself + settle.emit_settle_all(
        bc, fn, op, "%s thing" % site.word, gain_ttrait_stacks.GRANT,
        gain_ttrait_stacks.MANAGER, found.the_bucket, traits_at, say_the_number=True,
        held=found.its_own, totals_held=totals) + prodpass.emit_sweep(
        bc, fn, its_thing, site.word)
    making = function_named(bc, oneshot.MAKE)
    # the pass starts with nobody in that list and its own fresh totals, published nowhere
    found.forgetting = (
        running.emit_take_it(bc, fn, totals)
        + running.emit_take_credits(bc, fn, credits)
        + settle.emit_forget_touched(bc, fn, "%s thing" % site.word, held=found.its_own)
        + prodpass.emit_ready(bc, fn)
        # nobody counted for yet: a fresh map, as the old may still be held
        + [op("New", dst=paid_here),
           op("Call1", dst=a_new_place(bc, fn, returns_type(making, oneshot.MAKE)),
              fun=gv(making.findex), arg0=paid_here)])
    return found


def ledgers(bc, fn, walk, two_holders):
    """What the walk keeps across rows: the parse's maps, the said latch, the marks, the aim."""
    found = SimpleNamespace()
    found.making, found.maps = parsed.emit_ready(bc, fn)
    found.said, found.said_map = saidrow.emit_ready(bc, fn)
    # with a second holder, the latch is keyed by the RECEIVER: one application serves many
    found.per_thing = []
    if two_holders:
        found.per_thing, found.said_map = saidrow.emit_for_this_thing(bc, fn, found.said_map, 0)
    # asked ONCE for the whole walk: is this the road's first pass over this holder?
    found.sweeping, found.first_pass = rederive.emit_is_the_first_pass(bc, fn, holder=0)
    found.placing, places = mark.ready(bc, fn, tray.PER_EVENT)
    found.counting, paid = mark.ready(bc, fn, tray.TAKEN_FROM)
    found.aiming, found.moved_past, found.took_a_place = tray.emit_aim_at_what_it_named(
        bc, fn, places, paid, walk.application)
    return found


def _unless_empty(bc, fn, spelling, walk, op):
    """The road's thing's stand-in, worked out only when the field its call reads is there."""
    from framework.names import module_of
    needs = getattr(module_of(vocabulary()[spelling]), SHOWN_NEEDS_BY, None)
    if needs is None:
        return walk.drawn_over
    at, kind = field_by_name(bc, gv(fn.regs[0]), needs, "the thing its numbers appear over")
    held, past = a_new_place(bc, fn, gv(kind)), "no %s to draw over at %d" % (needs, walk.over)
    return [op("Null", dst=walk.over), op("Field", dst=held, obj=0, field=at),
            (op("JNull", reg=held), past)] + walk.drawn_over + [past + ":", op("Label")]
