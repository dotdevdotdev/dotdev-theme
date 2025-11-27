# dotdev-theme Terminal Themes

Terminal color schemes and prompt themes matching the dotdev VS Code theme.

## 🎨 Color Palette

The dotdev-theme uses a distinctive black background with bright neon-like accent colors:

- **Background**: `#000000` (Pure Black)
- **Foreground**: `#E6E6E6` (Light Gray)
- **Primary Accent**: `#00FF00` (Bright Green) - Used for highlights, success states
- **Secondary Accent**: `#BB66FF` / `#CC00FF` / `#EE00FF` (Purple/Magenta) - Used for keywords, branches
- **Functions**: `#FFFF00` (Yellow)
- **Variables**: `#99DDFF` (Light Blue)
- **Constants/Paths**: `#00FFCC` (Cyan)
- **Comments**: `#CCCCCC` (Gray)
- **Errors**: `#FF0000` (Red)

## 📦 What's Included

- **iTerm2 color scheme** (`.itermcolors`)
- **Bash prompt theme** (`.bash`)
- **Zsh prompt theme** (`.zsh`)
- **Starship configuration** (`.toml`)

## 🚀 Installation

### iTerm2 (macOS)

1. Open iTerm2
2. Go to **Preferences** → **Profiles** → **Colors**
3. Click **Color Presets...** → **Import...**
4. Select `iterm2/dotdev-theme.itermcolors`
5. Select the imported theme from **Color Presets...**

### Bash

Add to your `~/.bashrc` or `~/.bash_profile`:

```bash
# Load dotdev-theme
source /path/to/dotdev-theme/terminal-themes/bash/dotdev-theme.bash
```

Then reload your shell:
```bash
source ~/.bashrc
```

### Zsh

Add to your `~/.zshrc`:

```bash
# Load dotdev-theme
source /path/to/dotdev-theme/terminal-themes/zsh/dotdev-theme.zsh
```

Then reload your shell:
```bash
source ~/.zshrc
```

### Starship (Recommended - Cross-platform)

[Starship](https://starship.rs/) is a fast, customizable prompt that works with any shell.

1. Install Starship (if not already installed):
   ```bash
   # macOS/Linux
   curl -sS https://starship.rs/install.sh | sh
   
   # Or with Homebrew
   brew install starship
   ```

2. Copy the starship config:
   ```bash
   cp starship/starship.toml ~/.config/starship.toml
   ```
   
   Or merge it with your existing config if you have one.

3. Add to your shell config:
   
   **For Bash** (`~/.bashrc`):
   ```bash
   eval "$(starship init bash)"
   ```
   
   **For Zsh** (`~/.zshrc`):
   ```bash
   eval "$(starship init zsh)"
   ```

4. Reload your shell:
   ```bash
   source ~/.zshrc  # or ~/.bashrc
   ```

## ✨ Features

All prompt themes include:

- **Status indicator**: Green arrow (➜) for success, red for errors
- **Current directory**: Shown in cyan
- **Git integration**:
  - Branch name in magenta/purple
  - Status indicator: ✓ (clean) or ● (changes)
- **Colored command output** for `ls`, `grep`, and `diff`

### Bash/Zsh Specific
- Git branch displayed in parentheses
- Exit status color changes based on last command
- Enhanced directory listing colors

### Starship Specific
- Ultra-fast rendering
- More advanced git status (ahead/behind, staged, modified, etc.)
- Language-specific context (Node.js, Python, Rust, Go, Java, Docker)
- Optional command duration display
- Highly customizable

## 🔧 Customization

### Bash/Zsh

Edit the theme files directly to modify:
- Colors (search for color codes like `\033[1;32m` or `%F{10}`)
- Prompt format (modify the `build_prompt()` or `PROMPT` variable)
- Git status symbols (✓, ●, etc.)

### Starship

Edit `~/.config/starship.toml` to customize:
- Change colors by modifying hex values (e.g., `#00FF00`)
- Add/remove prompt segments
- Adjust formats and symbols
- Enable/disable language contexts

See [Starship documentation](https://starship.rs/config/) for all options.

## 🐚 Terminal Emulator Compatibility

### Recommended
- **iTerm2** (macOS) - Full support with included color scheme
- **Alacritty** - Supports 24-bit colors
- **Kitty** - Supports 24-bit colors
- **WezTerm** - Supports 24-bit colors

### Standard Terminal Support
- macOS Terminal.app - Works with ANSI colors
- GNOME Terminal - Works with ANSI colors
- Konsole - Works with ANSI colors

## 📸 Screenshots

The prompt will look like:

```
➜ ~/projects/dotdev-theme (main) ✓ 
```

- Green arrow when commands succeed
- Cyan path
- Magenta branch name
- Green checkmark for clean repos, yellow dot for changes

## 🎯 Tips

1. **Font**: Use a Nerd Font for best results with symbols and icons
   - Download from [Nerd Fonts](https://www.nerdfonts.com/)
   - Recommended: Fira Code Nerd Font, JetBrains Mono Nerd Font

2. **zsh-syntax-highlighting**: Uncomment the syntax highlighting section in the Zsh theme for colored command syntax

3. **VS Code Integration**: Use this theme alongside the dotdev VS Code theme for a consistent look

4. **Starship Preset**: This config is minimal - explore [Starship presets](https://starship.rs/presets/) for more ideas

## 🔗 Related

- [dotdev VS Code Theme](../themes/dotdev-theme.json)
- [Starship Prompt](https://starship.rs/)
- [iTerm2 Color Schemes](https://iterm2colorschemes.com/)

## 📝 License

Same license as the parent dotdev-theme project.

---

**Enjoy your matching terminal theme! 🚀**
