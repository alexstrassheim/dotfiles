# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
ZSH_AUTOSUGGEST_USE_ASYNC=true

# Pluginlist
plugins=(colored-man-pages tmux history git vi-mode)

#===========================================================
#                       Theme Settings

export RPS1="%{$reset_color%}"
source $ZSH/oh-my-zsh.sh

#===========================================================
#                          History

HISTFILE=~/.zhistory
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY

#===========================================================
#                     Cover your tracks

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
  # alias python='python3'
  export PATH="$PATH:/usr/local/sbin"
  export PATH="/usr/local/opt/inetutils/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
  export PATH="/usr/local/opt/node@14/bin:$PATH"
fi

#===========================================================
#                     ranger settings

bindkey '^f' ra'^m'
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

# if [[ $TERM == xterm-termite ]]; then
#   . /etc/profile.d/vte.sh
#   __vte_osc7
# fi

#===========================================================
#                       Public alias

alias lls="ls -la | grep ^l"
alias ls=exa
alias watchdata="watch -n 1 grep -e Dirty: -e  Writeback: /proc/meminfo"


#===========================================================
#                   Settings for bindkey

bindkey -M viins 'jk' vi-cmd-mode
bindkey "^@" autosuggest-accept
# bindkey '^f' vi-forward-blank-word
bindkey '^f' vi-forward-word
bindkey '^l' clear-screen

fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export THEOS=~/theos
export PATH=$THEOS/bin:$PATH
export THEOS_DEVICE_IP=localhost THEOS_DEVICE_PORT=2222

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
