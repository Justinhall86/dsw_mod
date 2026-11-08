"""`ResearchingDev` -- a narrowing word."""
from framework.trailing import ONLY_EVER_ONE
WORD = 'ResearchingDev'
# its family on the catalogue
KIN = 'Development'
# the question it asks, by the name its file in `questions` declares
ASKS = 'researching'
# its bit in the narrowing set, never reordered
NUMBER = 8
TARGET = 'optional'
# the editor text, then the holder's own line
PHRASE = 'if {subject} {are} researching [::target::]'
HOLDER = 'if my faction is researching [::target::]'
BARE = 'if {subject} {are} researching a development'
HOLDER_BARE = 'if my faction is researching a development'
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = ONLY_EVER_ONE
# `Not` in front: its verb as the editor text says it, then turned; the first says one
NOT_VERB = (('is', 'is not'), ('are', 'are not'), ('am', 'am not'))
