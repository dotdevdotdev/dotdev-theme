# dotdev-theme Color Reference

Quick reference for terminal theme colors extracted from the VS Code theme.

## ANSI Colors (0-15)

| ANSI | Color Name      | Hex Code | RGB           | Use Case                          |
|------|-----------------|----------|---------------|-----------------------------------|
| 0    | Black           | #000000  | 0, 0, 0       | Background                        |
| 1    | Red             | #ff5449  | 255, 84, 73   | Errors, deleted files            |
| 2    | Green           | #00ff66  | 0, 255, 102   | Strings, success, added files    |
| 3    | Yellow          | #ffd84d  | 255, 216, 77  | Functions, warnings              |
| 4    | Blue            | #00bfff  | 0, 191, 255   | Directories, accent              |
| 5    | Magenta         | #c06cf0  | 192, 108, 240 | Keywords, git branches           |
| 6    | Cyan            | #1fe0e0  | 31, 224, 224  | Constants, paths                 |
| 7    | White           | #d6dee6  | 214, 222, 230 | Comments, normal text            |
| 8    | Bright Black    | #5c6670  | 92, 102, 112  | Dark gray (dim text)             |
| 9    | Bright Red      | #ff8078  | 255, 128, 120 | Bright errors                    |
| 10   | Bright Green    | #5cff9d  | 92, 255, 157  | Prompt success indicator         |
| 11   | Bright Yellow   | #ffe88a  | 255, 232, 138 | Modified files, git status       |
| 12   | Bright Blue     | #40cbff  | 64, 203, 255  | Variables, parameters            |
| 13   | Bright Magenta  | #d79bf5  | 215, 155, 245 | Links, decorators                |
| 14   | Bright Cyan     | #5cf0f0  | 92, 240, 240  | Constants, class names           |
| 15   | Bright White    | #ffffff  | 255, 255, 255 | Pure white (highlights)          |

## Extended Color Palette

### Theme Specific Colors

| Element           | Hex Code | RGB           | Description                       |
|-------------------|----------|---------------|-----------------------------------|
| Editor Foreground | #E6E6E6  | 230, 230, 230 | Main text color                   |
| Focus Border      | #00FF00  | 0, 255, 0     | Active element borders            |
| Badge Background  | #CC00FF  | 204, 0, 255   | Purple badges/notifications       |
| Selection         | #00FF0030| 0, 255, 0, 19%| Green selection with transparency |
| Line Highlight    | #00FF0008| 0, 255, 0, 3% | Very subtle green highlight       |

### Syntax Colors

| Token Type        | Hex Code | Description                       |
|-------------------|----------|-----------------------------------|
| Strings           | #00FF00  | String literals                   |
| Keywords          | #BB66FF  | Language keywords                 |
| Functions         | #FFFF00  | Function names and calls          |
| Variables         | #99DDFF  | Variable names                    |
| Variable Props    | #B3B3FF  | Object properties                 |
| Constants         | #00FFCC  | Constant values                   |
| Comments          | #CCCCCC  | Code comments (italic)            |
| Operators         | #CCCCCC  | Mathematical operators            |
| Types/Classes     | #BB66FF  | Type definitions, classes         |
| Numbers           | #00FFCC  | Numeric literals                  |
| Template Expr     | #FF00FF  | Template expression brackets      |
| Regex             | #FFCC00  | Regular expressions               |
| Escape Chars      | #FF00FF  | Escape sequences                  |
| Decorators        | #EE00FF  | Python/TS decorators (italic)     |

### Git Diff Colors

| Status    | Hex Code | Description                       |
|-----------|----------|-----------------------------------|
| Inserted  | #00CC00  | Added lines                       |
| Deleted   | #FF0099  | Removed lines                     |
| Changed   | #FFCC00  | Modified lines                    |

## Terminal Escape Codes

### Basic Colors (Bash/Zsh)

**Bash format:**
```bash
\033[0;30m  # Black
\033[0;31m  # Red
\033[0;32m  # Green
\033[0;33m  # Yellow
\033[0;34m  # Blue
\033[0;35m  # Magenta
\033[0;36m  # Cyan
\033[0;37m  # White
```

**Bright colors (add 60 to color code):**
```bash
\033[1;90m  # Bright Black (Gray)
\033[1;91m  # Bright Red
\033[1;92m  # Bright Green
\033[1;93m  # Bright Yellow
\033[1;94m  # Bright Blue
\033[1;95m  # Bright Magenta
\033[1;96m  # Bright Cyan
\033[1;97m  # Bright White
```

### Zsh Format
```zsh
%F{0}   # Black
%F{1}   # Red
%F{2}   # Green
%F{3}   # Yellow
%F{4}   # Blue
%F{5}   # Magenta
%F{6}   # Cyan
%F{7}   # White
%F{8-15} # Bright colors
%f      # Reset
```

### True Color (24-bit) Support

For terminals that support 24-bit color (iTerm2, Alacritty, Kitty, etc.):

**Bash/Zsh:**
```bash
\033[38;2;R;G;Bm  # Foreground
\033[48;2;R;G;Bm  # Background
```

**Example (bright green):**
```bash
\033[38;2;0;255;0m  # #00FF00
```

## Special Symbols Used

| Symbol | Unicode | Name                  | Use Case              |
|--------|---------|-----------------------|-----------------------|
| ➜      | U+279C  | Heavy Round-Tipped Rightwards Arrow | Prompt symbol  |
| ✓      | U+2713  | Check Mark           | Clean git status      |
| ●      | U+25CF  | Black Circle         | Modified git status   |
| ⚔      | U+2694  | Crossed Swords       | Git conflicts         |
| ⇡      | U+21E1  | Upwards Dashed Arrow | Commits ahead         |
| ⇣      | U+21E3  | Downwards Dashed Arrow | Commits behind      |
| ✘      | U+2718  | Heavy Ballot X       | Errors                |

## Usage Examples

### In Bash Scripts
```bash
GREEN='\033[0;32m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'  # No Color

echo -e "${GREEN}Success!${NC}"
echo -e "${CYAN}~/projects/my-app${NC} ${MAGENTA}(main)${NC}"
```

### In Zsh Prompts
```zsh
PROMPT='%F{10}➜%f %F{14}%~%f %F{13}(branch)%f '
```

### LS_COLORS Format
```bash
# di = directory, ln = symlink, ex = executable
export LS_COLORS='di=1;36:ln=1;35:ex=1;32'
```

**Format:** `type=style;color`
- Style: 0=normal, 1=bold, 4=underline
- Color: 30-37 (normal), 90-97 (bright)

---

**Note:** The actual appearance may vary depending on your terminal emulator's color rendering capabilities.
