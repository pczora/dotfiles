# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dracula"

export EDITOR=vim

# Example aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
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
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(battery git themes github osx colorize brew cp vagrant mvn kubectl gradle z)

source $ZSH/oh-my-zsh.sh

export GOROOT="/opt/golang"
export GOPATH="/home/pczora/code/go"
# Customize to your needs...

export PATH=$GOROOT/bin:$GOPATH/bin:/Users/pczora/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin/usr/texbin:$PATH:~/.bin
#export GOPATH=/usr/local/go/bin

# macOS specific configuration
if [[ `uname` == 'Darwin' ]]
then
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
  export PATH=$JAVA_HOME/bin:$PATH
  source /Users/pczora/google-cloud-sdk/path.zsh.inc
  source /Users/pczora/google-cloud-sdk/completion.zsh.inc
fi

export LC_ALL=de_DE.UTF-8
export LANG=en_US.UTF-8

deb_update() {
  print "=== Update package lists ==="
  sudo apt-get update
}

deb_upgrade() {
  deb_update
  print "=== Upgrade system packages ==="
  sudo apt-get upgrade
}

deb_install() {
  sudo apt-get install $1
}

deb_search() {
  sudo apt-cache search $1
}

brew_update() {
  print "=== Update package lists ==="
  brew update
}

brew_upgrade() {
  brew_update
  print "=== Upgrade system packages ==="
  brew upgrade
}

brew_install() {
  brew install $1
}

brew_search() {
  brew search $1
}

generic_update() {
  if [[ `uname` == 'Darwin' ]]
  then
    brew_update
  elif [[ `uname -o` == 'GNU/Linux' ]]
  then
    deb_update
  fi
}

generic_upgrade() {
  if [[ `uname` == 'Darwin' ]]
  then
    brew_upgrade
  elif [[ `uname -o` == 'GNU/Linux' ]]
  then
    deb_upgrade
  fi
}

generic_install() {
  if [[ `uname` == 'Darwin' ]]
  then
    brew_install $1
  elif [[ `uname -o` == 'GNU/Linux' ]]
  then
    deb_install $1
  fi
}

generic_search() {
  if [[ `uname` == 'Darwin' ]]
  then
    brew_search $1
  elif [[ `uname -o` == 'GNU/Linux' ]]
  then
    deb_search $1
  fi
}

alias update=generic_update
alias upgrade=generic_upgrade
alias install=generic_install
alias search=generic_search

alias vp='vagrant provision'
alias vu='vagrant up'
alias vs='vagrant ssh'

alias g='git'
alias gs='git status'
alias gpl='git pull'
alias gps='git push'
alias gc='git commit'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}


export PATH="$HOME/.yarn/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
if [[ `uname` == 'Darwin' ]]
then
  export SDKMAN_DIR="/Users/pczora/.sdkman"
  [[ -s "/Users/pczora/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/pczora/.sdkman/bin/sdkman-init.sh"
fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then source '/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then source '/opt/google-cloud-sdk/completion.zsh.inc'; fi
