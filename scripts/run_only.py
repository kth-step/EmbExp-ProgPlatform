#!/usr/bin/env python3

import subprocess

rdycheck__exec = ["make", "checkready"]
postuart__exec = ["make", "--no-print-directory", "log"]
postdebug_exec = ["make", "run"]

tempuartlog = "./temp/uart.log"
temprunlog  = "./temp/run.log"

retval = subprocess.call(rdycheck__exec)

if retval != 0:
	raise Exception("connection has not been established yet, run \"make connect\" first")


print( "---------------------------")
print(f"uart log > {tempuartlog}")
print(f"run log  > {temprunlog}")
print( "---------------------------")

subprocess.call(["mkdir", "-p", "temp"])
subprocess.call(["rm", tempuartlog])
subprocess.call(["rm", temprunlog])

with open(tempuartlog, "w") as uartlog:
	uartproc = subprocess.Popen(postuart__exec, stdout=uartlog, stderr=None)
	try:
		print("starting uart logging")
		with open(temprunlog, "w") as runlog:
			print("starting run logging")
			try:
				subprocess.call(postdebug_exec, stdout=runlog, stderr=subprocess.STDOUT, timeout=2)
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

