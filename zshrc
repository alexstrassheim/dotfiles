# Path to your oh-my-zsh installation.
if [[ `uname` == 'Darwin' ]]; then
  # MacOS
    export ZSH=/Users/alex/.oh-my-zsh
else
  # Linux
    export ZSH=/home/lex/.oh-my-zsh
fi
ZSH_THEME="bira"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Pluginlist
plugins=(vi-mode git gitignore tmuxinator colored-man mosh)

source $ZSH/oh-my-zsh.sh

#--------
# History
#--------
HISTFILE=~/.zhistory
setopt APPEND_HISTORY
HISTSIZE=1200
SAVEHIST=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

#---------
# Language
#---------
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR='vim'


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-Tomorrow.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

source ~/.zshrc_contents/private

if [[ `uname` == 'Darwin' ]]; then
  # MacOS
    export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin":$PATH
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
    export MANPATH="/usr/local/man:$MANPATH"

   # Ruby
    source /usr/local/opt/chruby/share/chruby/chruby.sh
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh

    # ixon
    alias vim="stty stop '' -ixoff ; vim"
else
  # Linux
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
    # Ruby
    source /usr/share/chruby/chruby.sh

    # ixon
    stty -ixon
    screenfetch
fi
