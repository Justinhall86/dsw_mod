"""`EachDay` -- fires at the start of every day; `EachDays`, its with-`val` form, every val-th."""
from framework.trailing import NO_FAMILY_TRAILER, NO_NAME_TO_WRITE, OPENS_THE_RULE
from framework.turned import NAMES_NOTHING_TO_LEAVE_OUT
WORD = "EachDay"
# its family on the catalogue
KIN = 'Calendar'
# the editor text, then the holder's
PHRASE = "at the start of each day"
HOLDER = "at the start of each day"
# a day names no cdb row
TARGET = "never"
# its with-`val` form: every val-th day counted from 01.01, so val 5 is days 5, 10, 15
WITH_VAL = {
    'WORD': 'EachDays',
    'NUMBER': 23,
    'PHRASE': "at the start of every ::value::th day",
    'HOLDER': "at the start of every ::value::th day",
}
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# why `Not` never turns it: "every day but this one" means nothing
NOT_NONE = NAMES_NOTHING_TO_LEAVE_OUT
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 19
# WHERE IT IS RAISED FROM: the game's own turn of the day, once per day, never at a load
SITE = "Game.gameTick"
ABOUT = "Game"
# the call there writing the new day down, made once the game's daily updates have run
MARKS = "logic.state.State.set_previousDay"
# the user's calendar: day 1 is 01.01, and every month is exactly this many days
MONTH_DAYS = 30
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the faction whose day began"
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
# that place in the word builder's words, and the scope whose rules it is asked by
PLACE, PLACE_IS = "the faction whose day began", "Faction"
# a day happens NOWHERE: its number floats over the scope's own thing, a place of this kind
SIGNER = "ent.Faction"
SHOWN_AS = "ent.Entity"
# bare or named: why it takes one side only
NAMED_NONE = NO_NAME_TO_WRITE
