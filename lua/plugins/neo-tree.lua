return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        indent = { indent_size = 2, with_markers = true, with_expanders = true },
        git_status = { symbols = { added = "✚", modified = "", deleted = "✖", renamed = "󰁕", untracked = "", ignored = "", unstaged = "󰄱", staged = "", conflict = "" } },
      },
      window = { position = "left", width = 35 },
      filesystem = {
        filtered_items = { hide_dotfiles = false, hide_gitignored = false, hide_by_name = { ".git", "node_modules" } },
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
      },
    })

    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "File Explorer" })
    vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus Explorer" })
  end,
}
