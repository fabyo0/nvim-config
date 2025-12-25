-- ===========================================
-- Keymaps
-- ===========================================
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ===========================================
-- Genel Kısayollar
-- ===========================================

-- Kaydet / Çık
keymap("n", "<leader>w", ":w<CR>", { desc = "Kaydet" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Çık" })
keymap("n", "<leader>Q", ":qa!<CR>", { desc = "Hepsini kapat" })

-- ESC alternatifleri
keymap("i", "jk", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)

-- Highlight temizle
keymap("n", "<leader>h", ":nohlsearch<CR>", { desc = "Highlight kapat" })

-- ===========================================
-- Buffer Yönetimi
-- ===========================================
keymap("n", "<Tab>", ":bnext<CR>", { desc = "Sonraki buffer" })
keymap("n", "<S-Tab>", ":bprevious<CR>", { desc = "Önceki buffer" })
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Buffer kapat" })
keymap("n", "<leader>ba", ":%bdelete<CR>", { desc = "Tüm buffer'ları kapat" })

-- ===========================================
-- Pencere Yönetimi
-- ===========================================
keymap("n", "<C-h>", "<C-w>h", { desc = "Sol pencere" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Alt pencere" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Üst pencere" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Sağ pencere" })

-- Pencere boyutlandırma
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Split oluştur
keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Dikey split" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Yatay split" })

-- ===========================================
-- Satır Taşıma (Visual mode)
-- ===========================================
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Satırı aşağı taşı" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Satırı yukarı taşı" })

-- ===========================================
-- Daha İyi Navigasyon
-- ===========================================
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- ===========================================
-- Terminal
-- ===========================================
keymap("n", "<leader>tt", ":terminal<CR>", { desc = "Terminal aç" })
keymap("n", "<leader>tv", ":vsplit | terminal<CR>", { desc = "Terminal (dikey)" })
keymap("n", "<leader>th", ":split | terminal<CR>", { desc = "Terminal (yatay)" })
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Terminal'den çık" })

-- ===========================================
-- Quick Config
-- ===========================================
keymap("n", "<leader>vc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Config aç" })
keymap("n", "<leader>vp", ":e ~/.config/nvim/lua/plugins/<CR>", { desc = "Plugins klasörü" })
keymap("n", "<leader>vr", ":source ~/.config/nvim/init.lua<CR>", { desc = "Config yenile" })

-- ToggleTerm shortcut
keymap("n", "<leader>m", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
