_gsutil()
{
  local cur
  COMPREPLY=()
  _get_comp_words_by_ref -n : cur
  choices=(`gsutil ls ${cur}*`)
  COMPREPLY=($(compgen -W "${choices[*]}" -- $cur))
  __ltrim_colon_completions "$cur"
  return 0
}

complete -F _gsutil -o dirnames gsutil

