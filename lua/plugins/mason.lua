-- ===========================================
-- Mason: LSP/DAP/Linter Manager
-- ===========================================
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { 
          "gopls",        -- Go
          "lua_ls",       -- Lua
          "intelephense", -- PHP
        },
        automatic_installation = true,
      })
    end,
  },
}
