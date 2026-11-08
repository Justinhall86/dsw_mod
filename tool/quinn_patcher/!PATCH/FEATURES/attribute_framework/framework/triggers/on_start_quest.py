"""`OnStartQuest` -- a quest starts for a faction, whatever started it; `OnStartTQuest` on one."""
from framework.trailing import OPENS_THE_RULE, VAL_NOT_ITS
WORD = "OnStartQuest"
# its family on the catalogue
KIN = 'Quest'
# the editor text, with and without a target, then the holder's; `{s}` is empty after "you"
PHRASE = "when {actor} start{s} [::target::]"
BARE = "when {actor} start{s} a quest"
HOLDER = "when my faction starts [::target::]"
HOLDER_BARE = "when my faction starts a quest"
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS = ("a quest pick",)
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotStartTQuest2`: `Not` after this text fires on every quest but the one named
TURNED_AFTER = "On"
TURNED_PHRASE = "when {actor} start{s} a quest other than [::target::]"
TURNED_HOLDER = "when my faction starts a quest other than [::target::]"
# the cdb sheet a target column names
SHEET = "quest"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 7
# WHERE IT IS RAISED FROM: the one place every quest is started, the console's and the cycle's
SITE = "logic.faction.Quests.startQuest"
# the call there that makes the quest, once its start is recorded; the word fires ahead of it
BEFORE = "logic.faction.$Quest.create"
# what that function is about, checked by name the way a scope's site is
ABOUT = "logic.faction.Quests"
# the faction whose quests they are, by the name the game's own type gives it
OWNER_ON = "owner"
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the faction starting"
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
# that place in the word builder's words, and the scope whose rules it is asked by
PLACE, PLACE_IS = "the starting faction", "Faction"
# it happens NOWHERE: its number floats over the scope's own thing, a place of this kind
SHOWN_AS = "ent.Entity"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
