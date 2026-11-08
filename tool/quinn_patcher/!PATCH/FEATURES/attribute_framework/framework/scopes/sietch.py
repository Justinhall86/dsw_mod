"""`Sietch` -- `Structure` narrowed to a Sietch itself, any of four kinds (not `LocalSietch`)."""
from framework.trailing import OPENS_THE_RULE, SCOPE_HANDS_NOTHING, VAL_NOT_ITS
WORD = "Sietch"
# the editor noun, with and without a target; the owner word frames it
PHRASE = "[::target::]"
BARE = "sietch"
# the bare noun's plural, where adding an "s" is wrong
PLURAL = "sietches"
# their sheet says optional, and says why: the kind is worth naming because there are four
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), SCOPE_HANDS_NOTHING
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `Not` in front: every one of its kind but the one its column names
TURNED_AFTER = ""
TURNED_PHRASE = "any sietch but [::target::]"
# whose road this rides. That scope owns the site, the rules and who gets paid
NARROWS = "Structure"
# the game's own question, asked of the structure in hand. A no turns the row away
ASKS = "ent.Structure.isSietch"
# which scope this is, as a number of ours. Never where the word sits in a list
NUMBER = 18

# the field a marked spelling matches (its cdb id); without it the UNIT matcher refuses the row
MARKED_ID = "kind"
# and the kind to read it off, because this word narrows rather than naming one
MARKED_ON = "ent.Structure"
# the cdb sheet a target column names
SHEET = "structure"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
