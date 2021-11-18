# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH completions
autoload -Uz compinit
  compinit

#  if type brew &>/dev/null; then
#     FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
#
#     autoload -Uz compinit
#     compinit
#   fi
  zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

#===========================================================
#                   Settings for bindkey
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey -M viins 'jk' vi-cmd-mode
bindkey "^?" backward-delete-char
bindkey "^ " autosuggest-accept
bindkey '^f' vi-forward-word
bindkey '^l' clear-screen

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
ZSH_AUTOSUGGEST_USE_ASYNC=true
CASE_SENSITIVE="false"


#===========================================================
#                          History

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# setopt APPEND_HISTORY
# setopt SHARE_HISTORY

setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY

setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALLDUPS

alias history="history -E"


#===========================================================
#                     Neovim

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

#===========================================================
#                          Language

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR='nvim'

#===========================================================
#                       private stuff

[ -z "$TMUX" ] && export TERM=alacritty
[[ -d "${HOME}/.local/bin" ]] && export PATH="$PATH:${HOME}/.local/bin"

if [ -f ~/.zshrc_contents/private ]; then
  . ~/.zshrc_contents/private
fi

#===========================================================
#                 OS specific settings

if [[ `uname` == 'Darwin' ]]; then
  # MacOS
  alias python='/usr/local/bin/python3'
  export PATH="/usr/local/sbin:$PATH"
  export PATH="/usr/local/opt/inetutils/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  # export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
  # export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
  # export PATH="/usr/local/opt/node@14/bin:$PATH"
fi

#===========================================================
#                     ranger settings

# bindkey '^f' ra'^m'
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
#                       Public alias

alias lls="ls -la | grep ^l"
alias ll="ls -la"
alias ls=exa
alias watchdata="watch -n 1 grep -e Dirty: -e  Writeback: /proc/meminfo"



fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
export PATH="/usr/local/opt/curl/bin:$PATH"

# Created by `userpath` on 2021-08-24 08:25:12
export PATH="$PATH:/Users/alex/.local/bin"
export PATH="/usr/local/opt/node@14/bin:$PATH"

export ANDROID_SDK=${HOME}/Library/Android/sdk
export PATH="${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools:${PATH}"
