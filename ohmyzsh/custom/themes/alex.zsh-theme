# local rvm="%{$fg[green]%}[$(rvm-prompt i v g)]%{$reset_color%}"

PROMPT='
%{$fg_bold[green]%}%~%{$fg_bold[cyan]%}%{$fg_bold[blue]%} % %{$reset_color%}
%{$fg[green]%}➞  %{$reset_color%'

# comment out until have rvm or rbenv installed.
# RPROMPT='$(git_prompt_info) $(rvm)'
RPROMPT='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}] %{$fg[red]%}✖ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}] %{$fg[green]%}✔%{$reset_color%}"
