#!/usr/bin/env bash
for file in *.jpg; do convert "$file" -quality 90 -resize 30% "web_$file"; done
