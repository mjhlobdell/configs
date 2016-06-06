#!/bin/bash

source ~/.git-completion.bash
source ~/.git-prompt.sh
source ~/.profile

alias gg="git status -s"
alias ll="ls -lah"
alias gt="git log --oneline --graph --color --all --decorate"
alias dockerqs="docker-machine start default; eval "$(docker-machine env default)""

################## SPOTIFY-CLI ####################
spotifyCli() {
  if [ $1 = "np" ]; then
    spotify-cli now-playing
  elif [ $1 = "pp" ]; then
    spotify-cli play-pause
  elif [ $1 = "p" ]; then
    spotify-cli previous
  elif [ $1 = "n" ]; then
    spotify-cli next
  elif [ $1 = "album" ] && [ $# -ge 2 ]; then
    spotify-cli play-album "${@:2}"
  elif [ $1 = "artist" ] && [ $# -ge 2 ]; then
    spotify-cli play-artist "${@:2}"
  elif [ $1 = "track" ] && [ $# -ge 2 ]; then
    spotify-cli play-track "${@:2}"
  else
    echo "error"
  fi
}
alias spot=spotifyCli

MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
BRIGHT_BLACK="\[\033[0;38m\]"
GIT_PS1_SHOWDIRTYSTATE=true

################### GLOBAL VARIABLES ###############
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export GOPATH=$HOME/Documents/go/workspace
export PATH=$PATH:$GOPATH/bin

export PS1=$MAGENTA"\u"$BRIGHT_BLACK" in "$GREEN"\w"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
      # a file has been modified but not added
      then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
      # a file has been added, but not commited
      then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
      # the state is clean, changes are commited
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$YELLOW" $"$BRIGHT_BLACK" "

# OPAM configuration
. /Users/michaellobdell/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
