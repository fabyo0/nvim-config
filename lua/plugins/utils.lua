return {
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({ check_ts = true, fast_wrap = { map = "<M-e>" } })
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      require("Comment").setup({ pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook() })
    end,
  },

  -- Surround
  { "kylechui/nvim-surround", version = "*", event = "VeryLazy", config = function() require("nvim-surround").setup({}) end },

  -- Todo Comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("todo-comments").setup({})
      vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Find TODOs" })
    end,
  },

  -- Illuminate
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("illuminate").configure({ delay = 200, large_file_cutoff = 2000, filetypes_denylist = { "neo-tree", "Trouble", "alpha", "lazy" } })
    end,
  },

  -- Colorizer
  { "norcalli/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" }, config = function() require("colorizer").setup() end },

  -- Autosave
  {
    "pocco81/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      enabled = true,
      execution_message = { enabled = false },
      trigger_events = { "InsertLeave", "TextChanged" },
      debounce_delay = 1000,
    },
  },

  -- ToggleTerm: Better terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        direction = "horizontal",
        shade_terminals = true,
      })
      vim.keymap.set("n", "<leader>m", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
    end,
  },
}
