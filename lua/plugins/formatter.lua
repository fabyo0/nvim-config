-- ===========================================
-- Formatter: conform.nvim
-- ===========================================
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      -- Go
      go = { "gofumpt", "goimports" },
      
      -- PHP
      php = { "php_cs_fixer" },
      blade = { "blade-formatter" },
      
      -- Lua
      lua = { "stylua" },
      
      -- Web
      javascript = { "prettier" },
      typescript = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
    
    -- Format on save
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
  },
}
