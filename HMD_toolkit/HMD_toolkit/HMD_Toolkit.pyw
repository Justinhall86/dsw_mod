"""
HMD Toolkit -- GUI front-end for the HMD<->FBX modding pipeline.

Wraps the validated command-line tools (Models/ and Animations/ folders must
sit next to this file). Each tab is one pipeline step; output appears in the
log pane, with warnings highlighted. Settings (last used paths, rig) persist
in gui_settings.json.

Run by double-clicking (pythonw), or via HMD_Toolkit.bat.
"""

import json
import os
import queue
import subprocess
import sys
import threading
import tkinter as tk
from tkinter import filedialog, messagebox, ttk

ROOT = os.path.dirname(os.path.abspath(__file__))
MODELS = os.path.join(ROOT, "Models")
ANIMS = os.path.join(ROOT, "Animations")
REPACK = os.path.join(ROOT, "Repackager")
RIGS = os.path.join(ROOT, "Rigs")
SETTINGS_FILE = os.path.join(ROOT, "gui_settings.json")

HMD_FT = [("HMD files (incl. game exports named .fbx)", "*.hmd *.fbx"),
          ("All files", "*.*")]
FBX_FT = [("FBX files", "*.fbx"), ("All files", "*.*")]


def sniff(path):
    """'hmd' / 'fbx' / None by content -- game exports are often HMD data
    with a .fbx extension."""
    try:
        with open(path, "rb") as f:
            head = f.read(20)
    except OSError:
        return None
    if head[:3] == b"HMD":
        return "hmd"
    if head.startswith(b"Kaydara FBX Binary"):
        return "fbx"
    return None

# dark palette
C_BG = "#2b2b2b"
C_FIELD = "#3c3c3c"
C_BTN = "#454545"
C_TAB = "#383838"
C_TAB_SEL = "#555555"
C_FG = "#e6e6e6"
C_TEXT_BG = "#1e1e1e"

ICON_PATH = os.path.join(ROOT, "icon.ico")   # optional; drop icon.ico next to this file


def _set_dark_titlebar(win):
    """Turn on the DWM dark-mode title bar. This only SETS the flag; it does not
    repaint. Call it while the window is still hidden (withdrawn) so the frame is
    already dark the first time the window is shown: no white outline, no flash, and
    no open/close/open. No-op off Windows / on unsupported builds."""
    if os.name != "nt":
        return
    try:
        from ctypes import windll, byref, sizeof, c_int
        win.update_idletasks()                       # realize the frame so GetParent works
        hwnd = windll.user32.GetParent(win.winfo_id())
        for attr in (20, 19):   # DWMWA_USE_IMMERSIVE_DARK_MODE: 20 (Win10 20H1+/11), 19 (older)
            try:
                windll.dwmapi.DwmSetWindowAttribute(hwnd, attr, byref(c_int(1)), sizeof(c_int))
            except Exception:
                pass
    except Exception:
        pass


def _apply_icon(win):
    """Give a window our icon, if icon.ico is present next to this file."""
    try:
        if os.path.isfile(ICON_PATH):
            win.iconbitmap(ICON_PATH)
    except Exception:
        pass


def apply_dark_theme(root):
    st = ttk.Style(root)
    st.theme_use("clam")
    root.configure(bg=C_BG)
    st.configure(".", background=C_BG, foreground=C_FG,
                 fieldbackground=C_FIELD, bordercolor="#555555",
                 lightcolor=C_BG, darkcolor=C_BG, troughcolor=C_FIELD)
    st.configure("TFrame", background=C_BG)
    st.configure("TLabel", background=C_BG, foreground=C_FG)
    st.configure("TButton", background=C_BTN, foreground=C_FG, padding=4)
    st.map("TButton", background=[("active", "#5a5a5a"), ("pressed", "#666666")])
    # primary action buttons (Convert / Fix / Export / Inject / Clone)
    st.configure("Accent.TButton", background="#2f6fb0", foreground="#ffffff",
                 padding=(14, 9), font=("Segoe UI", 10, "bold"))
    st.map("Accent.TButton", background=[("active", "#3c86d1"),
                                         ("pressed", "#28598c")])
    st.configure("TEntry", fieldbackground=C_FIELD, foreground=C_FG,
                 insertcolor=C_FG)
    st.configure("TCheckbutton", background=C_BG, foreground=C_FG)
    st.map("TCheckbutton", background=[("active", C_BG)],
           indicatorcolor=[("selected", "#4f9d4f"), ("!selected", C_FIELD)])
    st.configure("TRadiobutton", background=C_BG, foreground=C_FG)
    st.map("TRadiobutton", background=[("active", C_BG)],
           indicatorcolor=[("selected", "#6a9fd8"), ("!selected", C_FIELD)])
    # segmented choice buttons (Radiobutton with style="Toolbutton")
    st.configure("Toolbutton", background=C_BTN, foreground=C_FG,
                 padding=(14, 4), anchor="center")
    st.map("Toolbutton",
           background=[("selected", "#2f6fb0"), ("active", "#5a5a5a")],
           foreground=[("selected", "#ffffff")])
    st.configure("TSeparator", background=C_BG)
    st.configure("TPanedwindow", background=C_BG)
    try:
        st.configure("Sash", sashthickness=7, gripcount=12)
    except Exception:
        pass
    st.configure("Vertical.TScrollbar", background=C_BTN,
                 troughcolor=C_TEXT_BG, bordercolor=C_TEXT_BG,
                 lightcolor=C_BTN, darkcolor=C_BTN, arrowcolor=C_FG,
                 gripcount=0, relief="flat")
    st.map("Vertical.TScrollbar",
           background=[("active", "#5a5a5a"), ("pressed", "#666666")],
           lightcolor=[("active", "#5a5a5a"), ("pressed", "#666666")],
           darkcolor=[("active", "#5a5a5a"), ("pressed", "#666666")])
    st.configure("TNotebook", background=C_BG, borderwidth=0)
    st.configure("TNotebook.Tab", background=C_TAB, foreground=C_FG,
                 padding=(12, 5))
    # lock size across states so selecting a tab only changes its highlight color
    # (clam otherwise re-pads / expands the selected tab, making it appear to shrink)
    st.map("TNotebook.Tab", background=[("selected", C_TAB_SEL)],
           foreground=[("selected", "#ffffff")],
           padding=[("selected", (12, 5))],
           expand=[("selected", [0, 0, 0, 0])])


NOWIN = subprocess.CREATE_NO_WINDOW if hasattr(subprocess, "CREATE_NO_WINDOW") else 0


PROBE = ("import numpy, sys\n"
         "try:\n"
         "    import PIL\n"
         "    pil = 1\n"
         "except Exception:\n"
         "    pil = 0\n"
         "print(sys.executable)\n"
         "print(pil)\n")


def find_python(settings):
    """Locate a Python interpreter that has numpy -- preferring one that ALSO
    has Pillow (DDS->PNG conversion). The GUI may run under a different
    installation (pythonw associated with .pyw) than the one the user
    normally uses. Order: settings override, our own interpreter, then
    python/py from PATH. Returns (python_exe, has_pillow) or (None, False)."""
    import shutil
    cands = []
    if settings.get("python_path"):
        cands.append(settings["python_path"])
    cands.append(sys.executable)
    for name in ("python", "python3", "py"):
        w = shutil.which(name)
        if w:
            cands.append(w)
    numpy_only = None
    for c in cands:
        try:
            p = subprocess.run([c, "-c", PROBE], capture_output=True,
                               text=True, timeout=30, creationflags=NOWIN)
            lines = p.stdout.strip().splitlines()
            if p.returncode == 0 and len(lines) >= 2:
                exe, pil = lines[-2], lines[-1] == "1"
                if pil:
                    return exe, True     # numpy + Pillow: best
                if numpy_only is None:
                    numpy_only = exe
        except Exception:
            pass
    return numpy_only, False


def load_settings():
    try:
        with open(SETTINGS_FILE) as f:
            return json.load(f)
    except Exception:
        return {}


def save_settings(s):
    try:
        with open(SETTINGS_FILE, "w") as f:
            json.dump(s, f, indent=2)
    except Exception:
        pass


class Info(ttk.Label):
    """A small (i) marker that shows an explanation tooltip on hover."""

    def __init__(self, master, text):
        super().__init__(master, text="ⓘ", foreground="#6a9fd8",
                         cursor="question_arrow", width=2, anchor="center")
        self.tiptext = text
        self.tip = None
        self.bind("<Enter>", self._show)
        self.bind("<Leave>", self._hide)

    def _show(self, _e):
        self._hide(None)
        self.tip = tw = tk.Toplevel(self)
        tw.wm_overrideredirect(True)
        tw.wm_geometry(f"+{self.winfo_rootx() + 18}+{self.winfo_rooty() + 14}")
        tk.Label(tw, text=self.tiptext, bg="#1e1e1e", fg="#e6e6e6",
                 justify="left", wraplength=460, borderwidth=1,
                 relief="solid", padx=9, pady=7).pack()

    def _hide(self, _e):
        if self.tip is not None:
            self.tip.destroy()
            self.tip = None


class PathField(ttk.Frame):
    """Entry + Browse button. kind: 'open'/'multi'/'dir'."""

    def __init__(self, master, label, filetypes=None, kind="open",
                 settings=None, key=None, info=None, on_set=None,
                 persist=False):
        super().__init__(master)
        self.filetypes = filetypes or []
        self.kind = kind
        self.settings = settings if settings is not None else {}
        self.key = key or label
        self.on_set = on_set
        self.persist = persist
        ttk.Label(self, text=label, width=22, anchor="w").pack(side="left")
        if info:
            Info(self, info).pack(side="left", padx=(0, 4))
        self.var = tk.StringVar()
        self.entry = ttk.Entry(self, textvariable=self.var)
        self.entry.pack(side="left", fill="x", expand=True, padx=4)
        self.btn = ttk.Button(self, text="Browse...", width=10,
                              command=self.browse)
        self.btn.pack(side="left")
        if persist and self.settings.get("val_" + self.key):
            self.var.set(self.settings["val_" + self.key])

    def save_value(self):
        if self.persist:
            self.settings["val_" + self.key] = self.get()
            save_settings(self.settings)

    def _notify(self):
        if self.on_set:
            try:
                self.on_set()
            except Exception:
                pass

    def initialdir(self):
        return self.settings.get("dir_" + self.key, ROOT)

    def browse(self):
        if self.kind == "dir":
            p = filedialog.askdirectory(initialdir=self.initialdir())
        elif self.kind == "multi":
            ps = filedialog.askopenfilenames(initialdir=self.initialdir(),
                                             filetypes=self.filetypes)
            p = "; ".join(ps) if ps else ""
        else:
            p = filedialog.askopenfilename(initialdir=self.initialdir(),
                                           filetypes=self.filetypes)
        if p:
            self.var.set(p.replace("\\", "/"))
            first = p.split("; ")[0]
            d = first if os.path.isdir(first) else os.path.dirname(first)
            self.settings["dir_" + self.key] = d
            save_settings(self.settings)
            self._notify()

    def get(self):
        return self.var.get().strip()

    def get_list(self):
        return [p for p in (s.strip() for s in self.get().split(";")) if p]

    def accept_drop(self, paths):
        if not paths:
            return
        paths = [p.replace("\\", "/") for p in paths]
        if self.kind != "multi":
            paths = paths[:1]
        self.var.set("; ".join(paths))
        d = paths[0] if os.path.isdir(paths[0]) else os.path.dirname(paths[0])
        self.settings["dir_" + self.key] = d
        save_settings(self.settings)
        self._notify()


def enable_windows_dnd(root, on_drop, log=None):
    """Accept Explorer file drops (no dependencies) and report
    (widget_under_cursor, [paths]) via on_drop. Windows only.
    Tk toplevels have TWO HWNDs (decorated wrapper + inner content window);
    the shell delivers WM_DROPFILES to whichever it hit-tests, so both are
    hooked."""
    if os.name != "nt":
        return

    def say(msg):
        if log:
            log(msg)

    try:
        import ctypes
        from ctypes import wintypes
        user32 = ctypes.windll.user32
        shell32 = ctypes.windll.shell32
        WM_DROPFILES = 0x0233
        GWL_WNDPROC = -4
        LRESULT = ctypes.c_ssize_t
        WNDPROC = ctypes.WINFUNCTYPE(LRESULT, wintypes.HWND, ctypes.c_uint,
                                     wintypes.WPARAM, wintypes.LPARAM)
        SetWindowLongPtr = getattr(user32, "SetWindowLongPtrW",
                                   user32.SetWindowLongW)
        SetWindowLongPtr.restype = ctypes.c_ssize_t
        SetWindowLongPtr.argtypes = [wintypes.HWND, ctypes.c_int, WNDPROC]
        user32.CallWindowProcW.restype = LRESULT
        user32.CallWindowProcW.argtypes = [ctypes.c_ssize_t, wintypes.HWND,
                                           ctypes.c_uint, wintypes.WPARAM,
                                           wintypes.LPARAM]
        user32.GetParent.restype = ctypes.c_void_p
        user32.GetParent.argtypes = [ctypes.c_void_p]
        shell32.DragAcceptFiles.argtypes = [ctypes.c_void_p, wintypes.BOOL]
        shell32.DragQueryFileW.argtypes = [wintypes.WPARAM, ctypes.c_uint,
                                           ctypes.c_wchar_p, ctypes.c_uint]
        shell32.DragFinish.argtypes = [wintypes.WPARAM]

        inner = root.winfo_id()
        outer = user32.GetParent(inner)
        hwnds = [h for h in {inner, outer} if h]

        root._dnd_refs = []

        def hook(hwnd):
            shell32.DragAcceptFiles(hwnd, True)
            state = {}

            def wnd_proc(h, msg, wp, lp):
                if msg == WM_DROPFILES:
                    try:
                        n = shell32.DragQueryFileW(wp, 0xFFFFFFFF, None, 0)
                        paths = []
                        for i in range(n):
                            buf = ctypes.create_unicode_buffer(2048)
                            shell32.DragQueryFileW(wp, i, buf, 2048)
                            paths.append(buf.value)
                        shell32.DragFinish(wp)
                        x, y = root.winfo_pointerxy()
                        w = root.winfo_containing(x, y)
                        root.after(1, lambda: on_drop(w, paths))
                    except Exception as e:
                        say(f"(drop handling failed: {e})")
                    return 0
                return user32.CallWindowProcW(state["old"], h, msg, wp, lp)

            proc = WNDPROC(wnd_proc)
            old = SetWindowLongPtr(hwnd, GWL_WNDPROC, proc)
            if not old:
                say(f"(DnD hook failed on hwnd {hwnd:#x}, error "
                    f"{ctypes.get_last_error() or user32.GetLastError()})")
                return
            state["old"] = old
            root._dnd_refs.append(proc)  # keep alive (GC!)

        for h in hwnds:
            hook(h)
        if not root._dnd_refs:
            say("(drag & drop unavailable: no window hook succeeded)")
    except Exception as e:
        say(f"(drag & drop disabled: {e})")


class App:
    def __init__(self, root):
        self.root = root
        root.title("HMD Toolkit")
        root.geometry("880x640")
        self.settings = load_settings()
        # restore last window size/position (clamped to the visible screen)
        geo = self.settings.get("geometry")
        if geo:
            try:
                size, x, y = geo.split("+", 1)[0], *geo.split("+")[1:3]
                x = max(0, min(int(x), root.winfo_screenwidth() - 200))
                y = max(0, min(int(y), root.winfo_screenheight() - 200))
                root.geometry(f"{size}+{x}+{y}")
            except Exception:
                pass
        root.protocol("WM_DELETE_WINDOW", self._on_close)
        self.q = queue.Queue()
        self.running = False

        for d, what in [(MODELS, "Models"), (ANIMS, "Animations")]:
            if not os.path.isdir(d):
                messagebox.showerror(
                    "HMD Toolkit",
                    f"'{what}' folder not found next to this script.\n"
                    f"Expected: {d}\nKeep HMD_Toolkit.pyw in the folder that "
                    "contains Models/ and Animations/.")
                root.destroy()
                return

        self.python, self.has_pillow = find_python(self.settings)
        if self.python is None:
            self.python = sys.executable
            messagebox.showwarning(
                "HMD Toolkit",
                "No Python installation with numpy was found.\n\n"
                "Install it into the Python this GUI uses:\n"
                f"  \"{sys.executable}\" -m pip install numpy\n\n"
                "Or set \"python_path\" in gui_settings.json to a Python "
                "that has numpy. Conversions will fail until then.")

        # status bar first, pinned to the window bottom so resizing the log
        # can never hide it
        bar = ttk.Frame(root)
        bar.pack(side="bottom", fill="x", padx=8, pady=(0, 6))
        self.status = ttk.Label(bar, text="Ready.")
        self.status.pack(side="left")
        ttk.Button(bar, text="Clear log",
                   command=lambda: self.log_widget.delete("1.0", "end")
                   ).pack(side="right")

        # vertical paned layout: tabs on top, log below -- the sash between
        # them lets the log be resized by dragging its top edge
        self.pw = ttk.PanedWindow(root, orient="vertical")
        self.pw.pack(fill="both", expand=True)
        top = ttk.Frame(self.pw)
        self.pw.add(top, weight=0)

        nb = ttk.Notebook(top)
        nb.pack(fill="both", expand=True, padx=8, pady=6)
        self.make_tab_model_export(nb)
        self.make_tab_model_fix(nb)
        self.make_tab_anim_export(nb)
        self.make_tab_anim_fix(nb)
        self.make_tab_recolour(nb)
        self.make_tab_settings(nb)

        # drag & drop: any Explorer drop lands in the field under the cursor
        self.dnd_fields = [self.me_in, self.mf_fbx, self.mf_ref, self.ae_anim,
                           self.ae_model, self.af_fbx, self.af_ref,
                           self.rc_hmd, self.af_out,
                           self.me_out, self.ae_out, self.st_mod,
                           self.st_game]
        self.dnd_map = {}
        for pf in self.dnd_fields:
            self.dnd_map[str(pf)] = pf
            for ch in pf.winfo_children():
                self.dnd_map[str(ch)] = pf
        root.after(200, lambda: enable_windows_dnd(
            root, self._on_drop, log=lambda m: self.log(m, "warn")))

        lf = ttk.Frame(self.pw, padding=(8, 2, 8, 6))
        self.pw.add(lf, weight=1)
        lf.rowconfigure(0, weight=1)
        lf.columnconfigure(0, weight=1)
        self.log_widget = tk.Text(lf, height=10, wrap="word",
                                  font=("Consolas", 9), bg=C_TEXT_BG,
                                  fg=C_FG, insertbackground=C_FG,
                                  selectbackground="#264f78", borderwidth=0)
        self.log_widget.grid(row=0, column=0, sticky="nsew")
        self.log_sb = ttk.Scrollbar(lf, orient="vertical",
                                    command=self.log_widget.yview)
        self.log_sb.grid(row=0, column=1, sticky="ns")
        self.log_sb.grid_remove()  # hidden until there is something to scroll
        self.log_widget.configure(yscrollcommand=self._log_yset)
        # thumb: normal grab-drag; trough: jump there, thumb centred on the
        # cursor, then drag continues; arrows keep default behavior
        self._sb_grab = None
        self.log_sb.bind("<Button-1>", self._log_sb_press)
        self.log_sb.bind("<B1-Motion>", self._log_sb_motion)
        self.log_sb.bind("<ButtonRelease-1>", self._log_sb_release)
        self.log_widget.tag_config("warn", foreground="#ffb45e")
        self.log_widget.tag_config("err", foreground="#ff6b6b")
        self.log_widget.tag_config("ok", foreground="#7ec97e")
        self.log_widget.tag_config("dim", foreground="#9a9a9a")
        self.log(f"Using Python: {self.python} "
                 f"(Pillow: {'yes' if self.has_pillow else 'NO'})",
                 "ok" if self.has_pillow else "warn")
        if not self.has_pillow:
            self.log("(without Pillow, DDS-in-.png textures are copied "
                     "unconverted in Recolour. To fix, run:  "
                     f'"{self.python}" -m pip install pillow  '
                     "and restart the toolkit)", "warn")
        root.after(100, self.poll_queue)

    # ---------- tabs ----------------------------------------------------

    def make_tab_model_export(self, nb):
        f = ttk.Frame(nb, padding=10)
        nb.add(f, text="Model → FBX")
        ttk.Label(f, text="Convert game model HMDs to rigged FBX for Blender. "
                          "Accepts files or a folder (searched recursively; "
                          "HMDs detected by content).", wraplength=800
                  ).pack(anchor="w", pady=(0, 8))
        self.me_in = PathField(
            f, "Model HMD(s):", HMD_FT, "multi",
            self.settings, "model_in",
            info="One or more model HMDs, or a folder (searched "
                 "recursively). Files are detected by CONTENT, so game "
                 "exports that are HMD data named .fbx are found and "
                 "converted too.")
        self.me_in.pack(fill="x", pady=2)
        row = ttk.Frame(f); row.pack(fill="x", pady=2)
        ttk.Button(row, text="(or pick a folder)",
                   command=lambda: self._pick_dir(self.me_in)).pack(side="left")
        self.me_embed = tk.BooleanVar(value=self.settings.get("me_embed", True))
        ttk.Checkbutton(
            row, variable=self.me_embed,
            text="Embed textures"
        ).pack(side="left", padx=(14, 0))
        Info(row, "Bakes the model's images into the FBX so it is "
                  "self-contained in Blender (no loose files needed).\n\n"
                  "Works when the referenced images sit beside the HMD "
                  "(e.g. a recolour kit or an extracted game folder). "
                  "Images that cannot be found are skipped with a warning "
                  "and referenced by path instead -- with no images at all "
                  "this is simply a regular export.").pack(side="left",
                                                           padx=(6, 0))
        self.me_out = PathField(
            f, "Output folder:", [], "dir",
            self.settings, "me_out", persist=True,
            info="Optional -- converted FBX files are written here instead "
                 "of next to each source file. Leave empty for the default "
                 "(outputs beside the sources).")
        self.me_out.pack(fill="x", pady=(6, 2))
        rowc = ttk.Frame(f); rowc.pack(fill="x", pady=(6, 0))
        self.me_copy = tk.BooleanVar(value=self.settings.get("copy_hmd", True))
        ttk.Checkbutton(
            rowc, variable=self.me_copy,
            text="Fix mislabeled game exports"
        ).pack(side="left")
        Info(rowc, "Game exports are often HMD data with a .fbx extension. "
                   "With this ticked, such files are RENAMED to .hmd (their "
                   "correct extension) and the converted FBX then takes the "
                   "original name -- ending with a clean pair, X.hmd + "
                   "X.fbx, in the same folder.").pack(side="left",
                                                      padx=(6, 0))
        ttk.Button(f, text="Convert", style="Accent.TButton",
                   command=self.run_model_export).pack(fill="x", pady=8)

    def make_tab_model_fix(self, nb):
        f = ttk.Frame(nb, padding=10)
        nb.add(f, text="FBX → Model")
        ttk.Label(f, text="One step from Blender export to the final game "
                          "HMD: the skeleton is restored from the chosen "
                          "rig, the model is repackaged locally (in a "
                          "temporary folder -- nothing of yours is touched), "
                          "and the finished HMD lands at the output "
                          "location.", wraplength=800).pack(anchor="w", pady=(0, 8))
        self.mf_fbx = PathField(
            f, "Input FBX:", FBX_FT, "open",
            self.settings, "mf_fbx",
            on_set=lambda: self._update_mf_preview(),
            info="The model FBX exported from Blender after editing the "
                 "mesh.\n\nExport settings: Forward = Y, Up = Z, Add Leaf "
                 "Bones OFF, Animation OFF, Path Mode = Copy with its "
                 "Embed Textures button enabled.\n\nEmbedding carries the "
                 "colour maps inside the FBX; they are extracted, renamed "
                 "and wired beside the finished HMD automatically. Use PNG "
                 "images in the Blender materials -- whatever format is "
                 "embedded is what gets shipped.")
        self.mf_fbx.pack(fill="x", pady=2)
        row = ttk.Frame(f); row.pack(fill="x", pady=4)
        ttk.Label(row, text="Rig:", width=22, anchor="w").pack(side="left")
        Info(row, "The armature the model was built on. Male/Female use the "
                  "bundled Male01/Female01 rig references; the skeleton's "
                  "bone frames and bind matrices are restored from them "
                  "(Blender silently alters these on export; without the "
                  "restore, the game's animations deform wrongly).\n\n"
                  "Custom: for non-human models (drones, ships, ...) pick "
                  "any HMD sharing the model's armature -- usually its "
                  "original.").pack(side="left", padx=(0, 4))
        self.mf_rig = tk.StringVar(value=self.settings.get("mf_rig", "Male"))
        for val in ("Male", "Female", "Custom"):
            ttk.Radiobutton(row, text=val, value=val, style="Toolbutton",
                            variable=self.mf_rig, width=9
                            ).pack(side="left", padx=(4, 0))
        self.mf_rig.trace_add("write", self._mf_rig_changed)
        self.mf_ref = PathField(
            f, "Custom rig HMD:", HMD_FT, "open",
            self.settings, "mf_ref",
            info="Only used when Rig is set to Custom: an HMD with the SAME "
                 "armature as the edited model (usually the model's "
                 "original HMD).")
        self.mf_ref.pack(fill="x", pady=2)
        self.mf_resdir_row = row2 = ttk.Frame(f)
        row2.pack(fill="x", pady=4)
        ttk.Label(row2, text="Resource dir:", width=22,
                  anchor="w").pack(side="left")
        Info(row2, "Optional -- where the model's folder is meant to live "
                   "under the game's res/. Used when the FBX has EMBEDDED "
                   "textures: the HMD's texture paths are wired as "
                   "<resource dir>/<name>/<name>_Albedo.png etc., i.e. for "
                   "files placed at res/<resource dir>/<name>/.\n\nTexture "
                   "paths resolve from the resource ROOT in game, so this "
                   "must match the final location. Leave empty to wire bare "
                   "filenames (only correct if the files end up at the res "
                   "root itself).").pack(side="left", padx=(0, 4))
        self.mf_resdir = tk.StringVar(
            value=self.settings.get("mf_resdir", "CharMOD"))
        ttk.Entry(row2, textvariable=self.mf_resdir).pack(side="left",
                                                          fill="x",
                                                          expand=True, padx=4)
        rowo = ttk.Frame(f); rowo.pack(fill="x", pady=(6, 2))
        ttk.Label(rowo, text="Output folder:", width=22,
                  anchor="w").pack(side="left")
        Info(rowo, "Where the finished HMD (and extracted textures) are "
                   "written. Auto-fills to <modding dir>/res/<resource dir>/"
                   "<name> -- the location the wired texture paths expect "
                   "(refreshes on Enter or when leaving a field).\n\nType "
                   "your own path to override -- a custom value is kept and "
                   "will not be overwritten.").pack(side="left", padx=(0, 4))
        self.mf_out_var = tk.StringVar()
        ttk.Entry(rowo, textvariable=self.mf_out_var).pack(side="left",
                                                           fill="x",
                                                           expand=True,
                                                           padx=4)
        ttk.Button(rowo, text="Browse...", width=10,
                   command=self._browse_mf_out).pack(side="left")
        rowt = ttk.Frame(f); rowt.pack(fill="x", pady=(6, 0))
        self.mf_prefab = tk.BooleanVar(
            value=self.settings.get("mf_prefab", True))
        ttk.Checkbutton(rowt, variable=self.mf_prefab,
                        text="Create prefab").pack(side="left")
        Info(rowt, "Also writes a base <name>.prefab beside the finished "
                   "HMD -- the file the game uses to reference models (and "
                   "attach others, e.g. weapons). It contains just this "
                   "model, with its resource-root-relative path, ready to "
                   "extend in the editor.").pack(side="left", padx=(6, 0))
        self._mf_auto_out = ""
        for w in (self.mf_fbx.entry,):
            w.bind("<Return>", self._update_mf_preview, add="+")
            w.bind("<FocusOut>", self._update_mf_preview, add="+")
        mf_resdir_entry = row2.winfo_children()[-1]
        mf_resdir_entry.bind("<Return>", self._update_mf_preview, add="+")
        mf_resdir_entry.bind("<FocusOut>", self._update_mf_preview, add="+")
        ttk.Button(f, text="Convert to HMD", style="Accent.TButton",
                   command=self.run_model_fix).pack(fill="x", pady=8)
        self._mf_rig_changed()  # hide the custom-rig row unless selected
        self._update_mf_preview()

    def _mf_out_folder(self):
        """Default destination for the finished model (forward slashes):
        <modding dir>/res/<resource dir>/<name>, matching the wired paths."""
        fbx = self.mf_fbx.get().strip().replace("\\", "/")
        stem = os.path.splitext(os.path.basename(fbx))[0] if fbx else "<name>"
        mod = self.st_mod.get().strip().replace("\\", "/").rstrip("/") \
            if hasattr(self, "st_mod") else ""
        resdir = self.mf_resdir.get().strip().replace("\\", "/").strip("/")
        if mod:
            return "/".join([mod, "res"] + ([resdir] if resdir else [])
                            + [stem])
        d = fbx.rsplit("/", 1)[0] if "/" in fbx else "<input dir>"
        return f"{d}/{stem}"

    def _update_mf_preview(self, *_args):
        auto = self._mf_out_folder()
        cur = self.mf_out_var.get().strip()
        if not cur or cur == self._mf_auto_out:
            self.mf_out_var.set(auto)  # keep custom text, follow otherwise
        self._mf_auto_out = auto

    def _browse_mf_out(self):
        p = filedialog.askdirectory(
            initialdir=self.settings.get("dir_mf_out", ROOT))
        if p:
            self.mf_out_var.set(p.replace("\\", "/"))  # custom value: kept
            self.settings["dir_mf_out"] = p
            save_settings(self.settings)

    def _mf_rig_changed(self, *_args):
        if self.mf_rig.get() == "Custom":
            self.mf_ref.pack(fill="x", pady=2, before=self.mf_resdir_row)
        else:
            self.mf_ref.pack_forget()

    def make_tab_anim_export(self, nb):
        f = ttk.Frame(nb, padding=10)
        nb.add(f, text="Animation → FBX")
        ttk.Label(f, text="Export HMD animations onto a rig as animated FBX. "
                          "Each animation is paired with the model whose "
                          "skeleton best covers its bone tracks. If the "
                          "animation input is a folder that already contains "
                          "model HMDs, the model field may stay empty. Folder "
                          "input writes to <folder>/converted/.", wraplength=800
                  ).pack(anchor="w", pady=(0, 8))
        self.ae_anim = PathField(
            f, "Animation HMD(s):", HMD_FT, "multi",
            self.settings, "anim_in",
            info="Animation HMD files, or a folder (searched recursively). "
                 "Animations and models are told apart by content, so "
                 "misnamed .fbx game exports work too. Folder input writes "
                 "results to <folder>/converted/ with the original names.")
        self.ae_anim.pack(fill="x", pady=2)
        row = ttk.Frame(f); row.pack(fill="x", pady=2)
        ttk.Button(row, text="(or pick a folder of animations)",
                   command=lambda: self._pick_dir(self.ae_anim)).pack(side="left")
        self.ae_model = PathField(
            f, "Model (rig) HMD(s):", HMD_FT, "multi",
            self.settings, "anim_model",
            info="One or more rig models to play the animations on. Each "
                 "animation is exported onto the model whose skeleton best "
                 "covers its bone tracks (full coverage first, then fewest "
                 "unused bones).\n\nOptional when the animation input is a "
                 "folder that already contains model HMDs.")
        self.ae_model.pack(fill="x", pady=(8, 2))
        self.ae_out = PathField(
            f, "Output folder:", [], "dir",
            self.settings, "ae_out", persist=True,
            info="Optional -- animated FBX files are written here instead "
                 "of the default (<folder>/converted/ for folder input, or "
                 "next to the model for loose files).")
        self.ae_out.pack(fill="x", pady=(6, 2))
        ttk.Button(f, text="Export", style="Accent.TButton",
                   command=self.run_anim_export).pack(fill="x", pady=8)

    def make_tab_anim_fix(self, nb):
        f = ttk.Frame(nb, padding=10)
        nb.add(f, text="FBX → Animation")
        ttk.Label(f, text="One step from Blender export to the final game "
                          "animation: curves and headers are fixed, the "
                          "animation is repackaged locally (temporary "
                          "folder -- nothing of yours is touched), events "
                          "are injected, and the finished "
                          "Anim_<rig>_<name>.hmd lands at the output "
                          "location.", wraplength=800).pack(anchor="w", pady=(0, 8))
        self.af_fbx = PathField(
            f, "Input FBX/HMD:",
            [("FBX or HMD", "*.fbx *.hmd"), ("All files", "*.*")], "open",
            self.settings, "af_fbx",
            info="FBX: an animation exported from Blender -- runs the full "
                 "pipeline (fix, repackage, events).\nExport settings: "
                 "Forward = Y, Up = Z, Add Leaf Bones OFF, Animation ON, "
                 "Key All Bones ON, Simplify 0.0.\n\nHMD: an already "
                 "finished animation HMD -- ONLY its events are edited, "
                 "in place (rig/name/trim and the output folder are "
                 "ignored). Tip: use the same file as its own reference to "
                 "load its current events, tweak, and re-inject.")
        self.af_fbx.pack(fill="x", pady=2)
        self.af_ref = PathField(
            f, "Reference animation:", HMD_FT, "open",
            self.settings, "af_ref",
            on_set=self._autofill_events,
            info="An animation HMD file.\n\nFor an EDITED animation: its "
                 "original (provides name, length check, and pre-fills the "
                 "events below).\n\nFor a NEW animation: any animation of "
                 "the same rig -- still recommended, it powers the "
                 "bone-frame safety check that catches wrong Blender "
                 "bone-axis exports.")
        self.af_ref.pack(fill="x", pady=2)
        self.af_ref.entry.bind("<Return>", self._autofill_events, add="+")
        self.af_ref.entry.bind("<FocusOut>", self._autofill_events, add="+")
        row = ttk.Frame(f); row.pack(fill="x", pady=4)
        ttk.Label(row, text="Rig:", width=22, anchor="w").pack(side="left")
        Info(row, "The rig folder name in the game's Anim/ directory, e.g. "
                  "Male01 or Female01. Determines the output file name: "
                  "Anim_<rig>_<name>.hmd.").pack(side="left", padx=(0, 4))
        self.af_rig = tk.StringVar(value=self.settings.get("rig", "Male01"))
        ttk.Entry(row, textvariable=self.af_rig, width=12).pack(side="left",
                                                                padx=4)
        ttk.Label(row, text="   New animation name:").pack(side="left")
        Info(row, "Optional -- only for BRAND-NEW animations: the "
                  "animation's name "
                  "(e.g. AttackSpin).\n\nLeave empty when fixing an edited "
                  "existing animation -- the name is taken from the "
                  "reference HMD.").pack(side="left", padx=(0, 4))
        self.af_name = tk.StringVar()
        ttk.Entry(row, textvariable=self.af_name, width=20).pack(side="left")
        ttk.Label(row, text="   Trim to frames:").pack(side="left")
        Info(row, "Optional -- cuts all curves to this frame count (or "
                  "'ref' for the reference's length). Use when Blender "
                  "baked padding up to the scene's end frame -- the log "
                  "warns and suggests the exact value. 'ref' = the "
                  "reference animation's length.\n\nLeave empty to keep "
                  "the exported length (e.g. for intentional length "
                  "changes).").pack(side="left", padx=(0, 4))
        self.af_trim = tk.StringVar()
        ttk.Entry(row, textvariable=self.af_trim, width=8).pack(side="left")
        row = ttk.Frame(f); row.pack(fill="x", pady=4)
        ttk.Label(row, text="Events (frame:name):", width=22,
                  anchor="nw").pack(side="left", anchor="n")
        Info(row, "One event per line, as frame:name -- e.g. 11:hit\n\n"
                  "Auto-fills from the reference animation; the list is "
                  "the COMPLETE final event set written into the finished "
                  "HMD -- what you see is what the animation gets."
             ).pack(side="left", anchor="n", padx=(0, 4))
        self.ev_text = tk.Text(row, height=4, bg=C_FIELD, fg=C_FG,
                               insertbackground=C_FG, relief="flat", borderwidth=0,
                               highlightthickness=1, highlightbackground="#555555",
                               highlightcolor="#6a9fd8")
        self.ev_text.pack(side="left", fill="x", expand=True, padx=4)
        self.ev_nobak = tk.BooleanVar(value=self.settings.get("ev_nobak", True))
        ttk.Checkbutton(
            f, variable=self.ev_nobak,
            text="Skip .bak backup when injecting events (untick to keep "
                 "one beside the finished file)"
        ).pack(anchor="w", pady=(6, 0))
        self.af_out = PathField(
            f, "Output folder:", [], "dir",
            self.settings, "af_out", persist=True,
            info="Optional -- where the finished Anim_<rig>_<name>.hmd is "
                 "written. Leave empty to place it next to the input file.")
        self.af_out.pack(fill="x", pady=(6, 2))
        ttk.Button(f, text="Convert to HMD", style="Accent.TButton",
                   command=self.run_anim_fix).pack(fill="x", pady=8)

    def make_tab_recolour(self, nb):
        f = ttk.Frame(nb, padding=10)
        nb.add(f, text="Recolour")
        self._rc_spacers = []

        def _sync_spacers():
            # measure a Browse button on the first (visible) tab so spacers
            # are already correct before this tab is ever opened -- no snap
            w = self.me_in.btn.winfo_width()
            if w <= 1:
                w = self.me_in.btn.winfo_reqwidth()
            if w > 1:
                for sp in self._rc_spacers:
                    sp.configure(width=w)
        f.after(250, _sync_spacers)
        ttk.Label(f, text="Clone a model into a recolour kit: copies every "
                          "companion image whose name starts with the old "
                          "texture base (Albedo, Normal, MetallicGlossAO, "
                          "Emissive, ...) to the new base, and writes a new "
                          "HMD whose texture paths point to them -- any name "
                          "length, no more character counting. Then edit the "
                          "new PNGs in an image editor.", wraplength=800
                  ).pack(anchor="w", pady=(0, 8))
        self.rc_hmd = PathField(
            f, "Model HMD:", HMD_FT, "open", self.settings, "rc_hmd",
            on_set=lambda: (self._autofill_base(), self._update_rc_preview()),
            info="The .hmd to recolour. Its texture images (PNG) must sit in "
                 "the SAME folder as this file.\n\nImages are found by the "
                 "'old texture base' prefix below -- taken from the paths "
                 "stored INSIDE the HMD, not from the model's file name. So "
                 "it does not matter if the images are named differently "
                 "from the model itself.")
        self.rc_hmd.pack(fill="x", pady=2)
        self.rc_hmd.entry.bind("<Return>", self._autofill_base)
        self.rc_hmd.entry.bind("<FocusOut>", self._autofill_base)
        row = ttk.Frame(f); row.pack(fill="x", pady=4)
        ttk.Label(row, text="Texture base:", width=22,
                  anchor="w").pack(side="left")
        Info(row, "The shared beginning of the texture file names.\n\n"
                  "OLD: as referenced inside the HMD -- detected "
                  "automatically when you pick the model (or click Inspect "
                  "to see the paths). Example: 'AtreideSoldier01' covers "
                  "AtreideSoldier01_Albedo.png, AtreideSoldier01_Normal.png, "
                  "and so on.\n\nNEW: the name for the recoloured copies, "
                  "any length (e.g. 'RedSoldier01').\n\nEvery file starting "
                  "with the old base is copied -- including maps the HMD "
                  "does not list but the game finds by naming convention, "
                  "like _Emissive.").pack(side="left", padx=(0, 4))
        self.rc_old = tk.StringVar()
        ttk.Entry(row, textvariable=self.rc_old).pack(side="left", fill="x",
                                                      expand=True, padx=4)
        ttk.Label(row, text="→").pack(side="left")
        self.rc_new = tk.StringVar()
        self.rc_new_entry = ttk.Entry(row, textvariable=self.rc_new)
        self.rc_new_entry.pack(side="left", fill="x", expand=True, padx=4)
        sp = tk.Frame(row, width=84, height=1, bg=C_BG)
        sp.pack(side="left")
        self._rc_spacers.append(sp)  # resized to the Browse button's width
        row2 = ttk.Frame(f); row2.pack(fill="x", pady=4)
        ttk.Label(row2, text="New resource dir:", width=22,
                  anchor="w").pack(side="left")
        Info(row2, "Optional -- the resource folder for the texture paths "
                   "INSIDE the "
                   "new HMD, e.g. CharMOD/Atreides/Unit -- the model's own "
                   "folder (<new base>) is appended automatically, giving "
                   "paths like CharMOD/Atreides/Unit/RedSoldier/"
                   "RedSoldier_Albedo.png.\n\nLeave empty to keep the "
                   "original resource folder.").pack(side="left", padx=(0, 4))
        # default CharMOD keeps mod files organised instead of loose in res/
        # (blank is still allowed); last-used value persists across sessions
        self.rc_dir = tk.StringVar(
            value=self.settings.get("rc_dir", "CharMOD"))
        self.rc_dir_entry = ttk.Entry(row2, textvariable=self.rc_dir)
        self.rc_dir_entry.pack(side="left", fill="x", expand=True, padx=4)
        sp = tk.Frame(row2, width=84, height=1, bg=C_BG)
        sp.pack(side="left")
        self._rc_spacers.append(sp)  # resized to the Browse button's width
        # (the Modding directory is global now -- see the Settings tab; when
        # set there, kits land in <modding dir>/res/<resource dir>/<base>/)
        rowo = ttk.Frame(f); rowo.pack(fill="x", pady=(8, 2))
        ttk.Label(rowo, text="Output folder:", width=22,
                  anchor="w").pack(side="left")
        Info(rowo, "Where the finished kit is written. Auto-fills from the "
                   "fields above (refreshes on Enter or when leaving a "
                   "field).\n\nType your own path to override -- a custom "
                   "value is kept and will not be overwritten."
             ).pack(side="left", padx=(0, 4))
        self.rc_out = tk.StringVar()
        ttk.Entry(rowo, textvariable=self.rc_out).pack(side="left", fill="x",
                                                       expand=True, padx=4)
        ttk.Button(rowo, text="Browse...", width=10,
                   command=self._browse_rc_out).pack(side="left")
        self._rc_auto_out = ""
        # refresh on Enter/defocus (not per keystroke), preserving custom text
        for w in (self.rc_new_entry, self.rc_dir_entry):
            w.bind("<Return>", self._update_rc_preview, add="+")
            w.bind("<FocusOut>", self._update_rc_preview, add="+")
        self.rc_hmd.entry.bind("<Return>", self._update_rc_preview, add="+")
        self.rc_hmd.entry.bind("<FocusOut>", self._update_rc_preview, add="+")
        self._update_rc_preview()
        rowt = ttk.Frame(f); rowt.pack(fill="x", pady=(8, 0))
        ttk.Button(rowt, text="Inspect (list current texture paths)",
                   command=self.run_recolour_inspect).pack(side="left")
        self.rc_prefab = tk.BooleanVar(
            value=self.settings.get("rc_prefab", True))
        ttk.Checkbutton(rowt, variable=self.rc_prefab,
                        text="Create prefab").pack(side="left", padx=(14, 0))
        Info(rowt, "Also writes a base <new base>.prefab into the kit -- "
                   "the file the game uses to reference models. It contains "
                   "just this model, with its resource-root-relative path, "
                   "ready to extend in the editor.").pack(side="left",
                                                          padx=(6, 0))
        ttk.Button(f, text="Clone recolour kit", style="Accent.TButton",
                   command=self.run_recolour).pack(fill="x", pady=8)

    def _rc_out_folder(self):
        """Destination folder for the recolour kit (forward slashes).
        Uses the global Modding directory from the Settings tab."""
        base = self.rc_new.get().strip() or "<new base>"
        mod = self.st_mod.get().strip().replace("\\", "/").rstrip("/") \
            if hasattr(self, "st_mod") else ""
        ndir = self.rc_dir.get().strip().replace("\\", "/").strip("/")
        if mod:
            return "/".join([mod, "res"] + ([ndir] if ndir else []) + [base])
        hmd = self.rc_hmd.get().strip().replace("\\", "/")
        d = hmd.rsplit("/", 1)[0] if "/" in hmd else "<model HMD dir>"
        return f"{d}/{base}"

    def _on_close(self):
        try:
            self.settings["geometry"] = self.root.winfo_geometry()
            for pf in (self.me_out, self.ae_out, self.af_out,
                       self.st_mod, self.st_game):
                self.settings["val_" + pf.key] = pf.get()
            self.settings["rc_dir"] = self.rc_dir.get().strip()
            self.settings["mf_rig"] = self.mf_rig.get()
            self.settings["mf_resdir"] = self.mf_resdir.get().strip()
            self.settings["mf_prefab"] = bool(self.mf_prefab.get())
            self.settings["rc_prefab"] = bool(self.rc_prefab.get())
            self.settings["ev_nobak"] = bool(self.ev_nobak.get())
            save_settings(self.settings)
        except Exception:
            pass
        self.root.destroy()

    def _browse_rc_out(self):
        p = filedialog.askdirectory(
            initialdir=self.settings.get("dir_rc_out", ROOT))
        if p:
            self.rc_out.set(p.replace("\\", "/"))  # custom value: kept
            self.settings["dir_rc_out"] = p
            save_settings(self.settings)

    def _update_rc_preview(self, *_args):
        auto = self._rc_out_folder()
        cur = self.rc_out.get().strip()
        if not cur or cur == self._rc_auto_out:
            self.rc_out.set(auto)  # keep custom text, follow otherwise
        self._rc_auto_out = auto

    def make_tab_settings(self, nb):
        f = ttk.Frame(nb, padding=10)
        nb.add(f, text="Settings")
        ttk.Label(f, text="Toolkit-wide settings.",
                  wraplength=800).pack(anchor="w", pady=(0, 8))
        self.st_mod = PathField(
            f, "Modding directory:", [], "dir",
            self.settings, "st_mod", persist=True,
            on_set=lambda: self._update_rc_preview(),
            info="Your D4XEditor folder (usually ends in .../D4XEditor).\n\n"
                 "Used across the whole tool -- for example, the Recolour "
                 "tab places finished kits in <modding dir>/res/"
                 "<resource dir>/<new base>/. The tool only ever writes the "
                 "outputs you ask for; nothing else in it is touched.")
        self.st_mod.pack(fill="x", pady=2)
        if not self.st_mod.get() and self.settings.get("val_rc_mod"):
            self.st_mod.var.set(self.settings["val_rc_mod"])  # migrate old
        self.st_mod.entry.bind("<Return>", self._update_rc_preview, add="+")
        self.st_mod.entry.bind("<FocusOut>", self._update_rc_preview, add="+")
        self.st_mod.entry.bind("<Return>", self._update_mf_preview, add="+")
        self.st_mod.entry.bind("<FocusOut>", self._update_mf_preview, add="+")
        self.st_mod.on_set = lambda: (self._update_rc_preview(),
                                      self._update_mf_preview())
        self.st_game = PathField(
            f, "Game directory:", [], "dir",
            self.settings, "st_game", persist=True,
            info="The game's install folder. Find it via Steam: right-click "
                 "Dune: Spice Wars -> Manage -> Browse local files.\n\n"
                 "Only used as the source of D4X.exe (the HashLink runtime "
                 "every modder has, since it ships with the game): it is "
                 "copied into a temporary stage for each local repackaging "
                 "run and deleted afterwards. The game folder itself is "
                 "never modified.")
        self.st_game.pack(fill="x", pady=2)
        # the modding dir was just restored from settings: refresh the
        # output previews that depend on it (built before this tab)
        self._update_rc_preview()
        self._update_mf_preview()

    # ---------- helpers ----------------------------------------------------

    def _on_drop(self, widget, paths):
        w = widget
        while w is not None:
            pf = self.dnd_map.get(str(w))
            if pf is not None:
                pf.accept_drop(paths)
                return
            w = getattr(w, "master", None)
        self.log("(drop ignored: release the files over one of the path "
                 "fields)", "warn")

    def _check_hmd_fields(self, *fields):
        """Validate HMD fields by content. Fake .fbx (HMD data) is fine;
        genuine FBX gets a clear notification instead of a tool crash.
        Returns True when all given fields are acceptable."""
        for label, value in fields:
            for p in (s.strip() for s in value.split(";")):
                if not p or os.path.isdir(p) or not os.path.isfile(p):
                    continue
                kind = sniff(p)
                if kind == "fbx":
                    messagebox.showwarning(
                        "HMD Toolkit",
                        f"{label}:\n{os.path.basename(p)}\n\nis a GENUINE "
                        "FBX (Kaydara binary), not an HMD. Game exports "
                        "named .fbx are usually HMD inside -- this one "
                        "isn't. It probably belongs in an FBX field.")
                    return False
                if kind is None and p.lower().endswith((".hmd", ".fbx")):
                    if not messagebox.askyesno(
                            "HMD Toolkit",
                            f"{label}:\n{os.path.basename(p)}\n\nis neither "
                            "HMD nor FBX by content. Continue anyway?"):
                        return False
        return True

    def _load_hmd(self, path):
        if MODELS not in sys.path:
            sys.path.insert(0, MODELS)
        import hmd_reader  # pure stdlib, safe in the GUI process
        return hmd_reader.load(path)

    def _autofill_events(self, *_event):
        """Fill the explicit-events box from the reference animation (on
        Browse/drop/Enter/defocus). Custom text is never overwritten."""
        p = self.af_ref.get().strip()
        if not (os.path.isfile(p) and sniff(p) == "hmd"):
            return
        if getattr(self, "_last_ev_ref", None) == p:
            return
        try:
            d = self._load_hmd(p)
            if not d.animations:
                return
            ev = d.animations[0].events or []
            text = "\n".join(f"{e.frame}:{e.data}" for e in ev)
            cur = self.ev_text.get("1.0", "end").strip()
            if not cur or cur == getattr(self, "_last_ev_autofill", None):
                self.ev_text.delete("1.0", "end")
                self.ev_text.insert("1.0", text)
                self._last_ev_autofill = text
            self._last_ev_ref = p
        except Exception as e:
            self.log(f"(could not read reference events: {e})", "warn")

    def _autofill_base(self, *_event):
        """Fill 'old texture base' from the texture paths inside the chosen
        HMD (runs on Browse/drop/Enter/defocus -- never while typing)."""
        p = self.rc_hmd.get()
        if not (os.path.isfile(p) and sniff(p) == "hmd"):
            return
        if getattr(self, "_last_autofill", None) == p:
            return
        try:
            if MODELS not in sys.path:
                sys.path.insert(0, MODELS)
            import hmd_reader as H  # pure stdlib, safe in the GUI process
            d = H.load(p)
            stems = []
            for m in d.materials:
                for t in (m.diffuseTexture, m.specularTexture, m.normalMap):
                    if t:
                        fn = t.replace("\\", "/").rsplit("/", 1)[-1]
                        stems.append(fn.rsplit(".", 1)[0])
            if not stems:
                return
            if len(stems) == 1:
                base = stems[0].rsplit("_", 1)[0]
            else:
                base = os.path.commonprefix(stems).rstrip("_")
            if base:
                self.rc_old.set(base)
                self._last_autofill = p
                self.log(f"(detected texture base: {base})", "dim")
        except Exception as e:
            self.log(f"(could not detect texture base: {e})", "warn")

    def _pick_dir(self, field):
        p = filedialog.askdirectory(initialdir=field.initialdir())
        if p:
            field.var.set(p)
            field.settings["dir_" + field.key] = p
            save_settings(field.settings)

    def _log_sb_press(self, e):
        elem = self.log_sb.identify(e.x, e.y)
        if "arrow" in elem:
            return None  # default arrow scrolling
        first, last = self.log_widget.yview()
        span = last - first
        cursor = self.log_sb.fraction(e.x, e.y)
        if "thumb" in elem:
            # grab: remember where inside the thumb the cursor is
            self._sb_grab = cursor - first
        else:
            # trough: jump, cursor ends up mid-thumb, then drag from there
            self._sb_grab = span / 2
            self.log_widget.yview_moveto(
                max(0.0, min(1.0 - span, cursor - span / 2)))
        # our "break" suppresses ttk's own state handling: light the thumb up
        self.log_sb.state(["pressed"])
        return "break"

    def _log_sb_motion(self, e):
        if self._sb_grab is None:
            return None
        first, last = self.log_widget.yview()
        span = last - first
        frac = self.log_sb.fraction(e.x, e.y) - self._sb_grab
        self.log_widget.yview_moveto(max(0.0, min(1.0 - span, frac)))
        return "break"

    def _log_sb_release(self, _e):
        self._sb_grab = None
        self.log_sb.state(["!pressed"])
        return "break"

    def _log_yset(self, first, last):
        # auto-hide: only show the scrollbar when the log overflows
        if float(first) <= 0.0 and float(last) >= 1.0:
            self.log_sb.grid_remove()
        else:
            self.log_sb.grid()
        self.log_sb.set(first, last)

    def log(self, line, tag=None):
        self.log_widget.insert("end", line + "\n", tag)
        self.log_widget.see("end")

    def run_cmd(self, argv, cwd):
        if self.running:
            messagebox.showinfo("HMD Toolkit", "A task is already running.")
            return
        self.running = True
        self.status.config(text="Running...")
        argv = [a.replace("\\", "/") for a in argv]  # forward slashes only
        self.log("$ " + " ".join(os.path.basename(a) if i < 2 else a
                                 for i, a in enumerate(argv)), "ok")

        def worker():
            try:
                p = subprocess.run(argv, cwd=cwd, capture_output=True,
                                   text=True, timeout=600,
                                   creationflags=NOWIN)
                out = (p.stdout or "") + (p.stderr or "")
                self.q.put(("out", out, p.returncode))
            except Exception as e:
                self.q.put(("out", f"ERROR: {e}", 1))
        threading.Thread(target=worker, daemon=True).start()

    def log_segments(self, segs):
        for text, tag in segs:
            self.log_widget.insert("end", text, tag)
        self.log_widget.insert("end", "\n")
        self.log_widget.see("end")

    def poll_queue(self):
        import re
        try:
            while True:
                _kind, out, rc = self.q.get_nowait()
                for line in out.splitlines():
                    m = re.match(r"^=== batch done: (\d+) (\w+), (\d+) "
                                 r"(failed\S*) ===$", line)
                    if m:
                        n_ok, verb, n_bad, bad_word = \
                            int(m[1]), m[2], int(m[3]), m[4]
                        self.log_segments([
                            ("=== batch done: ", "dim"),
                            (f"{n_ok} {verb}", "ok" if n_ok else "dim"),
                            (", ", "dim"),
                            (f"{n_bad} {bad_word}", "err" if n_bad else "dim"),
                            (" ===", "dim")])
                        continue
                    low = line.lower()
                    tag = ("err" if "error" in low or "traceback" in low
                           or "failed" in low
                           else "warn" if "warning" in low or "note:" in low
                           else None)
                    self.log(line, tag)
                self.log("=== done (ok) ===" if rc == 0
                         else "=== finished with errors ===",
                         "ok" if rc == 0 else "err")
                self.log("")
                self.running = False
                self.status.config(text="Ready.")
        except queue.Empty:
            pass
        self.root.after(150, self.poll_queue)

    # ---------- actions ----------------------------------------------------

    def run_model_export(self):
        ins = self.me_in.get_list()
        if not ins:
            return messagebox.showwarning("HMD Toolkit", "Pick model HMD file(s) or a folder.")
        if not self._check_hmd_fields(("Model HMD(s)", self.me_in.get())):
            return
        argv = [self.python, os.path.join(MODELS, "hmd2fbx.py")] + ins
        if self.me_copy.get():
            argv.append("--copy-hmd")
        if self.me_embed.get():
            argv.append("--embed")
        if self.me_out.get():
            argv += ["--outdir", self.me_out.get()]
        self.me_out.save_value()
        self.settings["copy_hmd"] = bool(self.me_copy.get())
        self.settings["me_embed"] = bool(self.me_embed.get())
        save_settings(self.settings)
        self.run_cmd(argv, MODELS)

    def _get_d4x(self):
        gamedir = self.st_game.get().strip().replace("\\", "/")
        d4x = os.path.join(gamedir, "D4X.exe") if gamedir else ""
        if not gamedir or not os.path.isfile(d4x):
            messagebox.showwarning(
                "HMD Toolkit", "Set the Game directory in the Settings tab "
                "first -- D4X.exe from the game install is needed for local "
                "repackaging.\n(Steam: right-click the game -> Manage -> "
                "Browse local files)")
            return None
        return d4x

    def run_model_fix(self):
        fbx = self.mf_fbx.get()
        rig = self.mf_rig.get()
        if not fbx:
            return messagebox.showwarning(
                "HMD Toolkit", "Pick the Blender-exported FBX.")
        if rig == "Custom":
            ref = self.mf_ref.get()
            if not ref:
                return messagebox.showwarning(
                    "HMD Toolkit", "Rig is set to Custom: pick the custom "
                    "rig HMD (or choose Male/Female).")
            if not self._check_hmd_fields(("Custom rig HMD", ref)):
                return
        else:
            ref = os.path.join(RIGS, rig + "01.hmd")
            if not os.path.isfile(ref):
                return messagebox.showwarning(
                    "HMD Toolkit", f"Bundled rig missing: {ref}\n"
                    "(the Rigs folder should contain Male01.hmd and "
                    "Female01.hmd)")
        d4x = self._get_d4x()
        if not d4x:
            return
        argv = [self.python, os.path.join(REPACK, "convert_fbx.py"),
                "model", fbx, "--ref", ref, "--d4x", d4x]
        resdir = self.mf_resdir.get().strip()
        if resdir:
            argv += ["--resdir", resdir]
        outdir = self.mf_out_var.get().strip().replace("\\", "/")
        if not outdir or "<" in outdir:
            outdir = self._mf_out_folder()
        stem = os.path.splitext(os.path.basename(fbx))[0]
        argv += ["--out", f"{outdir}/{stem}.hmd"]
        if not self.mf_prefab.get():
            argv.append("--no-prefab")
        self.settings["mf_rig"] = rig
        self.settings["mf_resdir"] = resdir
        self.settings["mf_prefab"] = bool(self.mf_prefab.get())
        save_settings(self.settings)
        self.run_cmd(argv, REPACK)

    def run_anim_export(self):
        anims = self.ae_anim.get_list()
        models = self.ae_model.get_list()
        if not anims:
            return messagebox.showwarning("HMD Toolkit", "Pick animation HMD(s) or a folder.")
        if not self._check_hmd_fields(("Animation HMD(s)", self.ae_anim.get()),
                                      ("Model (rig) HMD(s)", self.ae_model.get())):
            return
        if not models and not any(os.path.isdir(a) for a in anims):
            return messagebox.showwarning(
                "HMD Toolkit", "Pick at least one model (rig) HMD -- "
                "animations need a skeleton to be exported onto.\n(A model "
                "field is only optional when the animation input is a folder "
                "that already contains model HMDs.)")
        argv = [self.python, os.path.join(ANIMS, "hmdanim2fbx.py")] \
            + anims + models
        if self.ae_out.get():
            argv += ["--outdir", self.ae_out.get()]
        self.ae_out.save_value()
        self.run_cmd(argv, ANIMS)

    def run_anim_fix(self):
        fbx = self.af_fbx.get()
        ref = self.af_ref.get()
        name = self.af_name.get().strip()
        trim = self.af_trim.get().strip()
        rig = self.af_rig.get().strip() or "Male01"
        lines = [l.strip() for l in self.ev_text.get("1.0", "end").splitlines()
                 if l.strip()]
        if not fbx:
            return messagebox.showwarning(
                "HMD Toolkit", "Pick the input FBX (or a finished HMD for "
                "event editing).")
        if ref and not self._check_hmd_fields(("Reference animation HMD", ref)):
            return
        for l in lines:
            if ":" not in l or not l.split(":", 1)[0].strip().lstrip("-").isdigit():
                return messagebox.showwarning(
                    "HMD Toolkit", f"Bad event line: {l!r} (use frame:name, e.g. 11:hit)")

        # HMD input: event-editing mode -- inject in place, nothing else
        if os.path.isfile(fbx) and sniff(fbx) == "hmd":
            if not ref and not lines:
                return messagebox.showwarning(
                    "HMD Toolkit", "Event editing: give a reference HMD or "
                    "explicit events (tip: use the input file itself as "
                    "reference to load its current events).")
            argv = [self.python, os.path.join(ANIMS, "animfix.py"),
                    "--inject-events", fbx]
            if self.ev_nobak.get():
                argv.append("--no-backup")
            if lines:
                for l in lines:
                    argv += ["--event", l]
            elif ref:
                argv.append(ref)
            self.settings["ev_nobak"] = bool(self.ev_nobak.get())
            save_settings(self.settings)
            return self.run_cmd(argv, ANIMS)

        if not ref and not name:
            return messagebox.showwarning(
                "HMD Toolkit", "Pick a reference animation HMD, or enter a "
                "name for a new animation (ideally both).")
        d4x = self._get_d4x()
        if not d4x:
            return
        argv = [self.python, os.path.join(REPACK, "convert_fbx.py"),
                "anim", fbx]
        if ref:
            argv += ["--ref", ref]
        argv += ["--rig", rig]
        if name:
            argv += ["--name", name]
        if trim:
            argv += ["--trim", trim]
        for l in lines:
            argv += ["--event", l]
        if not self.ev_nobak.get():
            argv.append("--backup")
        argv += ["--d4x", d4x]
        if self.af_out.get():
            argv += ["--outdir", self.af_out.get()]
        self.af_out.save_value()
        self.settings["rig"] = rig
        self.settings["ev_nobak"] = bool(self.ev_nobak.get())
        save_settings(self.settings)
        self.run_cmd(argv, REPACK)

    def run_recolour_inspect(self):
        hmd = self.rc_hmd.get()
        if not hmd:
            return messagebox.showwarning("HMD Toolkit", "Pick the model HMD.")
        if not self._check_hmd_fields(("Model HMD", hmd)):
            return
        self.run_cmd([self.python, os.path.join(MODELS, "retexture.py"), hmd],
                     MODELS)

    def run_recolour(self):
        hmd = self.rc_hmd.get()
        old = self.rc_old.get().strip()
        new = self.rc_new.get().strip()
        ndir = self.rc_dir.get().strip()
        mod = self.st_mod.get().strip().replace("\\", "/").rstrip("/")
        if not self._check_hmd_fields(("Model HMD", hmd)):
            return
        if mod and not os.path.isdir(mod):
            return messagebox.showwarning(
                "HMD Toolkit", f"Modding directory does not exist:\n{mod}")
        if not hmd or not old or not new:
            return messagebox.showwarning(
                "HMD Toolkit", "Pick the model HMD and fill in both texture "
                "bases (use Inspect to see the current names).")
        # resource path inside the HMD: <resource dir>/<new base>
        internal = None
        if ndir:
            internal = ndir.replace("\\", "/").strip("/") + "/" + new
        elif mod:
            internal = new
        argv = [self.python, os.path.join(MODELS, "retexture.py"), hmd,
                "--clone", old, new]
        if internal:
            argv += ["--dir", internal]
        outdir = self.rc_out.get().strip().replace("\\", "/")
        if not outdir or "<" in outdir:
            outdir = self._rc_out_folder()
        argv += ["--outdir", outdir]
        if not self.rc_prefab.get():
            argv.append("--no-prefab")
        self.st_mod.save_value()
        self.settings["rc_dir"] = self.rc_dir.get().strip()
        self.settings["rc_prefab"] = bool(self.rc_prefab.get())
        save_settings(self.settings)
        self.run_cmd(argv, MODELS)


if __name__ == "__main__":
    if os.name == "nt":
        # so the taskbar uses our window icon instead of the python(w) host icon
        try:
            import ctypes
            ctypes.windll.shell32.SetCurrentProcessExplicitAppUserModelID("hmd.toolkit")
        except Exception:
            pass
    root = tk.Tk()
    root.withdraw()                      # stay hidden until the title bar is dark (no flash)
    try:
        root.call("tk", "scaling", 1.25)
    except Exception:
        pass
    apply_dark_theme(root)
    _set_dark_titlebar(root)             # set the dark flag while hidden
    _apply_icon(root)                    # and the icon, before the taskbar button appears
    App(root)
    if root.winfo_exists():              # App aborts (destroys root) if Models/Animations missing
        root.deiconify()                 # reveal the already-dark window exactly once
    root.mainloop()
