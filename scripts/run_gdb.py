#!/usr/bin/env python3

import os
import subprocess
import argparse

# parse arguments
parser = argparse.ArgumentParser()
parser.add_argument("gdb_cmd", help="")
parser.add_argument("gdb_remote", help="")
parser.add_argument("gdb_elf", help="")
parser.add_argument("gdb_boardconfig", help="")
parser.add_argument("gdb_mode", help="run/debug/run_exp")
args = parser.parse_args()

gdb_exec_l = [args.gdb_cmd, f"--eval-command=target remote {args.gdb_remote}", "-x", "scripts/run.gdb", args.gdb_elf]

temprunlog  = "./temp/gdb.log"

run_timeout = None
if args.gdb_mode == "run_exp":
	# read timeout for run from config file
	with open("Makefile.config", "r") as f:
		for line in f:
			if line.strip() == "":
				continue
			parts = line.split("=")
			assert len(parts) == 2
			k = parts[0].strip()
			v = parts[1].strip()
			if k.upper() == "PROGPLAT_RUN_TIMEOUT":
				assert run_timeout == None
				run_timeout = int(v)
	# default value
	if run_timeout == None:
		run_timeout = None
	# value range
	if run_timeout < 0:
		raise Exception("run_timeout cannot be negative")
	# special value for no timeout
	if run_timeout == 0:
		run_timeout = None

print( "---------------------------")
print(f"gdb log  > {temprunlog}")
print( "---------------------------")

subprocess.call(["mkdir", "-p", os.path.dirname(temprunlog)])
subprocess.call(["rm", "-f", temprunlog])

with open(temprunlog, "w") as runlog:
	print("starting run logging")

	if args.gdb_mode == "run_exp":
		gdb_stdin  = subprocess.PIPE
		gdb_stdout = runlog
		gdb_stderr = subprocess.STDOUT
	else:
		gdb_stdin  = None
		gdb_stdout = None
		gdb_stderr = None

	try:
		subprocess.call(gdb_exec_l, stdin=gdb_stdin, stdout=gdb_stdout, stderr=gdb_stderr, timeout=run_timeout)
	except subprocess.TimeoutExpired:
		print("!" * 60)
		print("!!! the execution on the board didn't finish. something is off.")
		print("!" * 60)
		raise
	print()
	print("finishing run logging process")

