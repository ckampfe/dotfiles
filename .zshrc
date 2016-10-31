# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM=screen-256color

source $(brew --prefix)/share/antigen/antigen.zsh
# source /usr/local/share/zsh/site-functions/_aws
antigen use oh-my-zsh

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme mh

# Tell antigen that you're done.
antigen apply

# null out the RPROMPT because we're showing git info on the regular PROMPT
RPROMPT=''

PROMPT="[%{$fg[$NCOLOR]%}%{$fg[red]%}%30<...<%~%<<%{$reset_color%}]"'$(git_prompt_info)'$'\n'"$fg[blue]%B%n%b%(!.#.$)> "

alias tmux="TERM=xterm-256color tmux"
alias be='bundle exec '
alias berc='bundle exec rake console'
alias mylocalip='ifconfig | grep 192'
alias v='vim '
alias vim='nvim '
alias e='emacs '
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

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin"

export MANPATH="/usr/local/man:$MANPATH"
export MANPATH=$MANPATH:/usr/local/opt/erlang/lib/erlang/man
export EDITOR='nvim'

# ruby
# look for rubies in ~/.rubies
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
  source /usr/local/share/chruby/chruby.sh
fi
source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby-2.3

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi

GPG_TTY=$(tty)
export GPG_TTY

