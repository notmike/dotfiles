#!/bin/bash
ram=`free -m | grep Mem | awk '{print $3/$2 * 100}' | cut -d . -f 1`
if [ $ram -lt 10 ]
then
	echo "   $ram" 
else
	echo "  $ram"  
fi