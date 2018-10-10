#!/bin/bash
# This script opens a new workspace in the currently active monitor
#
# First gets a list of all of the active workspaces with i3-msg and jq
#
# Then, if there are other available workspaces, moves to one; the lowest number
#
# If all of the workspaces are full moves to workspace #11

readarray -t activeWorkspaces < <(i3-msg -t get_workspaces | jq 'map(.num)' | tr -dc '[:alnum:]\n\r' | sort -g)

number=$(echo "${activeWorkspaces[@]}" | awk -v RS='\\s+' '{ a[$1] } END { for(i=1; i in a; ++i); print i }')

if [ $# -eq 0 ]
    then
        i3-msg workspace $number
    else
        i3-msg workspace $number; exec $1
fi
