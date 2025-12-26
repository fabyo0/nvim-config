# Neovim IDE Config

My personal Neovim configuration for Go and PHP/Laravel development.

## Features

### General
- 🔍 Fuzzy finder (Telescope)
- 📁 File explorer (Neo-tree)
- ✨ Autocompletion (nvim-cmp)
- 🐛 Debugger (DAP + Delve)
- 💾 Autosave
- 🖥️ Integrated terminal (ToggleTerm)
- 🎨 Multiple themes (Darcula, Miasma, TokyoNight, Catppuccin, etc.)

### Go Development
- 🚀 Full Go support (gopls, go.nvim)
- 🧪 Test runner
- 📊 Code coverage
- 🔧 Auto format & import on save

### PHP/Laravel Development
- 🐘 PHP support (intelephense)
- ⚡ Laravel.nvim integration
- 🗡️ Blade syntax highlighting
- 🎯 Artisan commands
- 🛣️ Route explorer

## Requirements

Before installing, make sure you have:

| Requirement | Version | Check Command |
|-------------|---------|---------------|
| Neovim | >= 0.11 | `nvim --version` |
| Git | any | `git --version` |
| Node.js | >= 18 | `node --version` |
| Go | >= 1.21 | `go version` |
| PHP | >= 8.1 | `php --version` |
| A Nerd Font | any | [Download](https://www.nerdfonts.com/) |

### macOS Installation

```bash
# Install Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install requirements
brew install neovim node go php

# Install a Nerd Font (optional but recommended)
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

### Ubuntu/Debian Installation

```bash
# Update packages
sudo apt update

# Install Neovim (latest)
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt install neovim

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install nodejs

# Install Go
sudo apt install golang-go

# Install PHP
sudo apt install php php-cli
```

### Windows Installation (WSL2)

```bash
# Use Ubuntu/Debian instructions inside WSL2
```

## Installation

### Step 1: Backup existing config

```bash
# Backup if you have existing config
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

### Step 2: Clone this repository

```bash
git clone https://github.com/fabyo0/nvim-config.git ~/.config/nvim
```

### Step 3: Start Neovim

```bash
nvim
```

On first launch:
1. Lazy.nvim will automatically install all plugins (wait for it to finish)
2. Treesitter will install language parsers
3. Mason will install LSP servers

### Step 4: Verify LSP servers

Open Neovim and run:

```vim
:Mason
```

Make sure these are installed (✓):
- `gopls` (Go)
- `lua_ls` (Lua)  
- `intelephense` (PHP)

If not installed, press `i` on each to install.

### Step 5: Test the setup

```bash
# Test Go
cd /tmp && mkdir go-test && cd go-test
go mod init test
nvim main.go
# Type: package main → autocomplete should work

# Test PHP
nvim test.php
# Type: <?php → autocomplete should work
```

## Keybindings

### General

| Key | Action |
|-----|--------|
| `Space + w` | Save |
| `Space + q` | Quit |
| `Space + e` | File explorer |
| `Space + ff` | Find files |
| `Space + fg` | Live grep |
| `Space + fb` | Buffers |
| `Space + m` | Toggle terminal |
| `Tab` | Next buffer |
| `Shift + Tab` | Previous buffer |

### LSP (All Languages)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Hover info |
| `Space + rn` | Rename symbol |
| `Space + ca` | Code actions |
| `Space + f` | Format |
| `Space + i` | Import class |
| `[d` / `]d` | Previous/Next diagnostic |

### Go Specific

| Key | Action |
|-----|--------|
| `Space + gr` | Go Run |
| `Space + gb` | Go Build |
| `Space + gt` | Go Test |
| `Space + ge` | Go If Err |
| `Space + gi` | Go Implement Interface |
| `Space + gm` | Go Mod Tidy |

### Laravel Specific

| Key | Action |
|-----|--------|
| `Space + la` | Artisan commands |
| `Space + lr` | Routes |
| `Space + lm` | Related files |

### Debug

| Key | Action |
|-----|--------|
| `F5` | Start/Continue |
| `F9` | Toggle breakpoint |
| `F10` | Step over |
| `F11` | Step into |
| `F12` | Step out |
| `Space + du` | Toggle debug UI |

### Git

| Key | Action |
|-----|--------|
| `]g` / `[g` | Next/Previous hunk |
| `Space + hs` | Stage hunk |
| `Space + hr` | Reset hunk |
| `Space + hp` | Preview hunk |
| `Space + hb` | Blame line |

## Themes

Switch themes with `:colorscheme <name>`

Available themes:
- `darcula-dark` (default)
- `miasma`
- `tokyonight-night`
- `catppuccin-mocha`
- `gruvbox`
- `kanagawa`
- `rose-pine`
- `dracula`

## Structure

```
~/.config/nvim/
├── init.lua              # Main configuration
├── lua/
│   ├── keymaps.lua       # Key mappings
│   └── plugins/
│       ├── colorscheme.lua   # Theme settings
│       ├── cmp.lua           # Autocompletion
│       ├── dap.lua           # Debugger
│       ├── gitsigns.lua      # Git integration
│       ├── go.lua            # Go development
│       ├── lsp.lua           # LSP configuration
│       ├── mason.lua         # LSP installer
│       ├── neo-tree.lua      # File explorer
│       ├── php.lua           # PHP/Laravel development
│       ├── telescope.lua     # Fuzzy finder
│       ├── treesitter.lua    # Syntax highlighting
│       ├── trouble.lua       # Diagnostics list
│       ├── ui.lua            # UI enhancements
│       └── utils.lua         # Utility plugins
```

## Troubleshooting

### LSP not working

```vim
:LspInfo
:LspLog
```

### Treesitter errors

```vim
:TSUpdate
```

### Plugin issues

```vim
:Lazy sync
:Lazy clean
```

### Reset everything

```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
nvim
```

## Updating

```bash
cd ~/.config/nvim
git pull
nvim
:Lazy sync
```

## Uninstall

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

## License

MIT

## Author

[@fabyo0](https://github.com/fabyo0)
