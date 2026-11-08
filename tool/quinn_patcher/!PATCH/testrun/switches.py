#!/usr/bin/env python3
"""How the game asks for a command-line switch and reads the file it names; both lifts use it."""
# how this build asks for a value on the command line: the name, and what to answer without one
ARG_READER = "$AppBase.getSysArg"
# and how it reads the file a switch names
FILE_READER = "sys.io.$File.getContent"
# the function both lifts copy from: it already asks for a switch and reads the file it names
DONOR = "$Main.quickStart"
