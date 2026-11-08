"""`FullyBuilt` -- a narrowing word: only structures with a finished building in every slot."""
from framework.trailing import NOTHING_TO_NAME, ONLY_EVER_ONE
WORD = 'FullyBuilt'
# its family on the catalogue
KIN = 'Structure'
# the question it asks, by the name its file in `questions` declares
ASKS = 'structure fully built'
# its bit in the narrowing set, never reordered
NUMBER = 21
TARGET = 'never'
# the editor text, then the holder's own line
PHRASE = 'if it is fully built'
# the one scope it is asked under, with every scope narrowing that one, and why no other
ONLY_UNDER, ONLY_WHY = 'Structure', 'only structures have building slots'
HOLDER = 'if I am fully built'
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NOTHING_TO_NAME
VAL_NONE = ONLY_EVER_ONE
# `Not` in front: its verb as the editor text says it, then turned; the first says one
NOT_VERB = (('is', 'is not'), ('am', 'am not'))
