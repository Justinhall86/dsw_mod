"""Extract a fractional box chunk from a donor (normalised to a reference
size) and render it ALONE from 4 angles, so the extraction bounds can be
tuned before committing to a full graft."""
import json, math, os, sys
import bmesh, bpy
from mathutils import Vector

cfg = json.load(open(sys.argv[sys.argv.index("--") + 1]))
REF_SIZE = cfg.get("ref_size", 10.2)  # Sentinal's own host_size

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=cfg["fbx"])
meshes = [o for o in bpy.context.scene.objects if o.type == "MESH"]
root = bpy.data.objects.new("root", None)
bpy.context.scene.collection.objects.link(root)
for o in list(bpy.context.scene.objects):
    if o not in (root,) and o.parent is None:
        o.parent = root

mat = bpy.data.materials.new("Mat")
mat.use_nodes = True
nt = mat.node_tree
for n in list(nt.nodes):
    nt.nodes.remove(n)
def tex(path, loc, non_color=False):
    nd = nt.nodes.new("ShaderNodeTexImage")
    img = bpy.data.images.load(path, check_existing=False); img.pack()
    if non_color: img.colorspace_settings.name = "Non-Color"
    nd.image = img; nd.location = loc
    return nd
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled"); bsdf.location=(-200,0)
out = nt.nodes.new("ShaderNodeOutputMaterial"); out.location=(200,0)
nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
alb = tex(cfg["albedo"], (-700,300))
nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
if cfg.get("mgao") and os.path.exists(cfg["mgao"]):
    mga = tex(cfg["mgao"], (-700,0), True)
    nt.links.new(mga.outputs["Color"], bsdf.inputs["Specular IOR Level"])
if cfg.get("normal") and os.path.exists(cfg["normal"]):
    nrm = tex(cfg["normal"], (-700,-300), True)
    nmap = nt.nodes.new("ShaderNodeNormalMap"); nmap.location=(-400,-300)
    nt.links.new(nrm.outputs["Color"], nmap.inputs["Color"])
    nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
for m in meshes:
    m.data.materials.clear(); m.data.materials.append(mat)

def bake_pose_and_clear_armature(obj):
    """These HMD-converted meshes store BASE data in bind-pose space, not the
    visually-correct shape - the Armature modifier deforms them at render
    time (confirmed: raw mesh.data.vertices range doesn't match bound_box /
    evaluated-mesh range at all for DroneS). Reading m.data directly for a
    per-face box selection picks up the WRONG (garbled) positions. Bake the
    evaluated (deformed) positions into the base mesh, then drop the
    modifier/parent so it isn't deformed a second time."""
    dg = bpy.context.evaluated_depsgraph_get()
    eval_obj = obj.evaluated_get(dg)
    eval_mesh = eval_obj.to_mesh()
    if len(eval_mesh.vertices) == len(obj.data.vertices):
        for i, v in enumerate(obj.data.vertices):
            v.co = eval_mesh.vertices[i].co
    eval_obj.to_mesh_clear()
    obj.data.update()
    for mod in list(obj.modifiers):
        if mod.type == 'ARMATURE':
            obj.modifiers.remove(mod)
    if obj.parent is not None and obj.parent.type == 'ARMATURE':
        armature = obj.parent
        new_parent = armature.parent  # re-attach where the armature was (e.g. "root")
        obj.matrix_parent_inverse = new_parent.matrix_world.inverted() if new_parent else obj.matrix_parent_inverse
        obj.parent = new_parent


def bbox_world(objs):
    mn = Vector((1e9,1e9,1e9)); mx = Vector((-1e9,-1e9,-1e9))
    for o in objs:
        for c in o.bound_box:
            wc = o.matrix_world @ Vector(c)
            for i in range(3):
                mn[i]=min(mn[i],wc[i]); mx[i]=max(mx[i],wc[i])
    return mn, mx

for m in meshes:
    bake_pose_and_clear_armature(m)

bpy.context.view_layer.update()
mn, mx = bbox_world(meshes)
center = (mn+mx)/2
size = max(mx.x-mn.x, mx.y-mn.y, mx.z-mn.z)
scale = REF_SIZE / size
root.scale = (scale,scale,scale)
root.location = (-center.x*scale, -center.y*scale, -center.z*scale)
bpy.context.view_layer.update()
mn, mx = bbox_world(meshes)
half = Vector(((mx.x-mn.x)/2, (mx.y-mn.y)/2, (mx.z-mn.z)/2))
print("NORMALISED half-extents", tuple(round(v,3) for v in half))

ex = cfg["extract"]
box_mn = Vector((ex["x"][0]*half.x, ex["y"][0]*half.y, ex["z"][0]*half.z))
box_mx = Vector((ex["x"][1]*half.x, ex["y"][1]*half.y, ex["z"][1]*half.z))
for m in meshes:
    bm = bmesh.new(); bm.from_mesh(m.data); bm.faces.ensure_lookup_table()
    doomed = []
    for f in bm.faces:
        wc = m.matrix_world @ f.calc_center_median()
        if not (box_mn.x<=wc.x<=box_mx.x and box_mn.y<=wc.y<=box_mx.y and box_mn.z<=wc.z<=box_mx.z):
            doomed.append(f)
    for f in doomed: bm.faces.remove(f)
    for v in [v for v in bm.verts if not v.link_faces]: bm.verts.remove(v)
    bm.to_mesh(m.data); bm.free(); m.data.update()

bpy.context.view_layer.update()
mn, mx = bbox_world(meshes)
if mn.x > mx.x:
    print("EMPTY EXTRACTION - nothing kept")
    sys.exit(0)
c_center = (mn+mx)/2
c_size = max(mx.x-mn.x, mx.y-mn.y, mx.z-mn.z, 1e-6)
print("CHUNK size", round(c_size,3), "center", tuple(round(v,3) for v in c_center))

cam_data = bpy.data.cameras.new("Cam")
cam = bpy.data.objects.new("Cam", cam_data)
bpy.context.scene.collection.objects.link(cam)
dist = c_size * 2.8
tgt = c_center
empty = bpy.data.objects.new("T", None)
bpy.context.scene.collection.objects.link(empty)
empty.location = tgt
con = cam.constraints.new("TRACK_TO"); con.target = empty
con.track_axis = "TRACK_NEGATIVE_Z"; con.up_axis = "UP_Y"
bpy.context.scene.camera = cam

sun = bpy.data.objects.new("Sun", bpy.data.lights.new("Sun","SUN")); sun.data.energy=3.0
bpy.context.scene.collection.objects.link(sun); sun.rotation_euler=(math.radians(55),0,math.radians(35))
fill = bpy.data.objects.new("Fill", bpy.data.lights.new("Fill","SUN")); fill.data.energy=1.0
bpy.context.scene.collection.objects.link(fill); fill.rotation_euler=(math.radians(70),0,math.radians(-120))
world = bpy.data.worlds.new("World"); world.use_nodes=True
world.node_tree.nodes["Background"].inputs[0].default_value=(0.08,0.09,0.11,1)
bpy.context.scene.world = world

scene = bpy.context.scene
scene.render.engine = "BLENDER_EEVEE_NEXT" if "BLENDER_EEVEE_NEXT" in bpy.types.RenderSettings.bl_rna.properties["engine"].enum_items.keys() else "BLENDER_EEVEE"
scene.render.resolution_x = 480; scene.render.resolution_y = 480
scene.render.image_settings.file_format="PNG"
outdir = cfg["outdir"]
os.makedirs(outdir, exist_ok=True)
for i, ang in enumerate([0,90,180,270]):
    a = math.radians(ang)
    cam.location = (tgt.x+dist*math.cos(a), tgt.y+dist*math.sin(a), tgt.z+c_size*0.6)
    scene.render.filepath = os.path.join(outdir, f"chunk_{ang:03d}.png")
    bpy.ops.render.render(write_still=True)
print("DONE")
