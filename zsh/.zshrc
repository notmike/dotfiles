# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="norm"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sublime web-search archlinux common-aliases emoji extract torrent zsh-syntax-highlighting)

# User configuration

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

export PATH=$HOME/bin:/usr/local/bin:/opt/altera/quartus/bin:/opt/altera/modelsim_ase/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi


throwaway_cpp() {
  local tdir=$(mktemp -d /tmp/deleteme-XXX)
  cd $tdir
  sed -e 's/LD\s*:=.*$/LD       := $(CXX)/' \
   < ~/.vim/skeletons/skeleton.make > Makefile
  cat > test.cpp <<"EOF"
#include <stdio.h>
#include <stdlib.h>
#include <iostream>

int main() {

return 0;
}
EOF
vim test.cpp
}


# experimental colored man pages:

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;42;30m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;35m") \
			man "$@"
}

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Completion
    # faster?
    zstyle ':completion::complete:*' use-cache 1
    # case insensitive
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

    zstyle ':completion:*' verbose yes
    # for PID
    zstyle ':completion:*:*:kill:*' menu yes select
    zstyle ':completion:*:kill:*' force-list always
    # color completion
    zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
    # separate man page sections
    zstyle ':completion"*"manuals' separate-sections true
    # don't complete current directory
    zstyle ':completion:*' ignore-parents parent pwd


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
alias alive='ping -c 2 google.com'

# autostart gui for gnome
alias autostart='gnome-session-properties'

# For going to last directory
alias back='cd -'

# Clean all the tmp folders
alias cleanup='bleachbit --clean system.cache system.localizations system.trash system.tmp'
alias cleanupsu='sudo bleachbit --clean system.cache system.localizations system.trash system.tmp'

#navigate to downloads folder
alias dl='cd /mnt/R2D2/Downloads/LINUXDLS'

#navigate to downloads folder
alias drop='cd /mnt/R2D2/Dropbox'

#espresso settings that i need for correct SoP logic minimizing
#alias espresso='espresso -Dso -o eqntott'

#espresso settings that i need for correct PoS logic minimizing 
# just need to flip all the output bits of the orig file, and flip NOTs after also
#alias espresso='espresso -o eqntott'

# Firefox aliases
alias ff='nohup firefox &>/dev/null &'
alias fp='nohup firefox -private &>/dev/null &'

# test if firstshred server is up/alive (does 4 pings)
alias fsup='sudo hping3 -c 4 -V -S -p 3340 24.153.238.2'

# test if firstshred server is up/alive (does unlimited pings)
alias fsup2='sudo hping3 -V -S -p 3340 24.153.238.2'

# shortcut for downloading subtitles in english
alias getsubs='addic7ed -l english'

# pretty grep
alias grep='grep --color=auto'

#navigate to downloads folder
alias home='cd ~'

#i3 config shortcut
alias i3config='vim ~/.config/i3/config'

# lists personal fav imagemagick commands
alias imagecommands='cat /mnt/R2D2/Dropbox/Programs/LINUX/imagemagick-commands.txt'

# lock PC when using i3
alias lock='. ~/scripts/i3lock.sh'

# shows current mac address
alias mac='macchanger -s enp4s0'

# get your IP by just typing "myip"
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# lists personal fav nmap commands
alias nmapcommands='drop && cat ./Programs/LINUX/nmap-commands.txt'

# nvim config shortcut
alias nvimrc='nvim ~/.config/nvim/init.vim' 

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
# alias quartus='(~/altera/13.0sp1/quartus/bin/quartus --64bit &)'

# for mispellings of "ranger"
alias ragner='ranger'
alias rg='ranger'

# shortcut for reboot
alias reboot='sudo reboot'

# remove 
alias remove='sudo pacman -Rs'

# rename multiple files in sequential order
alias renamem='j=1;for i in *.jpg; do mv "$i" "$j".jpg; let j=j+1;done'

# restart the network for LinuxMint 17.2 when troubleshooting
alias restartnetwork='sudo systemctl restart NetworkManager.service'

# Print out warnings from RKHunter (rootkit malware detection)
# alias rootkit='sudo rkhunter -c --enable all --disable none --rwo'

# Remove all EXIF data from files
# alias scrubexif='for i in *.jpg; do echo "Processing $i"; exiftool -all= "$i"; done'

# shredding program more secure then secure-delete
alias shred='srm -v'

# shortcut for shutdown
alias shutdown='sudo shutdown -h now'

# check internet speeds!
alias speedtest='speedtest-cli'

# fix broken spotify
alias spotify='nohup spotify --force-device-scale-factor=1.0000001 &>/dev/null &'

# For opening Tor in background subshell
alias tor='(/usr/bin/tor-browser-en &)'

# VPN - US-east
alias vpn1='sudo openvpn --config /etc/openvpn/US_East.conf'

# VPN - Swiss
alias vpn2='sudo openvpn --config /etc/openvpn/Switzerland.conf'

# convert jpgs to 30% size and 90% of quality
alias webconvert='for file in *.jpg; do convert "$file" -quality 90 -resize 30% "web_$file"; done'

# reload zshrc changes w/out exiting terminal session
alias zshreload="source ~/.zshrc"

# so the terminal app "ranger" can open new terminal in last directory
cd "$AUTOCD"
