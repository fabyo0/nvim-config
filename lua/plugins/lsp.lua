-- ===========================================
-- LSP Configuration
-- ===========================================
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    vim.g.lspconfig_suppress_deprecation = true

    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Diagnostic settings
    vim.diagnostic.config({
      virtual_text = { prefix = "●", source = "if_many" },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = { border = "rounded", source = "always" },
    })

    -- Diagnostic signs
    local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- LSP Attach keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local keymap = vim.keymap.set
        local buf = ev.buf

        keymap("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "Go to definition" })
        keymap("n", "gD", vim.lsp.buf.declaration, { buffer = buf, desc = "Go to declaration" })
        keymap("n", "gr", vim.lsp.buf.references, { buffer = buf, desc = "Find references" })
        keymap("n", "gi", vim.lsp.buf.implementation, { buffer = buf, desc = "Go to implementation" })
        keymap("n", "gt", vim.lsp.buf.type_definition, { buffer = buf, desc = "Go to type definition" })
        keymap("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover info" })
        keymap("n", "<leader>k", vim.lsp.buf.signature_help, { buffer = buf, desc = "Signature help" })
        keymap("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = buf, desc = "Signature help" })
        keymap("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, desc = "Rename symbol" })
        keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "Code action" })
        keymap("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, { buffer = buf, desc = "Format" })
        keymap("n", "[d", vim.diagnostic.goto_prev, { buffer = buf, desc = "Previous diagnostic" })
        keymap("n", "]d", vim.diagnostic.goto_next, { buffer = buf, desc = "Next diagnostic" })
        keymap("n", "<leader>d", vim.diagnostic.open_float, { buffer = buf, desc = "Diagnostic details" })
      end,
    })

    -- ===========================================
    -- Go (gopls)
    -- ===========================================
    lspconfig.gopls.setup({
      capabilities = capabilities,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
          gofumpt = true,
          usePlaceholders = true,
          completeUnimported = true,
        },
      },
    })

    -- ===========================================
    -- Lua
    -- ===========================================
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })

    -- ===========================================
    -- PHP (intelephense)
    -- ===========================================
    lspconfig.intelephense.setup({
      capabilities = capabilities,
      settings = {
        intelephense = {
          files = { maxSize = 5000000 },
        },
      },
    })

  end,
}
