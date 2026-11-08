"""`OnEliminate` -- an assassination or a last main base taken; `OnTEliminate` on the one named."""
from framework.trailing import NO_FAMILY_TRAILER, OPENS_THE_RULE, VAL_NOT_ITS
WORD = "OnEliminate"
# its family on the catalogue
KIN = 'Elimination'
# the editor text, with and without a target, then the holder's; `{s}` is empty after "you"
PHRASE = "when {actor} eliminate{s} [::target::] by any means"
BARE = "when {actor} eliminate{s} another faction by any means"
HOLDER = "when my faction eliminates [::target::] by any means"
HOLDER_BARE = "when my faction eliminates another faction by any means"
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotTEliminate2`: `Not` after this text fires on every victim but the one named
TURNED_AFTER = "On"
TURNED_PHRASE = "when {actor} eliminate{s} a faction other than [::target::] by any means"
TURNED_HOLDER = "when my faction eliminates a faction other than [::target::] by any means"
# the cdb sheet a target column names
SHEET = "faction"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 5
# NO SITE OF ITS OWN: the assassination and the destruction raise it, each naming it in `ALSO`
RAISED_BY = ("OnAssassinate", "OnDestroyFaction")
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the victim"
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
# that place in the word builder's words, and the scope whose rules it is asked by
PLACE, PLACE_IS = "the victim", "Faction"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
