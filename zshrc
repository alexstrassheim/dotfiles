# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#===========================================================
# Settings and History
DISABLE_AUTO_TITLE="true"
ZSH_AUTOSUGGEST_USE_ASYNC=true
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALLDUPS
export HISTTIMEFORMAT="[%F %T] "
alias history="history -E"
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

#===========================================================
# Language
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR='nvim'
[ -z "$TMUX" ] && export TERM=alacritty

#===========================================================
# Neovim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

#===========================================================
# Settings for bindkey
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey -M viins 'jk' vi-cmd-mode
bindkey "^?" backward-delete-char
bindkey "^ " autosuggest-accept
bindkey '^f' vi-forward-word
bindkey '^l' clear-screen

#===========================================================
# ranger settings
# bindkey '^f' ra'^m'
function ra {
  tempfile="$(mktemp -t tmp.XXXXXX)"
  if [[ `uname` == 'Darwin' ]]; then
    /opt/homebrew/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  else
    /opt/homebrew/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  fi
  test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
      cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
  }

#===========================================================
# Public alias
alias lls="ls -la | grep ^l"
alias ll="ls -la"
alias ls=exa
alias watchdata="watch -n 1 grep -e Dirty: -e  Writeback: /proc/meminfo"

#===========================================================
# PATHS
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

if [ -f ~/.zshrc_contents/private ]; then
  . ~/.zshrc_contents/private
fi

FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit && compinit -i

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

export ANDROID_SDK=${HOME}/Library/Android/sdk
export PATH="${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools:${PATH}"

# [[ -d "${HOME}/.local/bin" ]] && export PATH="$PATH:${HOME}/.local/bin"
# alias python='/opt/homebrew/bin/python3'
# export PATH="/usr/local/sbin:$PATH"
# export PATH="/usr/local/opt/inetutils/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# export PATH="/usr/local/opt/node@14/bin:$PATH"
# export PATH="$PATH:${HOME}/.local/bin"

