"""A building begun, finished, torn down or cancelled: one walk per moment, about that building."""
from tools.project import gv, guard
from tools.hlcode import (assemble, call_sites, function_named, kind_named, returns_type,
                          shared_function, template, written)
from tools.splice import insert
from framework import columns, raisewalk, sayonce, traps
from framework.modifiers import ofdomain
from framework.parsed import a_new_place
from framework.pipeline import Place, hands_for
from framework.raises.on_kill import (BUILDING, BUILDING_OWNER, CALLED, ENTITY, FACTION, OWNER,
                                      REGION, REGIONS, ZONE, _the_last_walks)
from framework.resheld import DATA, SHEET_KIND
from framework.scopematch import NAMED as SCOPE
from framework.scopes import building as building_scope, faction as faction_scope
from framework.triggers import (on_building_built, on_building_canceled, on_building_demolished,
                                on_building_started)

# the game's keeper of a village's buildings, the village it keeps them for, its building finder
UPGRADES, STRUCTURE = "logic.Upgrades", "ent.Structure"
ITS_VILLAGE, FIND = "logic.Upgrades.get_structure", "logic.Upgrades.findBuilding"
# and its record of one building by number, which names the building even with no thing for it
RECORD = "logic.Upgrades.get"
# what a village calls its keeper, and what a building record calls its number and its name
KEEPER_ON, NUMBER_ON, NAME_ON = "upgrades", "uid", "kind"
# a game function handing back nothing, whose kind our walks hand back too
NOTHING_BACK = "logic.Upgrades.sendCompletionAlerts"


class Moment:
    """One building moment: its site, what it is handed, and whether the building pays at once."""

    def __init__(self, word, noun, keeper, last=False):
        # the trigger, the walk's name, and whether place 0 is the keeper (else the village)
        self.word, self.NOUN, self.keeper, self.last = word, noun, keeper, last
        # how many of the site's first places the walk is handed: a finished one's name too
        self.handed = 3 if word is on_building_built else 2
        self.SPLICE = "a building %s" % noun
        self.FIRES = "this row fires on this building %s" % noun
        self.RAISED = "a row owed something by this building %s" % noun
        self.FINISHED = "a building was %s" % noun
        self.HAS_FACTION = "the faction whose building was %s is in hand" % noun

    def kinds(self, bc):
        """The faction weighed, the village the rows ask about, and the building in hand."""
        return kind_named(bc, FACTION), kind_named(bc, ENTITY), kind_named(bc, BUILDING)

    def places(self, bc, fn, at):
        """Where the number floats, the keeper, the village, its region, the domain, the scope."""
        self.at = at
        at.where = a_new_place(bc, fn, kind_named(bc, ENTITY))
        at.keeper = a_new_place(bc, fn, kind_named(bc, UPGRADES))
        at.village = a_new_place(bc, fn, kind_named(bc, STRUCTURE))
        at.zone = a_new_place(bc, fn, kind_named(bc, ZONE))
        at.domain = a_new_place(bc, fn, at.reader.text_kind)
        at.scope = a_new_place(bc, fn, at.reader.count_kind)

    def opening(self, bc, fn, op, at, done):
        """The keeper, its village, the building and its name and domain, and whose it is."""
        place = Place(self.NOUN, {}, {}, None, None, None, done, hands_for(bc, fn))
        if self.keeper:
            number, handed = 1, [place.op("Mov", dst=at.keeper, src=0)]
        else:
            number_at, number = place.field_of(1, NUMBER_ON)
            handed = [place.op("Field", dst=at.keeper, obj=0,
                               field=place.field_of(STRUCTURE, KEEPER_ON)[0]),
                      place.op("Field", dst=number, obj=1, field=number_at)]
        return (sayonce.emit_word_always(bc, fn, self.FINISHED, even_when_quiet=True)
                + [place.op("Null", dst=at.acting), place.op("Null", dst=at.domain)]
                + handed + [(place.op("JNull", reg=at.keeper), done),
                            place.op("Call1", dst=at.village,
                                     fun=place.named_function(ITS_VILLAGE), arg0=at.keeper),
                            (place.op("JNull", reg=at.village), done),
                            place.op("Call2", dst=at.running, fun=place.named_function(FIND),
                                     arg0=at.keeper, arg1=number)]
                + _named(place, at, self, number, done)
                + _whose(place, at, done)
                + sayonce.emit_word_always(bc, fn, self.HAS_FACTION, even_when_quiet=True)
                + _its_domain(place, at)
                + sayonce.emit_always(bc, fn, at.acting))

    def emit_fired(self, bc, fn, at, into, refused):
        """Past this, the row names no domain, or the building's is one it names."""
        place = Place(name="the %s building's domain" % self.NOUN, row=into, notes={}, note=None,
                      kept=None, store=None, refused=refused, hands=hands_for(bc, fn))
        return raisewalk.emit_listed(place, ofdomain.WORD, into[columns.PART_FOR_COUNT],
                                     at.domain, refused)

    def emit_actor(self, bc, fn, at, into):
        """Who collects: the faction, the building, the region, else the village it stands in."""
        place = Place(self.NOUN + " actor", {}, {}, None, None, None, None, hands_for(bc, fn))
        done = place.here("whose it is, settled")
        cases = ((faction_scope.NUMBER, at.faction), (building_scope.NUMBER, at.running)) + tuple(
            (number, at.zone) for number in REGIONS)
        out = [place.op("Mov", dst=at.scope, src=into[SCOPE]),
               place.op("UnsafeCast", dst=at.actor, src=at.thing)]
        for number, who in cases:
            other = place.here("not scope %d" % number)
            out += [place.op("Int", dst=at.count["wanted"], ptr=place.number(number)),
                    (place.op("JNotEq", a=at.scope, b=at.count["wanted"]), other),
                    (place.op("JNull", reg=who), done),
                    place.op("UnsafeCast", dst=at.actor, src=who),
                    (place.op("JAlways"), done),
                    other + ":", place.op("Label")]
        return out + [done + ":", place.op("Label")]


def _named(place, at, moment, number, done):
    """The village as the thing asked, the number over the building, and the building's name."""
    found, as_found = place.here("the building is found"), place.here("its name is known")
    out = [place.op("UnsafeCast", dst=at.thing, src=at.village),
           place.op("UnsafeCast", dst=at.where, src=at.village),
           (place.op("JNotNull", reg=at.running), found)]
    # NO THING FOR IT (housed, or finished at once): its name off what the game was handed
    if moment.word is on_building_built:
        out += [place.op("Mov", dst=at.acting, src=2)]
    elif not moment.keeper:
        out += [place.op("Field", dst=at.acting, obj=1, field=place.field_of(1, NAME_ON)[0])]
    else:
        record = place.scratch_return(RECORD)
        out += [place.op("Call2", dst=record, fun=place.named_function(RECORD), arg0=at.keeper,
                         arg1=number),
                (place.op("JNull", reg=record), done),
                place.op("Field", dst=at.acting, obj=record,
                         field=place.field_of(record, NAME_ON)[0])]
    return out + [(place.op("JAlways"), as_found),
                  found + ":", place.op("Label"),
                  place.op("UnsafeCast", dst=at.where, src=at.running),
                  place.op("Field", dst=at.acting, obj=at.running,
                           field=place.field_of(BUILDING, CALLED)[0]),
                  as_found + ":", place.op("Label"),
                  (place.op("JNull", reg=at.acting), done)]


def _whose(place, at, done):
    """Whose it is: the building's own getter, else the village's owner; and the region."""
    village, settled = place.here("no building to ask"), place.here("whose, settled")
    return [(place.op("JNull", reg=at.running), village),
            place.op("Call1", dst=at.faction, fun=place.named_function(BUILDING_OWNER),
                     arg0=at.running),
            (place.op("JAlways"), settled),
            village + ":", place.op("Label"),
            place.op("Call1", dst=at.faction, fun=place.named_function(OWNER), arg0=at.village),
            settled + ":", place.op("Label"),
            (place.op("JNull", reg=at.faction), done),
            place.op("Call1", dst=at.zone, fun=place.named_function(REGION), arg0=at.village)]


def _its_domain(place, at):
    """The building's domain off its own `building` row, or nothing when the row has none."""
    from framework.boundary import BY_VALUE as LOOK_UP
    none = place.here("its domain, looked for")
    data = place.scratch_of(DATA)
    sheet_at, sheet = place.field_of(DATA, ofdomain.SHEET)
    by_id_at, by_id = place.field_of(SHEET_KIND, ofdomain.BY_ID)
    found, row = place.scratch_return(LOOK_UP), place.scratch_arg(*ofdomain.ROW_OF)
    named_at, named = place.field_of(row, ofdomain.IN_COLUMN)
    guard(place.kind_of(named) == place.kind_of(at.domain),
          "a building row's `%s` is not the text a target column names" % ofdomain.IN_COLUMN)
    return [place.op("GetGlobal", **{"dst": data, "global": place.the_one_global(DATA)}),
            place.op("Field", dst=sheet, obj=data, field=sheet_at),
            (place.op("JNull", reg=sheet), none),
            place.op("Field", dst=by_id, obj=sheet, field=by_id_at),
            (place.op("JNull", reg=by_id), none),
            place.op("Call2", dst=found, fun=place.named_function(LOOK_UP), arg0=by_id,
                     arg1=at.acting),
            (place.op("JNull", reg=found), none),
            place.op("ToVirtual", dst=row, src=found),
            place.op("Field", dst=at.domain, obj=row, field=named_at),
            none + ":", place.op("Label")]


# EVERY MOMENT: begun and finished pay on the building's next tick; the other two at once
MOMENTS = (Moment(on_building_built, "completed", True),
           Moment(on_building_started, "begun", False),
           Moment(on_building_demolished, "torn down", True, last=True),
           Moment(on_building_canceled, "cancelled", False, last=True))


def where_spliced(bc, moment, fn):
    """The one place in the moment's site its block goes, each checked against the game."""
    word = moment.word
    if word is on_building_built:
        found = call_sites(fn, function_named(bc, word.BEFORE))
        guard(len(found) == 1, "%s calls %s %d time(s), not once" % (word.SITE, word.BEFORE,
                                                                      len(found)))
        return found[0]
    if word is on_building_started:
        ends = [i for i, o in enumerate(fn.ops) if o.op == "Ret"]
        guard(len(ends) == 1, "%s returns at %d places, not one" % (word.SITE, len(ends)))
        return ends[0]
    if word is on_building_demolished:
        # past its own return when there is nothing to demolish
        guard([o.op for o in fn.ops[1:3]] == ["JNotNull", "Ret"],
              "%s does not return at once when there is nothing to demolish" % word.SITE)
        return 3
    return 0


def site(bc, moment):
    """The moment's game function, checked to be handed the keeper or the village first."""
    fn = function_named(bc, moment.word.SITE)
    first = gv(list(fn.regs)[0])
    wanted = UPGRADES if moment.keeper else STRUCTURE
    guard(first == kind_named(bc, wanted),
          "%s is about t@%s rather than a %s" % (moment.word.SITE, first, wanted))
    return fn


def _paid_at_once(bc, fn, moment):
    """A building torn down or cancelled walks its own rules once more, no time passing."""
    skip = "the %s building has no thing to walk" % moment.NOUN
    return assemble([(written(template(bc, "JNull"), reg=moment.at.running), skip)]
                    + _the_last_walks(bc, fn, who=moment.at.running)
                    + [skip + ":", written(template(bc, "Label"))])


def walk(bc, moment, fn):
    """The moment's walk as a function of ours, handed what the site holds in its first places."""
    nothing = returns_type(function_named(bc, NOTHING_BACK), NOTHING_BACK)

    def body(own):
        out = raisewalk.emit(bc, own, moment)
        if moment.last:
            out += _paid_at_once(bc, own, moment)
        return out + [written(template(bc, "Ret"), ret=a_new_place(bc, own, nothing))]
    # FILED AS OURS, so the weigher never takes it for the game function it was made like
    own = shared_function(bc, fn, lambda _bc, own: own, ("a building walk", moment.NOUN),
                          [gv(r) for r in list(fn.regs)[:moment.handed]], nothing, body)
    return own, nothing


def install(bc):
    """One call per moment, in its own site; a building torn down or cancelled pays at once."""
    said = []
    for moment in MOMENTS:
        fn = site(bc, moment)
        own, nothing = walk(bc, moment, fn)
        call = written(template(bc, "Call%d" % moment.handed), dst=a_new_place(bc, fn, nothing),
                       fun=own, **{"arg%d" % i: i for i in range(moment.handed)})
        how_many = insert(bc, fn, where_spliced(bc, moment, fn), [call], moment.SPLICE,
                          traps.IN_PLAY)
        said.append("%s: %d at %s, walking in f@%d" % (moment.word.WORD, how_many,
                                                       moment.word.SITE, own))
    return ("BUILDING: %s -- each raises a mark on every row whose trigger it is, on a marked one "
            "only when the building is the one named, and past `%s` only in a domain named"
            % ("; ".join(said), ofdomain.WORD))
