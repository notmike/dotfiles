#!/bin/bash

## Xset - sets screen sleep time to 1 hour
xset s 3600 3600 &
xset -dpms &
## xbindkeys (and xautomation) used to bind mx thumb wheel to vol+-
xbindkeys &
## xset - make the hold down key-rate faster
xset r rate 250 30 &
