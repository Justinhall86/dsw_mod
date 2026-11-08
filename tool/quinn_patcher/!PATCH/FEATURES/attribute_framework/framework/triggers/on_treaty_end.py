"""`OnTreatyEnd` -- fires for each side of a treaty that ends; `OnTTreatyEnd` on the one named."""
from framework.trailing import OPENS_THE_RULE, OWES_ITS_TREATIES, VAL_NOT_ITS
WORD = "OnTreatyEnd"
# its family on the catalogue
KIN = 'Treaty'
# the editor text, with and without a target, then the holder's; `{with}` is where `With` reads
PHRASE = "when [::target::] signed by {actor}{with} ends"
BARE = "when a treaty signed by {actor}{with} ends"
HOLDER = "when my faction's [::target::]{with} ends"
HOLDER_BARE = "when one of my faction's treaties{with} ends"
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS_OWED = {"a treaty pick": OWES_ITS_TREATIES}
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotTTreatyEnd2`: `Not` after this text fires on every treaty but the one named
TURNED_AFTER = "On"
TURNED_PHRASE = "when a treaty other than [::target::] signed by {actor}{with} ends"
TURNED_HOLDER = "when my faction's treaty other than [::target::]{with} ends"
# the cdb sheet a target column names
SHEET = "treaty"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 11
# what a trailing word on its right may attach to: `EndedByDuration`, how the treaty ended
OFFERS = ("a treaty ending",)
# WHERE IT IS RAISED FROM: the game's one drain of a treaty, broken, run out, war or replaced
SITE = "logic.state.DiplomacyManager.removeTreaty"
# the call there taking the treaty off the active list; the word fires once it said it did
DRAINS = "hl.types.ArrayObj.remove"
# AND THE DEFEAT: the daily check drops a defeated faction's treaties without that drain
DAILY = "logic.state.DiplomacyManager.regularUpdate"
# what those functions are about, and the kind of both sides
ABOUT = "logic.state.DiplomacyManager"
SIGNER = "ent.Faction"
# the record's own fields, by the names the game gives them
SIDES, KIND, STARTED = ("faction1", "faction2"), "kind", "startTime"
# a treaty's full length off its kind, as the game's own expiry reads it
LENGTH = "$HDiplomacy.getTreatyDurationInSeconds"
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the faction whose treaty ended"
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
PLACE, PLACE_IS = "the faction whose treaty ended", "Faction"
# it happens NOWHERE: its number floats over the scope's own thing, a place of this kind
SHOWN_AS = "ent.Entity"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
