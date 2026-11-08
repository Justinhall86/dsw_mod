"""`OrUnit` -- a trailing word (`PerTUnit2_OrTUnit3`): units of the named type count as well."""
from framework.trailing import ADDS_ONE_KIND, NOTHING_TRAILS_IT, VAL_NOT_ITS
from framework.turned import OR_ADDS_TO_A_COUNT
WORD = "OrUnit"
# its family on the catalogue
KIN = 'Unit'
# the editor text it adds as its counting word's `{more}`
PHRASE = " or [::target::]"
# the type is named in a target column, so the bare word is never offered
TARGET = "required"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
# what it attaches to: the nearest word on its left offering this
NEEDS = "a unit count"
# why `Not` never turns it
NOT_NONE = OR_ADDS_TO_A_COUNT
# the counting word whose named types it adds one to: a unit counts if it is ANY of them
ADDS_TO = "PerUnit"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
BARE_NONE = ADDS_ONE_KIND
VAL_NONE = VAL_NOT_ITS
