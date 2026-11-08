"""A road's walk over its holder's stores, put together from pieces that each read their part."""
from tools.project import gv
from tools.hlcode import (assemble, field_by_name, function_named, kind_named, number,
                          returns_type, template, written)
from framework import (board, boundary, carrierplace, columns, foreignwalk, triggermatch, lasttick,
                   multmatch, ownermatch, parammatch, parsed, passtray, pipeline,
                   reach, record, ridermatch, sayonce, scopematch, traps, tray, walkpasses,
                   walkplaces, walkrow)
from framework.acts import gain_ttrait_stacks, spawn_tunits
from framework.loadguard import world_slot
from framework.parsed import a_new_place
from framework.rowreader import reader_for
from framework.storewalk import (DONE, HAND_THE_VILLAGE_OVER, HOLDERS, PAYEE, RAN,
                             THE_BASE_THROUGH, _naming_the_holder)


# the belonging question is `framework/setreach.py`'s, and only its -- a copy here was dead code.
def _kept(bc, road, ops):
    """The road as written into the game, kept by its name so the pipeline case checks it."""
    ops = list(ops)
    bc.__dict__.setdefault(WRITTEN_ON, {}).setdefault(road.name, []).append(ops)
    return ops


# where each road's written instructions are kept on the file, by the road's name
WRITTEN_ON = "_spine_roads_written"


def emit(bc, site, road, reader=None):
    """The whole block: wait, ask, walk the store above the sentinel, run the road on each row."""
    walk = _Walk(bc, site, road, reader or reader_for(bc))
    return assemble(walk.opening() + walk.passes() + walk.rows() + walk.closing())


class _Walk:
    """One road's walk as it is written: its places made in a fixed order, then its four parts."""

    def __init__(self, bc, site, road, reader):
        self.bc, self.site, self.road, self.reader = bc, site, road, reader
        fn, op = site.fn, self.op
        self.fn = fn
        self.ids = walkplaces.ids(bc, site)
        # THE ROAD'S OWN OPENING, WRITTEN FIRST: it asks where the sentinel sits, once a walk
        self.road_opening = list(road.opening(bc, fn))
        self.world = a_new_place(bc, fn, gv(bc.global_types[world_slot(bc)]))
        self.asking_if_live = walkplaces.asking_if_live(bc, fn, op, site)
        self.payee = payee = walkplaces.payee(bc, fn, op, site)
        self.region = region = walkplaces.region(bc, fn, op, site)
        self.host = walkplaces.Host(bc, fn, op, site, payee.two_holders, reader,
                                    self.ids.application_kind)
        # ⛔ the road's own store count, never the constant: the carrier and foreign passes use it
        self.holders = HOLDERS + (1 if self.host.on else 0) + (1 if region.read else 0)
        self.walk = walk = walkplaces.the_walk(bc, fn, op, site, reader, self.ids, region)
        self.going_in, self.coming_out = walkplaces.in_flight(bc, fn, op, site, reader, walk)
        # what the parse kept comes back into a place per thing, each of the kind that thing is
        self.into = into = parsed.places_for(bc, fn, reader)
        # AND THE REACH, never kept: each row's own is taken off it before anything reads it
        into[reach.NAMED] = reader.borrow_register(bc, fn, "count_kind")
        self.carriers, self.factions, self.remembering = walkplaces.other_stores(
            bc, fn, op, site, reader, self.ids, walk, payee)
        self.one_holder_stores = walkpasses.one_holder_stores(bc, fn, op, site, self.ids, walk,
                                                              self.factions)
        self.opening_the_factions = walkpasses.opening_the_factions(bc, fn, op, site,
                                                                    self.factions)
        walk.counted = {}
        counts = multmatch.emit_counts(bc, fn, op, site, reader, walk.counted,
                                       payee.owner if payee.two_holders else None)
        base = _the_main_base(bc, fn, op, site, walk)
        village, reaching_the_village = _the_village(bc, fn, op, site)
        self.holder_facts = counts + base + reaching_the_village
        # a moved row is read against the CARRIER's place: its pass swaps in the carrier's region
        region.row = (None if region.the is None
                      else a_new_place(bc, fn, gv(list(fn.regs)[region.the])))
        self.places = {"owner": payee.owner, "region": region.row, "village": village}
        # the carrier's region, a proved carrier's own or, with no cell, its host's
        self.carriers.region = ([] if region.row is None else carrierplace.emit_region_of(
            bc, fn, op, self.carriers.one, region.row, "%s carrier" % site.word))
        walk.asked = reader.borrow_register(bc, fn, "count_kind")
        self.remembering_this_one = [] if not payee.two_holders else (
            walkrow.remembering_this_one(bc, fn, op, site, reader, into, walk, self.host,
                                         self.carriers, village))
        self.only_a_moved_row = [] if not payee.two_holders else walkrow.only_a_moved_row(
            bc, fn, op, site, reader, into, walk, self.carriers, self.holders, self.places,
            region.the)
        self.settling = walkplaces.settling(bc, fn, op, site, reader, walk.its_thing)
        self.ledgers = walkplaces.ledgers(bc, fn, walk, payee.two_holders)
        # what this row is read against, written per ROW: two rows may name different holders
        walk.read_against = a_new_place(bc, fn, kind_named(bc, reach.EVERY_HOLDER))
        self.noting = walkrow.noting(bc, fn, op, site, into, walk, self.settling.its_own)
        self.row = _the_row(into, walk, payee, region, self.factions)

    def op(self, name, **operands):
        return written(template(self.bc, name), **operands)

    def opening(self):
        """Everything asked once a walk, before the first store is opened."""
        bc, fn, op, site = self.bc, self.fn, self.op, self.site
        walk, region, ledgers, settling = self.walk, self.region, self.ledgers, self.settling
        return (
            # a road wears the traps of `a splice that runs every tick`, the load guard among them
            traps.wear(bc, traps.PER_TICK, fn, DONE, world=self.world)
            # still in the game? the update's own question, left on the answer that returns
            + self.asking_if_live
            + self.payee.reaching
            + region.reaching
            + self.holder_facts
            # the walker's own region until a pass says otherwise, on a road with no carriers too
            + ([] if region.row is None else [op("Mov", dst=region.row, src=region.the)])
            + sayonce.emit(bc, fn, RAN % site.word, even_when_quiet=True)
            + board.emit_bump(bc, fn, board.PASS_NOW)
            # and from HERE every exit passes DONE, so the count this raises is always put back
            + self.going_in
            + [# the THING's own id, read ONCE for the walk, the owner's pass included
               op("Field", dst=walk.holder_id, obj=0, field=self.ids.holder_id_at)]
            + _naming_the_holder(bc, fn, walk.holder_id)
            + [
               # ⛔ ANYTHING AT ALL? asked BEFORE the tray opens, since opening one EMPTIES it
               op("Field", dst=walk.store, obj=0, field=site.store_at)]
            + ([] if self.payee.two_holders else [(op("JNull", reg=walk.store), DONE)])
            + ledgers.making
            + ledgers.said
            + [op("Int", dst=settling.the_bucket,
                  ptr=number(bc, gain_ttrait_stacks.bucket_for(site.word)))]
            + settling.readying
            + self.opening_the_factions
            + settling.forgetting
            + self.remembering
            + ledgers.per_thing
            + ledgers.sweeping
            + ledgers.placing
            + ledgers.counting
            + self.road_opening
            # ONE TRAY PER PAYEE: the thing it is drawn over is worked out once, for every row
            + walk.drawn_over + passtray.emit_open(bc, fn, walk.over))

    def passes(self):
        """ONE PASS PER HOLDER: the thing's own rows, then its owner's, then the rest."""
        if not self.payee.two_holders:
            return self.one_holder_stores
        bc, fn, op, site, walk = self.bc, self.fn, self.op, self.site, self.walk
        payee, region, host = self.payee, self.region, self.host
        return (walkpasses.own_and_owner(bc, fn, op, site, walk, payee, region, host)
                + walkpasses.the_host_s(bc, fn, op, site, walk, region, host)
                + walkpasses.the_region_s(bc, fn, op, site, walk, region, host)
                + walkpasses.a_carrier_s(bc, fn, op, site, self.reader, self.ids, walk, payee,
                                         region, host, self.carriers, self.holders)
                + walkpasses.a_foreign_one(bc, fn, op, site, self.ids, walk, payee,
                                           self.carriers, self.factions, self.holders))

    def rows(self):
        """Each row of the store in hand: opened, gated, read, then run down the road."""
        bc, fn, op, site, reader = self.bc, self.fn, self.op, self.site, self.reader
        walk, host, into, ledgers = self.walk, self.host, self.into, self.ledgers
        return (
            walkrow.opening_a_row(bc, fn, op, site, self.road.kept[boundary.STAGE], self.ids,
                                  walk, self.region, self.payee.two_holders)
            + walkrow.the_host_gate(bc, fn, op, site, reader, walk, host)
            + walkrow.reading_the_row(bc, fn, op, site, reader, self.ids, into, walk, host,
                                      self.places, ledgers)
            # ⛔ nothing about a place is decided here: a region cannot answer the accept gate
            + self.remembering_this_one
            # on a carrier's pass only a row a reach moved is read; the rest is the carrier's
            + self.only_a_moved_row
            # ⛔ the stage path is off with every other print
            + _kept(bc, self.road, self.road.emit(
                bc, fn, self.row, saying=False, shouting=None, only_while=walk.say_here,
                once_past_the_gates=walkrow.once_past_the_gates(
                    bc, fn, op, site, reader, into, walk, host, self.places, ledgers),
                # ⛔ past every act and no refusal: a refused row aims there next walk
                before_leaving=(
                    ledgers.moved_past
                    # ⛔ AND THE TRAIT IS WRITTEN DOWN HERE, where no refused row reaches
                    + self.noting
                    # then the tray is drawn and emptied, shown to the payee
                    + passtray.emit_row_or_pass(bc, fn, ledgers.took_a_place, walk.shown_to,
                                                self.payee.owner)))))

    def closing(self):
        """Past the row, on to the next store; past the last store, the settling and the exit."""
        bc, fn, op, owner = self.bc, self.fn, self.op, self.payee.owner
        return (
            walkrow.closing_the_row(bc, fn, op, self.site, self.into, self.walk, self.ledgers)
            # and on to the next store: the owner's, and then one per remembered carrier
            + walkpasses.on_to_the_next(bc, op, self.walk, self.carriers, self.factions,
                                        self.holders, self.payee.two_holders)
            # PAST EVERY ROW OF EVERY STORE, never at an exit: an ungranted trait goes to nothing
            + self.settling.taking_back
            # AND THE WORLD'S TICK IS TOLD THIS PASS FINISHED, which an idle road never says
            + lasttick.emit_ran(bc, fn, self.site.word)
            + [DONE + ":",
               op("Label")]
            # every exit above passes here, so the road is off the count whichever way it left
            + self.coming_out
            # PAST EVERY EXIT: closing empties both places, so no walk inherits a position
            + tray.emit_close(bc, fn, owner) + passtray.emit_close(bc, fn, owner))


def _the_main_base(bc, fn, op, site, walk):
    """The faction's main base, for spawning: empty on every road but the faction's."""
    door = function_named(bc, THE_BASE_THROUGH)
    walk.the_main_base = a_new_place(bc, fn, returns_type(door, THE_BASE_THROUGH))
    out = [op("Null", dst=walk.the_main_base)]
    if site.holder_kind == kind_named(bc, foreignwalk.ASKED_AS_FACTION):
        out = [op("Call1", dst=walk.the_main_base, fun=gv(door.findex), arg0=0)]
    return out


def _the_village(bc, fn, op, site):
    """The village the holder belongs to, hop by hop, each place emptied before it is written."""
    # ⛔ reading `ent.Unit._structure` directly faults; go through `get_structure`
    hops = scopematch.the_village_hops(site.word)
    village, out = None, []
    if hops == ("itself",):
        village = 0
    elif hops:
        no_village = "%s: this holder belongs to no village" % site.word
        at_each, emptied = 0, []
        for name in hops:
            # a name with a dot in it is a question, not a place: reading the place faults
            if "." in name:
                door = function_named(bc, name)
                got = a_new_place(bc, fn, returns_type(door, name))
                emptied.append(got)
                out += [op("Call1", dst=got, fun=gv(door.findex), arg0=at_each),
                        (op("JNull", reg=got), no_village)]
                at_each = got
                continue
            where, holds = field_by_name(bc, gv(list(fn.regs)[at_each]), name,
                                         "the holder these rules are about")
            got = a_new_place(bc, fn, holds)
            emptied.append(got)
            out += [op("Field", dst=got, obj=at_each, field=where),
                    (op("JNull", reg=got), no_village)]
            at_each = got
        # every place this writes is emptied first, so a skipped write reads cleared, not stale
        out = [op("Null", dst=r) for r in emptied] + out + [no_village + ":", op("Label")]
        village = at_each
    # switched off, the village is worked out and handed to NOBODY
    return (village if HAND_THE_VILLAGE_OVER else None), out


def _the_row(into, walk, payee, region, factions):
    """What the road's stages read of one row, under the name each stage asks for."""
    return {"source.row": walk.count["rows"], "source.application": walk.application,
            pipeline.SCOPE_IS: into["scope"], "holder": walk.read_against, PAYEE: payee.owner,
            # the walk's holder's id, read once above: a re-hosted holder keeps none of its own
            gain_ttrait_stacks.WHOSE: walk.holder_id,
            # the reach the modder wrote, so the scope gate tells a refusal from a moved row
            columns.REACH_NAMED: into[reach.NAMED],
            # and what a narrowing's own column names, for the word that asks about it
            columns.PART_FOR_NARROWING: into[columns.PART_FOR_NARROWING],
            columns.PART_FOR_PARAMETER: into[columns.PART_FOR_PARAMETER],
            columns.PART_FOR_COUNT: into[columns.PART_FOR_COUNT],
            columns.PART_FOR_MEMBERS: into[columns.PART_FOR_MEMBERS],
            # what a MARKED scope narrows by: which column, and the id that column named
            pipeline.SCOPE_AT_COLUMN: into[scopematch.AT_COLUMN],
            pipeline.SCOPE_TURNED: into[pipeline.scopeturn.TURNED],
            columns.PART_FOR_SCOPE: into[columns.PART_FOR_SCOPE],
            # THE COLUMN THE EFFECT'S NUMBER NAMED, kept under the application at the load
            "columns.named": into[columns.PART], "value": walk.value,
            "effect.adds": into["adds"],
            # which act the row named, so the ones it did not step over themselves
            "effect.does": into["does"],
            # and what part it reads on which column; column 0 is a row spelled with no target
            "effect.part": into["part"], "effect.column": into["column"],
            # whether the spelling means ONE, rather than the number the modder wrote
            "effect.one": into["one"], "effect.turned": into["turned"],
            # whether it ACCUMULATES, so the gate never pays it on the trigger-less path
            "effect.lump": into["lump"],
            # AND WHETHER THE ROW NAMED A TRIGGER: with one it pays each time, without it holds
            "name.%s" % triggermatch.NAMED: into[triggermatch.NAMED],
            # and WHO may accept the row, read by the gate that judges two factions
            "name.%s" % ownermatch.NAMED: into[ownermatch.NAMED],
            # AND WHO THE RESULT COUNTS FOR: the act writes it beside the total
            "name.%s" % ridermatch.NAMED: into[ridermatch.NAMED],
            # every word's numbers, on the row's own list, looked up where they are used
            parsed.NUMBERS_PART: into[parsed.NUMBERS],
            # and which parameter it spelled, for the act that is handed something to use
            "name.%s" % parammatch.NAMED: into[parammatch.NAMED],
            "name.%s" % parammatch.AT_COLUMN: into[parammatch.AT_COLUMN],
            # and whether the pass that found this row was a foreign one
            foreignwalk.FROM_FOREIGN: walk.from_foreign,
            foreignwalk.WHOSE_RULE: walk.whose_rule,
            # the game's own factions, opened once a pass for `ForAll`; empty with no game
            foreignwalk.EVERY_ONE: factions.all,
            foreignwalk.HOW_MANY: factions.how_many_all,
            # and where a rule that makes units puts them
            spawn_tunits.THE_BASE: walk.the_main_base,
            # and who holds the region this holder is standing in, asked once a pass
            scopematch.HELD_REGION: region.held,
            # whether this is the region's pass, so the owner gate keeps unworded rows off it
            record.FROM_REGION: walk.from_region,
            # who this row's numbers are drawn to, which an act paying across factions moves
            tray.SHOWN_TO: walk.shown_to,
            # AND WHAT MAY RECEIVE THE GRANT, which a reach never moves (`holder` is re-hosted)
            scopematch.TICKED: walk.its_thing,
            # and what each multiplier counts on this holder
            **{"%s.%s" % (multmatch.COUNTED, word): walk.counted[word]
               for word in multmatch.counted_words()}}
