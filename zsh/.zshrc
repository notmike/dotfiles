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
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS

# Set Ranger to not use default settings
export RANGER_LOAD_DEFAULT_RC=false

# SSH works better
export TERM=xterm-256color

export PATH=$HOME/bin:/usr/local/bin:/opt/altera/quartus/bin:/opt/altera/modelsim_ase/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR=vim
export VIMRUNTIME=/usr/share/vim/vim80
#export VIMRUNTIME=/usr/share/nvim/runtime


# Start new ranger instance only if it is not running in current shell
rg() {
    if [ -z "$RANGER_LEVEL" ]
    then
        ranger
    else
        exit
    fi
}


# Convenient c templates created in /tmp directory
throwaway_c() {
	local tdir=$(mktemp -d /tmp/deleteme-XXX)
	cd $tdir
	cp ~/.vim/skeletons/skeleton.make Makefile
	cat > test.c <<"EOF"
#include <stdio.h>
#include <stdlib.h>

int main() {
	return 0;
}
EOF
	vim test.c
}


# Convenient c++ templates created in /tmp directory
throwaway_cpp() {
  local tdir=$(mktemp -d /tmp/deleteme-XXX)
  cd $tdir
  sed -e 's/LD\s*:=.*$/LD       := $(CXX)/' \
   < ~/.vim/skeletons/skeleton.make > Makefile
  cat > test.cpp <<"EOF"
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
using namespace std;

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
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;35m") \
			man "$@"
}

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

# For using NPM and nodeJS packages
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# force Steam to use the Arch Package libs instead of the ones packaged w/ steam
STEAM_RUNTIME=0

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

# See what programs are using bandwidth
alias checknetwork='nethogs'

# Clean all the tmp folders
alias cleanup='bleachbit --clean system.cache system.localizations system.trash system.tmp'
alias cleanupsu='sudo bleachbit --clean system.cache system.localizations system.trash system.tmp'

#navigate to downloads folder
alias dl='cd /mnt/R2D2/Downloads/LINUXDLS'

#navigate to downloads folder
alias drop='cd /mnt/R2D2/Dropbox'

# Firefox aliases
alias ff='nohup firefox &>/dev/null &'
alias fp='nohup firefox -private &>/dev/null &'

# pretty grep
alias grep='grep --color=auto'

# test if gosharps server is up/alive (does 4 pings)
alias gsup='sudo hping3 -c 4 -V -S -p 80 162.243.210.220'

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
alias pw='python2 /mnt/R2D2/Dropbox/Programming/git/diceware/diceware-v2 -w 4 | xsel -i -b'
alias pw2='python2 /mnt/R2D2/Dropbox/Programming/git/diceware/diceware-v2 -w 1 | xsel -i -b'
alias pw3='python2 /mnt/R2D2/Dropbox/Programming/git/diceware/diceware-v2 -w 2 | xsel -i -b'
alias pw4='python2 /mnt/R2D2/Dropbox/Programming/git/diceware/diceware-v2 -w 3 | xsel -i -b'
alias pw5='python2 /mnt/R2D2/Dropbox/Programming/git/diceware/diceware-v2 -w 4 | xsel -i -b'
alias pw6='python2 /mnt/R2D2/Dropbox/Programming/git/diceware/diceware-v2 -w 5 | xsel -i -b'
alias pw7='python2 /mnt/R2D2/Dropbox/Programming/git/diceware/diceware-v2 -w 6 | xsel -i -b'
alias pw8='python2 /mnt/R2D2/Dropbox/Programming/git/diceware/diceware-v2 -w 7 | xsel -i -b'
alias pw9='python2 /mnt/R2D2/Dropbox/Programming/git/diceware/diceware-v2 -w 8 | xsel -i -b'
alias pw10='python2 /mnt/R2D2/Dropbox/Programming/git/diceware/diceware-v2 -w 9 | xsel -i -b'

# for running python scripts w/ 2.7
alias python2=/usr/bin/python2.7

# For opening Quartus
# alias quartus='(~/altera/13.0sp1/quartus/bin/quartus --64bit &)'

# for mispellings of "ranger"
# alias rg='ranger'

# shortcut for reboot
alias reboot='sudo reboot'

# remove package
alias remove='sudo pacman -Rs'

# remove colons from filenames (and replace w/ underscores)
alias removecolons='~/scripts/removecolon.sh'

# rename multiple files in sequential order
alias renamem='j=1;for i in *.jpg; do mv "$i" "$j".jpg; let j=j+1;done'

# restart the network for LinuxMint 17.2 when troubleshooting
alias restartnetwork='sudo systemctl restart NetworkManager.service'

# Print out warnings from RKHunter (rootkit malware detection)
# alias rootkit='sudo rkhunter -c --enable all --disable none --rwo'

# Remove all EXIF data from files
alias scrubexif='for i in *.jpg; do echo "Processing $i"; exiftool -all= "$i"; done'

# shredding program more secure then secure-delete
alias shred='srm -v'

# shortcut for shutdown
alias shutdown='sudo shutdown -h now'

# check internet speeds!
alias speedtest='speedtest-cli'

# For opening Tor in background subshell
alias tor='(/usr/bin/tor-browser-en &)'

# edit vim rc file quickly
alias vimrc='vim ~/dotfiles/vim/.vimrc'

# convert jpgs to 30% size and 90% of quality
alias webconvert='for file in *.jpg; do convert "$file" -quality 90 -resize 30% "web_$file"; done'

# reload zshrc changes w/out exiting terminal session
alias zshreload="source ~/.zshrc"

# so the terminal app "ranger" can open new terminal in last directory
cd "$AUTOCD"
