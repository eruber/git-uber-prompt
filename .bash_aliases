#!/bin/bash
# bash aliases file
#echo "bash aliases file has been sourced..."

# --show-control-chars: help showing Korean or accented characters
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -la'

#source ~/git-prompt.sh
#source ~/git-prompt-old.sh

source ~/posh-git-prompt.sh

#source ~/git-uber-prompt.sh 


# PROMPT_COMMAND -- its contents are executed by bash just before displaying the PS1 variable
prompt_command () {
    local EXITCODE="$?"

    local COLOR_OFF="\[\033[0m\]"       # Text Reset
    local DEFAULT="\[\033[0;39m\]"      # Return terminal to setting for text color
    local CYAN="\[\033[0;36m\]"
    local YELLOW_BOLD="\[\033[1;33m\]"
    local WHITE="\[\033[0;37m\]"        
    local WHITE_BOLD="\[\033[1;37m\]"
    local RED="\[\033[0;31m\]"

    local GREEN="\[\033[0;32m\]"
    local BGREEN="\[\033[1;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local BYELLOW="\[\033[1;33m\]"
    local CYAN="\[\033[0;36m\]"
    local BCYAN="\[\033[1;36m\]"
    local BLUE="\[\033[0;34m\]"
    local GRAY="\[\033[0;37m\]"
    local DKGRAY="\[\033[1;30m\]"
    local WHITE="\[\033[1;37m\]"
    local RED="\[\033[1;31m\]"
    local MAGENTA='\[\033[1;35m\]'
    local RCOL='\[\e[0m\]'

    local TIME=`date +%I:%M:%S%P`

    local ERR=""
    # Check last commands return status
    if [ $EXITCODE != 0 ]; then
        ERR+="${RED}${EXITCODE}${WHITE_BOLD}"      # Add red if exit code non 0
    else
        ERR+="${BGREEN}${EXITCODE}${WHITE_BOLD}"
    fi

    ps1_prefix="${MAGENTA}${TIME} ${YELLOW_BOLD}bash-\V${WHITE_BOLD} |${ERR}|"
    
    # see posh-git-prompt.sh
    local gitstring=$(__posh_git_echo)

    ps1_suffix=" ${YELLOW_BOLD}\w\n${WHITE_BOLD}$ "

    #stash=$(git_stash_size)
    #PS1="${ps1_prefix}${stash}${gitstring}${ps1_suffix}"
    
    PS1="${ps1_prefix}${gitstring}${ps1_suffix}"
}


PROMPT_COMMAND=prompt_command

# #------------------------------------------------------------------------------
# function git_stash_size {
#  lines=$(git stash list -n 100 2> /dev/null) || return
#  if [ "${#lines}" -gt 0 ]
#  then
#    count=$(echo "$lines" | wc -l | sed 's/^[ \t]*//') # strip tabs
#    echo " {stash: "${count#}"} "
#  fi
# }


