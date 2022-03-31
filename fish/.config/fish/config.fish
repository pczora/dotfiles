if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pyenv setup
status --is-interactive; and . (pyenv init - | psub)

thefuck --alias | source
alias k=kubectl
switch (uname) 
  case Darwin
    fish_add_path /usr/local/opt/curl/bin
end

# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

set -gx PATH $PATH $HOME/.krew/bin
