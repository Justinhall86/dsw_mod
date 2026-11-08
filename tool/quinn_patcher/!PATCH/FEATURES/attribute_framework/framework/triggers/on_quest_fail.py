"""`OnQuestFail` -- a faction's quest ends unfinished, failed or timed out; `OnTQuestFail` one."""
from framework.trailing import OPENS_THE_RULE, VAL_NOT_ITS
WORD = "OnQuestFail"
# its family on the catalogue
KIN = 'Quest'
# the editor text, with and without a target, then the holder's; `{s}` is empty after "you"
PHRASE = "when {actor} fail{s} [::target::]"
BARE = "when {actor} fail{s} a quest"
HOLDER = "when my faction fails [::target::]"
HOLDER_BARE = "when my faction fails a quest"
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS = ("a quest pick",)
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotTQuestFail2`: `Not` after this text fires on every quest but the one named
TURNED_AFTER = "On"
TURNED_PHRASE = "when {actor} fail{s} a quest other than [::target::]"
TURNED_HOLDER = "when my faction fails a quest other than [::target::]"
# the cdb sheet a target column names
SHEET = "quest"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 9
# WHERE IT IS RAISED FROM: the one place a quest leaves the faction's running list, once
SITE = "logic.faction.Quests.endQuest"
# the game's taking it off that list; the word fires only when it was there to take
AFTER = "hl.types.ArrayObj.remove"
# what that function is about, and what it is handed: the quest, whose id is its `kind`
ABOUT = "logic.faction.Quests"
HANDED, ITS_ID = "logic.faction.Quest", "kind"
# a quest ending with this set was completed, which is no failure
DONE_ON = "completed"
OWNER_ON = "owner"
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the faction failing"
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
PLACE, PLACE_IS = "the failing faction", "Faction"
# it happens NOWHERE: its number floats over the scope's own thing, a place of this kind
SHOWN_AS = "ent.Entity"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
