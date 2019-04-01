#!/bin/bash

# setup environment
my_pid=$BASHPID
postuart__exec=$1
postdebug_exec=$2
#echo "exec when uart  ready: $postuart__exec"
#echo "exec when debug ready: $postdebug_exec"
tempfile="./temp/interactive.log"
tempfifo="./temp/interactive.in"
tempuartlog="./temp/uart.log"
temprunlog="./temp/run.log"
echo "---------------------------"
echo "interactive output > $tempfile"
echo "interactive input  < $tempfifo"
echo "---------------------------"
echo "uart log > $tempuartlog"
echo "run log  > $temprunlog"
echo "---------------------------"

# create temp folder if it doesn't exist yet
mkdir -p ./temp

# setup finalization
finalizer() {
    printf "\nFinalizing..\n"
    rm $tempfifo
}
catcher() {
    trap '' INT TERM
    printf "\nSIGINT caught\n"
    finalizer
    kill -TERM 0
    wait
    echo "Done..\n"
    exit 2
}
trap 'catcher' INT TERM

# setup fifo
if [ ! -p $tempfifo ]; then
    mkfifo $tempfifo
else
    echo "another interactive session is still running" >&2
    exit 1
fi

# start interactive session
touch $tempfile
rm $tempfile
touch $tempfile
(tail -f --pid=$my_pid $tempfifo | make connect &> $tempfile) &
interactive_pid=$!

# read output until "waiting for bootup" appears
until grep -q -i 'waiting for bootup' $tempfile
do       
    if ! ps $interactive_pid > /dev/null 
    then
    echo "the interactive session died" >&2
    finalizer
    exit 3
    fi
    echo -n "."
    sleep 1
done

# uart can be connected now
echo
echo "uart ready!"
# run postuart
$postuart__exec > $tempuartlog &

# read output until "finished starting" appears
until grep -q -i 'finished starting' $tempfile
do       
    if ! ps $interactive_pid > /dev/null 
    then
    echo "the interactive session died" >&2
    finalizer
    exit 4
    fi
    echo -n "."
    sleep 1
done

sleep 1

# jtag can be connected now
echo
echo "jtag ready!"
# run postdebug
$postdebug_exec > $temprunlog

# and shut down
echo > $tempfifo

sleep 1

# cleanup
finalizer

