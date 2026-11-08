"""Factions living: how many of the game's factions are not dead, the asker's too (`PerFaction`)."""
QUESTION = "factions living"
# what the sum is kept in, as every count of a faction's
COUNTED_AS = "I32"
# the faction asked, though the sum is the game's and never its own
ASKED_OF = "ent.Faction"
# its own jump back: the game's factions walked one at a time
WALKS = 1
# `PerEnemyFaction`: a faction an owner word picks, alive, counts itself, with no walk of its own
PICKED_COUNTS_ITSELF = True


def emit_every(place, past):
    """The running game's factions, dead ones too, as (array, count, the way there); else `past`."""
    from framework.foreignwalk import EVERY_FACTION, emit_unwrapped
    from framework.ownermatch import THE_GAME_CLASS, THE_GAME_ON, THE_STATE_ON
    holding = place.scratch_of(THE_GAME_CLASS)
    at_game, game = place.field_of(THE_GAME_CLASS, THE_GAME_ON)
    at_state, state = place.field_of(game, THE_STATE_ON)
    at_list, listed = place.field_of(state, EVERY_FACTION)
    held, count, unwrapping = emit_unwrapped(place, listed, past)
    return held, count, [
        place.op("GetGlobal", dst=holding, **{"global": place.the_one_global(THE_GAME_CLASS)}),
        place.op("Field", dst=game, obj=holding, field=at_game),
        (place.op("JNull", reg=game), past),
        place.op("Field", dst=state, obj=game, field=at_state),
        (place.op("JNull", reg=state), past),
        place.op("Field", dst=listed, obj=state, field=at_list)] + unwrapping


def emit_total(place, _way_in, total):
    """Every living faction in the running game added to `total`; with no game yet, refused."""
    from framework.storewalk import IS_DEAD
    held, count, every = emit_every(place, place.refused)
    index, one = place.scratch_like(count), place.scratch_of("Dyn")
    faction, dead = place.scratch_of(ASKED_OF), place.scratch_return(IS_DEAD)
    again, skip, done = (place.here("%s, %s" % (QUESTION, what)) for what in (
        "the next faction", "not counted", "every faction counted"))
    return every + [
        place.op("Int", dst=index, ptr=place.number(0)),
        again + ":", place.op("Label"),
        (place.op("JSGte", a=index, b=count), done),
        place.op("GetArray", dst=one, array=held, index=index),
        place.op("Incr", dst=index),
        (place.op("JNull", reg=one), skip),
        place.op("UnsafeCast", dst=faction, src=one),
        place.op("Call1", dst=dead, fun=place.named_function(IS_DEAD), arg0=faction),
        (place.op("JTrue", cond=dead), skip),
        place.op("Incr", dst=total),
        skip + ":", place.op("Label"),
        (place.op("JAlways"), again),
        done + ":", place.op("Label")]
