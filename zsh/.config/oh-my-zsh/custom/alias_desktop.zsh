# ####################################################################################
# ############# ALIAS ############# ALIAS ############# ALIAS ############# ALIAS ####
# ####################################################################################

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# ls replacement (colorful)
alias exa='exa -la --git --header --group-directories-first'

# Edit Kitty config
alias kittyrc='$EDITOR ~/.config/kitty/kitty.conf'

# shows current mac address
alias mac='macchanger -s enp4s0'

# polybar config file
alias polyrc='$EDITOR ~/.config/polybar/config'

# Using diceware python script saved on git will produce diceware pw of specified length.
# Default word length is 5, then copies to clipboard using xsel (must have installed also)
alias pw='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 5 | xsel -i -b'
alias pw2='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 1 | xsel -i -b'
alias pw3='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 2 | xsel -i -b'
alias pw4='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 3 | xsel -i -b'
alias pw5='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 4 | xsel -i -b'
alias pw6='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 5 | xsel -i -b'
alias pw7='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 6 | xsel -i -b'
alias pw8='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 7 | xsel -i -b'
alias pw9='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 8 | xsel -i -b'
alias pw10='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 9 | xsel -i -b'

# edit sxhkdrc key-bindings config
alias sxrc='$EDITOR $HOME/.config/sxhkd/sxhkdrc'
