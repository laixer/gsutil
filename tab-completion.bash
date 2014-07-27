_gsutil()
{
  local cur
  COMPREPLY=()
  _get_comp_words_by_ref -n : cur
  COMPREPLY=(`gsutil ls ${cur}*`)
  __ltrim_colon_completions "$cur"
  return 0
}

complete -F _gsutil -o dirnames gsutil

