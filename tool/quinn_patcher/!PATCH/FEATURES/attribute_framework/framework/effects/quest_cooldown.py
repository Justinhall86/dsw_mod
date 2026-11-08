"""`QuestCooldown` -- an effect held through the game's own attributes."""
# NO: no `TQuestCooldown`; one quest's own cooldown is another thing, so the user dropped it
from framework.trailing import NOTHING_TO_NAME, VAL_IS_ITS_AMOUNT
from framework.turned import NAMES_NOTHING_TO_LEAVE_OUT
WORD = 'QuestCooldown'
# its family on the catalogue
KIN = 'Quest'
# its own number among the held words, never reordered
NUMBER = 107
# the game's attributes it raises, per parameter: `plain`, `ARatio`, `MRatio`
ATTRIBUTES = {
    "plain": "Quest_Cooldown_Flat",
    "ARatio": "Quest_Cooldown_ARatio",
    "MRatio": "Quest_Cooldown_MRatio",
}
# the editor text
PHRASE = '::s_value:: days between new quests'
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NOTHING_TO_NAME
VAL_NONE = VAL_IS_ITS_AMOUNT
# with `Not`: why it takes none
NOT_NONE = NAMES_NOTHING_TO_LEAVE_OUT
