from pathlib import Path
import shutil
import re

def get_dest_file_path(file_path, index, src_name):
    regex = '(\d)_'
    dest_file_name = f"{index}_{re.split(regex, src_name, maxsplit=1)[-1]}"
    dest = file_path / dest_file_name
    return dest

def move_files(presentation_md_files):
    for index, file in enumerate(presentation_md_files):
        file_path = Path.cwd() / "presentation"
        src = list(file_path.glob(f"*{file}")).pop()
        dest = get_dest_file_path(file_path, index, src.name)
        shutil.move(str(src), str(dest))
        replace_filenames_in_html(f"presentation/{src.name}", f"presentation/{dest.name}", "reveal/index.html")

def replace_filenames_in_html(old_filename, new_filename, html_filepath):
    with open(html_filepath, 'r') as file:
        filedata = file.read()

    filedata = re.sub(old_filename, new_filename, filedata)
    with open(html_filepath, 'w') as file:
        file.write(filedata)


if __name__ == "__main__":
    presentation_md_files = [
        "title.md",
        "spack_overview.md",
        "install_numpy_conda.md",
        "install_numpy_spack.md",
        "install_numpy_intel_2023.2.1_conda.md",
        "install_numpy_intel_2023.2.1_spack.md",
        "install_numpy_intel_2023.2.1_optimized_conda.md",
        "install_numpy_intel_2023.2.1_optimized_spack.md",
    ]
    move_files(presentation_md_files)

