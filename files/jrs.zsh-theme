local _hist_no="%{$fg[grey]%}%h%{$reset_color%}"

function _current_username() {
  if [[ $(whoami) == 'joshanah' ]]; then
    printf 'ジョン'
  else
    printf $(whoami)
  fi
}

function _user_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[cyan]%}$me%{$reset_color%}:"
  fi
}

function _vi_status() {
  if {echo $fpath | grep -q "plugins/vi-mode"}; then
    echo "$(vi_mode_prompt_info)"
  fi
}

if [[ $USER == "root" ]]; then
  LAMBDACOLOR="red"
else
  LAMBDACOLOR="white"
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}◒ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}◒ "

PROMPT='$(_user_host)%{$fg[blue]%}%2~ %{$fg[yellow]%}$(_current_username)%{$reset_color%} $(git_prompt_info)
%{$fg[$CARETCOLOR]%}λ%{$resetcolor%} '
PROMPT2='%{$fg[$LAMBDACOLOR]%}◀ λ%{$reset_color%} '
