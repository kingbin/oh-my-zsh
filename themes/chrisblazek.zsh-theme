# vim:ft=zsh ts=2 sw=2 sts=2
#autoload -U colors && colors

setopt PROMPT_SUBST
setopt PROMPT_BANG

local user='%{$fg_bold[blue]%}%n%{$reset_color%}@%{$fg_bold[green]%}%m%{$reset_color%}'
local pwd='%{$fg_bold[yellow]%}${PWD/#$HOME/~}%{$reset_color%}'
local histver='%{$fg_bold[red]%}%!%{$reset_color%}'
#local timedisplay='👾  %{$fg_bold[red]%}%*%{$reset_color%}'
local timedisplay='🍺 %{$fg_bold[red]%}%*%{$reset_color%}'

local rvm=''
if which rvm-prompt &> /dev/null; then
  rvm='%{$fg[green]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm='%{$fg[green]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi

local nvm=''
if which node &> /dev/null; then
 nvm='%{$fg[green]%}<$(node --version)>%{$reset_color%}'
fi

#local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

# git theming
#ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}⭠ "
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
##ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
#ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg_bold[blue](%}⭠ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
ZSH_THEME_GIT_PROMPT_AHEAD=" ⬆"
ZSH_THEME_GIT_PROMPT_BEHIND=" ⬇"
ZSH_THEME_GIT_PROMPT_DIVERGED=" ᛨ"

if [[ -n $SSH_CONNECTION ]]; then
  #PROMPT='%m:%3~$(git_prompt_info)%# '
  PROMPT="${user} ${pwd} ${git_branch} ${timedisplay}
  ${histver}$ "
else
  PROMPT="${user} ${pwd} ${git_branch} ${timedisplay}
  ${histver}$ "
  #PROMPT='%3~$(git_prompt_info)%# '
fi

RPROMPT="${rvm}:${nvm}"

#RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
