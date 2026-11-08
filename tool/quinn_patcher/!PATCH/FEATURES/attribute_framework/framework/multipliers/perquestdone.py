"""`PerQuestDone` -- a trailing word: the amount on its left times the quests completed."""
from framework.trailing import VAL_IS_ITS_AMOUNT
WORD = "PerQuestDone"
# its family on the catalogue
KIN = 'Quest'
# the editor text, with and without a target, then the holder's; `{more}` is what trailing words add
PHRASE = "for each time{more} {subject} completed [::target::]"
BARE = "for each quest{more} {subject} completed"
HOLDER = "for each time{more} my faction completed [::target::]"
HOLDER_BARE = "for each quest{more} my faction completed"
# its marked spelling (`PerTQuestDone3`) counts only the completions of the quest its column names
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS = ("a quest pick",)
# what it attaches to: the nearest word on its left offering this
NEEDS = "an amount"
# `PerNotTQuestDone3`: `Not` after this text counts every completion but the named quest's
TURNED_AFTER = "Per"
TURNED_PHRASE = "for each time{more} {subject} completed a quest other than [::target::]"
TURNED_HOLDER = "for each time{more} my faction completed a quest other than [::target::]"
# what it counts on, and the way there: the faction's quests, whose tally is summed
ASKED_OF = "ent.Faction"
COUNTS = ("ent.Faction.get_quests",)
# ⛔ the end of the way is no count: this sums the game's tally, every completion counted
SUMMED_BY = "framework.questions.quests_done"
# ⛔ MARKED, the count is the tally of the quest its column names, and of that quest alone
NAMED_COUNT = "framework.questions.quests_done"
# an owner word after `Per` sums the count over the factions it picks, judged against the writer
OWNERS_PICK = True
# written straight after `Per`, inside the spelling
OWNER_STEM = "Per"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_IS_ITS_AMOUNT
