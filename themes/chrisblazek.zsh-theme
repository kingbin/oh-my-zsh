# vim:ft=zsh ts=2 sw=2 sts=2

#autoload -U colors && colors

#autoload -Uz vcs_info

#zstyle ':vcs_info:*' stagedstr '%F{green}●'
#zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
#zstyle ':vcs_info:*' enable git svn
#precmd () {
#    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
#        zstyle ':vcs_info:*' formats ' %F{blue}[%F{green}%b%c%u%B%F{blue}]'
#    } else {
#        zstyle ':vcs_info:*' formats ' %F{blue}[%F{green}%b%c%u%B%F{red}●%F{blue}]'
#    }
#
#    vcs_info
#}
#
#setopt prompt_subst
#
#PROMPT='$fg_bold[blue][ $fg[green]%n@%m:$fg[yellow]%~ $fg[red]@ %t $fg_bold[blue]] $fg_bold[blue] ${vcs_info_msg_0_}%B%F{magenta} $reset_color
# $ '


local user="%{$fg_bold[blue]%}%n%{$reset_color%}@%{$fg_bold[green]%}%m%{$reset_color%}"
local pwd="%{$fg_bold[yellow]%}${PWD/#$HOME/~}%{$reset_color%}"
local time="%{$fg_bold[red]%}%*%{$reset_color%}"
local return_code='%(?..%{$fg[red]%}%? .%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

local rvm=''
if which rvm-prompt &> /dev/null; then
 rvm='%{$fg[green]%}<$(rvm-prompt i v g)>%{$reset_color%}'
else
 if which rbenv &> /dev/null; then
   rvm='%{$fg[green]%}<$(rbenv version | sed -e "s/ (set.*$//")>%{$reset_color%}'
 fi
fi

local nvm=''
if which node &> /dev/null; then
 nvm='%{$fg[green]%}<$(node --version)>%{$reset_color%}'
fi

PROMPT='${user}|${pwd}|${time}
\$ '
RPROMPT="${return_code} ${git_branch} ${rvm}${nvm}"

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}X"
#ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}O"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} + "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[red]%} M "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%} - "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} R "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} UM "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ? "
