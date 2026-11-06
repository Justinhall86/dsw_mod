"""Probe the drone material node tree, UV layer and albedo image (Blender Python, no PIL)."""
import bpy

bpy.ops.wm.open_mainfile(filepath=r"C:\Users\justi\Python\dsw_mod\model_projects\thorvald_vehicles\03_blender\Thorvald_Drone_v2_nogimbal.blend")
drone = bpy.data.objects["CombatDrone_Smuggler"]
print("PROBE drone materials:", [m.name for m in drone.data.materials])
print("PROBE uv layers:", [u.name for u in drone.data.uv_layers], "active:", drone.data.uv_layers.active.name if drone.data.uv_layers.active else None)
print("PROBE color attrs:", [c.name for c in drone.data.color_attributes])
mat = drone.data.materials[0]
print("PROBE mat", mat.name, "use_nodes", mat.use_nodes)
nt = mat.node_tree
for n in nt.nodes:
    ins = []
    for i in n.inputs:
        try:
            dv = i.default_value
            if hasattr(dv, "__len__"):
                dv = tuple(round(float(x), 3) for x in dv)
            else:
                dv = round(float(dv), 3)
        except Exception:
            dv = "-"
        ins.append("%s=%s" % (i.name, dv))
    print("PROBE node %-22s type=%s" % (n.name, n.type))
    print("        inputs:", "; ".join(ins)[:400])
for l in nt.links:
    print("PROBE link %s.%s -> %s.%s" % (l.from_node.name, l.from_socket.name, l.to_node.name, l.to_socket.name))
# image info
for n in nt.nodes:
    if n.type == "TEX_IMAGE" and n.image:
        im = n.image
        print("PROBE image", im.name, im.size[:], "filepath", im.filepath)
# sample a few UV centres of body faces from the albedo image
img = None
for n in nt.nodes:
    if n.type == "TEX_IMAGE" and n.image and "Albedo" in (n.image.name or ""):
        img = n.image
        break
print("PROBE albedo img:", img.name if img else None)
if img:
    W, H = img.size[:]
    px = img.pixels
    uv = drone.data.uv_layers.active.data
    def sample(u, v):
        x = min(W - 1, max(0, int(u * W)))
        y = min(H - 1, max(0, int(v * H)))
        i = (y * W + x) * 4
        return px[i], px[i + 1], px[i + 2]
    def hsv(r, g, b):
        mx, mn = max(r, g, b), min(r, g, b)
        d = mx - mn
        if d < 1e-6:
            h = 0.0
        elif mx == r:
            h = (60 * ((g - b) / d)) % 360
        elif mx == g:
            h = 60 * ((b - r) / d) + 120
        else:
            h = 60 * ((r - g) / d) + 240
        s = 0.0 if mx <= 1e-6 else d / mx
        return h, s, mx
    grey = orange = other = 0
    samples = []
    for p in drone.data.polygons:
        us = [uv[li].uv.x for li in p.loop_indices]
        vs = [uv[li].uv.y for li in p.loop_indices]
        u, v = sum(us) / len(us), sum(vs) / len(vs)
        r, g, b = sample(u, v)
        h, s, val = hsv(r, g, b)
        if s < 0.30 and 0.05 < val < 0.85:
            grey += 1
            if len(samples) < 12:
                samples.append((p.index, round(u, 3), round(v, 3), round(r, 2), round(g, 2), round(b, 2), round(h), round(s, 2), round(val, 2), len(p.vertices)))
        elif 5 < h < 32 and s > 0.45:
            orange += 1
        else:
            other += 1
    print("PROBE face colour classes: grey(gunmetal) %d  orange %d  other %d  (of %d)" % (grey, orange, other, len(drone.data.polygons)))
    for s in samples:
        print("   PROBE grey face idx %d uv(%.3f,%.3f) rgb(%.2f,%.2f,%.2f) hsv(%d,%.2f,%.2f) verts %d" % s)
