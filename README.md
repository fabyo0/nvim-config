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

## Installation

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this repo
git clone https://github.com/fabyo0/nvim-config.git ~/.config/nvim

# Open Neovim (plugins will install automatically)
nvim

# Install LSP servers
:Mason
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
├── init.lua
├── lua/
│   ├── keymaps.lua
│   └── plugins/
│       ├── colorscheme.lua
│       ├── cmp.lua
│       ├── dap.lua
│       ├── gitsigns.lua
│       ├── go.lua
│       ├── lsp.lua
│       ├── mason.lua
│       ├── neo-tree.lua
│       ├── php.lua
│       ├── telescope.lua
│       ├── treesitter.lua
│       ├── trouble.lua
│       ├── ui.lua
│       └── utils.lua
```

## Requirements

- Neovim >= 0.11
- Git
- Node.js (for some LSP servers)
- Go (for Go development)
- PHP (for PHP development)
- A Nerd Font (for icons)

## License

MIT
