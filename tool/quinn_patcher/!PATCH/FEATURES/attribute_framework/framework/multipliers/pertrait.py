"""`PerTrait` -- a trailing word (`PerTTrait`): the amount once per stack of a trait carried."""
from framework.questions.trait_stacks import ASKS, THROUGH  # noqa: F401
from framework.trailing import NAMES_ONE_THING, NO_FAMILY_TRAILER, VAL_IS_ITS_AMOUNT
from framework.turned import ONE_AMOUNT_COUNTED

WORD = "PerTrait"
# its family on the catalogue
KIN = 'Trait'
# the editor text, then the holder's own line's; `{more}` is what trailing words add
PHRASE = "for each stack of [::target::]{more} {subject} {have}"
HOLDER = "for each stack of [::target::]{more} I have"
# the trait is named in a target column; the bare word refuses its row
TARGET = "required"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
# what it attaches to: the nearest word on its left offering this
NEEDS = "an amount"
# why `Not` never turns it
NOT_NONE = ONE_AMOUNT_COUNTED
# ⛔ `val` IS PER STACK, as `PerUnit`'s is per unit: the stacks are read by this file
HELD_READ_BY = "framework.stacksheld"
# the row's own thing is asked, or each faction an owner word in front picks
COUNTS_ITSELF = True
ASKED_OF = "ent.Faction"
OWNERS_PICK = True
# written straight after `Per`, inside the spelling
OWNER_STEM = "Per"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
BARE_NONE = NAMES_ONE_THING
VAL_NONE = VAL_IS_ITS_AMOUNT
