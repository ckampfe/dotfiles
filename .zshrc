# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# ZSH_THEME="superjarin"
# ZSH_THEME="geoffgarside"
ZSH_THEME="mh"

# tmux alias
alias tmux="TERM=screen-256color-bce tmux"

# git/zsh aliases
 alias zshconfig="mate ~/.zshrc"
 alias ohmyzsh="mate ~/.oh-my-zsh"
 alias gs='git status '
 alias ga='git add '
 alias gb='git branch '
 alias gc='git commit'
 alias gd='git diff'
 alias go='git checkout '
 alias gk='gitk --all&'
 alias gx='gitx --all'
 alias got='git '
 alias get='git '

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew ruby rails rvm heroku github copydir last-working-dir)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/rvm/gems/ruby-1.9.3-p448/bin:/usr/local/rvm/gems/ruby-1.9.3-p448@global/bin:/usr/local/rvm/rubies/ruby-1.9.3-p448/bin/bin:/usr/local/rvm/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
# __rvm_project_rvmrc

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
