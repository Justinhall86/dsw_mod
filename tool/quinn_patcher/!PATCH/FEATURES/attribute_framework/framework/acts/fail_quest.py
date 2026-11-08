"""`fail-quest`: the faction's running quest of that name failed, as running out of time does."""
from tools.project import guard
from tools.hlcode import argument_kinds, text_object
from framework.acts.complete_quest import READS, acting  # noqa: F401
from framework.acts.gain_devs import _asking
from framework.acts.gain_res import PAYEE

STAGE, DOES = "fail-quest", "fail quest"
NUMBER = 10
# running quests and solves, the random pick's two walks, the three shared counts, the row's number
LOOPS = 2 + 2 + 3 + 1
# the game's own failure: the quest ended uncompleted, then its alert
END = "logic.faction.BaseQuest.end"
ALERTS = "ent.Faction.get_alerts"
ALERT = "logic.faction.AlertsManager.add"
SHOWN_AS, FOCUS, ON_QUEST = "QuestFailed", "logic.faction.FocusKind", "FQuest"
TAKES = ((END, 0), (ALERTS, 0), (ALERT, 4))
ENTERED = "SPINE a quest-failing row reached its act"
FAILED = "SPINE a quest-failing row failed the named quest"
NOT_RUNNING = "SPINE a quest-failing row named a quest the faction is not running"
NOBODY = "SPINE a quest-failing row had no faction"


def emit_act(place):
    """The named running quest failed; a named solve fails the whole quest it belongs to."""
    return acting(place, NUMBER, (ENTERED, NOT_RUNNING, NOBODY), _fail,
                  lambda place, quest, _solve: _fail(place, quest, "named by a solve"), DOES)


def _fail(place, quest, by="named"):
    """Ended uncompleted, which pays what it pays on no completion; then `QuestFailed` shows."""
    ended, alerts = place.scratch_return(END), place.scratch_return(ALERTS)
    name, focus = place.scratch_arg(ALERT, 0), place.scratch_arg(ALERT, 1)
    nothing, none = place.scratch_arg(ALERT, 2), place.scratch_arg(ALERT, 3)
    shown = place.scratch_return(ALERT)
    silent = place.here("the failing faction keeps no alerts, its quest %s" % by)
    return [place.op("Call1", dst=ended, fun=place.named_function(END), arg0=quest),
            place.op("Call1", dst=alerts, fun=place.named_function(ALERTS),
                     arg0=place.row[PAYEE]),
            (place.op("JNull", reg=alerts), silent),
            place.op("GetGlobal", **{"dst": name, "global": place.text_object(SHOWN_AS)}),
            place.op("MakeEnum", dst=focus, construct=place.enum_case(FOCUS, ON_QUEST),
                     args=[quest]),
            place.op("Null", dst=nothing),
            place.op("Null", dst=none),
            place.op("CallN", dst=shown, fun=place.named_function(ALERT),
                     args=[alerts, name, focus, nothing, none]),
            silent + ":", place.op("Label")] + _asking(place, FAILED)


def install(bc):
    """Check the calls this borrows and mint the alert's name."""
    for called, takes in TAKES:
        got = len(argument_kinds(bc, called))
        guard(got == takes, "%s takes %d argument(s) and this hands it %d" % (called, got, takes))
    text_object(bc, SHOWN_AS)
    return "FAIL QUEST: `%s` on the named running quest, then `%s` `%s`" % (END, ALERT, SHOWN_AS)
