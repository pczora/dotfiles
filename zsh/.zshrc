if [ "$TMUX" = "" ]; then tmux; fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"
export EDITOR=vim

# Example aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias vimconfig="$EDITOR ~/.vimrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

fr() {
  candidates=$(find ~/repos/synaos -maxdepth 1 -type d & find ~/repos -maxdepth 1 -type d)
  repo=$(echo $candidates | fzf)
  cd $repo
}

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(battery git themes github colorize cp vagrant mvn kubectl helm gradle z zsh-autosuggestions pyenv colored-man-pages aws fzf)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=$HOME/bin:$HOME/.bin:$HOME/.local/bin:$PATH


export LANG=en_US.UTF-8

alias vp='vagrant provision'
alias vu='vagrant up'
alias vs='vagrant ssh'

alias g='git'
alias gs='git status'
alias gpl='git pull'
alias gps='git push'
alias gc='git commit'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function gfc() { git checkout "$(git branch -a | fzf | tr -d '[:space:]')" }

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

export PATH="$HOME/.yarn/bin:$PATH"

if [[ `uname` == "Darwin" ]]; then
  export GOROOT="$(brew --prefix golang)/libexec"
else 
  export GOROOT="/opt/go"
fi

export GOPATH="$HOME/go"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then source '/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then source '/opt/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U compinit
compinit

PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH" 

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc
function gi() { curl -sLw n https://www.gitignore.io/api/$@ ;}

eval $(thefuck --alias)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_VERSION_SHOW=false
SPACESHIP_RPROMPT_ORDER=(
  kubectl
  )
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  golang        # Go section
  rust          # Rust section
#  docker        # Docker section
  aws           # Amazon Web Services section
#  gcloud        # Google Cloud Platform section
  #venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
