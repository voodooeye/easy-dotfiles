#!/bin/bash

sources() {
  local script_folder="$( dirname "$(realpath -s "${BASH_SOURCE[0]}")" )"
  
  source "$script_folder/../common/vars.sh"
  source "$script_folder/../common/utils.sh"

}; sources

setup_log_file "git-reset"

reset() {
  local folder="$1"

  echo -e "\nResetting changes in [ $folder ]..."

  cd "$folder"

  git reset --hard @{u}
  git clean -df
  git pull
}

prompt_user "[ WARN ] This will reset all the unpushed changes from your local copy of <dotfiles> !"

check_git_props
reset "$PRIVATE_FOLDER"
reset "$PROJECT_ROOT"
