"""`EachMonth` -- fires at the start of every month; `EachMonths`, with `val`, of every val-th."""
from framework.trailing import NO_FAMILY_TRAILER, NO_NAME_TO_WRITE, OPENS_THE_RULE
from framework.turned import NAMES_NOTHING_TO_LEAVE_OUT
WORD = "EachMonth"
# its family on the catalogue
KIN = 'Calendar'
# the editor text, then the holder's; a month is exactly 30 days, so days 1, 31, 61
PHRASE = "at the start of each month"
HOLDER = "at the start of each month"
# a month names no cdb row
TARGET = "never"
# its with-`val` form: every val-th month counted from 01.01, so val 2 is months 2, 4, 6
WITH_VAL = {
    'WORD': 'EachMonths',
    'NUMBER': 24,
    'PHRASE': "at the start of every ::value::th month",
    'HOLDER': "at the start of every ::value::th month",
}
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# why `Not` never turns it: "every month but this one" means nothing
NOT_NONE = NAMES_NOTHING_TO_LEAVE_OUT
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 21
# NO SITE OF ITS OWN: the day's turn raises it, `EachDay` naming it in `ALSO`
RAISED_BY = ("EachDay",)
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the faction whose day began"
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
PLACE, PLACE_IS = "the faction whose day began", "Faction"
# bare or named: why it takes one side only
NAMED_NONE = NO_NAME_TO_WRITE
