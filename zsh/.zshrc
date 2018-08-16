# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh

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
ZSH_CUSTOM=~/.config/oh-my-zsh/custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sublime per-directory-history archlinux common-aliases emoji extract torrent colorize zsh-autosuggestions fast-syntax-highlighting)
# ******** For ZSH-AutoSuggestions and Fast-Syntax-Highlighting, need to git clone those into the custom/plugins folder  **********************
# AutoSuggestions Plugin -- https://github.com/zsh-users/zsh-autosuggestions
# Fast-Syntax-Highlighting Plugin -- https://github.com/zdharma/fast-syntax-highlighting

# User configuration

# History
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS

# Set Ranger to not use default settings
export RANGER_LOAD_DEFAULT_RC=false
export GOPATH=$HOME/go
export PATH=$HOME/bin:/usr/local/bin:$GOPATH/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export VISUAL=nvim
export EDITOR=nvim
#export VIMRUNTIME=/usr/share/vim/vim80
export VIMRUNTIME=/usr/share/nvim/runtime

# SSH works better when $TERM = xterm-256color
# export TERM=xterm-256color
export TERM=xterm-termite

# Allow for starting new window w/ CWD when pressing Ctrl+Shift+t
# originally we check for $TERM == xterm-termite  but since we changed the
# $TERM value above, I adjusted here
if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

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
  $EDITOR test.c
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
$EDITOR test.cpp
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

## ############# ====== ALIAS ======= #############
#
#  ALIAS SHORTCUTS ARE LOCATED IN $ZSH_CUSTOM folder
# source $ZSH_CUSTOM/.aliases
#
###################################################

# so the terminal app "ranger" can open new terminal in last directory
cd "$AUTOCD"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH="/home/mg/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/mg/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/mg/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/mg/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/mg/perl5"; export PERL_MM_OPT;

# Unbreak Pycharm in BSPWM (https://wiki.archlinux.org/index.php/Dwm#Fixing_misbehaving_Java_applications)
export _JAVA_AWT_WM_NONREPARENTING=1

# Android Studio Exports
export ANDROID_HOME=/home/mg/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

