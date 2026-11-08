"""`EndedByDuration` -- a trailing word (`OnTreatyEnd_EndedByDuration`): it ran its full time."""
from framework.trailing import NOTHING_TO_NAME, NOTHING_TRAILS_IT, VAL_NOT_ITS
WORD = "EndedByDuration"
# its family on the catalogue
KIN = 'Treaty'
# the editor text it adds to the trigger it trails
PHRASE = " after running its full time"
# nothing is named or weighed, so no target column is read
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
# what it attaches to: the nearest word on its left offering it
NEEDS = "a treaty ending"
# what it says of the event, which the raise holds the answer to
FLAG = "ran its time"
# `OnTreatyEnd_NotEndedByDuration`: `Not` in front keeps only a treaty ended early
TURNED_AFTER = ""
TURNED_PHRASE = " ended before its full time"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NOTHING_TO_NAME
VAL_NONE = VAL_NOT_ITS
