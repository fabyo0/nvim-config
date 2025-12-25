return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    position = "bottom",
    height = 10,
    icons = true,
    mode = "workspace_diagnostics",
    auto_preview = true,
    signs = { error = "", warning = "", hint = "󰌵", information = "" },
  },
  config = function(_, opts)
    require("trouble").setup(opts)
    local keymap = vim.keymap.set
    keymap("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Trouble toggle" })
    keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Workspace diagnostics" })
    keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Document diagnostics" })
    keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Quickfix list" })
    keymap("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<CR>", { desc = "LSP references" })
  end,
}
