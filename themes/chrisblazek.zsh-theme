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





rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}

PROMPT='
%{$fg_bold[blue]%}%n%{$reset_color%}@%{$fg_bold[green]%}%m%{$reset_color%}%{$fg_bold[yellow]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) ⌚ %{$fg_bold[red]%}%*%{$reset_color%}
$ '



# git theming
#ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[green]("
#ZSH_THEME_GIT_PROMPT_SUFFIX=")"

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta](%}⭠ "
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
#ZSH_THEME_GIT_PROMPT_DIRTY="✗"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="✔"

RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
