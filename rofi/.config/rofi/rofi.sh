#!/bin/bash

# THEMING
# With rofi 0.15.4 we have a new way of specifying colors, the old settings still apply (for now). To enable the new setup, set rofi.color-enabled to true. The new setup allows you to specify colors per state, similar to i3 Currently 3 states exists:

# normal Normal row.
# urgent Highlighted row (urgent)
# active Highlighted row (active)
# For each state the following 5 colors must be set:

# bg Background color row
# fg Text color
# bgalt Background color alternating row
# hlfg Foreground color selected row
# hlbg Background color selected row
# The window background and border color should be specified separate. The key color-window contains a pair background,border. An example for Xresources file:

# ! State:           'bg',     'fg',     'bgalt',  'hlbg',   'hlfg'
# rofi.color-normal: #fdf6e3,  #002b36,  #eee8d5,  #586e75,  #eee8d5
# rofi.color-urgent: #fdf6e3,  #dc322f,  #eee8d5,  #dc322f,  #fdf6e3
# rofi.color-active: #fdf6e3,  #268bd2,  #eee8d5,  #268bd2,  #fdf6e3

# !                  'background', 'border'
# rofi.color-window: #fdf6e3,      #002b36
# Same settings can also be specified on command-line:

# rofi -color-normal "#fdf6e3,#002b36,#eee8d5,#586e75,#eee8d5"


rofi -modi "drun,run,window" -show drun -color-window "#282828,#282828" -color-normal "#282828,#ffffff,#282828,#282828,#b8bb26" -lines 10 -line-margin 4 -eh 1 -width 800 -padding 30 -location 0 -bw 0 -font "Fantasque Sans Mono 15" -show-icons -no-show-match -no-sort
