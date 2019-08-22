#!/bin/bash

# check if the ports are available
declare -a ports_to_check=(
    20000
    20013
)

# loop over the ports
for port in "${ports_to_check[@]}"
do
    echo "checking port ${port}"
    # fail if one of them is not open locally
    if ! lsof -Pi :${port} -sTCP:LISTEN -t > /dev/null ; then
        exit 1
    fi
done

exit 0

