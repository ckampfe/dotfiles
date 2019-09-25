# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM=screen-256color

# source ~/.profile
# fpath+=~/.zfunc

source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh

# Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme mh

# Tell antigen that you're done.
antigen apply

# null out the RPROMPT because we're showing git info on the regular PROMPT
RPROMPT=''

PROMPT="[%{$fg[$NCOLOR]%}%{$fg[red]%}%30<...<%~%<<%{$reset_color%}]"'$(git_prompt_info)'$'\n'"$fg[blue]%B%n%b%(!.#.$)> "

alias tmux="TERM=xterm-256color tmux"
alias ala="alacritty"
alias be='bundle exec '
alias berc='bundle exec rake console'
alias mylocalip='ifconfig | grep 192'
alias v='vim '
alias vim='nvim '
alias e='exa -la '
alias diff='colordiff '
alias zshconfig="vim ~/.zshrc"
alias youp3="youtube-dl -x --audio-format mp3 "

# scala
alias scala='scala -Dscala.color '
alias sbt-ass="sbt assembly"

# git
alias gpom='echo "git pull origin master"; git pull origin master'
alias gfrom='echo "git fetch; git rebase origin/master"; git fetch; git rebase origin/master'
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

# elm
alias elm-make="elm make"

# export MANPATH="/usr/local/man:$MANPATH"
# export MANPATH=$MANPATH:/usr/local/opt/erlang/lib/erlang/man
export EDITOR='nvim'


# rust
export PATH="$HOME/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
alias cb="cargo build"
alias cbr="cargo build --release"
alias ct="cargo test"
alias ctr="cargo test --release"


# ruby
# look for rubies in ~/.rubies
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
  source /usr/local/share/chruby/chruby.sh
fi
source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby-2.5

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi

GPG_TTY=$(tty)
export GPG_TTY

# elixir/erlang
export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_DEFAULT_INSTALL_DIR="$HOME/kerl"
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
function xx() {
  pushd $HOME/code/dotfiles/exshell \
    && iex "$@" -S mix \
    && popd
}
# . ~/kerl/21.3-builtdocs/activate

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

export GOPATH=$HOME/code/gocode
export PATH=$PATH:$GOPATH/bin

# export BOOT_JVM_OPTIONS="--add-modules java.xml.bind"

# graalvm
export PATH="/Users/clark/Downloads/graalvm-ce-19.2.0.1/Contents/Home/bin:$PATH"
export GRAALVM_HOME="/Users/clark/Downloads/graalvm-ce-19.2.0.1/Contents/Home"

# use brew sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export SHELL="/usr/local/bin/zsh"

# OPAM configuration
# . /Users/clark/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# opam configuration
test -r /Users/clark/.opam/opam-init/init.zsh && . /Users/clark/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PATH="/usr/local/opt/qt/bin:$PATH"

# python
VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3'
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

alias q='QHOME=~/q rlwrap -r ~/q/q'

alias view_cap="open http://localhost:5000/entries"
alias vc="open http://localhost:5000/entries"

# node version manager
eval "$(nodenv init -)"

# docker
# export DOCKER_TLS_VERIFY="1"
# export DOCKER_HOST="tcp://192.168.99.100:2376"
# export DOCKER_CERT_PATH="/Users/clark/.docker/machine/machines/default"
# export DOCKER_MACHINE_NAME="default"
# Run this command to configure your shell:
# eval $(docker-machine env default)



# Wasmer
export WASMER_DIR="/Users/clark/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"  # This loads wasmer
