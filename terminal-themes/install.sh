#!/bin/bash
# Installation script for dotdev-theme terminal themes
# Usage: ./install.sh [bash|zsh|starship|iterm2|all]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_NAME="dotdev-theme"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Helper functions
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_header() {
    echo ""
    echo -e "${BLUE}╔══════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC}  dotdev-theme Terminal Theme Installer  ${BLUE}║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════╝${NC}"
    echo ""
}

# Backup function
backup_file() {
    local file=$1
    if [ -f "$file" ]; then
        local backup="${file}.backup-$(date +%Y%m%d-%H%M%S)"
        cp "$file" "$backup"
        print_info "Backed up existing file to: $backup"
    fi
}

# Install bash theme
install_bash() {
    print_info "Installing Bash theme..."
    
    local bashrc=""
    if [ -f "$HOME/.bashrc" ]; then
        bashrc="$HOME/.bashrc"
    elif [ -f "$HOME/.bash_profile" ]; then
        bashrc="$HOME/.bash_profile"
    else
        bashrc="$HOME/.bashrc"
        touch "$bashrc"
    fi
    
    # Check if already installed
    if grep -q "dotdev-theme" "$bashrc"; then
        print_warning "dotdev-theme already configured in $bashrc"
        return
    fi
    
    backup_file "$bashrc"
    
    echo "" >> "$bashrc"
    echo "# dotdev-theme" >> "$bashrc"
    echo "source \"$SCRIPT_DIR/bash/dotdev-theme.bash\"" >> "$bashrc"
    
    print_success "Bash theme installed! Reload with: source $bashrc"
}

# Install zsh theme
install_zsh() {
    print_info "Installing Zsh theme..."
    
    local zshrc="$HOME/.zshrc"
    
    if [ ! -f "$zshrc" ]; then
        touch "$zshrc"
    fi
    
    # Check if already installed
    if grep -q "dotdev-theme" "$zshrc"; then
        print_warning "dotdev-theme already configured in $zshrc"
        return
    fi
    
    backup_file "$zshrc"
    
    echo "" >> "$zshrc"
    echo "# dotdev-theme" >> "$zshrc"
    echo "source \"$SCRIPT_DIR/zsh/dotdev-theme.zsh\"" >> "$zshrc"
    
    print_success "Zsh theme installed! Reload with: source $zshrc"
}

# Install starship theme
install_starship() {
    print_info "Installing Starship theme..."
    
    # Check if starship is installed
    if ! command -v starship &> /dev/null; then
        print_warning "Starship not found. Install it first:"
        echo "    curl -sS https://starship.rs/install.sh | sh"
        echo "    or: brew install starship"
        return 1
    fi
    
    local starship_config="$HOME/.config/starship.toml"
    local config_dir="$HOME/.config"
    
    # Create config directory if it doesn't exist
    mkdir -p "$config_dir"
    
    # Backup existing config
    if [ -f "$starship_config" ]; then
        backup_file "$starship_config"
        print_warning "Existing starship config backed up"
        print_info "You may want to merge the configs manually"
    fi
    
    # Copy the config
    cp "$SCRIPT_DIR/starship/starship.toml" "$starship_config"
    
    # Check if starship init is in shell config
    local shell_config=""
    if [ -n "$ZSH_VERSION" ]; then
        shell_config="$HOME/.zshrc"
    elif [ -n "$BASH_VERSION" ]; then
        shell_config="$HOME/.bashrc"
        [ ! -f "$shell_config" ] && shell_config="$HOME/.bash_profile"
    fi
    
    if [ -n "$shell_config" ] && [ -f "$shell_config" ]; then
        if ! grep -q "starship init" "$shell_config"; then
            print_info "Adding starship init to $shell_config"
            echo "" >> "$shell_config"
            echo "# Initialize starship prompt" >> "$shell_config"
            if [ -n "$ZSH_VERSION" ]; then
                echo 'eval "$(starship init zsh)"' >> "$shell_config"
            else
                echo 'eval "$(starship init bash)"' >> "$shell_config"
            fi
        fi
    fi
    
    print_success "Starship theme installed to: $starship_config"
}

# Install iTerm2 theme
install_iterm2() {
    print_info "Installing iTerm2 color scheme..."
    
    if [[ "$OSTYPE" != "darwin"* ]]; then
        print_warning "iTerm2 is only available on macOS"
        return 1
    fi
    
    local iterm_file="$SCRIPT_DIR/iterm2/dotdev-theme.itermcolors"
    
    print_info "To complete installation:"
    echo "  1. Open iTerm2"
    echo "  2. Go to Preferences → Profiles → Colors"
    echo "  3. Click 'Color Presets...' → 'Import...'"
    echo "  4. Select: $iterm_file"
    echo "  5. Then select 'dotdev-theme' from Color Presets"
    
    # Try to open iTerm2 preferences
    if command -v open &> /dev/null; then
        read -p "Open iTerm2 color file now? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            open "$iterm_file"
        fi
    fi
    
    print_success "iTerm2 color scheme ready for import"
}

# Show usage
show_usage() {
    echo "Usage: $0 [bash|zsh|starship|iterm2|all]"
    echo ""
    echo "Options:"
    echo "  bash      - Install Bash prompt theme"
    echo "  zsh       - Install Zsh prompt theme"
    echo "  starship  - Install Starship configuration"
    echo "  iterm2    - Instructions for iTerm2 color scheme"
    echo "  all       - Install all available themes"
    echo ""
}

# Main installation logic
main() {
    print_header
    
    local option="${1:-}"
    
    case "$option" in
        bash)
            install_bash
            ;;
        zsh)
            install_zsh
            ;;
        starship)
            install_starship
            ;;
        iterm2)
            install_iterm2
            ;;
        all)
            print_info "Installing all available themes..."
            echo ""
            install_bash
            echo ""
            install_zsh
            echo ""
            install_starship
            echo ""
            install_iterm2
            ;;
        -h|--help|help)
            show_usage
            exit 0
            ;;
        *)
            print_error "Invalid option: $option"
            echo ""
            show_usage
            exit 1
            ;;
    esac
    
    echo ""
    print_success "Installation complete!"
    print_info "Restart your terminal or reload your shell config to see changes"
    echo ""
}

# Run main function
main "$@"
