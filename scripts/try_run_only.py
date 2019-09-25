#!/usr/bin/env python3

import subprocess

rdycheck___exec = ["make", "checkready"]
runlog_____exec = ["make", "runlog"]
runlog_rst_exec = ["make", "runlog_reset"]

retval = subprocess.call(rdycheck___exec)
if retval == 0:
	subprocess.call(runlog_____exec)
else:
	subprocess.call(runlog_rst_exec)

