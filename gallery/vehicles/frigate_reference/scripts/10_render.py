"""Frigate reference renders: per ship tq / tq_rear / top / rts at ONE fixed scale (in-game size = mesh x cdb scale),
plus a top-down lineup and a 3/4 lineup of all ships in one scene. Cycles CPU, neutral grey world, fixed sun + fill.

    FRIG_WORK=<scratch> python 10_render.py <outdir> [--fast]
"""
import os, sys, math, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import bpy
from mathutils import Vector, Matrix
import ships as SH

out = os.path.abspath(sys.argv[1]); os.makedirs(out + '/views', exist_ok=True)
FAST = '--fast' in sys.argv
ONLY = [a for a in sys.argv[2:] if not a.startswith('--')]
ORTHO = 20.0        # metres across the frame width, for tq / tq_rear / top (1000 x 700)
ORTHO_RTS = 41.0    # thumbnail, 420 x 300 (same framing ratio as thorvald_frigate 73_render_blend.py rts)
DIRS = {'tq': (-0.7, -0.7, 0.55), 'tq_rear': (0.7, 0.7, 0.55), 'top': (0, 0, 1), 'rts': (-0.35, -0.6, 1.0)}


def scene_setup(w, h, tex=True):
    sc = bpy.context.scene
    sc.render.engine = 'CYCLES'; sc.cycles.device = 'CPU'
    sc.cycles.samples = 8 if FAST else 64; sc.cycles.use_denoising = not FAST
    sc.render.resolution_x, sc.render.resolution_y, sc.render.resolution_percentage = w, h, 100
    sc.view_settings.view_transform = 'Standard'; sc.render.image_settings.file_format = 'PNG'
    sc.render.film_transparent = False
    wd = bpy.data.worlds.new('W'); sc.world = wd
    bg = wd.node_tree.nodes['Background']; bg.inputs[0].default_value = (0.62, 0.62, 0.64, 1); bg.inputs[1].default_value = 1.0
    for name, energy, rot in (('Sun', 3.0, (55, 0, 35)), ('Fill', 0.8, (65, 0, -140))):
        ld = bpy.data.lights.new(name, 'SUN'); ld.energy = energy; ld.angle = math.radians(3)
        lo = bpy.data.objects.new(name, ld); sc.collection.objects.link(lo)
        lo.rotation_euler = [math.radians(a) for a in rot]
    cd = bpy.data.cameras.new('Cam'); cd.type = 'ORTHO'
    cam = bpy.data.objects.new('Cam', cd); sc.collection.objects.link(cam); sc.camera = cam
    return sc, cam


def aim(cam, target, d, ortho):
    cam.data.ortho_scale = ortho
    cam.location = target + Vector(d).normalized() * 200
    cam.data.clip_end = 1000
    up = 'Y'
    cam.rotation_euler = (target - cam.location).to_track_quat('-Z', up).to_euler()


def load_scaled(s, offset=Vector()):
    objs = SH.load_ship(s); SH.wire(objs, s, rough_floor=0.3)
    for o in objs:
        o.data.transform(Matrix.Scale(s['cdb_scale'], 4))
        o.data.transform(Matrix.Translation(offset))
    return objs


stats = {}
for s in SH.SHIPS:
    if ONLY and s['key'] not in ONLY and 'ships' not in ONLY:
        continue
    SH.reset()
    objs = load_scaled(s)
    mn, mx = SH.bounds(objs); c = (mn + mx) / 2
    for o in objs:                      # sit every ship on z = 0, centred in x/y
        o.data.transform(Matrix.Translation(Vector((-c.x, -c.y, -mn.z))))
    mn, mx = SH.bounds(objs); c = (mn + mx) / 2
    sc, cam = scene_setup(1000, 700)
    for v in ('tq', 'tq_rear', 'top'):
        sc.render.resolution_y = 1000 if v == 'top' else 700     # top: square, 20 m x 20 m
        aim(cam, c, DIRS[v], ORTHO)
        sc.render.filepath = f"{out}/views/{s['key']}_{v}.png"; bpy.ops.render.render(write_still=True)
    sc.render.resolution_x, sc.render.resolution_y = 420, 300
    aim(cam, c, DIRS['rts'], ORTHO_RTS)
    sc.render.filepath = f"{out}/views/{s['key']}_rts.png"; bpy.ops.render.render(write_still=True)
    print('SHIP_DONE', s['key'], flush=True)

if not ONLY or 'lineup' in ONLY:
    # all ships in one scene, 2 rows x 4, 19 m pitch, nose -Y; one ortho camera = one scale
    SH.reset()
    PITCH = 19.0
    ROWP = 22.0
    placed = []
    for i, s in enumerate(SH.SHIPS):
        objs = load_scaled(s)
        mn, mx = SH.bounds(objs); c = (mn + mx) / 2
        col, row = i % 4, i // 4
        t = Vector(((col - 1.5) * PITCH - c.x, (0.5 - row) * ROWP - c.y, -mn.z))
        for o in objs:
            o.data.transform(Matrix.Translation(t))
        placed.append((s['key'], (col - 1.5) * PITCH, (0.5 - row) * ROWP))
    sc, cam = scene_setup(2000, 1200)
    aim(cam, Vector((0, -1.2, 0)), (0, 0, 1), 4 * PITCH)
    sc.render.filepath = f"{out}/views/LINEUP_top.png"; bpy.ops.render.render(write_still=True)
    json.dump({'pitch_m': PITCH, 'ortho_m': 4 * PITCH, 'px': [2000, 1200], 'cam_centre': [0, -1.2], 'row_pitch_m': ROWP, 'placed': placed}, open(f"{out}/views/LINEUP_top.json", 'w'))
    print('LINEUP_DONE', flush=True)
