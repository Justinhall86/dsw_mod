"""Stage 2 - kitbash new components onto the top of the Renegade.

    blender -b --python 02_top_parts.py -- <in.blend> <out.blend>

Four components, each reading as its own piece of hardware (silhouette, not paint, is what makes kitbash parts
read):

  TK_Scanner      slim mast on the forward deck carrying a tilted dish + feed horn   (dish = copper)
  TK_Module       personnel capsule on the mid spine: bevelled box, domed roof, hatch plates,
                  hinges, portholes, a copper seam band                             (roof = hull)
  TK_Turret       twin-barrel blaster on a ring barbette on the aft deck, facing forward
                  (hull housing, copper trim band, copper muzzle rings)
  TK_SensorDome   low sensor blister + aerial on the aft deck corner               (dome = dark lens)

Hull-coloured faces are UV-mapped into one flat patch of the ship's own recoloured albedo, so they take the
painted shading and metal flags of the hull instead of reading as flat plastic.  Every part gets a single
B_Body vertex group and an Armature modifier so it travels with the ship.
"""
import math
import os
import sys

import bmesh
import bpy
from mathutils import Vector

a = sys.argv[sys.argv.index("--") + 1:]
src, dst = os.path.abspath(a[0]), os.path.abspath(a[1])

PATCH = (0.2578, 0.8594, 0.0625)      # (u0, v0, size) flat mid-grey patch of Thorvald_Renegade_Albedo
SPAN = 2.0                            # world units mapped across the patch

SPINE_Z = 2.37
AFT_Z = 2.54

bpy.ops.wm.open_mainfile(filepath=src)
scene = bpy.context.scene
ship = bpy.data.objects["Renegade_Frigate"]
arm = bpy.data.objects["Armature"]
HULL = bpy.data.materials["Mat_Renegade_Frigate"]


def srgb_to_linear(c):
    return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4


def make_mat(name, hexcol, metallic, rough):
    m = bpy.data.materials.new(name)
    m.use_nodes = True
    bsdf = next(n for n in m.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
    r, g, b = (int(hexcol[i:i + 2], 16) / 255 for i in (0, 2, 4))
    bsdf.inputs["Base Color"].default_value = (srgb_to_linear(r), srgb_to_linear(g), srgb_to_linear(b), 1.0)
    bsdf.inputs["Metallic"].default_value = metallic
    bsdf.inputs["Roughness"].default_value = rough
    return m


COPPER = make_mat("Thorvald_Copper", "B26E3C", 0.9, 0.34)
LENS = make_mat("Thorvald_Lens", "0C1014", 0.0, 0.12)

made = []


def cyl(name, r, depth, loc, rot=(0, 0, 0), mat=HULL, verts=24):
    bpy.ops.mesh.primitive_cylinder_add(vertices=verts, radius=r, depth=depth, location=loc, rotation=rot)
    o = bpy.context.active_object
    o.name = name
    o.data.materials.append(mat)
    made.append(o)
    return o


def box(name, size, loc, rot=(0, 0, 0), mat=HULL):
    bpy.ops.mesh.primitive_cube_add(size=1, location=loc, rotation=rot)
    o = bpy.context.active_object
    o.name = name
    o.scale = (size[0], size[1], size[2])
    bpy.ops.object.transform_apply(location=False, rotation=False, scale=True)
    o.data.materials.append(mat)
    made.append(o)
    return o


def cone(name, r1, r2, depth, loc, rot=(0, 0, 0), mat=HULL, verts=24):
    bpy.ops.mesh.primitive_cone_add(vertices=verts, radius1=r1, radius2=r2, depth=depth,
                                    location=loc, rotation=rot)
    o = bpy.context.active_object
    o.name = name
    o.data.materials.append(mat)
    made.append(o)
    return o


def ball(name, r, loc, mat=LENS, scale=(1, 1, 1)):
    bpy.ops.mesh.primitive_uv_sphere_add(segments=20, ring_count=12, radius=r, location=loc)
    o = bpy.context.active_object
    o.name = name
    o.scale = scale
    bpy.ops.object.transform_apply(location=False, rotation=False, scale=True)
    o.data.materials.append(mat)
    made.append(o)
    return o


def join(parts, name):
    bpy.ops.object.select_all(action="DESELECT")
    for p in parts:
        p.select_set(True)
    bpy.context.view_layer.objects.active = parts[0]
    bpy.ops.object.join()
    ob = bpy.context.active_object
    ob.name = name
    ob.data.name = name
    return ob


def bevel(ob, width=0.02, segments=2, angle=1.0):
    """Apply a small hard-surface bevel so edges catch light like the rest of the ship."""
    bpy.ops.object.select_all(action="DESELECT")
    ob.select_set(True)
    bpy.context.view_layer.objects.active = ob
    mod = ob.modifiers.new("Bevel", "BEVEL")
    mod.width = width
    mod.segments = segments
    mod.limit_method = "ANGLE"
    mod.angle_limit = angle
    bpy.ops.object.modifier_apply(modifier=mod.name)
    return ob


def triplanar(ob, patch=PATCH, span=SPAN):
    u0, v0, size = patch
    me = ob.data
    if not me.uv_layers:
        me.uv_layers.new(name="UVMap")
    uv = me.uv_layers.active
    for poly in me.polygons:
        n = poly.normal
        ax = 2 if (abs(n.z) >= abs(n.x) and abs(n.z) >= abs(n.y)) else (0 if abs(n.x) >= abs(n.y) else 1)
        for li in poly.loop_indices:
            co = me.vertices[me.loops[li].vertex_index].co
            if ax == 2:
                p, q = co.x, co.y
            elif ax == 0:
                p, q = co.z, co.y
            else:
                p, q = co.x, co.z
            uv.data[li].uv = (u0 + ((p / span) % 1.0) * size, v0 + ((q / span) % 1.0) * size)


def skin(ob):
    vg = ob.vertex_groups.new(name="B_Body")
    vg.add(list(range(len(ob.data.vertices))), 1.0, "REPLACE")
    mod = ob.modifiers.new("Armature", "ARMATURE")
    mod.object = arm
    ob.parent = arm


def skin_matrix():
    """World matrix the B_Body armature modifier applies to a rest-space vertex.

    The ship's mesh data sits in the FBX import's rotated rest space, so anything skinned to B_Body is
    remapped by (armature_world @ pose @ rest.inverted()).  Parts are modelled in world coords, so their
    vertices have to be pushed through the inverse to survive the modifier.
    """
    bpy.context.view_layer.update()
    pb = arm.pose.bones["B_Body"]
    bone = arm.data.bones["B_Body"]
    return arm.matrix_world @ pb.matrix @ bone.matrix_local.inverted()


M = skin_matrix()
print("B_Body skin matrix maps (1,0,0)->%s  (0,1,0)->%s  (0,0,1)->%s  origin->%s"
      % (tuple(round(v, 3) for v in (M @ Vector((1, 0, 0)))),
         tuple(round(v, 3) for v in (M @ Vector((0, 1, 0)))),
         tuple(round(v, 3) for v in (M @ Vector((0, 0, 1)))),
         tuple(round(v, 3) for v in (M @ Vector((0, 0, 0))))))


# ---------------------------------------------------------------- scanner --
d = math.radians(55)
axis = Vector((-math.sin(d), 0.0, math.cos(d)))
sx, sy, sz = -3.60, 0.0, SPINE_Z
dish_c = Vector((sx, sy, sz + 0.58))
sc = [cyl("sc_base", 0.17, 0.10, (sx, sy, sz + 0.04)),
      cyl("sc_mast", 0.055, 0.55, (sx, sy, sz + 0.33)),
      box("sc_yoke_l", (0.12, 0.04, 0.34), (sx, sy + 0.15, sz + 0.58)),
      box("sc_yoke_r", (0.12, 0.04, 0.34), (sx, sy - 0.15, sz + 0.58)),
      cone("sc_dish", 0.30, 0.05, 0.13, tuple(dish_c), rot=(0, -d, 0), mat=COPPER),
      cyl("sc_feed", 0.028, 0.20, tuple(dish_c + axis * 0.16), rot=(0, -d, 0), mat=COPPER, verts=12),
      ball("sc_tip", 0.05, tuple(dish_c + axis * 0.27), mat=COPPER, scale=(1, 1, 0.8))]
scanner = join(sc, "TK_Scanner")

# ------------------------------------------------------------ crew module --
mx, mz = 0.30, SPINE_Z
mod = [bevel(box("md_body", (1.15, 0.90, 0.34), (mx, 0, mz + 0.14)), width=0.03),
       cyl("md_roof", 0.45, 1.15, (mx, 0, mz + 0.31), rot=(0, math.pi / 2, 0)),
       cyl("md_seam", 0.458, 0.07, (mx, 0, mz + 0.31), rot=(0, math.pi / 2, 0), mat=COPPER),
       cyl("md_roofhatch", 0.15, 0.06, (mx + 0.28, 0, mz + 0.74), mat=COPPER, verts=20),
       cyl("md_roofrib", 0.468, 0.08, (mx - 0.34, 0, mz + 0.31), rot=(0, math.pi / 2, 0)),
       cyl("md_roofrib", 0.468, 0.08, (mx - 0.05, 0, mz + 0.31), rot=(0, math.pi / 2, 0))]
for side in (1, -1):
    mod.append(box("md_recess", (0.58, 0.02, 0.28), (mx - 0.08, side * 0.448, mz + 0.13), mat=LENS))
    mod.append(bevel(box("md_hatch", (0.52, 0.04, 0.24), (mx - 0.08, side * 0.465, mz + 0.13)), width=0.015))
    mod.append(box("md_handle", (0.30, 0.03, 0.035), (mx - 0.08, side * 0.49, mz + 0.13), mat=COPPER))
    mod.append(box("md_step", (0.50, 0.10, 0.035), (mx - 0.08, side * 0.50, mz + 0.06)))
    for hx in (-0.30, 0.14):
        mod.append(box("md_hinge", (0.07, 0.03, 0.06), (mx + hx, side * 0.478, mz + 0.21), mat=COPPER))
    for px in (0.22, 0.42):
        mod.append(cyl("md_port", 0.050, 0.025, (mx + px, side * 0.4555, mz + 0.17),
                       rot=(math.pi / 2, 0, 0), mat=LENS, verts=16))
        mod.append(cyl("md_portrim", 0.075, 0.03, (mx + px, side * 0.458, mz + 0.17),
                       rot=(math.pi / 2, 0, 0), mat=COPPER, verts=16))
module = join(mod, "TK_Module")

# ----------------------------------------------------------------- turret --
tx, tz = 2.30, AFT_Z
tur = [cyl("tu_ring", 0.40, 0.12, (tx, 0, tz + 0.04)),
       cyl("tu_house", 0.28, 0.30, (tx, 0, tz + 0.22)),
       cyl("tu_band", 0.292, 0.05, (tx, 0, tz + 0.335), mat=COPPER),
       bevel(box("tu_mantlet", (0.20, 0.32, 0.22), (tx - 0.30, 0, tz + 0.26)), width=0.02),
       box("tu_sight", (0.10, 0.08, 0.06), (tx - 0.10, 0, tz + 0.40), mat=LENS),
       cyl("tu_collar", 0.14, 0.16, (tx - 0.40, 0, tz + 0.26), rot=(0, math.pi / 2, 0))]
for s in (1, -1):
    tur.append(cyl("tu_barrel", 0.048, 0.72, (tx - 0.72, s * 0.09, tz + 0.26),
                   rot=(0, math.pi / 2, 0), verts=14))
    tur.append(cyl("tu_muzzle", 0.068, 0.09, (tx - 1.04, s * 0.09, tz + 0.26),
                   rot=(0, math.pi / 2, 0), mat=COPPER, verts=14))
turret = join(tur, "TK_Turret")

# ------------------------------------------------------------ sensor dome --
dx, dy2 = 3.15, 0.55
dome = [cyl("sd_base", 0.24, 0.10, (dx, dy2, AFT_Z + 0.04)),
        ball("sd_bubble", 0.22, (dx, dy2, AFT_Z + 0.10), scale=(1, 1, 0.8)),
        cyl("sd_aerial", 0.016, 0.44, (dx, dy2, AFT_Z + 0.42), verts=8),
        ball("sd_cap", 0.035, (dx, dy2, AFT_Z + 0.65), mat=COPPER, scale=(1, 1, 1.2))]
sensordome = join(dome, "TK_SensorDome")

Mi = M.inverted()
for ob in (scanner, module, turret, sensordome):
    bpy.ops.object.select_all(action="DESELECT")
    ob.select_set(True)
    bpy.context.view_layer.objects.active = ob
    bpy.ops.object.transform_apply(location=True, rotation=True, scale=True)   # verts -> world coords
    triplanar(ob)
    ob.data.transform(Mi)                                                       # verts -> B_Body rest space
    skin(ob)
    pts = [ob.matrix_world @ Vector(c) for c in ob.bound_box]
    lo = (min(p.x for p in pts), min(p.y for p in pts), min(p.z for p in pts))
    hi = (max(p.x for p in pts), max(p.y for p in pts), max(p.z for p in pts))
    print("PART %-14s verts %4d faces %4d  mats %s  x %.2f..%.2f y %.2f..%.2f z %.2f..%.2f"
          % (ob.name, len(ob.data.vertices), len(ob.data.polygons),
             [m.name for m in ob.data.materials], lo[0], hi[0], lo[1], hi[1], lo[2], hi[2]))

# smooth the curved parts only where it does not destroy the hard-surface read
for ob in (scanner, module, turret, sensordome):
    bpy.ops.object.select_all(action="DESELECT")
    ob.select_set(True)
    bpy.context.view_layer.objects.active = ob
    try:
        bpy.ops.object.shade_auto_smooth(angle=math.radians(40))
    except Exception as exc:                      # noqa: BLE001 - fallback per Blender version
        print("smooth fallback:", exc)
        bpy.ops.object.shade_smooth()

for i in [i for i in bpy.data.images if i.users == 0 and not i.name.startswith(("Render", "Viewer"))]:
    bpy.data.images.remove(i)

# verify the parts land where they were modelled, once the armature modifier has had its way with them
dg = bpy.context.evaluated_depsgraph_get()
EXPECT = {"TK_Scanner": (-3.9, -3.3, -0.35, 0.35, 2.3, 3.2),
          "TK_Module": (-0.3, 0.9, -0.55, 0.55, 2.2, 3.2),
          "TK_Turret": (1.2, 2.75, -0.45, 0.45, 2.45, 3.0),
          "TK_SensorDome": (2.85, 3.45, 0.25, 0.85, 2.4, 3.3)}
ok = True
for name, (x0, x1, y0, y1, z0, z1) in EXPECT.items():
    ev = bpy.data.objects[name].evaluated_get(dg)
    pts = [ev.matrix_world @ Vector(c) for c in ev.bound_box]
    lo = tuple(min(p[i] for p in pts) for i in range(3))
    hi = tuple(max(p[i] for p in pts) for i in range(3))
    inside = (x0 <= lo[0] and hi[0] <= x1 and y0 <= lo[1] and hi[1] <= y1 and z0 <= lo[2] and hi[2] <= z1)
    ok = ok and inside
    print("CHECK %-14s world x %.2f..%.2f y %.2f..%.2f z %.2f..%.2f  %s"
          % (name, lo[0], hi[0], lo[1], hi[1], lo[2], hi[2], "OK" if inside else "OUT OF PLACE"))
if not ok:
    raise SystemExit("parts are not where they were modelled - armature rest-space transform wrong")

bpy.ops.wm.save_as_mainfile(filepath=dst, compress=True)
print("SAVED", dst, "objects:", sorted(o.name for o in bpy.data.objects))
