# ####################################################################################
# ############# ALIAS ############# ALIAS ############# ALIAS ############# ALIAS ####
# ####################################################################################

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# see if my internet is working?
alias alive='ping -c 2 google.com | grep "% packet loss" -C 7'

# For going to last directory
alias back='cd -'

# Make cal give 3 months by default
alias cal3='cal -n 3'

# See what programs are using bandwidth
alias checknetwork='nethogs'

# Clean all the tmp folders
alias cleanup='bleachbit --clean system.cache system.localizations system.trash system.tmp'
alias cleanupsu='bleachbit --clean system.cache system.localizations system.trash system.tmp'

# Pipe stdout to clipboard
alias copy='xsel -i -b'

#navigate to downloads folder
alias dl='cd ~/Downloads'

#navigate to downloads folder
alias drop='cd ~/Dropbox'

# ls replacement (colorful)
alias exa='exa -la --git --header --group-directories-first'

# Firefox aliases
alias ff='nohup firefox &>/dev/null &'
alias fp='nohup firefox -private &>/dev/null &'

# pretty grep
alias grep='grep --color=auto'

# test if gosharps server is up/alive (does 4 pings)
alias gsup='hping3 -c 4 -V -S -p 80 162.243.210.220'

#navigate to downloads folder
alias home='cd ~'

#i3 config shortcut
alias i3config='$EDITOR ~/.config/i3/config'

# lists personal fav imagemagick commands
alias imagecommands='cat ~/Dropbox/Programs/LINUX/imagemagick-commands.txt'

# Edit Kitty config
alias kittyrc='$EDITOR ~/.config/kitty/kitty.conf'

# lock PC when using i3
alias lock='. ~/scripts/i3lock.sh'

# shows current mac address
alias mac='macchanger -s enp4s0'

# get your IP by just typing "myip"
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# lists personal fav nmap commands
alias nmapcommands='cat ~/Dropbox/LINUX/nmap-commands.txt'

# nvim config shortcut
alias nvimrc='$EDITOR ~/.config/nvim/init.vim'

# polybar config file
alias polyrc='$EDITOR ~/.config/polybar/config'

#navigate to programming folder
alias prog='cd ~/Dropbox/Programming'

# will generate a random 15 character passwords if you have "pass" & "xsel" installed,
# http://www.passwordstore.org/
# This is the alternative to diceware incase site needs pw w/ symbols
alias pw0='cat /dev/urandom | tr -cd [:graph:] | fold -w $LENGTH | head -n 1'

# Using diceware python script saved on git will produce diceware pw of specified length.
# Default word length is 5, then copies to clipboard using xsel (must have installed also)
alias pw='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 4 | xsel -i -b'
alias pw2='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 1 | xsel -i -b'
alias pw3='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 2 | xsel -i -b'
alias pw4='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 3 | xsel -i -b'
alias pw5='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 4 | xsel -i -b'
alias pw6='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 5 | xsel -i -b'
alias pw7='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 6 | xsel -i -b'
alias pw8='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 7 | xsel -i -b'
alias pw9='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 8 | xsel -i -b'
alias pw10='python2 ~/Dropbox/Programming/git/diceware/diceware-v2 -w 9 | xsel -i -b'

# for running python scripts w/ 2.7
alias python2=/usr/bin/python2.7

# For opening Quartus
# alias quartus='(~/altera/13.0sp1/quartus/bin/quartus --64bit &)'

# for mispellings of "ranger"
# alias rg='ranger'

# remove colons from filenames (and replace w/ underscores)
alias removecolons='~/scripts/removecolon.sh'

# rename multiple files in sequential order
alias renamem='j=1;for i in *.(jpg|png|bmp|jpeg); do mv "$i" "$j"."${i##*.}"; let j=j+1;done'

# restart the network for LinuxMint 17.2 when troubleshooting
alias restartnetwork='systemctl restart NetworkManager.service'

# Print out warnings from RKHunter (rootkit malware detection)
# alias rootkit='rkhunter -c --enable all --disable none --rwo'

# Remove all EXIF data from files
alias scrubexif='for i in *.jpg; do echo "Processing $i"; exiftool -all= "$i"; done'

# shredding program more secure then secure-delete
alias shred='srm -v'

# shortcut for shutdown
alias shutdown='shutdown -h now'

# check internet speeds!
alias speedtest='speedtest-cli'

# edit sxhkdrc key-bindings config
alias sxrc='$EDITOR $HOME/.config/sxhkd/sxhkdrc'

# edit Termite config file
alias termiteconfig='$EDITOR $HOME/.config/termite/config'

# For opening Tor in background subshell
alias tor='(/usr/bin/tor-browser-en &)'

# edit vim rc file quickly
alias vimrc='$EDITOR ~/.vimrc'

# visual arm emulator
alias visual='/usr/local/bin/visual/VisUAL.sh'

# convert jpgs to 30% size and 90% of quality
alias webconvert='for file in *.jpg; do convert "$file" -quality 90 -resize 30% "web_$file"; done'

# reload zshrc changes w/out exiting terminal session
alias zshreload="source ~/.zshrc"

