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

export PATH="$HOME/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin"

# export MANPATH="/usr/local/man:$MANPATH"
# export MANPATH=$MANPATH:/usr/local/opt/erlang/lib/erlang/man
export EDITOR='nvim'


# rust
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

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

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

export GOPATH=$HOME/code/gocode
export PATH=$PATH:$GOPATH/bin


# export BOOT_JVM_OPTIONS="--add-modules java.xml.bind"

# graalvm
# export PATH="/usr/local/share/graalvm-1.0.0-rc1/Contents/Home/bin:$PATH"
# export PATH="/Users/clark/Downloads/graalvm-1.0.0-rc1/Contents/Home/bin:$PATH"
# export PATH="/Users/clark/Downloads/graalvm-ee-1.0.0-rc2/Contents/Home/bin:$PATH"
# export PATH="/Users/clark/Downloads/graalvm-ee-1.0.0-rc3/Contents/Home/bin:$PATH"
# export PATH="/Users/clark/Downloads/graalvm-ee-1.0.0-rc4/Contents/Home/bin:$PATH"
# export PATH="/Users/clark/Downloads/graalvm-ce-1.0.0-rc5/Contents/Home/bin:$PATH"
# alias node="node --jvm"

# use brew sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"
