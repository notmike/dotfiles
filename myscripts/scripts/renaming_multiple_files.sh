#!/usr/bin/env bash
j=1;for i in *.jpg; do mv "$i" "$j".jpg; let j=j+1;done

#Explanation:
#Set a counter j, initially set it to 1
#Initiate a for loop and use a shell glob *.jpg to obtain all jpg files.
#for each file rename it using mv and increase the counter by 1.
