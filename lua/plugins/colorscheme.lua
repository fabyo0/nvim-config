-- ===========================================
-- Colorschemes
-- ===========================================
return {
  -- Darcula Dark (active)
  {
    "xiantang/darcula-dark.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      vim.cmd.colorscheme("darcula-dark")
    end,
  },

  -- Miasma
  { "xero/miasma.nvim" },

  -- Catppuccin (modern, soft)
  { "catppuccin/nvim", name = "catppuccin" },

  -- OneDark (Atom style)
  { "navarasu/onedark.nvim" },

  -- Gruvbox (retro, warm)
  { "ellisonleao/gruvbox.nvim" },

  -- Kanagawa (Japanese art)
  { "rebelot/kanagawa.nvim" },

  -- Rose Pine (elegant)
  { "rose-pine/neovim", name = "rose-pine" },

  -- Dracula
  { "Mofiqul/dracula.nvim" },

  -- TokyoNight
  { "folke/tokyonight.nvim" },
}