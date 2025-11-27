#!/bin/zsh
# dotdev-theme for Zsh
# Add this to your ~/.zshrc or source it with: source ~/path/to/dotdev-theme.zsh

# Enable colors and prompt substitution
autoload -Uz colors && colors
setopt PROMPT_SUBST

# Color definitions using true colors (RGB) matching dotdev-theme exactly
# These use 24-bit color support for vibrant colors
DOTDEV_BLACK='%F{#000000}'
DOTDEV_RED='%F{#FF0000}'
DOTDEV_GREEN='%F{#00FF00}'
DOTDEV_YELLOW='%F{#FFFF00}'
DOTDEV_BLUE='%F{#0077FF}'
DOTDEV_MAGENTA='%F{#BB66FF}'
DOTDEV_CYAN='%F{#00FFCC}'
DOTDEV_WHITE='%F{#E6E6E6}'

# Additional theme colors
DOTDEV_PURPLE='%F{#EE00FF}'
DOTDEV_LIGHT_BLUE='%F{#99DDFF}'
DOTDEV_GRAY='%F{#CCCCCC}'

# Reset
DOTDEV_RESET='%f'

# Git information function
git_prompt_info() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        echo " ${DOTDEV_MAGENTA}($branch)${DOTDEV_RESET}"
    fi
}

# Git status indicator - renamed variable to avoid conflict
git_prompt_status() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        local git_status_output=$(git status --porcelain 2>/dev/null)
        if [[ -n $git_status_output ]]; then
            echo " ${DOTDEV_YELLOW}●${DOTDEV_RESET}"
        else
            echo " ${DOTDEV_GREEN}✓${DOTDEV_RESET}"
        fi
    fi
}

# Exit status indicator
exit_status_indicator() {
    echo "%(?.${DOTDEV_GREEN}.${DOTDEV_RED})➜${DOTDEV_RESET}"
}

# Build the prompt
PROMPT='$(exit_status_indicator) ${DOTDEV_CYAN}%~${DOTDEV_RESET}$(git_prompt_info)$(git_prompt_status) '

# Right prompt with time (optional)
# RPROMPT='${DOTDEV_WHITE}%*${DOTDEV_RESET}'

# Enhanced LS_COLORS for better directory listing
export LS_COLORS='di=1;36:ln=1;35:so=1;33:pi=1;33:ex=1;32:bd=1;33:cd=1;33:su=1;31:sg=1;31:tw=1;36:ow=1;36'

# Aliases for colored output
alias ls='ls --color=auto 2>/dev/null || ls -G'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Enable color support
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# Syntax highlighting colors (if you use zsh-syntax-highlighting)
# Uncomment these if you have zsh-syntax-highlighting installed
# ZSH_HIGHLIGHT_STYLES[default]=none
# ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
# ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=magenta
# ZSH_HIGHLIGHT_STYLES[alias]=fg=green
# ZSH_HIGHLIGHT_STYLES[builtin]=fg=green
# ZSH_HIGHLIGHT_STYLES[function]=fg=yellow
# ZSH_HIGHLIGHT_STYLES[command]=fg=green
# ZSH_HIGHLIGHT_STYLES[precommand]=fg=green
# ZSH_HIGHLIGHT_STYLES[commandseparator]=none
# ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=green
# ZSH_HIGHLIGHT_STYLES[path]=fg=cyan
# ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue
# ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue
# ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=cyan
# ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=cyan
# ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
# ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=green
# ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=green
# ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
# ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
# ZSH_HIGHLIGHT_STYLES[assign]=none

echo "dotdev-theme loaded! 🚀"
