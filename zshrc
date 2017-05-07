# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="spaceship"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Pluginlist
plugins=(git colored-man vi-mode zsh-completions zsh-autosuggestions zsh-syntax-highlighting)


#===========================================================
#                       Theme Settings

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Disable <<<< when enter zsh vi insert mode
export RPS1="%{$reset_color%}"

source $ZSH/oh-my-zsh.sh


#===========================================================
#                          History

HISTFILE=~/.zhistory
# setopt APPEND_HISTORY
HISTSIZE=10000
SAVEHIST=10000
# setopt HIST_EXPIRE_DUPS_FIRST
# setopt EXTENDED_HISTORY
# setopt SHARE_HISTORY


#===========================================================
#                     Cover your tracks

# echo "" /var/log/auth.log
# echo "" ~/.bash_history
# rm ~/.bash_history -rf
# history -c
# export HISTFILESIZE=0
# export HISTSIZE=0
# unset HISTFILE
# ln /dev/null ~/.bash_history -sf


#===========================================================
#                          Language

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR='vim'


#=========================================================== 
#                 OS specific settings

if [[ `uname` == 'Darwin' ]]; then
    # MacOS

    # PATH
    export PATH="/usr/local/sbin/:$PATH"
    # Ruby

    # ixon
    alias vim="stty stop '' -ixoff ; vim"
else
   # Linux

     # ixon
     stty -ixon
     screenfetch
     source /usr/share/doc/pkgfile/command-not-found.zsh
fi


#===========================================================
#                       private stuff

source ~/.zshrc_contents/private
[[ -d "${HOME}/.local/bin" ]] && export PATH="${HOME}/.local/bin:${PATH}"
[ -z "$TMUX" ] && export TERM=xterm-256color


#===========================================================
#                       Public alias

alias lls="ls -la | grep ^l"
alias watchdata="watch -n 1 grep -e Dirty: -e  Writeback: /proc/meminfo"


#===========================================================
#                     ranger settings

function ra {
  tempfile="$(mktemp -t tmp.XXXXXX)"
  if [[ `uname` == 'Darwin' ]]; then
    /usr/local/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  else
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  fi
  test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
      cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
  }


#===========================================================
#                   Settings for bindkey

bindkey '^o' ra'^m'
bindkey -M viins 'jk' vi-cmd-mode
