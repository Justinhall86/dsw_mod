"""A faction acquired a development: walk each faction's rows and its things', weighing it."""
import sys

from tools.project import gv, guard
from tools.hlcode import call_sites, field_by_name, function_named, kind_named, returns_type
from tools.splice import insert
from framework import columns, raisewalk, sayonce, traps
from framework.triggers import on_dev as word
from framework.modifiers import ofdomain
from framework.parsed import a_new_place
from framework.rowreader import reader_for

# what this splice is called, which is what its own record answers to
SPLICE = "a development acquired"
# what the walk's own places are named after
NOUN = "development"
# ⛔ said through the quiet switch: without it they emit NOTHING, which is no verdict
FINISHED = "a development was acquired"
HAS_FACTION = "the faction acquiring is in hand"
HAS_THING = "the development is in hand"
RAISED = "a row owed something by this development"
FIRES = "this row fires on this development"
# where finding the domain rejoins, found or not
NO_DOMAIN = "the development's domain, looked for"
# what the domain test's gate is called
IN_DOMAIN = "the development's domain is one its row names"


def site(bc):
    """The game's own acquiring of a development, checked to be about a faction's developments."""
    fn = function_named(bc, word.SITE)
    regs = [gv(r) for r in fn.regs]
    guard(regs[0] == kind_named(bc, word.ABOUT),
          "%s is about t@%s rather than a %s" % (word.SITE, regs[0], word.ABOUT))
    guard(regs[1] == kind_named(bc, word.DEVELOPMENT),
          "%s is handed t@%s rather than a %s" % (word.SITE, regs[1], word.DEVELOPMENT))
    return fn


def the_point(bc, fn):
    """The one call made once the development is the faction's."""
    found = call_sites(fn, function_named(bc, word.BEFORE))
    guard(len(found) == 1,
          "%s calls %s %d time(s), not once" % (word.SITE, word.BEFORE, len(found)))
    return found[0]


def the_called(bc):
    """WHERE a development keeps its id, which is the text a target column names."""
    called_at, called_kind = field_by_name(bc, kind_named(bc, word.DEVELOPMENT), word.CALLED,
                                           "a development")
    guard(called_kind == reader_for(bc).text_kind,
          "a development's `%s` is t@%s rather than the text a target column names"
          % (word.CALLED, called_kind))
    return called_at


def kinds(bc):
    """The faction's kind, twice (it is also what fired), and the development's."""
    owner = field_by_name(bc, kind_named(bc, word.ABOUT), word.OWNER_ON, "developments")[1]
    return owner, owner, kind_named(bc, word.DEVELOPMENT)


def places(bc, fn, at):
    """Where the number floats (nowhere of its own: the scope's thing), and the domain."""
    at.where = a_new_place(bc, fn, kind_named(bc, word.SHOWN_AS))
    its_row = function_named(bc, word.ITS_ROW)
    at.its_row = a_new_place(bc, fn, returns_type(its_row, word.ITS_ROW))
    at.domain = a_new_place(bc, fn, returns_type(function_named(bc, word.ITS_DOMAIN),
                                                 word.ITS_DOMAIN))
    guard(at.reader.text_kind == gv(list(fn.regs)[at.domain]),
          "%s hands back something other than the text a target column names" % word.ITS_DOMAIN)


def opening(bc, fn, op, at, done):
    """The faction, the development, what it is called and its domain, said once."""
    owner_at = field_by_name(bc, kind_named(bc, word.ABOUT), word.OWNER_ON, "developments")[0]
    return (sayonce.emit_word_always(bc, fn, FINISHED, even_when_quiet=True)
            + [op("GetThis", dst=at.faction, field=owner_at),
               (op("JNull", reg=at.faction), done),
               op("Mov", dst=at.thing, src=at.faction)]
            + sayonce.emit_word_always(bc, fn, HAS_FACTION, even_when_quiet=True)
            + [op("Mov", dst=at.running, src=1),
               (op("JNull", reg=at.running), done)]
            + sayonce.emit_word_always(bc, fn, HAS_THING, even_when_quiet=True)
            + [op("Field", dst=at.acting, obj=at.running, field=the_called(bc)),
               op("Null", dst=at.domain),
               op("Call1", dst=at.its_row, fun=gv(function_named(bc, word.ITS_ROW).findex),
                  arg0=at.running),
               (op("JNull", reg=at.its_row), NO_DOMAIN),
               op("Call1", dst=at.domain, fun=gv(function_named(bc, word.ITS_DOMAIN).findex),
                  arg0=at.its_row),
               NO_DOMAIN + ":",
               op("Label"),
               op("Null", dst=at.where)]
            + sayonce.emit_always(bc, fn, at.acting))


def emit_fired(bc, fn, at, into, refused):
    """Past this, the row names no domain, or the development's is one it names."""
    from framework.pipeline import Place, hands_for
    place = Place(name=IN_DOMAIN, row=into, notes={}, note=None, kept=None, store=None,
                  refused=refused, hands=hands_for(bc, fn))
    return raisewalk.emit_listed(place, ofdomain.WORD, into[columns.PART_FOR_COUNT],
                                 at.domain, refused)


def install(bc):
    """Splice it just after the development became the faction's, ahead of the feedback."""
    fn = site(bc)
    how_many = insert(bc, fn, the_point(bc, fn), raisewalk.emit(bc, fn, sys.modules[__name__]),
                      SPLICE, traps.IN_PLAY)
    return ("DEVELOPMENT: %d instruction(s) at %s -- it raises a mark on every row whose "
            "trigger is `%s`, on a marked one only when the development is the one its own "
            "target column names, and past `%s` only when its domain is one named (none, "
            "with `Not`)"
            % (how_many, word.SITE, word.WORD, ofdomain.WORD))
