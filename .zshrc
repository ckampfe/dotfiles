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
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export PATH="/opt/homebrew/opt/goawk/bin:$PATH"

export TERM=screen-256color

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
setopt share_history
setopt inc_append_history
eval $(fc -A)

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
    iex -e "Mix.install([:csv, :easyhtml, :explorer, :jason, :nimble_parsec, :req, {:util, git: \"https://github.com/ckampfe/util.git\"}], force: true)"
  else
    iex -e "Mix.install([:csv, :easyhtml, :explorer, :jason, :nimble_parsec, :req, {:util, git: \"https://github.com/ckampfe/util.git\"}])"
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

alias youtube-dl="yt-dlp"

function dl-video() {
  yt-dlp -f "bv*+ba/b" "$1"
}

function asmr() {
  pushd "/Users/clark/Downloads/asmr"
  dl-video "$1"
  popd
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

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

source /Users/clark/code/shelldb/shelldb.sh

. /opt/homebrew/opt/asdf/libexec/asdf.sh

