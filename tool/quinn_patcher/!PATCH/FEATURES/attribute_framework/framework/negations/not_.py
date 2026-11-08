"""`Not` -- glued in front of a narrowing (`NotHasTDev`): only things that narrowing refuses."""
from framework.trailing import NOT_IS_GLUED, TURNS_ITS_WORD, VAL_NOT_ITS
from framework.turned import NOT_IS_ITSELF
WORD = "Not"
# its family on the catalogue
KIN = 'Grammar'
# never a piece of its own: it sits inside the narrowing's piece and names no column
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOT_IS_GLUED
NEEDS, NEEDS_NONE = (), NOT_IS_GLUED
# why `Not` never turns it
NOT_NONE = NOT_IS_ITSELF
# `NotEnemyHasTDev`: the whole question turned, so no enemy owns it; never 0, never reordered
IN_FRONT = 1
# `EnemyNotHasTDev`: each faction picked is asked the turned question, so one enemy lacks it
AFTER_THE_OWNER = 2
# `BordersNotEnemy`: every faction its owner word leaves out is asked, the writer's too
BEFORE_THE_OWNER = 3
# `NotBordersNotEnemy`: in front and before the owner word at once
BOTH_SIDES = 4
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = TURNS_ITS_WORD
VAL_NONE = VAL_NOT_ITS
