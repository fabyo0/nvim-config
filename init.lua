-- ===========================================
-- Full Go IDE Setup for Neovim
-- ===========================================

-- Leader key (her şeyden önce ayarlanmalı)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ===========================================
-- Temel Ayarlar
-- ===========================================
local opt = vim.opt

-- Satır numaraları
opt.number = true
opt.relativenumber = true

-- Tab/Indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Arama
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Görünüm
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false

-- Split yönleri
opt.splitright = true
opt.splitbelow = true

-- Performans
opt.updatetime = 250
opt.timeoutlen = 300

-- Undo history
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Clipboard (sistem clipboard'u ile senkron)
opt.clipboard = "unnamedplus"

-- Mouse desteği
opt.mouse = "a"

-- ===========================================
-- Lazy.nvim Bootstrap
-- ===========================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Lazy.nvim indiriliyor...")
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin'leri yükle
require("lazy").setup("plugins", {
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
})

-- Keymaps
require("keymaps")

-- Autosave: Focus kaybedince veya buffer değişince kaydet
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  pattern = "*",
  command = "silent! wa",
})
