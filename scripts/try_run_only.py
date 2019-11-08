#!/usr/bin/env python3

import subprocess

retval = subprocess.call(["scripts/check_ready.sh"])
if retval == 0:
	subprocess.call(["make", "runlog"])
else:
	subprocess.call(["scripts/connect_and_run.py"])

