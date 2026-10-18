"""
HMD animation frame-data decoder (format v3+, hxd.fmt.hmd.Library.makeAnimation).

Data layout (all float32, relative to animation.dataPosition in the data section):
  [single-frame block]  -- every SingleFrame object's enabled channels, once,
                           in object order
  [frame 0][frame 1]... -- per frame: every non-SingleFrame object's enabled
                           channels, in object order
Channel order within an object: Position(3), Rotation(3), Scale(3), UV(2),
Alpha(1), Props(1 each). Rotation is a quaternion's (qx,qy,qz) with
qw = +sqrt(1 - x^2-y^2-z^2) (quats are stored with qw >= 0).
"""

from __future__ import annotations

import struct
import sys

import hmd_reader as H


class Track:
    def __init__(self, obj: H.AnimationObject, frames: int):
        self.name = obj.name
        self.obj = obj
        self.single = obj.has("SingleFrame")
        n = 1 if self.single else frames
        self.position = [] if obj.has("HasPosition") else None
        self.rotation = [] if obj.has("HasRotation") else None  # (qx,qy,qz,qw)
        self.scale = [] if obj.has("HasScale") else None
        self.uv = [] if obj.has("HasUV") else None
        self.alpha = [] if obj.has("HasAlpha") else None
        self.props = {p: [] for p in (obj.props or [])} if obj.has("HasProps") else None
        self.frame_count = n

    def value_stride(self) -> int:
        s = 0
        if self.position is not None: s += 3
        if self.rotation is not None: s += 3
        if self.scale is not None: s += 3
        if self.uv is not None: s += 2
        if self.alpha is not None: s += 1
        if self.props is not None: s += len(self.props)
        return s


def _read_obj(track: Track, buf, pos: int) -> int:
    if track.position is not None:
        track.position.append(struct.unpack_from("<3f", buf, pos)); pos += 12
    if track.rotation is not None:
        qx, qy, qz = struct.unpack_from("<3f", buf, pos); pos += 12
        qw = 1.0 - (qx*qx + qy*qy + qz*qz)
        qw = -((-qw) ** 0.5) if qw < 0 else qw ** 0.5
        track.rotation.append((qx, qy, qz, qw))
    if track.scale is not None:
        track.scale.append(struct.unpack_from("<3f", buf, pos)); pos += 12
    if track.uv is not None:
        track.uv.append(struct.unpack_from("<2f", buf, pos)); pos += 8
    if track.alpha is not None:
        track.alpha.append(struct.unpack_from("<f", buf, pos)[0]); pos += 4
    if track.props is not None:
        for p in track.props:
            track.props[p].append(struct.unpack_from("<f", buf, pos)[0]); pos += 4
    return pos


def decode_animation(d: H.Data, a: H.Animation) -> dict:
    """Returns {object_name: Track}. Track channel lists have 1 entry for
    SingleFrame tracks, a.frames entries otherwise."""
    tracks = [Track(o, a.frames) for o in a.objects]
    singles = [t for t in tracks if t.single]
    others = [t for t in tracks if not t.single]
    buf = d.data
    pos = a.dataPosition
    for t in singles:
        pos = _read_obj(t, buf, pos)
    for _f in range(a.frames):
        for t in others:
            pos = _read_obj(t, buf, pos)
    expected = a.dataPosition \
        + 4 * (sum(t.value_stride() for t in singles)
               + a.frames * sum(t.value_stride() for t in others))
    if pos != expected:
        raise ValueError(f"animation decode desync: ended at {pos}, expected {expected}")
    return {t.name: t for t in tracks}


def load_animation(path: str):
    d = H.load(path)
    if not d.animations:
        raise ValueError(f"{path} contains no animation")
    a = d.animations[0]
    return d, a, decode_animation(d, a)


if __name__ == "__main__":
    for p in sys.argv[1:]:
        d, a, tracks = load_animation(p)
        print(f"=== {p}: {a.name!r} frames={a.frames} sampling={a.sampling:g} "
              f"loop={a.loop} events={[(e.frame, e.data) for e in (a.events or [])]}")
        for t in tracks.values():
            ch = [c for c, v in [("pos", t.position), ("rot", t.rotation),
                                 ("scale", t.scale), ("uv", t.uv), ("alpha", t.alpha)]
                  if v is not None]
            if t.props: ch.append(f"props{list(t.props)}")
            print(f"  {t.name!r}: {'+'.join(ch)}{' [single]' if t.single else ''}")
