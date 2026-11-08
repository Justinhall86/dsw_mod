"""`OnThis` -- fires once, when the row is applied: that filing is its occasion, so no `SITE`."""
from framework.trailing import NOTHING_TO_NAME, NO_FAMILY_TRAILER, OPENS_THE_RULE, VAL_NOT_ITS
from framework.turned import NAMES_NOTHING_TO_LEAVE_OUT
WORD = "OnThis"
# its family on the catalogue
KIN = 'Grammar'
# the editor text, then the holder's own line's
PHRASE = "when this activates"
HOLDER = "when this activates"
# it is about the row's own application and nothing else, so a target column would mean nothing
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# why `Not` never turns it
NOT_NONE = NAMES_NOTHING_TO_LEAVE_OUT
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 1
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NOTHING_TO_NAME
VAL_NONE = VAL_NOT_ITS
