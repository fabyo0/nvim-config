-- ===========================================
-- Treesitter: Better Syntax Highlighting
-- ===========================================
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = { 
      "go", "gomod", "gowork", "gosum", 
      "lua", "vim", "vimdoc", 
      "json", "yaml", "toml", 
      "markdown", "markdown_inline", 
      "bash", "dockerfile", "sql" 
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
