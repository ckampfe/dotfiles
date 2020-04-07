if [[ $PWD == $HOME ]]; then
    cd ~/code
fi

# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh
export TERM=screen-256color

export HISTFILE=~/.zsh_history
setopt share_history
setopt inc_append_history
eval $(fc -A)

alias tmux="TERM=xterm-256color tmux"
alias be='bundle exec '
alias berc='bundle exec rake console'
alias mylocalip='ifconfig | grep 192'
alias v='vim '
alias vim='nvim '
alias ls="exa -l"
alias l="exa -la"
alias diff='colordiff '
alias youp3="youtube-dl -x --audio-format mp3 "

alias ..="cd .."
alias ...="cd ..; cd .."

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

# docker
alias docker-gc="docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock spotify/docker-gc"

# elixir/mix
alias mc='mix compile'
alias mr='mix run'

# elm
alias elm-make="elm make"

export EDITOR='emacs'

# rust
export PATH="$HOME/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
alias cb="cargo build"
alias cbr="cargo build --release"
alias ct="cargo test"
alias ctr="cargo test --release"
alias ci="cargo install --path . --force"

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi

alias du="dust"

GPG_TTY=$(tty)
export GPG_TTY

# elixir/erlang
export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_DEFAULT_INSTALL_DIR="$HOME/kerl"
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# . ~/kerl/21.3-builtdocs/activate

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

export GOPATH=$HOME/code/gocode
export PATH=$PATH:$GOPATH/bin

# export BOOT_JVM_OPTIONS="--add-modules java.xml.bind"

# graalvm
export PATH="/Users/clark/Downloads/graalvm-ce-java8-20.0.0/Contents/Home/bin:$PATH"
export GRAALVM_HOME="/Users/clark/Downloads/graalvm-ce-java8-20.0.0/Contents/Home"


# use brew sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export SHELL="/usr/local/bin/zsh"

alias view_cap="open http://localhost:5000/entries"
alias vc="open http://localhost:5000/entries"

# Wasmer
export WASMER_DIR="/Users/clark/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"  # This loads wasmer

# prompt
eval "$(starship init zsh)"

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"

# node
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# python/conda
export PATH="/Users/clark/miniconda3/bin:$PATH"

