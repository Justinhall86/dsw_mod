"""`IgnoreCond` -- a trailing word (`StartQuest_IgnoreCond`): a quest picked past its conditions."""
from framework.trailing import NOTHING_TO_NAME, NOTHING_TRAILS_IT, VAL_NOT_ITS
from framework.turned import SWITCHES_A_CHECK_OFF
WORD = "IgnoreCond"
# its family on the catalogue
KIN = 'Quest'
# the editor text it adds to the act it trails
PHRASE = ", ignoring its conditions"
# nothing is named or weighed, so no target column is read
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
# what it attaches to: the nearest word on its left offering it
NEEDS = "a quest start"
# why `Not` never turns it
NOT_NONE = SWITCHES_A_CHECK_OFF
# the game's check our pick steps past, by the name its splice knows it by
SKIPS = "conditions"
# its own number among the skipping modifiers, from 1; never reordered
SKIP_NUMBER = 1
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NOTHING_TO_NAME
VAL_NONE = VAL_NOT_ITS
