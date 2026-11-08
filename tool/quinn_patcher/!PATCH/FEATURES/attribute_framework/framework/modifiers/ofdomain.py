"""`OfDomain` -- a trailing word (`PerDev_OfTDomain2`): only those in the named domain."""
from framework.trailing import ADDS_ONE_KIND, NOTHING_TRAILS_IT, VAL_NOT_ITS
WORD = "OfDomain"
# its family on the catalogue
KIN = 'Domain'
# the editor text it adds as its counting word's `{more}`
PHRASE = " in [::target::]"
# the domain is named in a target column, so the bare word is never offered
TARGET = "required"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
# what it attaches to: the nearest word on its left offering either
NEEDS = ("a domain", "a building count")
# the game's own list of the owned developments in one domain, asked once per named column
LISTS = "logic.faction.Developments.getAllOwned"
# with a building count on its left (`PerBuilding_OfTDomain2`) it narrows that count instead
NARROWS_TOO = "a building count"
# ⛔ A BUILDING'S DOMAIN BY NAME: its row looked up by its kind, as the game's own count does
SHEET = "building"
BY_ID = "byId"
IN_COLUMN = "domain"
# the kind the sheet's row is, borrowed from the one game function that takes it
ROW_OF = ("_Data.$Building_Impl_.get_domainId", 0)
# `PerDev_NotOfTDomain2`: `Not` in front counts every development outside the domain named
TURNED_AFTER = ""
TURNED_PHRASE = " outside [::target::]"
# the editor text for each domain named after the first, plain then with `Not`
AGAIN, AGAIN_TURNED = " or [::target::]", " and [::target::]"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
BARE_NONE = ADDS_ONE_KIND
VAL_NONE = VAL_NOT_ITS
