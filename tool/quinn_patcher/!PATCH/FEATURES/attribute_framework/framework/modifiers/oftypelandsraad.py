"""`OfTypeLandsraad` -- a trailing word (`StartQuest_OfTypeLandsraad`): only a Landsraad quest."""
from framework.trailing import (NOTHING_TRAILS_IT, PICKS_FROM_ITS_LIST,
                                VAL_NOT_ITS)
WORD = "OfTypeLandsraad"
# its family on the catalogue
KIN = 'Quest'
# the editor text it adds to the act it trails
PHRASE = " of type Landsraad"
# no target kind names a quest type, so the kind is in the word
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
# what it attaches to: the nearest word on its left offering it
NEEDS = "a quest pick"
# the kind's name in the quest sheet's own `type` list, filed behind the act
KIND = "Landsraad"
# `StartQuest_NotOfTypeLandsraad`: `Not` in front keeps every quest but a Landsraad one
TURNED_AFTER = ""
TURNED_PHRASE = " of any type but Landsraad"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = PICKS_FROM_ITS_LIST
VAL_NONE = VAL_NOT_ITS
