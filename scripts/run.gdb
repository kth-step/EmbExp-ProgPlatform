# connect to the remote
load

# clear all previous state
set confirm off
delete

# setup final breakpoint and exit procedure
b main.c:21
commands
delete
detach
quit
end

# jump to an entry point that resets the stack also
j _reset_core0

# in case of interruption:
set confirm off
delete
detach
quit

