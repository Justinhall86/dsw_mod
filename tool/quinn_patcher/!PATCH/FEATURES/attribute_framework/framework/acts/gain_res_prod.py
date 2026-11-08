#!/usr/bin/env python3
"""`add-production`: one game `TRes_Prod_*` application per walker and row, settled each pass."""
from tools.project import gv, guard
from tools.hlcode import argument_kinds, enum_case, kind_named, slot_global, text_object
from framework.acts.gain_res import PAYEE, PAYS, WHICH
from framework.parammatch import NAMED as PARAMETER
from framework.tray import ARRAY_OF_ENTRIES as A_LIST, BACKING_ON, COUNT_ON, PUSH
from framework.boundary import LOOKUP
from framework.foreignwalk import EVERY_ONE, FROM_FOREIGN, HOW_MANY, WHOSE_RULE
from framework.parsed import HELD_BY as APPLICATION, a_new_place
from framework import columns, effecttable, forwhom

# ours are keyed by the application's own number, in the game's own number-keyed map
MAP, MAKE = "haxe.ds.IntMap", "haxe.ds.$IntMap.__constructor__"
READ, TELL, FORGET = "haxe.ds.IntMap.get", "haxe.ds.IntMap.set", "haxe.ds.IntMap.remove"

STAGE = "add-production"
NUMBER = 4
# the held table's walk over families and over kinds, and its builder's walk over the text
LOOPS = 3
# per held word: part, where its target is named, the target case and each parameter's attribute
OWN, NONE, PICKED_DOMAIN = effecttable.OWN, effecttable.NONE, effecttable.PICKED_DOMAIN
FAMILIES = effecttable.held_families()
# the target case an untargeted family holds: past every case (checked), as a number is unsigned
NO_TARGET = 4096
# the game's own calls: what a faction carries of one attribute, and add and take away
CARRIED = "logic.AttributesManager.getAppsByKind"
ADD = "ent.Faction.addAttributeRaw"
REMOVE = "ent.Faction.removeAttribute"
# the game's cost factor of one development, asked per domain: the added, then the multiplied
COST, COST_ASKS, COST_FEEDS = ("logic.faction.Developments.getStepFactor", "ent.Object.getAtbVal",
                               ("Add", "Mul"))
# and the game's own way of taking one thing out of a list
UNLIST = "hl.types.ArrayObj.remove"
# ours is filed under the very source the row's own application has
GRANTED_BY = "source.application"
TARGET = "ETargetKind"
# the effect's part and the column it was spelled on (none: the untargeted family)
PART, SPELLED_ON = "effect.part", "effect.column"
# the source cases whose first part is a text, by name; a case with none matches by its case alone
SOURCE_KIND = "ESourceKind"
NAMED_SOURCES = ("EDevelopment", "ETrait", "EUpgrade", "EResolution", "ETreaty", "EMission")
# OUR FOUR PLACES: every application of ours, its walker's number, the renewed, and each walker
OURS = "every production application of ours"
OWNED_BY = "which walker each production application of ours belongs to"
RENEWED = "the production applications a pass renewed"
WALKERS = "each walker owning a production application of ours, by its own number"
THE_ID_ON = "__uid"
# ⛔ THE BASE ONE, CALLED DIRECTLY: only `removed`; the faction's own adds the game's end
GONE = "ent.Object.isDead"
# WHOSE WALK THIS IS, as the object: its own number keys ours, since a text id names a type
from framework.scopematch import TICKED as WALKER
READS = (PAYEE, "columns.named", "value", WHICH, "name.%s" % PARAMETER, GRANTED_BY, WALKER,
         WHOSE_RULE, FROM_FOREIGN, EVERY_ONE, HOW_MANY, PART, SPELLED_ON, columns.PART_FOR_COUNT,
         columns.PART_FOR_NARROWING)
ENTERED = "SPINE a production row reached its act"
ADDED = "SPINE a production row added the game's attribute"
KEPT = "SPINE a production row found its attribute already right"
REPLACED = "SPINE a production row replaced its attribute"
NOBODY = "SPINE a production row had no faction"
UNGRANTED = "SPINE a production row had no source to file it under"
ADOPTED = "SPINE a production row took back an application a load brought"
NO_LEDGER = "SPINE a production row found no list of ours to file under"
UNMATCHED = "SPINE a production row named no attribute the game has"
TAKEN_BACK = "SPINE a production no row renewed this pass was taken back"
OWNER_GONE = "SPINE a production whose unit or agent is gone was taken back"
ASKS_WITH = (ENTERED, ADDED, KEPT, REPLACED, NOBODY, UNGRANTED, ADOPTED, NO_LEDGER, TAKEN_BACK,
             OWNER_GONE, UNMATCHED)


def check_what_we_borrow(bc):
    """Each borrowed call takes what this hands it, or the build stops."""
    for name, takes in ((CARRIED, 1), (ADD, 2), (REMOVE, 1), (LOOKUP, 1), (UNLIST, 1),
                        (FORGET, 1), (GONE, 0)):
        got = len(argument_kinds(bc, name))
        guard(got == takes, "%s takes %d argument(s) and this hands it %d" % (name, got, takes))


def _asking(place, word):
    return place.said("prodpath", lambda: place.said_now(word))


def emit_act(place):
    """If the row named a held word: find this walker's application, keep, replace or add it."""
    return acting(place, effecttable.held_rows(), FAMILIES)


def acting(place, held, families):
    """The production act for every `held` word, each picking from its own families."""
    guard(place.kind_of(place.row[PAYEE]) == place.kind_of(place.scratch_of(PAYS)),
          "the payee is a t@%s and %s takes a %s" % (place.kind_of(place.row[PAYEE]), ADD, PAYS))
    mine = place.scratch_like(place.row[WHICH])
    past, nobody = place.here("this row names another act"), place.here("nobody")
    faction = place.scratch_of(PAYS)
    kind = place.scratch_arg(CARRIED, 0)
    case = _a_number(place)
    named = place.scratch_like(place.row["columns.named"])
    picked, unmatched = place.here("the attribute is picked"), place.here("no attribute")
    # ⛔ ONE RANGE, NOT ONE TEST PER WORD: the held words' numbers run on from the first
    out = [place.op("Int", dst=mine, ptr=place.number(effecttable.HELD_FIRST)),
           (place.op("JSLt", a=place.row[WHICH], b=mine), past),
           place.op("Int", dst=mine, ptr=place.number(effecttable.HELD_FIRST + len(held))),
           (place.op("JSGte", a=place.row[WHICH], b=mine), past)] + _asking(place, ENTERED) + [
           place.op("Mov", dst=faction, src=place.row[PAYEE]),
           (place.op("JNull", reg=faction), nobody)]
    # ⛔ FILED UNDER THE ROW'S OWN SOURCE: the trait's name shows, and each row keeps its own
    ungranted = place.here("no source")
    granting, granted = _the_rows_source(place, ungranted)
    out += [(place.op("JNull", reg=place.row[GRANTED_BY]), ungranted)] + granting + [
        (place.op("JNull", reg=granted), ungranted)]
    # THE PART AND THE PARAMETER PICK THE ATTRIBUTE; a pair the game has none for leaves the row
    from framework import prodpick
    out += prodpick.picking_by_table(place, kind, case, named, picked, unmatched, held,
                                     effecttable.HELD_FIRST) + [picked + ":", place.op("Label")]
    bundle = place.scratch_arg(ADD, 1)
    at_val, amount = place.field_of(bundle, "val")
    as_is = place.kind_of(place.row["value"]) == place.kind_of(amount)
    out += [place.op("Mov" if as_is else "ToSFloat", dst=amount, src=place.row["value"])]
    out += forwhom.scaled(place, amount)
    found = place.scratch_of(APPLICATION)
    have, add, keep, no_ledger = (place.here("this walker has its application"),
                                  place.here("add ours"), place.here("ours is already right"),
                                  place.here("no list of ours"))
    target = (case, named, families)
    finding, ledger, walker_id = _this_walkers(place, faction, kind, granted, found, have, add,
                                               no_ledger, target)
    out += finding
    at, held = place.field_of(APPLICATION, "val")
    at_uid, uid = place.field_of(APPLICATION, "uid")
    removed = place.scratch_return(REMOVE)
    got = place.scratch_return(ADD)
    return out + [
        have + ":", place.op("Label"),
    ] + _renew(place, found, "kept") + [
        place.op("Field", dst=held, obj=found, field=at),
        (place.op("JEq", a=held, b=amount), keep),
        place.op("Field", dst=uid, obj=found, field=at_uid),
        place.op("Call2", dst=removed, fun=place.named_function(REMOVE), arg0=faction, arg1=uid),
    ] + _disown(place, ledger, found) + _asking(place, REPLACED) + [
        add + ":", place.op("Label"),
    ] + _add(place, faction, kind, bundle, at_val, amount, granted, got, target) + [
        (place.op("JNull", reg=got), past),
    ] + _own(place, ledger, got, walker_id, "added") + _renew(place, got, "added") + [
        (place.op("JAlways"), past),
        keep + ":", place.op("Label"),
    ] + _asking(place, KEPT) + [
        (place.op("JAlways"), past),
        nobody + ":", place.op("Label"),
    ] + _asking(place, NOBODY) + [
        (place.op("JAlways"), past),
        ungranted + ":", place.op("Label"),
    ] + _asking(place, UNGRANTED) + [
        (place.op("JAlways"), past),
        no_ledger + ":", place.op("Label"),
    ] + _asking(place, NO_LEDGER) + [
        (place.op("JAlways"), past),
        unmatched + ":", place.op("Label"),
    ] + _asking(place, UNMATCHED) + [
        past + ":", place.op("Label")]


def _the_rows_source(place, refused):
    """The source the game filed the row's own application under, read into a place of ours."""
    held, narrowing = place.narrowed(place.row[GRANTED_BY], place.scratch_of(APPLICATION),
                                     refused)
    at, like = place.field_of(APPLICATION, "source")
    granted = place.scratch_like(like)
    return narrowing + [place.op("Field", dst=granted, obj=held, field=at)], granted


def _this_walkers(place, faction, kind, granted, found, have, add, no_ledger, case):
    """`found` is this walker's application, or one a load brought back; to `add` when neither."""
    from framework.reach import EVERY_HOLDER
    # ⛔ NO LIST OF OURS, NO ADD: an application nothing can sweep would pile up every pass
    ledger = place.scratch_of(A_LIST)
    walker_at, walker_id = place.field_of(EVERY_HOLDER, THE_ID_ON)
    out = [place.op("GetGlobal", **{"dst": ledger, "global": place.slot(OURS)}),
           (place.op("JNull", reg=ledger), no_ledger),
           (place.op("JNull", reg=place.row[WALKER]), no_ledger),
           place.op("Field", dst=walker_id, obj=place.row[WALKER], field=walker_at)]
    out += _find_the_walkers(place, ledger, found, granted, walker_id, case, faction) + [
        (place.op("JNotNull", reg=found), have)]
    # NOT THIS WALKER'S YET: one a load brought back, equal in source and owned by nobody
    out += _find_unowned(place, faction, kind, found, granted, case) + [
        (place.op("JNull", reg=found), add)] + _own(place, ledger, found, walker_id, "taken back")
    return out + _asking(place, ADOPTED), ledger, walker_id


def _a_number(place):
    """A place for a plain count, of the kind the game's own take-away is handed."""
    return place.scratch_arg(REMOVE, 0)


def _owner_of(place, app, into, nobody):
    """`into` gets the walker the application belongs to; on to `nobody` when it is no one's."""
    owners = place.scratch_of(MAP)
    got = place.scratch_return(READ)
    at_uid, uid = place.field_of(APPLICATION, "uid")
    return [
        place.op("GetGlobal", **{"dst": owners, "global": place.slot(OWNED_BY)}),
        (place.op("JNull", reg=owners), nobody),
        place.op("Field", dst=uid, obj=app, field=at_uid),
        place.op("Call2", dst=got, fun=place.named_function(READ), arg0=owners, arg1=uid),
        (place.op("JNull", reg=got), nobody),
        place.op("SafeCast", dst=into, src=got),
    ]


def _walking(place, listed, found, tag, test, case):
    """`found` gets the first of `listed` that `test(app, step)` lets through."""
    from framework.prodpick import same_target
    count_at, count = place.field_of(A_LIST, COUNT_ON)
    backing_at, backing = place.field_of(A_LIST, BACKING_ON)
    index, one = place.scratch_like(count), place.scratch_like(count)
    item, app = place.scratch_of("Dyn"), place.scratch_of(APPLICATION)
    loop, step, done = (place.here("%s: the next" % tag), place.here("%s: on to the next" % tag),
                        place.here("%s: every one looked at" % tag))
    return [
        place.op("Null", dst=found),
        (place.op("JNull", reg=listed), done),
        place.op("Int", dst=index, ptr=place.number(0)),
        place.op("Int", dst=one, ptr=place.number(1)),
        loop + ":", place.op("Label"),
        place.op("Field", dst=count, obj=listed, field=count_at),
        (place.op("JSGte", a=index, b=count), done),
        place.op("Field", dst=backing, obj=listed, field=backing_at),
        place.op("GetArray", dst=item, array=backing, index=index),
        (place.op("JNull", reg=item), step),
        place.op("UnsafeCast", dst=app, src=item),
    ] + test(app, step) + same_target(place, app, step, case, tag) + [
        place.op("Mov", dst=found, src=app),
        (place.op("JAlways"), done),
        step + ":", place.op("Label"),
        place.op("Add", dst=index, a=index, b=one),
        (place.op("JAlways"), loop),
        done + ":", place.op("Label"),
    ]


def _find_the_walkers(place, ledger, found, granted, walker_id, case, faction):
    """`found` gets this walker's application of the row's source and resource for `faction`."""
    source_at, source = place.field_of(APPLICATION, "source")
    whose = place.scratch_like(walker_id)
    faction_at, held = place.field_of(APPLICATION, "faction")
    for_whom = place.scratch_like(faction)

    def test(app, step):
        return _owner_of(place, app, whose, step) + [
            (place.op("JNotEq", a=whose, b=walker_id), step),
            # ⛔ ONE PER FACTION: a `ForAll` row holds one application for each faction it pays
            place.op("Field", dst=held, obj=app, field=faction_at),
            place.op("UnsafeCast", dst=for_whom, src=held),
            (place.op("JNotEq", a=for_whom, b=faction), step),
            place.op("Field", dst=source, obj=app, field=source_at),
            # the very same source, not an equal one: two rows of one trait are not one row
            (place.op("JNotEq", a=source, b=granted), step)]
    return _walking(place, ledger, found, "ours", test, case)


def _equal_sources(place, source, granted, other):
    """On to `other` unless both sources are one case with one first text; a load rebuilds them."""
    same = place.here("the sources are equal")
    which, wanted, case = _a_number(place), _a_number(place), _a_number(place)
    mine, theirs = (place.scratch_like(place.row["columns.named"]),
                    place.scratch_like(place.row["columns.named"]))
    out = [(place.op("JEq", a=source, b=granted), same),
           (place.op("JNull", reg=source), other),
           place.op("EnumIndex", dst=which, value=source),
           place.op("EnumIndex", dst=wanted, value=granted),
           (place.op("JNotEq", a=which, b=wanted), other)]
    for name in NAMED_SOURCES:
        number_of_case = place.enum_case(SOURCE_KIND, name)
        not_this = place.here("the source is no %s" % name)
        out += [place.op("Int", dst=case, ptr=place.number(number_of_case)),
                (place.op("JNotEq", a=which, b=case), not_this),
                place.op("EnumField", dst=mine, value=source, construct=number_of_case, field=0),
                place.op("EnumField", dst=theirs, value=granted, construct=number_of_case,
                         field=0),
                (place.op("JNotEq", a=mine, b=theirs), other),
                (place.op("JAlways"), same),
                not_this + ":", place.op("Label")]
    return out + [same + ":", place.op("Label")]


def _find_unowned(place, faction, kind, found, granted, case):
    """`found` gets the faction's `kind` equal in source and resource that nobody owns."""
    at, manager = place.field_of(PAYS, "attributes")
    every = place.scratch_return(CARRIED)
    source_at, source = place.field_of(APPLICATION, "source")
    whose = _a_number(place)
    asked = place.here("the faction's own asked")

    def test(app, step):
        free = place.here("owned by nobody")
        return _owner_of(place, app, whose, free) + [
            (place.op("JAlways"), step),
            free + ":", place.op("Label"),
            place.op("Field", dst=source, obj=app, field=source_at),
        ] + _equal_sources(place, source, granted, step)
    return [
        place.op("Null", dst=every),
        place.op("Field", dst=manager, obj=faction, field=at),
        (place.op("JNull", reg=manager), asked),
        place.op("Call2", dst=every, fun=place.named_function(CARRIED), arg0=manager, arg1=kind),
        asked + ":", place.op("Label"),
    ] + _walking(place, every, found, "the faction's", test, case)


def _own(place, ledger, app, walker_id, tag):
    """The application is this walker's from now on, and on our list; the walker is noted."""
    owners, walkers = place.scratch_of(MAP), place.scratch_of(MAP)
    boxed = place.scratch_of("Dyn")
    told = place.scratch_return(TELL)
    pushed = place.scratch_return(PUSH)
    nowhere = place.here("nowhere to note an owner: %s" % tag)
    at_uid, uid = place.field_of(APPLICATION, "uid")
    return [
        place.op("GetGlobal", **{"dst": owners, "global": place.slot(OWNED_BY)}),
        (place.op("JNull", reg=owners), nowhere),
        place.op("GetGlobal", **{"dst": walkers, "global": place.slot(WALKERS)}),
        (place.op("JNull", reg=walkers), nowhere),
        place.op("Field", dst=uid, obj=app, field=at_uid),
        place.op("ToDyn", dst=boxed, src=walker_id),
        place.op("Call3", dst=told, fun=place.named_function(TELL),
                 arg0=owners, arg1=uid, arg2=boxed),
        place.op("UnsafeCast", dst=boxed, src=place.row[WALKER]),
        place.op("Call3", dst=told, fun=place.named_function(TELL),
                 arg0=walkers, arg1=walker_id, arg2=boxed),
        place.op("Call2", dst=pushed, fun=place.named_function(PUSH), arg0=ledger, arg1=app),
        nowhere + ":", place.op("Label"),
    ]


def _disown(place, ledger, app):
    """The application leaves our list, our owners and this pass's renewals."""
    owners, renewed = place.scratch_of(MAP), place.scratch_of(MAP)
    gone = place.scratch_return(FORGET)
    unlisted = place.scratch_return(UNLIST)
    at_uid, uid = place.field_of(APPLICATION, "uid")
    return [
        place.op("GetGlobal", **{"dst": owners, "global": place.slot(OWNED_BY)}),
        place.op("GetGlobal", **{"dst": renewed, "global": place.slot(RENEWED)}),
        place.op("Field", dst=uid, obj=app, field=at_uid),
        place.op("Call2", dst=gone, fun=place.named_function(FORGET), arg0=owners, arg1=uid),
        place.op("Call2", dst=gone, fun=place.named_function(FORGET), arg0=renewed, arg1=uid),
        place.op("Call2", dst=unlisted, fun=place.named_function(UNLIST), arg0=ledger, arg1=app),
    ]


def _renew(place, app, tag):
    """A row held this application this pass, so the pass's end keeps it."""
    renewed = place.scratch_of(MAP)
    told = place.scratch_return(TELL)
    nowhere = place.here("nowhere to note a renewal: %s" % tag)
    at_uid, uid = place.field_of(APPLICATION, "uid")
    boxed = place.scratch_of("Dyn")
    return [
        place.op("GetGlobal", **{"dst": renewed, "global": place.slot(RENEWED)}),
        (place.op("JNull", reg=renewed), nowhere),
        place.op("Field", dst=uid, obj=app, field=at_uid),
        place.op("ToDyn", dst=boxed, src=uid),
        place.op("Call3", dst=told, fun=place.named_function(TELL),
                 arg0=renewed, arg1=uid, arg2=boxed),
        nowhere + ":", place.op("Label"),
    ] + __import__("framework.questtimer").questtimer.emit_noted(place, app, tag)


def _add(place, faction, kind, bundle, at_val, amount, granted, got, picked):
    """The game's own add: the row's source, its target (or none), the default scope."""
    from framework.prodpick import cases_of
    case, named, families = picked
    id_ = place.scratch_return(LOOKUP)
    out = [place.op("Call1", dst=id_, fun=place.named_function(LOOKUP), arg0=kind),
           place.op("New", dst=bundle)]
    at, reg = place.field_of(bundle, "faction")
    out += [place.op("Mov", dst=reg, src=faction),
            place.op("SetField", obj=bundle, field=at, src=reg)]
    at, reg = place.field_of(bundle, "source")
    out += [place.op("SetField", obj=bundle, field=at, src=granted)]
    at, reg = place.field_of(bundle, "target")
    wanted, set_ = _a_number(place), place.here("adding: the target is set")
    out += [place.op("Null", dst=reg)]
    for enum in cases_of(families):
        number_of_case = place.enum_case(TARGET, enum)
        not_this = place.here("adding: the target is no %s" % enum)
        out += [place.op("Int", dst=wanted, ptr=place.number(number_of_case)),
                (place.op("JNotEq", a=case, b=wanted), not_this),
                place.op("MakeEnum", dst=reg, construct=number_of_case, args=[named]),
                (place.op("JAlways"), set_),
                not_this + ":", place.op("Label")]
    out += [set_ + ":", place.op("Label"), place.op("SetField", obj=bundle, field=at, src=reg)]
    # ⛔ NO SCOPE: the game picks the attribute's own default, as it does for a cdb row
    for empty in ("target2", "scope"):
        at, reg = place.field_of(bundle, empty)
        out += [place.op("Null", dst=reg), place.op("SetField", obj=bundle, field=at, src=reg)]
    return out + [place.op("SetField", obj=bundle, field=at_val, src=amount),
                  place.op("Call3", dst=got, fun=place.named_function(ADD), arg0=faction,
                           arg1=id_, arg2=bundle)] + _asking(place, ADDED)


def mint(bc, families):
    """Every family's target case checked and its attribute names minted."""
    for _named, _way, enum, kinds in families:
        guard(enum is None or enum_case(bc, TARGET, enum) >= 0, "no `%s` target case" % enum)
        for _word, attribute in kinds:
            text_object(bc, attribute)


def install(bc):
    """Check what this borrows, make our four places, and mint every family's attribute names."""
    check_what_we_borrow(bc)
    slot_global(bc, OURS, kind_named(bc, A_LIST))
    for which in (OWNED_BY, RENEWED, WALKERS):
        slot_global(bc, which, kind_named(bc, MAP))
    __import__("framework.questtimer").questtimer.make_slots(bc)
    cases = len(bc.types[kind_named(bc, TARGET)].definition.constructs)
    guard(cases < NO_TARGET, "%s has %d cases, so %d is one" % (TARGET, cases, NO_TARGET))
    mint(bc, FAMILIES)
    from tools.hlcode import function_named
    from framework.prodpick import install_table
    _built, text = install_table(bc, function_named(bc, ADD),
                                 lambda enum: enum_case(bc, TARGET, enum))
    return ("ADD PRODUCTION: one per walker and row, added through `%s`; a pass's end takes "
            "back through `%s` each of the walker's that no row renewed; %d instruction(s) make a "
            "research-cost row naming no domain count in every domain; the held table holds %d "
            "entries" % (ADD, REMOVE, _every_domain(bc), len(text.split(",")) if text else 0))


def _cost_asks(bc, fn):
    """Each place the cost factor asks for a value, with the instruction that takes it in."""
    from tools.hlcode import function_named
    asks = gv(function_named(bc, COST_ASKS).findex)
    sites = [i for i, o in enumerate(fn.ops) if o.op == "Call4" and gv(o.df["fun"]) == asks]
    guard([fn.ops[i + 1].op for i in sites] == list(COST_FEEDS),
          "`%s` asks `%s` %d time(s), fed to %s, not once each to %s"
          % (COST, COST_ASKS, len(sites), [fn.ops[i + 1].op for i in sites], COST_FEEDS))
    return sites


def _asked_with_no_domain(bc, fn, call, fold):
    """The same question with no domain at all, folded into what the game's own answer feeds."""
    from tools.hlcode import template, written
    regs = list(fn.regs)
    nowhere = a_new_place(bc, fn, gv(regs[gv(call.df["arg2"])]))
    answer = a_new_place(bc, fn, gv(regs[gv(call.df["dst"])]))
    got = gv(call.df["dst"])
    return [written(template(bc, "Null"), dst=nowhere),
            written(template(bc, "Call4"), dst=answer, fun=gv(call.df["fun"]),
                    arg0=gv(call.df["arg0"]), arg1=gv(call.df["arg1"]), arg2=nowhere,
                    arg3=gv(call.df["arg3"])),
            written(template(bc, fold), dst=got, a=got, b=answer)]


def _every_domain(bc):
    """The game's research cost, asked per domain, also adds what a row naming no domain holds."""
    from tools.hlcode import function_named
    from tools.splice import insert
    from framework import traps
    fn, went = function_named(bc, COST), 0
    # the later site first, so the earlier one's place still holds
    for at, fold in reversed(list(zip(_cost_asks(bc, fn), COST_FEEDS))):
        went += insert(bc, fn, at + 1, _asked_with_no_domain(bc, fn, fn.ops[at], fold),
                       "DevCost %s" % fold.lower(),
                       traps.IN_PLAY)
    return went
