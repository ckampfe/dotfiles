if [[ $PWD == $HOME ]]; then
    cd ~/code
fi

export PATH="$HOME/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin"
export PATH=/opt/homebrew/bin:$PATH
export JAVA_HOME="$(/usr/libexec/java_home)"
export PATH=/Users/clark/.mix/escripts:$PATH
export PATH="/Applications/Emacs.app/Contents/MacOS:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
# export PATH=$PATH:$HOME/code/elixir-ls/release
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
# DAWN: for PIC
export PATH="$PATH:/Applications/microchip/xc8/v2.36/bin"
export PATH="$PATH:/Applications/microchip/xc16/v2.00/bin"
export PATH="/opt/homebrew/opt/goawk/bin:$PATH"

# node
# export PATH=~/.nvm/versions/node/v12.22.12/bin:$PATH
# export NVM_DIR=~/.nvm
# [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use

export TERM=screen-256color

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
setopt share_history
setopt inc_append_history
eval $(fc -A)

# ruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.2.2

# misc
alias tmux="TERM=xterm-256color tmux"
alias be='bundle exec '
alias mylocalip='ifconfig | grep 192'
alias vim='nvim '
alias ls="eza -l"
alias l="eza -la"
# alias diff='colordiff '
alias youp3="youtube-dl -x --audio-format mp3 "
alias worklog="vim ~/code/dawn/work.md"
alias zedit="vim ~/.zshrc; source ~/.zshrc"

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
alias github='/opt/homebrew/opt/gh/bin/gh'
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
alias mt='mix test'

function repl() {
  if [[ ($1 == "-f") || ($1 == "--force") ]]
  then
    iex -e "Mix.install([:csv, :easyhtml, :jason, :nimble_parsec, :req, {:util, git: \"https://github.com/ckampfe/util.git\"}], force: true)"
  else
    iex -e "Mix.install([:csv, :easyhtml, :jason, :nimble_parsec, :req, {:util, git: \"https://github.com/ckampfe/util.git\"}])"
  fi
}

alias ee='elixir -e "Mix.install([:csv, :easyhtml, :explorer, :jason, :nimble_parsec, :req, {:util, git: \"https://github.com/ckampfe/util.git\"}])"'
alias eef='elixir -e "Mix.install([:csv, :easyhtml, :explorer, :jason, :nimble_parsec, :req, {:util, git: \"https://github.com/ckampfe/util.git\"}], force: true)"'

# function ee() {
#   if [[ ($1 == "-f") || ($1 == "--force") ]]
#   then
#     elixir -e "Mix.install([:csv, :easyhtml, :jason, :nimble_parsec, :req, {:util, git: \"https://github.com/ckampfe/util.git\"}], force: true)"
#   else
#     elixir -e "Mix.install([:csv, :easyhtml, :jason, :nimble_parsec, :req, {:util, git: \"https://github.com/ckampfe/util.git\"}])"
#   fi
# }

# rust
alias ltr="ls target/release"
alias cb="cargo build"
alias cbr="cargo build --release"
alias ct="cargo test"
alias ctr="cargo test --release"
alias ci="RUSTFLAGS=\"-C target-cpu=native\" cargo install --path . --force"
alias co="cargo outdated"
alias cu="cargo update"
alias ch="cargo check"
alias cl="cargo clippy"
alias build-linux="cross build --release --target=x86_64-unknown-linux-musl"

alias du="dust"
alias cat="bat"

# elixir/erlang
export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_DEFAULT_INSTALL_DIR="$HOME/kerl"
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
export PATH="$PATH:/Users/clark/code/elixir/bin"

# . /Users/clark/kerl/24.2-builtdocs/activate
# . /Users/clark/kerl/24.2.1-builtdocs/activate
# . /Users/clark/kerl/24.3.1-builtdocs/activate
# . /Users/clark/kerl/25.0-builtdocs/activate
# . /Users/clark/kerl/25.0.1-builtdocs/activate
# . /Users/clark/kerl/25.0.2-builtdocs/activate
# . /Users/clark/kerl/25.0.3-builtdocs/activate
# . /Users/clark/kerl/25.0.4-builtdocs/activate
# . /Users/clark/kerl/25.1.1-builtdocs/activate
# . /Users/clark/kerl/25.1.2-builtdocs/activate
# . /Users/clark/kerl/25.2-builtdocs/activate
# . /Users/clark/kerl/25.2.1-builtdocs/activate
# . /Users/clark/kerl/25.3-builtdocs/activate
# . /Users/clark/kerl/25.3.1-builtdocs/activate
# . /Users/clark/kerl/25.3.2-builtdocs/activate
# . /Users/clark/kerl/25.3.2.1-builtdocs/activate
# . /Users/clark/kerl/25.3.2.2-builtdocs/activate
# . /Users/clark/kerl/26.0-rc1-builtdocs/activate
# . /Users/clark/kerl/26.0-rc3-builtdocs/activate
# . /Users/clark/kerl/26.0-builtdocs/activate
# . /Users/clark/kerl/26.0.1-builtdocs/activate
. /Users/clark/kerl/26.0.2-builtdocs/activate



alias youtube-dl="yt-dlp"


# kerl: build the given erlang version
function kbuild {
  export KERL_BUILD_DOCS=yes
  kerl build $1 $1-builtdocs && kerl install $1-builtdocs ~/kerl/$1-builtdocs
  unset KERL_BUILD_DOCS
}

# kerl: build erlang from master branch
function kbuild_master {
KERL_BUILD_DOCS=yes kerl build git https://github.com/erlang/otp.git master 25.0_master-builtdocs && kerl install 25.0_master-builtdocs ~/kerl/25.0_master-builtdocs
}

# extract frames from a video to individual image files.
# usage: toImgs [movie path] [prefix for output files]
function toImgs() {
    # the "-r 7" says dump 7 images per second of video.
    # You can increase or decrease 'r N' as necessary.
    ffmpeg -i "$1" -r 7 -qscale:v 2 "$2"-%0000d.jpg
}

# create a compressed tar with zstd compression
function ztar() {
  tar --zstd -cf $1 $2
}

function update-rust-analzyer() {
  curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-aarch64-apple-darwin.gz | gunzip -c - > ~/.cargo/bin/rust-analyzer
  chmod +x ~/.cargo/bin/rust-analyzer
}


# use brew sqlite
export SHELL="/bin/zsh"

# prompt
eval "$(starship init zsh)"


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"


export IDF_PATH="/Users/clark/code/esp-idf"
# export PATH="/Users/clark/code/esp-idf:$PATH"

