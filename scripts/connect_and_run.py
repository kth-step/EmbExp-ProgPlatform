#!/usr/bin/env python3

import subprocess
import time
import sys

connect_exec = ["make", "connect"]
runlog__exec = ["make", "runlog"]


tempfile = "./temp/interactive.log"
print( "---------------------------")
print(f"interactive output > {tempfile}")
print( "---------------------------")

subprocess.call(["mkdir", "-p", "temp"])
subprocess.call(["rm", tempfile])


with open(tempfile, "w+") as connectlog:
	connectlog.flush()
	connectproc = subprocess.Popen(connect_exec, stdout=connectlog, stderr=subprocess.STDOUT)
	try:
		# wait until the connect process is ready
		found = False
		while not found and connectproc.poll() == None:
			time.sleep(1)
			with open(tempfile, "r") as connectlog_observer:
				for line in connectlog_observer:
					#print(line)
					if line.strip() == "===    finished starting    ===":
						found = True
						break
			print(".", end='')
			sys.stdout.flush()
		print()

		time.sleep(1)
		print("starting connect logging")

		print("starting runlog process")
		subprocess.call(runlog__exec)
		print()
		print("finishing runlog process")
		print("finishing connect logging")
	finally:
		print()
		print("terminating connect process")
		connectproc.terminate()


