target remote localhost:20033
load
set confirm off
delete
b main.c:20
commands
detach
quit
end
j main.c:15
