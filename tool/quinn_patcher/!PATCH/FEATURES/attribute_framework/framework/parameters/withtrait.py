"""`WithTrait` -- a trailing parameter (`WithTTrait2`): the trait a unit made here is born with."""
from framework.trailing import NAMES_ONE_THING, NOTHING_TRAILS_IT, VAL_NOT_ITS
from framework.turned import SHAPES_THE_EFFECT
WORD = "WithTrait"
# its family on the catalogue
KIN = 'Trait'
# the editor text it adds
PHRASE = "with [::target::]"
# the trait is named in a target column, so the bare word is never offered
TARGET = "required"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
# which parameter this is, from one: zero is what no parameter spelled leaves
NUMBER = 1
# what it attaches to: the nearest word on its left offering this
NEEDS = "a unit being made"
# why `Not` never turns it
NOT_NONE = SHAPES_THE_EFFECT
# bare or named, and with or without `val`: why it takes one side only, or what is owed
BARE_NONE = NAMES_ONE_THING
VAL_NONE = VAL_NOT_ITS
