# Path to your oh-my-zsh installation.
export ZSH=/home/lex/.oh-my-zsh
ZSH_THEME="avit"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode git gitignore tmuxinator rails ruby colored-man)

#-------------------
# User configuration
#-------------------
# Linux
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

# OSX
# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin":$PATH
# export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
#
# export MANPATH="/usr/local/man:$MANPATH"

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

#-----
# Ruby
#-----
# Linux
source /usr/share/chruby/chruby.sh

# OSX
# source /usr/local/opt/chruby/share/chruby/chruby.sh
# # source /usr/local/share/chruby/chruby.sh
# source /usr/local/share/chruby/auto.sh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

#----------------
# Custom settings
#----------------
alias vim="stty stop '' -ixoff ; vim"
stty -ixon
screenfetch
# source .zshrc_contents/private
source .zshrc_contents/aliases
