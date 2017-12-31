#!/bin/bash
brightness=`xbacklight | cut -d . -f 1`
if [ $brightness -eq 100 ]
then 
    echo "  $brightness"
elif [ $brightness -lt 10 ]
then
    echo "       $brightness"
else
    echo "    $brightness"
fi