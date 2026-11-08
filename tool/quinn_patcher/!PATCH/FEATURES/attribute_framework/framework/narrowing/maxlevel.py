"""`MaxLevel` -- a narrowing word: only armies at their maximum experience level."""
from framework.trailing import NOTHING_TO_NAME, ONLY_EVER_ONE
WORD = 'MaxLevel'
# its family on the catalogue
KIN = 'Combat'
# the question it asks, by the name its file in `questions` declares
ASKS = 'army level against its maximum'
# its bit in the narrowing set, never reordered
NUMBER = 1
TARGET = 'never'
# the editor text, then the holder's own line
PHRASE = 'if it is at max level'
# the one scope it is asked under, with every scope narrowing that one, and why no other
ONLY_UNDER, ONLY_WHY = 'Unit', 'only units have levels'
HOLDER = 'if I am at max level'
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NOTHING_TO_NAME
VAL_NONE = ONLY_EVER_ONE
# `Not` in front: its verb as the editor text says it, then turned; the first says one
NOT_VERB = (('is', 'is not'), ('am', 'am not'))
