# connect to the remote
target remote localhost:20033
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

# jump to an entry point (preferably resetting the stack and so on)
#j main.c:15
#j _start
j _reset_core0
