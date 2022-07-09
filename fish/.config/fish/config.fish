if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pyenv setup
if type -q pyenv
  status --is-interactive; and . (pyenv init - | psub)
end

thefuck --alias | source
alias k='kubectl'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kdd='kubectl describe deployment'
alias kgp='kubectl get pod'
alias kgd='kubectl get deployment'
alias kl='kubectl logs'
alias klf='kubectl logs -f'

alias cat='bat'
alias ls='exa'

switch (uname) 
  case Darwin
    fish_add_path /usr/local/opt/curl/bin
end

# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

set -gx PATH $PATH $HOME/.krew/bin
