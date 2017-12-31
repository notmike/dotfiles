#!/bin/bash
cpu=`vmstat|tail -1|awk '{print 100 - $15}'`
if [ $cpu -lt 10 ]
then
	echo "   $cpu" 
else
	echo "  $cpu"  
fi