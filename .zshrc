# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM=screen-256color

source ~/antigen.zsh
source /usr/local/share/zsh/site-functions/_aws
antigen use oh-my-zsh

antigen-bundle git
antigen-bundle heroku
antigen-bundle command-not-found
antigen-bundle brew
antigen-bundle brew-cask
antigen-bundle osx

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme mh

# Tell antigen that you're done.
antigen apply

# null out the RPROMPT because we're showing git info on the regular PROMPT
RPROMPT=''

PROMPT="[%{$fg[$NCOLOR]%}%{$fg[red]%}%30<...<%~%<<%{$reset_color%}]""$(git_prompt_info)"$'\n'"$fg[blue]%B%n%b%(!.#.$)> "


alias tmux="TERM=xterm-256color tmux"
alias be='bundle exec '
alias berc='bundle exec rake console'
alias mylocalip='ifconfig | grep 192'
alias v='vim '
alias vim='nvim '
alias e='emacs '
# alias ls='ls -Glah ' # color
alias diff='colordiff '
alias zshconfig="vim ~/.zshrc"
alias youp3="youtube-dl -x --audio-format mp3 "

# scala
alias scala='scala -Dscala.color '
alias sbt-ass="sbt assembly"

# docker
alias dc='docker-compose '
alias fu='fig up'

# git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gh='git hist'
alias gco='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '

# elixir/mix
alias mc='mix compile'
alias mr='mix run'

# shell mode to vi
# bindkey -v


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx brew ruby rails heroku github copydir last-working-dir)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin"
export PATH=~/anaconda/bin:"$PATH"
# export PATH="/usr/local/openresty/nginx/sbin:$PATH"

export MANPATH="/usr/local/man:$MANPATH"
export MANPATH=$MANPATH:/usr/local/opt/erlang/lib/erlang/man
export EDITOR='vim'

# ruby
# look for rubies in ~/.rubies
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
  source /usr/local/share/chruby/chruby.sh
fi
source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby-2.0

# go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# python/anaconda
export DYLD_FALLBACK_LIBRARY_PATH=$HOME/anaconda/lib/:$DYLD_FALLBACK_LIBRARY_PATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#

# Docker
# export DOCKER_HOST=tcp://192.168.59.103:2376
# export DOCKER_CERT_PATH=/Users/clark/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1

# docker
export DOCKER_HOST=tcp://192.168.59.103:2375
unset DOCKER_CERT_PATH
unset DOCKER_TLS_VERIFY
