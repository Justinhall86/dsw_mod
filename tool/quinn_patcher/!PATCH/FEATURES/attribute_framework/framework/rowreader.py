#!/usr/bin/env python3
"""What the game gives us for reading a cdb row: the functions we borrow, and their shapes."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import (fields_of, function_named, minted_text, number, register_like,
                          returns_type)

# the word every column we care about starts with; the number after it is which column it is
PREFIX = "target"
# ⛔ NO NAMES OF OURS ARE ADDED to a row's list: they come back unreadable and the search faults

# ask a row which columns it carries
LIST_COLUMNS = "$Reflect.fields"
# read one column off a row, by name
READ_COLUMN = "$Reflect.field"
# turn the piece after the word into a number, or into nothing at all
NUMBER_OF = "$Std.parseInt"
# where one piece of text sits inside another
STARTS_AT = "String.indexOf"
# everything from a position onwards
TAIL_FROM = "String.substr"


# where a file's reader is remembered: ON the file, so two callers cannot resolve it twice
READER_ON = "_spine_row_reader"


def reader_for(bc):
    """The one reader for this game file. Resolving six functions by name is not free."""
    reader = getattr(bc, READER_ON, None)
    if reader is None:
        reader = RowReader(bc)
        setattr(bc, READER_ON, reader)
    return reader


class RowReader:
    """Every borrowed function and every shape the walk needs, each under its own name."""

    def __init__(self, bc):
        # ---- the five functions, each resolved by name and refused if there is not exactly one
        self.listing = function_named(bc, LIST_COLUMNS)
        self.reading = function_named(bc, READ_COLUMN)
        self.numbering = function_named(bc, NUMBER_OF)
        self.finding = function_named(bc, STARTS_AT)
        self.tailing = function_named(bc, TAIL_FROM)

        # ---- the kinds they pass each other (row, real text, count, the argument never given)
        self.row_kind = gv(list(self.reading.regs)[0])
        self.text_kind = gv(list(self.numbering.regs)[0])
        self.count_kind = returns_type(self.finding, STARTS_AT)
        self.optional_kind = gv(list(self.finding.regs)[2])
        self.listing_kind = returns_type(self.listing, LIST_COLUMNS)
        self.number_kind = returns_type(self.numbering, NUMBER_OF)
        self.value_kind = returns_type(self.reading, READ_COLUMN)

        # ---- what those signatures have to look like, or the walk means something else
        guard(gv(list(self.reading.regs)[1]) == self.text_kind,
              "%s does not take a name second" % READ_COLUMN)
        guard(gv(list(self.listing.regs)[0]) == self.row_kind,
              "%s does not take a row" % LIST_COLUMNS)
        guard(gv(list(self.finding.regs)[0]) == self.text_kind,
              "%s does not look inside text" % STARTS_AT)
        guard(gv(list(self.tailing.regs)[0]) == self.text_kind,
              "%s does not take text" % TAIL_FROM)
        guard(gv(list(self.tailing.regs)[2]) == self.optional_kind,
              "the two text helpers disagree about the argument neither of them is given")

        # ---- where the answer keeps its length and what it holds, both found BY NAME
        names, fields = fields_of(bc, self.listing_kind, "the list of column names")
        guard("length" in names, "the list of column names has no `length`, only %s" % names)
        holds = [i for i, n in enumerate(names) if n != "length"]
        guard(len(holds) == 1, "the list carries %s, not one place plus its length" % names)
        self.length_field = names.index("length")
        self.place_field = holds[0]
        self.place_kind = gv(fields[holds[0]].type)

        # ---- text says its own length the same way, which is why no length is written down
        text_names, text_fields = fields_of(bc, self.text_kind, "text")
        guard("length" in text_names, "text has no `length` field, only %s" % text_names)
        self.text_length_field = text_names.index("length")

        # ---- and every length has to BE the kind of number the walk counts in
        guard(gv(fields[self.length_field].type) == self.count_kind,
              "how many columns there are is not the kind of number the walk counts in")
        guard(gv(text_fields[self.text_length_field].type) == self.count_kind,
              "the length of text is not that kind of number either")
        guard(gv(list(self.tailing.regs)[1]) == self.count_kind,
              "%s is not given that kind of number to start from" % TAIL_FROM)

        # ---- the plain numbers and the words this file's own walk will need
        self.zero = number(bc, 0)
        self.one = number(bc, 1)
        self.word = minted_text(bc, PREFIX)
        # the five are where the rarer kinds of register are declared, so look in them first
        self.prefer = (self.listing, self.reading, self.numbering, self.finding, self.tailing)

    def registers(self, bc, fn):
        """Every register the walk needs, on `fn`, each one typed from a signature above."""
        wanted = (("names", "listing_kind"),
                  ("place", "place_kind"),
                  ("index", "count_kind"),
                  ("howmany", "count_kind"),
                  ("namedyn", "row_kind"),
                  ("name", "text_kind"),
                  ("word", "text_kind"),
                  ("nothing", "optional_kind"),
                  ("at", "count_kind"),
                  ("zero", "count_kind"),
                  ("wordlen", "count_kind"),
                  ("rest", "text_kind"),
                  ("restlen", "count_kind"),
                  ("number", "count_kind"),
                  ("lowest", "count_kind"),
                  ("maybe", "number_kind"),
                  ("value", "value_kind"))
        out, first = {}, len(fn.regs)
        for i, (name, kind) in enumerate(wanted):
            fn.regs.append(deepcopy(register_like(bc, getattr(self, kind), self.prefer)))
            out[name] = first + i
        # the function has to declare how many registers it now holds
        fn.nregs.value = len(fn.regs)
        return out

    def borrow_register(self, bc, fn, kind):
        """One more register of a named kind, for a caller that needs a row of its own."""
        fn.regs.append(deepcopy(register_like(bc, getattr(self, kind), self.prefer)))
        fn.nregs.value = len(fn.regs)
        return len(fn.regs) - 1
