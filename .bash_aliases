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

    local YELLOW_BOLD="\[\033[1;33m\]"    
    local WHITE_BOLD="\[\033[1;37m\]"
    local RED="\[\033[1;31m\]"
    local BGREEN="\[\033[1;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local MAGENTA='\[\033[1;35m\]'

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

    
    #echo $PS1
    # Strip out any potential Python virtual env between the parens
    st=$PS1
    PS1=${PS1#*\(}
    PS1=${PS1%\)*}
    #echo $PS1

    if [ "$st" == "$PS1" ]; then
        # No Python virtual env in prompt
        ps1_suffix=" ${YELLOW_BOLD}\w\n${WHITE_BOLD}$ "
        PS1="${ps1_prefix}${gitstring}${ps1_suffix}"
    else
        # Display Python virtual env in prompt
        ps1_suffix_1=" ${YELLOW_BOLD}\w\n"
        ps1_suffix_2="${WHITE_BOLD}(${PS1}) $ "
        PS1="${ps1_prefix}${gitstring}${ps1_suffix_1}${ps1_suffix_2}"
    fi
}


PROMPT_COMMAND=prompt_command
