function fish_right_prompt
  set num_contexts (kubectl config get-contexts | wc -l)
  if type -q kubectl && test (kubectl config get-contexts | wc -l) -gt 1
    set_color green; echo "ﴱ "; set_color normal; kubectl config current-context; 
 end
end
