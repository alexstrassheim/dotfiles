# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="agnoster"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Pluginlist
plugins=(git gitignore tmuxinator colored-man mosh)
# plugins=(git rails textmate ruby osx bundler brew github gem node npm rvm rails3 svn)

source $ZSH/oh-my-zsh.sh

#--------
# History
#--------
HISTFILE=~/.zhistory
setopt APPEND_HISTORY
HISTSIZE=201000
SAVEHIST=201000
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

# list all symbolic links in current directory
alias lls="ls -la | grep ^l"

if [[ `uname` == 'Darwin' ]]; then
  # MacOS
  export PATH="${HOME}/.gem/ruby/2.2.1/bin:${HOME}/.rubies/ruby-2.2.1/lib/ruby/gems/2.2.0/bin:${HOME}/.rubies/ruby-2.2.1/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/coolTools:/opt/itnl:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/usr/texbin:/usr/local/sbin:/usr/X11/bin:/opt/coolTools:/opt/itnl:$PATH"
   
  # Ruby
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
    chruby ruby-2.1.7

    # . $HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

    screenfetch

    # ixon
    alias vim="stty stop '' -ixoff ; vim"

else
  # Linux
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$PATH"

    # Ruby
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
    source /usr/share/chruby/chruby.sh
    source /usr/share/chruby/auto.sh
    chruby ruby-2.2.2

    # . /usr/share/zsh/site-contrib/powerline.zsh

    # script path
    [[ -d "${HOME}/.bin" ]] && export PATH="${HOME}/.bin:${PATH}"

    eval `keychain --eval --quiet --nogui --confhost  id_rsa_rootserver`
    # eval $(gnome-keyring-daemon)
    # export SSH_AUTH_SOCK


    # ixon
    stty -ixon
    screenfetch
fi

prompt_context () { }
