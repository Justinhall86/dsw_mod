"""`OnQuestComplete` -- a faction completes a quest, however it was; `OnTQuestComplete` on one."""
from framework.trailing import OPENS_THE_RULE, VAL_NOT_ITS
WORD = "OnQuestComplete"
# its family on the catalogue
KIN = 'Quest'
# the editor text, with and without a target, then the holder's; `{s}` is empty after "you"
PHRASE = "when {actor} complete{s} [::target::]"
BARE = "when {actor} complete{s} a quest"
HOLDER = "when my faction completes [::target::]"
HOLDER_BARE = "when my faction completes a quest"
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS = ("a quest pick",)
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotTQuestComplete2`: `Not` after this text fires on every quest but the one named
TURNED_AFTER = "On"
TURNED_PHRASE = "when {actor} complete{s} a quest other than [::target::]"
TURNED_HOLDER = "when my faction completes a quest other than [::target::]"
# the cdb sheet a target column names
SHEET = "quest"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 8
# WHERE IT IS RAISED FROM: the one place every completion is counted, a solve's parent's included
SITE = "logic.faction.Quests.completeQuest"
# the call there that announces the completion, once it is counted; the word fires ahead of it
BEFORE = "lib.EventManager.dispatch"
# what that function is about, and what it is handed: the quest, whose id is its `kind`
ABOUT = "logic.faction.Quests"
HANDED, ITS_ID = "logic.faction.Quest", "kind"
OWNER_ON = "owner"
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the faction completing"
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
PLACE, PLACE_IS = "the completing faction", "Faction"
# it happens NOWHERE: its number floats over the scope's own thing, a place of this kind
SHOWN_AS = "ent.Entity"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
