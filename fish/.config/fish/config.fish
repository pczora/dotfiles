if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pyenv setup
if type -q pyenv
  status --is-interactive; and . (pyenv init - | psub)
end

thefuck --alias | source

# kubectl aliases
alias k='kubectl'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kdd='kubectl describe deployment'
alias kg='kubectl get'
alias kga='kubectl get -A'
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods -A'
alias kgpn='kubectl get pods -n'
alias kgn='kubectl get nodes'
alias kgd='kubectl get deployments'
alias kgs='kubectl get services'
alias kgi='kubectl get ingresses'
alias kgpv='kubectl get persistentvolumes'
alias kgpvc='kubectl get persistentvolumeclaims'
alias kl='kubectl logs'
alias klf='kubectl logs -f'

# Git aliases
alias g='git'
alias gpl='git pull'
alias gps='git push'
alias gco='git commit'

alias cat='bat'
alias ls='exa'

switch (uname -a) 
  case "*Darwin*"
    fish_add_path /usr/local/opt/curl/bin
    set -x GOPATH (go env GOPATH)
    set -x GOROOT (go env GOROOT)
    set PATH $GOPATH/bin $GOROOT/bin $PATH
  case "*microsoft*"
    set -gx DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
    set -gx LIBGL_ALWAYS_INDIRECT 1
    set -gx XDG_RUNTIME_DIR /home/pcz/repos/
    set -gx RUNLEVEL 3

    alias rust-analyzer='rustup run nightly rust-analyzer'
end

# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

fish_add_path $HOME/.krew/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin
direnv hook fish | source
starship init fish | source
