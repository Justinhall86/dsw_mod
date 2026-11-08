"""`QuestDuration` -- an effect held through the game's own attributes: days a quest lasts."""
from framework.trailing import VAL_IS_ITS_AMOUNT
WORD = 'QuestDuration'
# its family on the catalogue
KIN = 'Quest'
# its own number among the held words, never reordered
NUMBER = 106
# the game's attributes it raises, per parameter: `plain`, `ARatio`, `MRatio`
ATTRIBUTES = {
    "plain": "Quest_Duration_Flat",
    "ARatio": "Quest_Duration_ARatio",
    "MRatio": "Quest_Duration_MRatio",
}
# `QuestDuration_OfTypeLandsraad`: the Of words after it pick the quests whose limit it changes
OFFERS = ("a quest pick",)
# `TQuestDuration`: the quest its column names is filed as one more pick, never told the game
FILED = 'quest'
# the editor text
PHRASE = '::s_value:: days to the duration of [::target::]'
BARE = '::s_value:: days to quest durations'
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_IS_ITS_AMOUNT
# with `Not` after '': the editor text, a random pick that skips the one named
TURNED_AFTER = ''
TURNED_PHRASE = '::s_value:: days to the duration of every quest but [::target::]'
