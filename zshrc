# Path to your oh-my-zsh installation.
if [[ `uname` == 'Darwin' ]]; then
  # MacOS
  export ZSH=/Users/$(whoami)/.oh-my-zsh
else
  # Linux
  export ZSH=/home/$(whoami)/.oh-my-zsh
fi
ZSH_THEME="bira"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Pluginlist
plugins=(git gitignore tmuxinator colored-man mosh)

source $ZSH/oh-my-zsh.sh

#--------
# History
#--------
HISTFILE=~/.zhistory
setopt APPEND_HISTORY
HISTSIZE=3000
SAVEHIST=3000
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
BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

source ~/.zshrc_contents/private

if [[ `uname` == 'Darwin' ]]; then
  # MacOS
  export PATH="/Users/$(whoami)/.gem/ruby/2.2.1/bin:/Users/$(whoami)/.rubies/ruby-2.2.1/lib/ruby/gems/2.2.0/bin:/Users/$(whoami)/.rubies/ruby-2.2.1/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/coolTools:/opt/itnl:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/usr/texbin:/usr/local/sbin:/usr/X11/bin:/opt/coolTools:/opt/itnl"
   
  # Ruby
    source /usr/local/share/chruby/chruby.sh
    # source /usr/local/opt/chruby/share/chruby/chruby.sh
    # source /usr/local/share/chruby/auto.sh

    # ixon
    alias vim="stty stop '' -ixoff ; vim"

else
  # Linux
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

    # Ruby
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
    source /usr/share/chruby/chruby.sh
    # source /usr/share/chruby/auto.sh

    # script path
    [[ -d "${HOME}/.bin" ]] && export PATH="${HOME}/.bin:${PATH}"

    # ixon
    stty -ixon
    screenfetch
fi

