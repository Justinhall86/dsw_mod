"""`UH` -- `Structure` narrowed to an Underworld Headquarters, not the main base's own one."""
from framework.trailing import NOTHING_TO_NAME, OPENS_THE_RULE, SCOPE_HANDS_NOTHING, VAL_NOT_ITS
from framework.turned import PLACE_HAS_NO_TARGET
WORD = "UH"
# the editor noun; the owner word frames it
PHRASE = "[!UWHeadquarters]"
# NOT as the scope it narrows: the user's sheet says nothing to target, so no marked spelling
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), SCOPE_HANDS_NOTHING
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# why `Not` never turns it
NOT_NONE = PLACE_HAS_NO_TARGET
# whose road this rides. That scope owns the site, the rules and who gets paid
NARROWS = "Structure"
# the game's own question, asked of the structure in hand. A no turns the row away
ASKS = "ent.Structure.isUWHeadquarters"
# which scope this is, as a number of ours. Never where the word sits in a list
NUMBER = 16

# the field a marked spelling matches (its cdb id); without it the UNIT matcher refuses the row
MARKED_ID = "kind"
# and the kind to read it off, because this word narrows rather than naming one
MARKED_ON = "ent.Structure"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NOTHING_TO_NAME
VAL_NONE = VAL_NOT_ITS
