"""`OnDay` -- fires once, at the start of the day `val` names, counted from 01.01 as day 1."""
from framework.trailing import (NO_FAMILY_TRAILER, NO_NAME_TO_WRITE, OPENS_THE_RULE,
                                VAL_IS_ITS_DATE)
from framework.turned import DATE_HAS_NO_OTHER_SIDE
WORD = "OnDay"
# its family on the catalogue
KIN = 'Calendar'
# the editor text, then the holder's
PHRASE = "at the start of day ::value::"
HOLDER = "at the start of day ::value::"
# the day comes from `val`, so a target column would mean nothing
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# why `Not` never turns it
NOT_NONE = DATE_HAS_NO_OTHER_SIDE
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 20
# NO SITE OF ITS OWN: the day's turn raises it, `EachDay` naming it in `ALSO`
RAISED_BY = ("EachDay",)
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the faction whose day began"
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
PLACE, PLACE_IS = "the faction whose day began", "Faction"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NO_NAME_TO_WRITE
VAL_NONE = VAL_IS_ITS_DATE
