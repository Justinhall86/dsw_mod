# Blender live bridge: executes .py files dropped into BRIDGE/cmd, writes .out logs.
import bpy, os, io, sys, traceback, contextlib
BRIDGE = r"C:\Users\justi\AppData\Local\Temp\claude\c--Users-justi-OneDrive-Python-dsw-mod\bcfd5601-f811-4ebb-8e18-d846ff537b3d\scratchpad\bridge"
CMD = os.path.join(BRIDGE, "cmd")
NS = {"bpy": bpy, "BRIDGE": BRIDGE}

def view3d_ctx():
    for win in bpy.context.window_manager.windows:
        for area in win.screen.areas:
            if area.type == 'VIEW_3D':
                region = next(r for r in area.regions if r.type == 'WINDOW')
                return dict(window=win, area=area, region=region, screen=win.screen)
NS["view3d_ctx"] = view3d_ctx

def shot(name):
    c = view3d_ctx()
    path = os.path.join(BRIDGE, "shots", name + ".png")
    with bpy.context.temp_override(**c):
        bpy.ops.screen.screenshot_area(filepath=path)
    return path
NS["shot"] = shot

def poll():
    try:
        for fn in sorted(os.listdir(CMD)):
            if not fn.endswith(".py"):
                continue
            p = os.path.join(CMD, fn)
            src = open(p, encoding="utf-8").read()
            os.replace(p, p + ".done")
            buf = io.StringIO()
            with contextlib.redirect_stdout(buf), contextlib.redirect_stderr(buf):
                try:
                    exec(compile(src, fn, "exec"), NS)
                    print("[OK]")
                except Exception:
                    traceback.print_exc()
            open(p[:-3] + ".out", "w", encoding="utf-8").write(buf.getvalue())
    except Exception:
        traceback.print_exc()
    return 0.5

bpy.app.timers.register(poll, first_interval=1.0, persistent=True)
print("bridge ready:", CMD)
