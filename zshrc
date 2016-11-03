# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh
# ZSH_THEME="candy"
ZSH_THEME="arrow"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Pluginlist
plugins=(nmap git colored-man mosh)

source $ZSH/oh-my-zsh.sh

#--------
# History
#--------
HISTFILE=~/.zhistory
# setopt APPEND_HISTORY
HISTSIZE=10000
SAVEHIST=10000
# setopt HIST_EXPIRE_DUPS_FIRST
# setopt EXTENDED_HISTORY
# setopt SHARE_HISTORY

#------------------
# Cover your tracks
#------------------
# echo "" /var/log/auth.log
# echo "" ~/.bash_history
# rm ~/.bash_history -rf
# history -c
# export HISTFILESIZE=0
# export HISTSIZE=0
# unset HISTFILE
# ln /dev/null ~/.bash_history -sf

#---------
# Language
#---------
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR='vim'

# export TERM=xterm-256color
export TERM=tmux-256color

# -------------
# private stuff
# -------------
source ~/.zshrc_contents/private

# --------------------------------------------
# list all symbolic links in current directory
# --------------------------------------------
alias lls="ls -la | grep ^l"

# -----------
# OS specific
# -----------
if [[ `uname` == 'Darwin' ]]; then

    # Ruby
    source /usr/local/share/chruby/chruby.sh

    # ixon
    alias vim="stty stop '' -ixoff ; vim"

else
   # Linux


    # Theos
    export PATH="${HOME}/Pentesttools/theos/toolchain/linux/iphone/bin/:$PATH"
    export THEOS=${HOME}/Pentesttools/theos
    export THEOS_DEVICE_IP=localhost THEOS_DEVICE_PORT=2222

    # Ruby
    source /usr/share/chruby/chruby.sh
    source /usr/share/chruby/auto.sh

    # script path
    # [[ -d "${HOME}/.local/bin" ]] && export PATH="${HOME}/.local/bin:${PATH}"

    # keychain
    # eval 'keychain --eval --quiet --nogui --agents ssh --confhost id_rsa'
    eval $(keychain --eval --quiet id_rsa --confhost)

     # ixon
     stty -ixon
     screenfetch

     source /usr/share/doc/pkgfile/command-not-found.zsh
fi

# ------
# ranger
# ------
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
# This binds Ctrl-O to ranger-cd:
bindkey '^o' ra'^m'
