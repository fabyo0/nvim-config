-- ===========================================
-- Go.nvim: Go Development Tools
-- ===========================================
return {
  "ray-x/go.nvim",
  dependencies = { "ray-x/guihua.lua", "neovim/nvim-lspconfig", "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("go").setup({
      lsp_cfg = false,
      lsp_gofumpt = false,  -- conform kullanacak
      lsp_on_attach = false,
      goimports = "gopls",
      gofmt = "gopls",
      tag_transform = false,
      tag_options = "json=omitempty",
      icons = { breakpoint = "🔴", currentpos = "📍" },
      verbose = false,
    })

    -- AUTO FORMAT KAPATILDI - conform.nvim kullanılacak

    -- Go keymaps
    local keymap = vim.keymap.set
    keymap("n", "<leader>gr", "<cmd>GoRun<CR>", { desc = "Go Run" })
    keymap("n", "<leader>gb", "<cmd>GoBuild<CR>", { desc = "Go Build" })
    keymap("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Go Test" })
    keymap("n", "<leader>gtf", "<cmd>GoTestFunc<CR>", { desc = "Go Test Function" })
    keymap("n", "<leader>gc", "<cmd>GoCoverage<CR>", { desc = "Go Coverage" })
    keymap("n", "<leader>gm", "<cmd>GoModTidy<CR>", { desc = "Go Mod Tidy" })
    keymap("n", "<leader>ga", "<cmd>GoAddTag<CR>", { desc = "Go Add Tag" })
    keymap("n", "<leader>gx", "<cmd>GoRemoveTag<CR>", { desc = "Go Remove Tag" })
    keymap("n", "<leader>gi", "<cmd>GoImpl<CR>", { desc = "Go Implement Interface" })
    keymap("n", "<leader>ge", "<cmd>GoIfErr<CR>", { desc = "Go If Err" })
    keymap("n", "<leader>gfs", "<cmd>GoFillStruct<CR>", { desc = "Go Fill Struct" })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
}
