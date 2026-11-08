"""`PerRes` -- a trailing word (`PerTRes`): the amount is 1 per whole `val` of a resource held."""
from framework.questions.resource_held import ASKS, BY_ID, POSITION, ROW_OF, SHEET  # noqa: F401
from framework.trailing import NAMES_ONE_THING, NO_FAMILY_TRAILER, VAL_IS_ITS_AMOUNT
from framework.turned import ONE_AMOUNT_COUNTED

WORD = "PerRes"
# its family on the catalogue
KIN = 'Resource'
# the editor text, then the holder's own line's; `{more}` is what trailing words add
PHRASE = "for each ::value:: [::target::]{more} {subject} hold{s}"
HOLDER = "for each ::value:: [::target::]{more} my faction holds"
# the resource is named in a target column; the bare word refuses its row
TARGET = "required"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
# what it attaches to: the nearest word on its left offering this
NEEDS = "an amount"
# why `Not` never turns it
NOT_NONE = ONE_AMOUNT_COUNTED
# ⛔ `val` IS ITS DIVISOR: the amount starts at 1, times the whole `val`s held, rounded down
HELD_PER = "value"
# the holder's faction is asked, or each faction an owner word in front picks
ASKED_OF = "ent.Faction"
OWNERS_PICK = True
# written straight after `Per`, inside the spelling
OWNER_STEM = "Per"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
BARE_NONE = NAMES_ONE_THING
VAL_NONE = VAL_IS_ITS_AMOUNT
