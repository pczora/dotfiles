function fish_right_prompt
 echo_colored "green" "ﴱ "; kubectl config current-context; echo_colored "green" "  "; echo $AWS_PROFILE;
end

function echo_colored
  set_color $argv[1]
  echo $argv[2]
  set_color normal
end
