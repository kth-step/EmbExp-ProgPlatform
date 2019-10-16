#!/usr/bin/env python3

import subprocess
import argparse

# parse arguments
parser = argparse.ArgumentParser()
parser.add_argument("gdb_cmd", help="")
parser.add_argument("gdb_remote", help="")
parser.add_argument("gdb_elf", help="")
args = parser.parse_args()

makeswitches = ["--silent", "--ignore-errors", "--no-print-directory"]
rdycheck__exec = ["make", "checkready"]
postuart__exec = ["make"] + makeswitches + ["log"]
postdebug_exec = [args.gdb_cmd, f"--eval-command=target remote {args.gdb_remote}", "-x", "scripts/run.gdb", args.gdb_elf]

tempuartlog = "./temp/uart.log"
temprunlog  = "./temp/run.log"

retval = subprocess.call(rdycheck__exec)

if retval != 0:
	raise Exception("connection has not been established yet, run \"make connect\" first")

# read timeout for run from config file
run_timeout = None
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
print(f"uart log > {tempuartlog}")
print(f"run log  > {temprunlog}")
print( "---------------------------")

subprocess.call(["mkdir", "-p", "temp"])
subprocess.call(["rm", "-f", tempuartlog])
subprocess.call(["rm", "-f", temprunlog])

with open(tempuartlog, "w") as uartlog:
	uartproc = subprocess.Popen(postuart__exec, stdout=uartlog, stderr=None)
	try:
		print("starting uart logging")
		with open(temprunlog, "w") as runlog:
			print("starting run logging")
			try:
				subprocess.call(postdebug_exec, stdout=runlog, stderr=subprocess.STDOUT, timeout=run_timeout)
			except subprocess.TimeoutExpired:
				print("!" * 60)
				print("!!! the execution on the board didn't finish. something is off.")
				print("!" * 60)
				raise
			print()
			print("finishing run logging process")
		print("finishing uart logging")
	finally:
		print()
		print("terminating uart logging process")
		uartproc.terminate()

