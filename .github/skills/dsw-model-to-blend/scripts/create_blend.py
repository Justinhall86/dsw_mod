#!/usr/bin/env python3
"""
DSW Model to Blend - Main entry point.

Usage:
    python create_blend.py --input-dir "C:\path\to\model_inputs\MyModel" --output "C:\path\to\output.blend"
"""

import argparse
import os
import shutil
import subprocess
import sys
from pathlib import Path


def find_fbx_and_textures(input_dir: Path):
    """Find the FBX and three texture files in the input directory."""
    files = list(input_dir.iterdir())
    
    # Find FBX - prefer TRUE_FBX versions, but prefer non-Demo over Demo
    fbx_files = [f for f in files if f.suffix.lower() == '.fbx']
    if not fbx_files:
        raise FileNotFoundError(f"No FBX file found in {input_dir}")
    
    fbx_path = None
    # Prefer TRUE_FBX files, but non-Demo over Demo
    true_fbx = [f for f in fbx_files if 'TRUE_FBX' in f.name]
    if true_fbx:
        # Prefer non-Demo TRUE_FBX
        non_demo = [f for f in true_fbx if 'Demo' not in f.name]
        if non_demo:
            fbx_path = non_demo[0]
        else:
            fbx_path = true_fbx[0]
        if len(fbx_files) > 1:
            print(f"Multiple FBX files found, using TRUE_FBX: {fbx_path.name}")
    else:
        fbx_path = fbx_files[0]
        if len(fbx_files) > 1:
            print(f"Multiple FBX files found, using first: {fbx_path.name}")
    
    # Find textures by common naming patterns
    albedo_patterns = ['*_Albedo.png', '*_BaseColor.png', '*_Color.png', '*_Diffuse.png']
    metallic_patterns = ['*_MetallicGlossAO.png', '*_Metallic.png', '*_ORM.png', '*_MRAO.png']
    normal_patterns = ['*_Normal.png', '*_NormalMap.png', '*_NormalDX.png', '*_NormalGL.png']
    
    def find_texture(patterns):
        for pattern in patterns:
            matches = list(input_dir.glob(pattern))
            if matches:
                return matches[0]
        return None
    
    albedo = find_texture(albedo_patterns)
    metallic = find_texture(metallic_patterns)
    normal = find_texture(normal_patterns)
    
    missing = []
    if not albedo:
        missing.append("Albedo (*_Albedo.png, *_BaseColor.png, *_Color.png, *_Diffuse.png)")
    if not metallic:
        missing.append("Metallic/Gloss/AO (*_MetallicGlossAO.png, *_Metallic.png, *_ORM.png, *_MRAO.png)")
    if not normal:
        missing.append("Normal (*_Normal.png, *_NormalMap.png, *_NormalDX.png, *_NormalGL.png)")
    
    if missing:
        raise FileNotFoundError(f"Missing textures in {input_dir}:\n  " + "\n  ".join(missing))
    
    return fbx_path, albedo, metallic, normal


def main():
    parser = argparse.ArgumentParser(description="Create a textured .blend from model inputs")
    parser.add_argument("--input-dir", required=True, help="Folder containing FBX + 3 textures")
    parser.add_argument("--output", required=True, help="Output .blend file path")
    parser.add_argument("--name", help="Model name (defaults to input folder name)")
    args = parser.parse_args()
    
    input_dir = Path(args.input_dir).resolve()
    output_path = Path(args.output).resolve()
    model_name = args.name or input_dir.name
    
    if not input_dir.exists():
        print(f"Input directory does not exist: {input_dir}")
        sys.exit(1)
    
    # Find FBX and textures
    try:
        fbx_path, albedo, metallic, normal = find_fbx_and_textures(input_dir)
    except FileNotFoundError as e:
        print(f"Error: {e}")
        sys.exit(1)
    
    print(f"Found:")
    print(f"  FBX:       {fbx_path.name}")
    print(f"  Albedo:    {albedo.name}")
    print(f"  Metallic:  {metallic.name}")
    print(f"  Normal:    {normal.name}")
    print(f"Output: {output_path}")

    # Create project folder (repo root is 4 levels up from this script: scripts -> dsw-model-to-blend -> skills -> .github -> repo_root)
    repo_root = Path(__file__).parent.parent.parent.parent.parent
    project_dir = repo_root / "model_projects" / model_name
    project_dir.mkdir(parents=True, exist_ok=True)

    # Copy inputs to project folder
    input_project = project_dir / "01_input"
    input_project.mkdir(exist_ok=True)

    shutil.copy2(fbx_path, input_project / fbx_path.name)
    shutil.copy2(albedo, input_project / albedo.name)
    shutil.copy2(metallic, input_project / metallic.name)
    shutil.copy2(normal, input_project / normal.name)

    # Create texture subfolder with expected naming for the build script
    tex_dir = input_project / "textures"
    tex_dir.mkdir(exist_ok=True)

    # Use a consistent stem based on the model name
    stem = model_name
    shutil.copy2(albedo, tex_dir / f"{stem}_Albedo.png")
    shutil.copy2(metallic, tex_dir / f"{stem}_MetallicGlossAO.png")
    shutil.copy2(normal, tex_dir / f"{stem}_Normal.png")
    
    # Build the .blend using Blender
    blender_build_script = Path(__file__).parent / "blender_build.py"
    
    blender_exe = r"C:\Program Files\Blender Foundation\Blender 5.2\blender.exe"
    if not Path(blender_exe).exists():
        # Try to find Blender
        for version in ["5.2", "5.1", "5.0", "4.3", "4.2", "4.1", "4.0"]:
            candidate = Path(f"C:/Program Files/Blender Foundation/Blender {version}/blender.exe")
            if candidate.exists():
                blender_exe = str(candidate)
                break
    
    # Use absolute paths for Blender
    body_fbx = input_project / fbx_path.name
    tex_dir_abs = tex_dir.resolve()
    output_abs = output_path.resolve()
    
    # Ensure output directory exists
    output_abs.parent.mkdir(parents=True, exist_ok=True)
    
    cmd = [
        blender_exe, "-b",
        "--python", str(blender_build_script),
        "--",
        "--body", str(body_fbx),
        "--textures", str(tex_dir_abs),
        "--out", str(output_abs),
        "--title", model_name
    ]
    
    print(f"\nRunning Blender...")
    result = subprocess.run(cmd, capture_output=True, text=True)
    
    if result.returncode != 0:
        print(f"Blender failed (exit code {result.returncode}):")
        print(result.stdout)
        print(result.stderr)
        sys.exit(1)
    
    print(result.stdout)
    
    # Open in Blender GUI
    print(f"\nOpening {output_path} in Blender...")
    subprocess.Popen([blender_exe, str(output_path)])
    
    print("Done!")


if __name__ == "__main__":
    main()