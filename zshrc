# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="gentoo"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Pluginlist
plugins=(git colored-man mosh)

source $ZSH/oh-my-zsh.sh

#--------
# History
#--------
HISTFILE=~/.zhistory
setopt APPEND_HISTORY
HISTSIZE=10000
SAVEHIST=10000
# setopt HIST_EXPIRE_DUPS_FIRST
# setopt EXTENDED_HISTORY
# setopt SHARE_HISTORY

#---------
# Language
#---------
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR='vim'

# source ~/.zshrc_contents/private

# list all symbolic links in current directory
alias lls="ls -la | grep ^l"

# OS specific
if [[ `uname` == 'Darwin' ]]; then
  # MacOS
  export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/texbin:/usr/local/bin:/usr/local/sbin:/usr/local/MacGPG2/bin:/opt/X11/bin:/opt/coolTools:/opt/itnl:${HOME}/.gem/ruby/2.2.1/bin:${HOME}/.rubies/ruby-2.2.1/lib/ruby/gems/2.2.0/bin:${HOME}/.rubies/ruby-2.2.1/bin:$PATH"

  # Ruby
    # source /usr/local/share/chruby/chruby.sh
    # source /usr/local/share/chruby/auto.sh
    # chruby ruby-2.1.7

    [[ -d "${HOME}/.bin" ]] && export PATH="${HOME}/.bin:${PATH}"

    export PATH="/usr/local/bin/:$PATH"

    # ixon
    alias vim="stty stop '' -ixoff ; vim"

else
  # Linux
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$PATH"

    export TERM=xterm-256color

    # Ruby
    # PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
    source /usr/share/chruby/chruby.sh
    # source /usr/share/chruby/auto.sh
    # chruby ruby-2.1.3

    # script path
    [[ -d "${HOME}/.bin" ]] && export PATH="${HOME}/.bin:${PATH}"

    # keychain
    eval `keychain --eval --quiet --nogui --agents ssh --confhost id_rsa`

    # ixon
    stty -ixon
    screenfetch
fi

function ra {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}
# This binds Ctrl-O to ranger-cd:
bindkey '^o' ra'^m'

