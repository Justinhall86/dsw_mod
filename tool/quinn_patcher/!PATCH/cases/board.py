#!/usr/bin/env python3
"""What proves the board and `mod say`. It reads the SPLICED file and changes nothing itself."""
from tools.project import guard
from tools.hlcode import function_named, minted_text
from tools.splice import where
from framework import board
from framework import modsay
from standalone import onoff


def _states_are_distinct():
    """No two states of a word read as the same number, or one would hide another."""
    every = (board.UNTOUCHED, board.AT_GAME, board.AT_TICK, board.AT_PASS, board.FREE, board.OFF)
    guard(len(set(every)) == len(every), "two of the board's six states are the same number")
    guard(board.UNTOUCHED not in board.READS_AS,
          "NOTHING is a state a word is never left in, so nothing should read it back")


def _every_word_declares_itself():
    """A word with no tempo, no description, or a tempo nobody knows cannot sit on the board."""
    guard(not board.refusals(), "; ".join(board.refusals()))
    for word in board.words():
        guard(word in onoff.SAYS, "`%s` is on the board and says nothing about itself" % word)
    guard(board.PER_FRAME not in board.TEMPO_IS,
          "`%s` is a tempo a word may declare, and it may never be one" % board.PER_FRAME)


def _nothing_shouts_before_it_is_asked():
    """Every word is silent before a line is typed, bar the ones the build names out loud."""
    loud = [w for w in board.words() if board.boot_of(w) != board.OFF]
    guard(sorted(loud) == sorted(onoff.SPEAKING_AT_BOOT),
          "%d word(s) speak at boot and `SPEAKING_AT_BOOT` names %d"
          % (len(loud), len(onoff.SPEAKING_AT_BOOT)))
    for word in onoff.SPEAKING_AT_BOOT:
        guard(onoff.ON.get(word), "`%s` speaks at boot and is not in the build at all" % word)


def _the_places_are_there(bc):
    """Every word's three places and the two counts were made, each with a name of its own."""
    made = board.make_slots(bc)
    wanted = 2 + 2 * len(board.words())
    guard(len(made) == wanted, "the board made %d place(s) and needs %d" % (len(made), wanted))
    guard(len(set(made.values())) == wanted, "two of the board's places are the same global")


def _every_reading_names_itself(bc):
    """Each word in this build has a gate of its own, or the door it rides speaks for it."""
    latches = board.every_latch(bc)
    for word in board.words():
        if not board.in_this_build(word) or word in (modsay.NAME,):
            continue
        guard(any(("%s says " % word) in name for name in latches),
              "`%s` is in this build and nothing in the file gates what it says" % word)
    return len(latches)


def _the_line_is_in_front(bc):
    """The command sits at the head of the one function every typed line comes through."""
    at, many = where(bc, "the `mod say` line")
    guard(at == 0, "the `mod say` line is at %d, not in front of the game's own parser" % at)
    guard(many > 0, "the `mod say` line went in empty")
    fn = function_named(bc, modsay.HANDLE)
    ours = [i for i in range(many) if fn.ops[i].op == "Ret"]
    guard(ours, "nothing in the `mod say` line returns, so every answer falls into the parser")
    return many


def _every_word_can_be_typed(bc):
    """Each word on the board is a real text in the file, or no typed line could ever match it."""
    for word in board.words():
        guard(minted_text(bc, word) is not None,
              "`%s` is on the board and the file carries no text of that word" % word)
    for one in (modsay.OURS, modsay.SAY, modsay.OFF_WORD, board.PER_FRAME):
        guard(minted_text(bc, one) is not None, "the file carries no text of `%s`" % one)
    for spelling in board.TEMPO_IS:
        guard(minted_text(bc, spelling) is not None,
              "`%s` is a tempo and the file carries no text of it" % spelling)


def check(bc):
    """Everything above, and what it adds up to."""
    _states_are_distinct()
    _every_word_declares_itself()
    _nothing_shouts_before_it_is_asked()
    _the_places_are_there(bc)
    if not onoff.on(modsay.NAME):
        return "the board is made; `mod say` is off"
    many = _the_line_is_in_front(bc)
    _every_word_can_be_typed(bc)
    gates = _every_reading_names_itself(bc)
    here = [w for w in board.words() if board.in_this_build(w)]
    return ("%d word(s) on the board, %d in this file behind %d gate(s), %d speaking at boot; "
            "the line is %d instruction(s) in front of `%s`"
            % (len(board.words()), len(here), gates, len(onoff.SPEAKING_AT_BOOT), many,
               modsay.HANDLE))
