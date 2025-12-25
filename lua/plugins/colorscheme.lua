-- ===========================================
-- Colorschemes
-- ===========================================
return {
  -- Miasma (active)
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("miasma")
    end,
  },

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