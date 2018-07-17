# ####################################################################################
# ############# ALIAS ############# ALIAS ############# ALIAS ############# ALIAS ####
# ####################################################################################

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Battery Status Shortcut
alias battery='acpi -b'

# Calculator
alias ca='python3 -ic "from math import *"'

# Disable Touchpad
alias touchoff='synclient TouchpadOff=1'

# Enable Touchpad
alias touchon='synclient TouchpadOff=0'

# Disable screen saver / blanking
alias screensaver-off='xset s off'

# Re-enable screensaver after 10 minutes of inactivity
alias screensaver-on='xset s 600 600'
