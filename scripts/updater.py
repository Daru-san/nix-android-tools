#!/usr/bin/env python

import subprocess, os, pathlib


currentPath = pathlib.Path().resolve()
currentDir = os.path.abspath(currentPath)


gitRootDir = subprocess.check_output(["git", "rev-parse", "--show-toplevel"])
gitRootDir = gitRootDir[:-1]

os.chdir(gitRootDir)


class Updaters:
    def update_version(self, pname):
        subprocess.run(["nix-update", "-F", pname, "--commit", "--format"])

    def update_branch(self, pname):

        subprocess.run(
            [
                "nix-update",
                "-F",
                pname,
                "--commit",
                "--format",
                "--version",
                "branch",
            ]
        )


ud = Updaters()
version_pnames = ["aospdtgen", "sebaubuntu_libs"]
branch_pnames = ["dumpyara", "unpackbootimg", "twrpdtgen", "twrpdtgen_v2"]

for x in version_pnames:
    ud.update_version(x)

for x in branch_pnames:
    ud.update_branch(x)
