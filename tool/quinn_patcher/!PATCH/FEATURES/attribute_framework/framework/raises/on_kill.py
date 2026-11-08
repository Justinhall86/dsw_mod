"""A thing killed another: one walk per side -- the killer's, the one killed's, and its region's."""
from tools.project import gv, guard
from tools.hlcode import (field_by_name, function_named, kind_named, new_function, replace_body,
                          returns_type, template, written)
from tools.splice import insert
from framework import raisewalk, sayonce, traps
from framework.parsed import a_new_place
from framework.pipeline import Place, hands_for
from framework.raisewalk import AN_OBJECT
from framework.rowreader import reader_for
from framework.scopematch import BASE_KIND_MATCHES, ITS_FAMILY, ITS_TYPE, NAMED as SCOPE
from framework.scopes import faction as faction_scope, region as region_scope, zone as zone_scope
from framework.triggers import on_death, on_kill, on_wreck

# what this splice is called, which is what its own record answers to
SPLICE = "a thing killed another"
# the game's classes a killer or the one killed may be, each asked by name
ENTITY, UNIT, STRUCTURE, BUILDING = "ent.Entity", "ent.Unit", "ent.Structure", "ent.BaseBuilding"
FACTION, ZONE = "ent.Faction", "ent.Zone"
# what each is called (the id a target column names), and the village a building stands in
CALLED, VILLAGE = "kind", "structure"
# who holds a thing, and a building; the region a thing stands in, and who holds that
OWNER, BUILDING_OWNER = "ent.Entity.get_owner", "ent.BaseBuilding.get_owner"
REGION, REGION_OWNER = "ent.Entity.get_zone", "ent.Zone.get_factionOwner"
# the two places every walk is handed: the killer, then the one killed, as the game hands them
KILLER, VICTIM = 0, 1
# declared True by a scope whose things die, and where their last walks are kept ON the file
LAST_WALK_BY, LAST_WALKS_ON = "LAST_WALK", "_spine_last_walks"
# the scopes a region's side keeps, which every other side leaves to it
REGIONS = (zone_scope.NUMBER, region_scope.NUMBER)


class Side:
    """One walk of one kill: whose rows it weighs, what they are asked of, and who collects."""

    def __init__(self, word, noun, subject, region=False):
        # the trigger, the walk's name, the one its rows ask about, and the region's side or not
        self.word, self.NOUN, self.subject, self.region = word, noun, subject, region
        # ⛔ WHO ACTED is the other one: the killer for a kill, the one killed for a death
        self.acted = KILLER if subject == VICTIM else VICTIM
        # both things, by the names the trigger gives them, for a word asking one side (`By`)
        self.SIDES = dict(zip(getattr(word, "SIDES", ()), (KILLER, VICTIM)))
        self.FIRES = "this row fires on this %s" % noun
        self.RAISED = "a row owed something by this %s" % noun
        self.FINISHED = "a %s happened" % noun
        self.HAS_FACTION = "the faction whose rows a %s weighs is in hand" % noun

    def kinds(self, bc):
        """The faction weighed, the thing the rows ask about, and the one in hand: both entities."""
        return kind_named(bc, FACTION), kind_named(bc, ENTITY), kind_named(bc, ENTITY)

    def places(self, bc, fn, at):
        """Where the number floats, the unit asked its family, that family, and the region."""
        unit = kind_named(bc, UNIT)
        family = field_by_name(bc, field_by_name(bc, unit, ITS_TYPE, "a unit")[1], ITS_FAMILY,
                               "a unit's type")[1]
        guard(family == at.reader.text_kind,
              "a unit type's `%s` is t@%s rather than the text a column names" % (
                  ITS_FAMILY, family))
        at.where = a_new_place(bc, fn, kind_named(bc, ENTITY))
        at.unit = a_new_place(bc, fn, unit)
        at.family = a_new_place(bc, fn, family)
        at.zone = a_new_place(bc, fn, kind_named(bc, ZONE))
        at.matched = a_new_place(bc, fn, returns_type(function_named(bc, BASE_KIND_MATCHES)))
        at.scope = a_new_place(bc, fn, at.reader.count_kind)

    def opening(self, bc, fn, op, at, done):
        """The class the one killed must be, what the rows ask about and its name, whose rows."""
        place = Place(self.NOUN, {}, {}, None, None, None, done, hands_for(bc, fn))
        return (sayonce.emit_word_always(bc, fn, self.FINISHED, even_when_quiet=True)
                + _the_one_killed(place, self.word, done)
                + _called(place, at, self.subject)
                + (_its_region(place, at, done) if self.region else _owned(
                    place, at.faction, self.acted, done))
                + sayonce.emit_word_always(bc, fn, self.HAS_FACTION, even_when_quiet=True)
                # the number floats over the one killed, whoever acted
                + [op("Mov", dst=at.where, src=VICTIM)]
                + sayonce.emit_always(bc, fn, at.acting))

    def emit_scoped(self, bc, fn, at, into, refused):
        """A region's side keeps only rows about regions; every other side, every row but those."""
        place = Place(self.NOUN + " scoped", {}, {}, None, None, None, refused,
                      hands_for(bc, fn))
        kept = place.here("a row of this side's scopes")
        out = [place.op("Mov", dst=at.scope, src=into[SCOPE])]
        for number in REGIONS:
            out += [place.op("Int", dst=at.count["wanted"], ptr=place.number(number)),
                    (place.op("JEq", a=at.scope, b=at.count["wanted"]),
                     kept if self.region else refused)]
        return out + ([(place.op("JAlways"), refused)] if self.region else []) + [
            kept + ":", place.op("Label")]

    def emit_actor(self, bc, fn, at, into):
        """Who collects: the region, or the faction on a faction's row, else the one that acted."""
        place = Place(self.NOUN + " actor", {}, {}, None, None, None, None, hands_for(bc, fn))
        if self.region:
            return [place.op("UnsafeCast", dst=at.actor, src=at.zone)]
        thing, done = place.here("the thing acted"), place.here("whose it is, settled")
        return [place.op("Int", dst=at.count["wanted"], ptr=place.number(faction_scope.NUMBER)),
                (place.op("JNotEq", a=at.scope, b=at.count["wanted"]), thing),
                place.op("UnsafeCast", dst=at.actor, src=at.faction),
                (place.op("JAlways"), done),
                thing + ":", place.op("Label"),
                place.op("UnsafeCast", dst=at.actor, src=self.acted),
                done + ":", place.op("Label")]

    def emit_also_named(self, bc, fn, at, matched):
        """A unit's base kind, then its parent on the `unit` sheet, as a scope's name matches."""
        place = Place(self.NOUN + " family", {}, {}, None, None, None, None, hands_for(bc, fn))
        count, reader = at.count, at.reader
        none = place.here("no family of it is named")
        return [(place.op("JNull", reg=at.unit), none),
                place.op("Call2", dst=at.matched, fun=place.named_function(BASE_KIND_MATCHES),
                         arg0=at.unit, arg1=at.named),
                (place.op("JTrue", cond=at.matched), matched),
                (place.op("JNull", reg=at.family), none),
                place.op("Null", dst=at.nothing),
                place.op("Call3", dst=count["found"], fun=gv(reader.finding.findex),
                         arg0=at.family, arg1=at.named, arg2=at.nothing),
                (place.op("JNotEq", a=count["found"], b=count["zero"]), none),
                place.op("Field", dst=count["mine"], obj=at.family,
                         field=reader.text_length_field),
                place.op("Field", dst=count["theirs"], obj=at.named,
                         field=reader.text_length_field),
                (place.op("JNotEq", a=count["mine"], b=count["theirs"]), none),
                (place.op("JAlways"), matched),
                none + ":", place.op("Label")]


def _the_one_killed(place, word, done):
    """Past this, the one killed is of a class the word is about; a death takes every one."""
    classes = getattr(word, "VICTIM_IS", None)
    if classes is None:
        return []
    if classes == (UNIT,):
        return place.narrowed(VICTIM, place.scratch_of(UNIT), goes_to=done)[1]
    not_unit, kept = place.here("the one killed is no unit"), place.here("its class is kept")
    out = place.narrowed(VICTIM, place.scratch_of(UNIT), goes_to=not_unit)[1] + [
        (place.op("JAlways"), done), not_unit + ":", place.op("Label")]
    for one in classes[:-1]:
        other = place.here("the one killed is no %s" % one)
        out += place.narrowed(VICTIM, place.scratch_of(one), goes_to=other)[1] + [
            (place.op("JAlways"), kept), other + ":", place.op("Label")]
    return out + place.narrowed(VICTIM, place.scratch_of(classes[-1]), goes_to=done)[1] + [
        kept + ":", place.op("Label")]


def _called(place, at, who):
    """The thing the rows ask about, what it is called, and a unit's own place and family."""
    not_unit, not_structure, known = (place.here(what) for what in (
        "it is no unit", "it is no structure", "what it is called is known"))
    unit, as_unit = place.narrowed(who, place.scratch_of(UNIT), goes_to=not_unit)
    structure, as_structure = place.narrowed(who, place.scratch_of(STRUCTURE),
                                             goes_to=not_structure)
    building, as_building = place.narrowed(who, place.scratch_of(BUILDING), goes_to=known)
    unit_at = place.field_of(UNIT, CALLED)[0]
    inf_at, inf = place.field_of(UNIT, ITS_TYPE)
    family_at = place.field_of(inf, ITS_FAMILY)[0]
    structure_at = place.field_of(STRUCTURE, CALLED)[0]
    building_at = place.field_of(BUILDING, CALLED)[0]
    village_at, village = place.field_of(BUILDING, VILLAGE)
    return [place.op("Null", dst=at.acting), place.op("Null", dst=at.unit),
            place.op("Null", dst=at.family), place.op("Mov", dst=at.thing, src=who)] + (
        as_unit + [
            place.op("Mov", dst=at.unit, src=unit),
            place.op("Field", dst=at.acting, obj=unit, field=unit_at),
            place.op("Field", dst=inf, obj=unit, field=inf_at),
            (place.op("JNull", reg=inf), known),
            place.op("Field", dst=at.family, obj=inf, field=family_at),
            (place.op("JAlways"), known),
            not_unit + ":", place.op("Label")] + as_structure + [
            place.op("Field", dst=at.acting, obj=structure, field=structure_at),
            (place.op("JAlways"), known),
            not_structure + ":", place.op("Label")] + as_building + [
            place.op("Field", dst=at.acting, obj=building, field=building_at),
            # ⛔ A BUILDING'S OWN `_owner` IS EMPTY: its village answers whose it is
            place.op("Field", dst=village, obj=building, field=village_at),
            (place.op("JNull", reg=village), known),
            place.op("UnsafeCast", dst=at.thing, src=village),
            known + ":", place.op("Label")])


def _owned(place, faction, who, done):
    """Whose `who` is, a building asked through its own getter; nobody's is `done`."""
    not_building, owned = place.here("the one that acted is no building"), place.here("owned")
    building, as_building = place.narrowed(who, place.scratch_of(BUILDING),
                                           goes_to=not_building)
    return [place.op("Null", dst=faction)] + as_building + [
        place.op("Call1", dst=faction, fun=place.named_function(BUILDING_OWNER), arg0=building),
        (place.op("JAlways"), owned),
        not_building + ":", place.op("Label"),
        place.op("Call1", dst=faction, fun=place.named_function(OWNER), arg0=who),
        owned + ":", place.op("Label"),
        (place.op("JNull", reg=faction), done)]


def _its_region(place, at, done):
    """The region the one killed stood in, a building's its village's, and who holds it."""
    not_building, found = place.here("the one killed is no building"), place.here("its region")
    building, as_building = place.narrowed(VICTIM, place.scratch_of(BUILDING),
                                           goes_to=not_building)
    village_at, village = place.field_of(BUILDING, VILLAGE)
    return [place.op("Null", dst=at.zone)] + as_building + [
        place.op("Field", dst=village, obj=building, field=village_at),
        (place.op("JNull", reg=village), done),
        place.op("Call1", dst=at.zone, fun=place.named_function(REGION), arg0=village),
        (place.op("JAlways"), found),
        not_building + ":", place.op("Label"),
        place.op("Call1", dst=at.zone, fun=place.named_function(REGION), arg0=VICTIM),
        found + ":", place.op("Label"),
        (place.op("JNull", reg=at.zone), done),
        place.op("Call1", dst=at.faction, fun=place.named_function(REGION_OWNER), arg0=at.zone),
        (place.op("JNull", reg=at.faction), done)]


# EVERY WALK ONE KILL TAKES: kill and wreck keep apart by the class of the one killed
SIDES = (Side(on_kill, "kill", VICTIM), Side(on_wreck, "wreck", VICTIM),
         Side(on_death, "death", KILLER), Side(on_kill, "kill in a region", VICTIM, True),
         Side(on_wreck, "wreck in a region", VICTIM, True),
         Side(on_death, "death in a region", KILLER, True))


def site(bc):
    """The game's own kill, checked to be handed the killer and the one killed, both things."""
    fn = function_named(bc, on_kill.SITE)
    entity = kind_named(bc, ENTITY)
    guard([gv(r) for r in list(fn.regs)[:2]] == [entity, entity],
          "%s is not handed two things" % on_kill.SITE)
    return fn


def _function(bc, fn, body):
    """A function of ours handed the killer and the one killed; `body` makes what it does."""
    nothing = returns_type(fn, on_kill.SITE)
    own = new_function(bc, [gv(r) for r in list(fn.regs)[:2]], nothing, like=fn)
    back = a_new_place(bc, own, nothing)
    replace_body(own, body(own) + [written(template(bc, "Ret"), ret=back)])
    return own


def walks(bc, fn):
    """One function per side, then one calling each in turn, handed the two things as it was."""
    every = [_function(bc, fn, lambda own, side=side: raisewalk.emit(bc, own, side) + (
        _the_last_walks(bc, own) if side.word is on_death and not side.region else []))
        for side in SIDES]

    def calling(own):
        nothing = a_new_place(bc, own, returns_type(fn, on_kill.SITE))
        return [written(template(bc, "Call2"), dst=nothing, fun=gv(one.findex), arg0=KILLER,
                        arg1=VICTIM) for one in every]
    return _function(bc, fn, calling), every


def _returning(bc, own, nothing):
    """One return, answering the kind the road's own site answers."""
    return written(template(bc, "Ret"), ret=a_new_place(bc, own, nothing))


def last_walks(bc):
    """Each dying scope's last walk, by spelling: made empty once here, filled by `fill`."""
    from framework.names import vocabulary
    from framework.storewalk import DECLARES, _declared, scopes_with_roads
    made = getattr(bc, LAST_WALKS_ON, None)
    if made is None:
        words, made = vocabulary(), {}
        for spelling in scopes_with_roads(words):
            if not _declared(spelling, LAST_WALK_BY, words, False):
                continue
            road = function_named(bc, _declared(spelling, DECLARES, words))
            nothing = returns_type(road, spelling)
            own = new_function(bc, [gv(r) for r in list(road.regs)[:2]], nothing, like=road)
            replace_body(own, [_returning(bc, own, nothing)])
            made[spelling] = own
        setattr(bc, LAST_WALKS_ON, made)
    return made


def fill(bc, site, road, emit):
    """The road's block for its own site; a dying scope's last walk is filled with it too."""
    from copy import copy
    own = last_walks(bc).get(site.word)
    if own is not None:
        alone = copy(site)
        alone.fn = own
        replace_body(own, emit(bc, alone, road) + [
            _returning(bc, own, returns_type(site.fn, site.name))])
    return emit(bc, site, road)


def _the_last_walks(bc, own, who=VICTIM):
    """AFTER EVERY SIDE: the one killed (or `who`) walks its own rules, no time passing; it pays."""
    from tools.hlcode import assemble
    place = Place("a last walk at %d" % who, {}, {}, None, None, None, None, hands_for(bc, own))
    out, counted = [], place.scratch_of("I32")
    for spelling, walk in sorted(last_walks(bc).items()):
        holder, no_time = (a_new_place(bc, own, gv(r)) for r in list(walk.regs)[:2])
        other = place.here("the one killed walks no `%s` rules" % spelling)
        thing, as_thing = place.narrowed(who, holder, goes_to=other)
        out += as_thing + [
            place.op("Int", dst=counted, ptr=place.number(0)),
            place.op("ToSFloat", dst=no_time, src=counted),
            place.op("Call2", dst=a_new_place(bc, own, returns_type(walk, spelling)),
                     fun=gv(walk.findex), arg0=thing, arg1=no_time),
            other + ":", place.op("Label")]
    return assemble(out)


def install(bc):
    """One call at the top of the game's own kill, before it pays its own kill bonuses."""
    fn = site(bc)
    bridge, every = walks(bc, fn)
    calls = [written(template(bc, "Call2"), dst=a_new_place(bc, fn, returns_type(
        bridge, on_kill.SITE)), fun=gv(bridge.findex), arg0=KILLER, arg1=VICTIM)]
    how_many = insert(bc, fn, 0, calls, SPLICE, traps.IN_PLAY)
    return ("KILL: %d instruction(s) at %s, calling f@%d -- %d walks, one per side, raise a "
            "mark on every row whose trigger is `%s`, `%s` or `%s`, keyed to the one that acted"
            % (how_many, on_kill.SITE, gv(bridge.findex), len(every), on_kill.WORD,
               on_wreck.WORD, on_death.WORD))
