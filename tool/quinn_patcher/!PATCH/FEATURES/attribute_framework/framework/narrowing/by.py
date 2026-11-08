"""`By` -- a narrowing word: after `OnDeath`, the killer belongs to the owner word after it."""
from framework.trailing import ONLY_EVER_ONE
WORD = 'By'
# its family on the catalogue
KIN = 'Allegiance'
# the question it asks, by the name its file in `questions` declares
ASKS = 'owner of a thing'
# its bit in the narrowing set, never reordered
NUMBER = 20
TARGET = 'optional'
# after a trigger with two sides, the one it asks about, whichever side the trigger fired in
SIDE = 'the killer'
# asked only of the place a trigger names, never of the holder; why, for the word builder
ONLY_AFTER_A_TRIGGER = "it asks who acted in a trigger"
# the editor text, then the holder's own line
PHRASE = 'if it belongs to {one}'
HOLDER = 'if I belong to {one}'
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = ONLY_EVER_ONE
# `Not` in front: its verb as the editor text says it, then turned; the first says one
NOT_VERB = (('belongs', "doesn't belong"), ('belong', "don't belong"))
