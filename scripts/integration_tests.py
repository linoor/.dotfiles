#!/bin/env python

import sys
import os
import re
import subprocess

def echo_step(s):
    for _ in range(4):
        print("")
    stars = '-*'*10
    print(f"-{stars}-")
    for _ in range(4):
        print("")

if __name__ == "__main__":
    full_dir = os.getcwd()
    last_dir_part = full_dir.split("/")[-1]
    print(f"current dir: {last_dir_part}")

    if len(sys.argv) >= 2 and sys.argv[1] == "install":
        echo_step("running mvn install")
        subprocess.call("mvn install -DskipTests")

    if 'behaviour' not in last_dir_part:
       echo_step("changing directory to behavior tests dir")
       os.chdir(f"{full_dir}/{last_dir_part}_behavior_test")

    cmd = "mvn integration-test -P lxc-staging"
    echo_step(cmd)

    subprocess.call(cmd)
