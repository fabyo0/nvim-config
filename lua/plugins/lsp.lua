return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.diagnostic.config({
      virtual_text = { prefix = "●", source = "if_many" },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = { border = "rounded", source = "always" },
    })

    local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap.set

        keymap("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Tanıma git" })
        keymap("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Deklarasyona git" })
        keymap("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "Referanslar" })
        keymap("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Implementation" })
        keymap("n", "gt", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Type definition" })
        keymap("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover bilgi" })
        keymap("n", "<leader>k", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })
        keymap("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })
        keymap("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
        keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
        keymap("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, { buffer = ev.buf, desc = "Format" })
        keymap("n", "[d", vim.diagnostic.goto_prev, { buffer = ev.buf, desc = "Önceki hata" })
        keymap("n", "]d", vim.diagnostic.goto_next, { buffer = ev.buf, desc = "Sonraki hata" })
        keymap("n", "<leader>d", vim.diagnostic.open_float, { buffer = ev.buf, desc = "Hata detayı" })
      end,
    })

    -- Go (gopls)
    lspconfig.gopls.setup({
      capabilities = capabilities,
      settings = {
        gopls = {
          analyses = { unusedparams = true, shadow = true, fieldalignment = true, nilness = true, unusedwrite = true, useany = true },
          staticcheck = true,
          gofumpt = true,
          usePlaceholders = true,
          completeUnimported = true,
          semanticTokens = true,
          codelenses = { gc_details = true, generate = true, run_govulncheck = true, test = true, tidy = true, upgrade_dependency = true },
          hints = { assignVariableTypes = true, compositeLiteralFields = true, compositeLiteralTypes = true, constantValues = true, functionTypeParameters = true, parameterNames = true, rangeVariableTypes = true },
        },
      },
    })

    -- Lua
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
  end,
}
