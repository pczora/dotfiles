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
plugins=(battery git themes github osx colorize brew cp vagrant mvn)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=/Users/pczora/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin/usr/texbin:$PATH
#export GOPATH=/usr/local/go/bin

# Java stuff
if [[ 'uname' == 'Darwin' ]]
then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
    export PATH=$JAVA_HOME/bin:$PATH
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


# TODO: Conditional use of functions based on OS
alias update=deb_update
alias upgrade=deb_upgrade
alias install=deb_install
# Custom Aliases
#alias thesis='cd /Users/pczora/Dropbox/Uni/Master/Masterthesis/'
#alias rdiary='cd /Users/pczora/Documents/researchdiary; jekyll build --watch &; jekyll serve &'
#alias vim=nvim

#alias duf='du -sk * | sort -n | perl -ne '\'($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
alias vp='vagrant provision'
alias vu='vagrant up'
alias vs='vagrant ssh'

alias g='git'
alias gpl='git pull'
alias gps='git push'
alias gc='git commit'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="/home/pcz/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
