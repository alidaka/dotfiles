local ret_status="%(?:%{$fg_bold[cyan]%}> :%{$fg_bold[red]%}> )"
local sep="%{$fg_bold[yellow]%}|"
PROMPT='
%{$fg_bold[blue]%}%* $sep %{$fg_bold[cyan]%}%~ $(git_prompt_info)
${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="$sep %{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
