local _hist_no="%{$fg[grey]%}%h%{$reset_color%}"

function _current_username() {
  local i_am=$(whoami)
  if [[ ${i_am} == 'root' ]]; then
    printf ' # '
  else
    printf ' '
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

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}◒ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='$(_user_host)%{$fg[cyan]%}%2~%{$fg[yellow]%}$(_current_username)%{$reset_color%}$(git_prompt_info)
%(?.$fg[green].$fg[red])%\λ %{$reset_color%}'
PROMPT2='%{$fg[$LAMBDACOLOR]%}◀ λ%{$reset_color%} '

