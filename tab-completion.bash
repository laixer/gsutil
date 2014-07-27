_gsutil_completer()
{
    local cur cword
    COMPREPLY=()
    _get_comp_words_by_ref -n : cur cword
    if [[ $cword -eq 1 ]]; then
        COMPREPLY=($(gsutil help | sed /Additional/q | grep '^  ' | sed -e 's/^  //' -e 's/ .*//'))
    elif [[ "$cur" =~ ^gs://.* ]]; then
        COMPREPLY=($(gsutil ls ${cur}* 2>/dev/null))
    else
        COMPREPLY=($(compgen -A file ${cur}))
    fi
    __ltrim_colon_completions "$cur"
    return 0
}

complete -F _gsutil_completer -o dirnames gsutil

