#!/usr/bin/env python3

output_text = ""
with open("Makefile.config", "r") as f:
	for line in f:
		if line.strip() == "":
			continue
		parts = line.split("=")
		assert len(parts) == 2
		k = parts[0].strip()
		v = parts[1].strip()
		output_text += f"#define __{k.upper()}__{v.upper()}\n"

with open("inc/config_input.h", "w") as f:
	f.write(output_text)

