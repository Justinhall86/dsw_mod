"""`Entity` -- the thing carrying the rule and everything below it; it rides every road."""
from framework.trailing import OPENS_THE_RULE, SCOPE_HANDS_NOTHING, VAL_NOT_ITS
WORD = "Entity"
# the editor noun, with and without a target; the owner word frames it
PHRASE = "[::target::]"
BARE = "thing"
# an entity use can name one in a target column, or mean whichever thing is in hand
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), SCOPE_HANDS_NOTHING
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `Not` in front: every one of its kind but the one its column names
TURNED_AFTER = ""
TURNED_PHRASE = "anything but [::target::]"
# every road answers for this word: no driver, no question -- the holder in hand is the answer
EVERY_ROAD = True
# our unique scope number, never a list place
NUMBER = 15
# the cdb sheet a target column names
SHEET = "unit"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
