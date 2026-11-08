"""`PerQuestFailed` -- a trailing word: the amount on its left times the quests failed."""
from framework.trailing import VAL_IS_ITS_AMOUNT
WORD = "PerQuestFailed"
# its family on the catalogue
KIN = 'Quest'
# the editor text, with and without a target, then the holder's; `{more}` is what trailing words add
PHRASE = "for each time{more} {subject} failed [::target::]"
BARE = "for each quest{more} {subject} failed"
HOLDER = "for each time{more} my faction failed [::target::]"
HOLDER_BARE = "for each quest{more} my faction failed"
# its marked spelling (`PerTQuestFailed3`) counts only the failures of the quest its column names
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS = ("a quest pick",)
# what it attaches to: the nearest word on its left offering this
NEEDS = "an amount"
# `PerNotTQuestFailed3`: `Not` after this text counts every failure but the named quest's
TURNED_AFTER = "Per"
TURNED_PHRASE = "for each time{more} {subject} failed a quest other than [::target::]"
TURNED_HOLDER = "for each time{more} my faction failed a quest other than [::target::]"
# what it counts on, and the way there: the faction's quests, whose failures we keep
ASKED_OF = "ent.Faction"
COUNTS = ("ent.Faction.get_quests",)
# ⛔ the end of the way is no count: our running entry in the game's tally is read
SUMMED_BY = "framework.questions.quests_failed"
# ⛔ MARKED, the count is our entry beside the quest its column names, and that quest's alone
NAMED_COUNT = "framework.questions.quests_failed"
# an owner word after `Per` sums the count over the factions it picks, judged against the writer
OWNERS_PICK = True
# written straight after `Per`, inside the spelling
OWNER_STEM = "Per"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_IS_ITS_AMOUNT
