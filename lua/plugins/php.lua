-- ===========================================
-- PHP / Laravel Development
-- ===========================================
return {
  -- Blade syntax highlighting
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },

  -- Laravel specific
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<CR>", desc = "Laravel Artisan" },
      { "<leader>lr", ":Laravel routes<CR>", desc = "Laravel Routes" },
      { "<leader>lm", ":Laravel related<CR>", desc = "Laravel Related Files" },
    },
    config = function()
      require("laravel").setup()
    end,
  },
}
