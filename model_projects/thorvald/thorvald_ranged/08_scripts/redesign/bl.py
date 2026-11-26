"""Run a Blender script with the bpy Python module (cloud sessions have no blender.exe).

    python bl.py [<file.blend>] <script.py> [-- args...]     ==   blender -b [<file.blend>] --python <script.py> -- args...
"""
import os, runpy, sys
import bpy

a = sys.argv[1:]
rest = a[a.index("--"):] if "--" in a else []
a = a[:a.index("--")] if "--" in a else a
if a[0].endswith(".blend"):
    bpy.ops.wm.open_mainfile(filepath=os.path.abspath(a.pop(0)))
script = os.path.abspath(a[0])
sys.argv = ["blender", "--python", script] + rest
sys.path.insert(0, os.path.dirname(script))
runpy.run_path(script, run_name="__main__")
