#!/bin/python3
# Build script for the awesome chess game. Creates .love files that can be
# destributed together with and played by the love2d game engine.
# This script is built and tested using python 3.7
import argparse
import pathlib
import itertools
import zipfile


def get_paths(root_dir):
    """
    Project path resolutions.
    """
    root_dir = pathlib.Path(__file__).parent if root_dir is None else root_dir
    return {
        "PROJECT_ROOT": root_dir,
        "ASSETS": pathlib.Path("assets"),
        "SRCS": pathlib.Path("chess"),
        "LIBS": pathlib.Path("lib")
    }


def get_all_files(paths):
    """
    Get a iterable of all the files that should be zipped
    """
    lua_files_in_root = (f for f in paths["PROJECT_ROOT"].iterdir() if not f.is_dir() and f.suffix == ".lua")
    assets = (f for f in path_walk(paths["ASSETS"]))
    srcs = (f for f in path_walk(paths["SRCS"]))
    libs = (f for f in path_walk(paths["LIBS"]))

    return itertools.chain(lua_files_in_root, srcs, assets, libs)


def path_walk(top_path):
    """
    Path walking algorithm for recursively finding files in a directory
    tree using pathlib
    """
    if not top_path.is_dir(): return top_path
    top_queue = [top_path]
    while len(top_queue) != 0:
        current_dir = top_queue.pop(0)
        for filepath in current_dir.iterdir():
            if filepath.is_dir():
                top_queue.append(filepath)
            elif filepath.is_file():
                yield filepath


def parse_cli():
    """
    Parsing the builder's Command Line Interface arguments
    """
    parser = argparse.ArgumentParser(
        description="Creates distributional .love files for the awesome-chess game."
    )
    parser.add_argument("-p", "--project-dir", type=pathlib.Path, default=None, action="store", help="Project root directory override")
    parser.add_argument("-o", "--output", type=pathlib.Path, default=pathlib.Path('awesome-chess.love'), action="store", help="Output filename")
    parser.add_argument("--clean", action="store_true", help="Clean the build files first before building")
    return parser.parse_args()


def main(argv):
    paths = get_paths(argv.project_dir)

    if argv.clean and argv.output.exists():
        print("Removing {!r}".format(argv.output.as_posix()))
        argv.output.unlink()

    print("Building {!r}".format(argv.output.as_posix()))
    with zipfile.ZipFile(argv.output, mode='w') as love_file:
        for f in get_all_files(paths):
            love_file.write(f)

if __name__ == "__main__":
    main(parse_cli())
