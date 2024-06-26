#ddev-generated

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Path
export PATH=$PATH:/usr/games

# This is so that child processes have appropriate access to this var
export SHELL

# ahoy
COMP_WORDBREAKS=${COMP_WORDBREAKS//:}

# fzf
source /opt/.fzf.bash

# fzf-git
source /opt/fzf-git.sh/fzf-git.sh

# z.lua
mkdir -p /mnt/ddev-global-cache/z.lua/${HOSTNAME}
_ZL_DATA=/mnt/ddev-global-cache/z.lua/${HOSTNAME}/.zlua
export _ZL_DATA
if [[ "$BASHOPTS" =~ login_shell ]]; then
  eval "$(lua /opt/z.lua/z.lua --init bash enhanced once fzf)"
fi

# starship prompt
function set_win_title(){
  if [[ $@ == *"starship_precmd"* ]]; then
    return
  fi
  if [[ $@ == *"__fzf_"* ]]; then
    return
  fi
  # Shortening $PWD
  # /var/www/html -> /v/w/html
  local short_pwd=$(echo "$PWD" | sed 's/\([^\/]\)[^\/]*\//\1\//g')
  echo -ne "\033]0;$@$DDEV_PROJECT/ddev: $short_pwd\007"
}
starship_precmd_user_func="set_win_title"
trap "set_win_title \"\${BASH_COMMAND} - \"" DEBUG
eval "$(starship init bash)"
