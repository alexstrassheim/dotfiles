# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="candy"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Pluginlist
# plugins=(openssl git systemadmin colored-man mosh)
plugins=(colored-man)

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

[ -z "$TMUX" ] && export TERM=xterm-256color

# -------------
# private stuff
# -------------
source ~/.zshrc_contents/private

# --------------------------------------------
# list all symbolic links in current directory
# --------------------------------------------
alias lls="ls -la | grep ^l"
alias watch="watch -n 1 grep -e Dirty: -e  Writeback: /proc/meminfo"

# ------------------
# custom script path
# ------------------
[[ -d "${HOME}/.local/bin" ]] && export PATH="${HOME}/.local/bin:${PATH}"

# -----------
# OS specific
# -----------
if [[ `uname` == 'Darwin' ]]; then

    # PATH
    export PATH="/usr/local/sbin/:$PATH"
    # Ruby

    # ZSH completions
    fpath=(/usr/local/share/zsh-completions $fpath)

    # ixon
    alias vim="stty stop '' -ixoff ; vim"

else
   # Linux

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
