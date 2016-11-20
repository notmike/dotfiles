# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.


# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found ]; then
    function command_not_found_handle {
            # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
           /usr/bin/python /usr/lib/command-not-found -- $1
                   return $?
        else
           return 127
        fi
    }
fi



# auto-complete for pacman when using sudo:
complete -cf sudo

# Add bin to path
PATH=$PATH:~/bin


#****************************************************************************
# ********* MIKE, PUT ALL YOUR CUSTOM SHIT DOWN HERE ************************
#****************************************************************************

# changes terminal window title to just " ~ "
PS1="\[\e]0;\w\a\]$PS1"

# Makes sure the GO path is in every terminal so I can run "wego" and other GO programs. I set default terminal size to 131x40 for this too
#export PATH=$HOME/go/bin:$PATH

# Use like    extract <filename>
# can unpack any compressed file without thinking about which command or flags needed
function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf "$1"    ;;
            *.tar.gz)    tar xvzf "$1"    ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xvf "$1"     ;;
            *.tbz2)      tar xvjf "$1"    ;;
            *.tgz)       tar xvzf "$1"    ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# SSH works better
export TERM=xterm-256color

# Default Editor
export VISUAL="vim" 

# Increase History size
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

# adds dotted line between each command
export PROMPT_COMMAND='q="- $(date +%T)"; while [[ ${#q} -lt $COLUMNS ]]; do q="${q:0:1}$q"; done; echo -e;'

#adds cool penguin
cowsay -f small ciao | lolcat


#*******************************************************************************************************************
### ALIASES  ### ALIASES  ### ALIASES  ### ALIASES  ### ALIASES  ### ALIASES  ### ALIASES  ### ALIASES  ### ALIASES 
#*******************************************************************************************************************
# pulls up list of all .bashrc custom shortcuts using regex search
alias commands='cat .bashrc | grep -P "(?<=alias)(.*)(?==)"' 
#**************************************************************************

# easy for going back directories by putting # of periods "....." = 4 directories back
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# see if my internet is working?
alias alive='ping -c 2 google.com'

# autostart gui for gnome
alias autostart='gnome-session-properties'

# For going to last directory
alias back='cd -'

#navigate to downloads folder
alias dl='cd /mnt/R2D2/Downloads/LINUXDLS && xdg-open .'

#navigate to downloads folder
alias drop='cd /mnt/R2D2/Dropbox'

#espresso settings that i need for correct SoP logic minimizing
#alias espresso='espresso -Dso -o eqntott'

#espresso settings that i need for correct PoS logic minimizing 
# just need to flip all the output bits of the orig file, and flip NOTs after also
#alias espresso='espresso -o eqntott'

# test if firstshred server is up/alive (does 4 pings)
alias fsup='sudo hping3 -c 4 -V -S -p 3340 24.153.238.2'

# test if firstshred server is up/alive (does unlimited pings)
alias fsup2='sudo hping3 -V -S -p 3340 24.153.238.2'

# shortens install command
alias get='sudo pacman -S'

# alternative AUR installer
alias get2='yaourt -S'

# download subtitles
alias getsubs='addic7ed -l english'

# pretty grep
alias grep='grep --color=auto'

#navigate to downloads folder
alias home='cd ~'

# lists personal fav imagemagick commands
alias imagecommands='cat /mnt/R2D2/Dropbox/Programs/LINUX/imagemagick-commands.txt'

alias ll='ls -alt'
alias ls='ls -lhFG --color=auto'

# shows current mac address
alias mac='macchanger -s enp4s0'

# get your IP by just typing "myip"
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# lists personal fav nmap commands
alias nmapcommands='drop && cat ./Programs/LINUX/nmap-commands.txt'

#Runs the last command with sudo.
alias please='sudo $(history -p !!)'

#navigate to programming folder
alias prog='cd /mnt/R2D2/Dropbox/Programming'

# will generate a random 15 character passwords if you have "pass" & "xsel" installed,
# http://www.passwordstore.org/
# This is the alternative to diceware incase site needs pw w/ symbols
alias pw0='cat /dev/urandom | tr -cd [:graph:] | fold -w $LENGTH | head -n 1'

# Using diceware python script saved on git will produce diceware pw of specified length.
# Default word length is 5, then copies to clipboard using xsel (must have installed also)
alias pw='python2 /mnt/R2D2/Dropbox/git/diceware/diceware-v2 -w 4 | xsel -i -b'
alias pw2='python2 /mnt/R2D2/Dropbox/git/diceware/diceware-v2 -w 1 | xsel -i -b'
alias pw3='python2 /mnt/R2D2/Dropbox/git/diceware/diceware-v2 -w 2 | xsel -i -b'
alias pw4='python2 /mnt/R2D2/Dropbox/git/diceware/diceware-v2 -w 3 | xsel -i -b'
alias pw5='python2 /mnt/R2D2/Dropbox/git/diceware/diceware-v2 -w 4 | xsel -i -b'
alias pw6='python2 /mnt/R2D2/Dropbox/git/diceware/diceware-v2 -w 5 | xsel -i -b'
alias pw7='python2 /mnt/R2D2/Dropbox/git/diceware/diceware-v2 -w 6 | xsel -i -b'
alias pw8='python2 /mnt/R2D2/Dropbox/git/diceware/diceware-v2 -w 7 | xsel -i -b'
alias pw9='python2 /mnt/R2D2/Dropbox/git/diceware/diceware-v2 -w 8 | xsel -i -b'
alias pw10='python2 /mnt/R2D2/Dropbox/git/diceware/diceware-v2 -w 9 | xsel -i -b'

# for running python scripts w/ 2.7
alias python2=/usr/bin/python2.7

# For opening Quartus
alias quartus='(~/altera/13.0sp1/quartus/bin/quartus --64bit &)'

# shortcut for reboot
alias reboot='sudo reboot'

# rename multiple files in sequential order
alias renamem='j=1;for i in *.jpg; do mv "$i" "$j".jpg; let j=j+1;done'

# remove package
alias remove='sudo pacman -Rs'

# restart the network for LinuxMint 17.2 when troubleshooting
alias restartnetwork='sudo systemctl restart NetworkManager.service'

# Print out warnings from RKHunter (rootkit malware detection)
alias rootkit='sudo rkhunter -c --enable all --disable none --rwo'

# Remove all EXIF data from files
alias scrubexif='for i in *.jpg; do echo "Processing $i"; exiftool -all= "$i"; done'

# shortcut for shredding file w/ options (in order) 
# final overwrite of zeros, truncate & remove file after done, verbose progress, shredding 7 times (instead of default 3)
#alias shred='shred -zuvn 7'

#alternative shredding program more secure
alias shred='srm -v'

# shortcut for shutdown
alias shutdown='sudo shutdown -h now'

# check internet speeds!
alias speedtest='speedtest-cli'

# For opening Tor in background subshell
alias tor='(/usr/bin/tor-browser-en &)'

# update on one command 
alias update='sudo pacman -Syu'

# VPN - US-east
alias vpn1='sudo openvpn --config /etc/openvpn/US_East.conf'

# VPN - Swiss
alias vpn2='sudo openvpn --config /etc/openvpn/Switzerland.conf'

# convert jpgs to 30% size and 90% of quality
alias webconvert='for file in *.jpg; do convert "$file" -quality 90 -resize 30% "web_$file"; done'

# so the terminal app "ranger" can open new terminal in last directory
cd "$AUTOCD"

export QSYS_ROOTDIR="/tmp/yaourt-tmp-mg/aur-quartus-lite/pkg/quartus-lite//opt/altera/quartus/sopc_builder/bin"

export ALTERAOCLSDKROOT="/tmp/yaourt-tmp-mg/aur-quartus-lite/pkg/quartus-lite//opt/altera/hld"
