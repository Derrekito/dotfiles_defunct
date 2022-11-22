#
# ~/.bashrc
#

PATH=$PATH:/home/derrekito/scripts

set -o vi

#swap capslock and escape
setxkbmap -option caps:swapescape

# set tab size to 4
tabs -4

VISUAL='emacsclient -c'
EDITER='emacsclient -c'

# escape octal notation passed to sed
E='\033['

#bash begin char style/color escape
#colors
GRAY=$(echo -e "${E}37m")
RED=$(echo -e "${E}31m")
GREEN=$(echo -e "${E}32m")
BROWN=$(echo -e "${E}33m")
BLUE=$(echo -e "${E}34m")
PURPLE=$(echo -e "${E}35m")
CYAN=$(echo -e "${E}36m")
WHITE=$(echo -e "${E}1;37m")

# char style/cmds
BOLD=$(echo -e "${E}1m")
RESET=$(echo -e "${E}0m")

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

#symbol colors
SHEV_COLOR="${CYAN}"
BRANCH_COLOR="${BLUE}"
MODE_COLOR="${RED}"
DIR_COLOR="${GREEN}"

#symbols
LEFT_SHEV="${SHEV_COLOR}${BOLD}⟪${RESET}"
RIGHT_SHEV="${SHEV_COLOR}${BOLD}⟫${RESET}"
BRANCH="${BRANCH_COLOR}"
MODE="${MODE_COLOR}${BOLD}"
GIT_INFO=""

#parse_git_branch() {
# git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\o033[0m ⟪ \o033[36m \1\o033[0m ⟫/'
#}
parse_git_branch() {
    branch_name=$(git branch 2> /dev/null| sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [[ -n $branch_name ]]
    then
  BRANCH=${BRANCH}$branch_name${RESET}
  git_mode=$(git status 2>/dev/null | sed -n '/You\ are/p' | sed -r 's/.*(bisecting|merging|rebasing|editing).*/\U\1/')
  if [[ -n $git_mode ]]
  then
      MODE="|$MODE$git_mode${RESET}"
  fi
  echo "$LEFT_SHEV$BRANCH$MODE$RIGHT_SHEV${RESET}" 2> /dev/null
    else
  echo "" 2> /dev/null
    fi
}

PS1='╔═╣${DIR_COLOR}\w/${RESET}  $(parse_git_branch)\n╚═> '
