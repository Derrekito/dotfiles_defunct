#
# ~/.bashrc
#

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/OpenBLAS/lib:/usr/local/lib
PATH=$PATH:$HOME/scripts:$HOME/.cargo/bin:$HOME/.local/bin
set -o vi

VISUAL='nvim'
EDITOR='nvim'
TERMINAL=alacritty

# Terminal colors using tput
# Basic colors
GRAY=$(tput setaf 7)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7; tput bold)

# Character styles
BOLD=$(tput bold)
RESET=$(tput sgr0)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -a'

# Symbol colors
SHEV_COLOR="${CYAN}"
BRANCH_COLOR="${BLUE}"
MODE_COLOR="${RED}"
DIR_COLOR="${GREEN}"

# Symbols
LEFT_SHEV="${SHEV_COLOR}${BOLD}⟪${RESET}"
RIGHT_SHEV="${SHEV_COLOR}${BOLD}⟫${RESET}"
BRANCH="${BRANCH_COLOR}"
MODE="${MODE_COLOR}${BOLD}"
GIT_INFO=""

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
