# Path to your oh-my-zsh installation.
export ZSH=/home/lex/.oh-my-zsh
ZSH_THEME="bira"

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
plugins=(git rails ruby colored-man)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='vim'

screenfetch
stty -ixon 
source .zshrc_contents/aliases

# Theos
export THEOS=/opt/theos
# export THEOS_DEVICE_IP=example.local THEOS_DEVICE_PORT=22

# Ruby
source /usr/share/chruby/chruby.sh
