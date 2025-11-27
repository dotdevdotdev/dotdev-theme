#!/bin/bash
# dotdev-theme for Bash
# Add this to your ~/.bashrc or source it with: source ~/path/to/dotdev-theme.bash

# Color definitions matching dotdev-theme
DOTDEV_BLACK='\[\033[0;30m\]'
DOTDEV_RED='\[\033[0;31m\]'
DOTDEV_GREEN='\[\033[0;32m\]'
DOTDEV_YELLOW='\[\033[0;33m\]'
DOTDEV_BLUE='\[\033[0;34m\]'
DOTDEV_MAGENTA='\[\033[0;35m\]'
DOTDEV_CYAN='\[\033[0;36m\]'
DOTDEV_WHITE='\[\033[0;37m\]'

# Bright colors
DOTDEV_BRIGHT_BLACK='\[\033[1;30m\]'
DOTDEV_BRIGHT_RED='\[\033[1;31m\]'
DOTDEV_BRIGHT_GREEN='\[\033[1;32m\]'
DOTDEV_BRIGHT_YELLOW='\[\033[1;33m\]'
DOTDEV_BRIGHT_BLUE='\[\033[1;34m\]'
DOTDEV_BRIGHT_MAGENTA='\[\033[1;35m\]'
DOTDEV_BRIGHT_CYAN='\[\033[1;36m\]'
DOTDEV_BRIGHT_WHITE='\[\033[1;37m\]'

# Reset
DOTDEV_RESET='\[\033[0m\]'

# Git prompt function
git_branch() {
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo " ($branch)"
    fi
}

# Git status indicators
git_status() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        local status=$(git status --porcelain 2>/dev/null)
        if [ -n "$status" ]; then
            echo "${DOTDEV_BRIGHT_YELLOW}*${DOTDEV_RESET}"
        else
            echo "${DOTDEV_BRIGHT_GREEN}✓${DOTDEV_RESET}"
        fi
    fi
}

# Exit status indicator
exit_status() {
    if [ $? -eq 0 ]; then
        echo "${DOTDEV_BRIGHT_GREEN}➜${DOTDEV_RESET}"
    else
        echo "${DOTDEV_BRIGHT_RED}➜${DOTDEV_RESET}"
    fi
}

# Build the prompt
build_prompt() {
    local EXIT_STATUS=$?
    
    # Status symbol (green arrow or red arrow based on last command)
    if [ $EXIT_STATUS -eq 0 ]; then
        PS1="${DOTDEV_BRIGHT_GREEN}➜${DOTDEV_RESET} "
    else
        PS1="${DOTDEV_BRIGHT_RED}➜${DOTDEV_RESET} "
    fi
    
    # Current directory (cyan)
    PS1+="${DOTDEV_BRIGHT_CYAN}\w${DOTDEV_RESET}"
    
    # Git branch (magenta) and status
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        PS1+=" ${DOTDEV_BRIGHT_MAGENTA}($branch)${DOTDEV_RESET}"
        
        # Git status indicator
        local status=$(git status --porcelain 2>/dev/null)
        if [ -n "$status" ]; then
            PS1+=" ${DOTDEV_BRIGHT_YELLOW}●${DOTDEV_RESET}"
        else
            PS1+=" ${DOTDEV_BRIGHT_GREEN}✓${DOTDEV_RESET}"
        fi
    fi
    
    PS1+=" "
}

# Set PROMPT_COMMAND to build prompt before each command
PROMPT_COMMAND=build_prompt

# Optional: Enhanced LS_COLORS for better directory listing
export LS_COLORS='di=1;36:ln=1;35:so=1;33:pi=1;33:ex=1;32:bd=1;33:cd=1;33:su=1;31:sg=1;31:tw=1;36:ow=1;36'

# Aliases for colored output
alias ls='ls --color=auto 2>/dev/null || ls -G'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Enable color support
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

echo "dotdev-theme loaded! 🚀"
