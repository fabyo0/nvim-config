return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = { horizontal = { prompt_position = "top", preview_width = 0.55 }, width = 0.87, height = 0.80 },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<Esc>"] = actions.close,
          },
        },
        file_ignore_patterns = { "node_modules", ".git/", "vendor/" },
      },
      pickers = { find_files = { hidden = true } },
      extensions = {
        fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case" },
        ["ui-select"] = { require("telescope.themes").get_dropdown() },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")

    local keymap = vim.keymap.set
    local builtin = require("telescope.builtin")

    keymap("n", "<leader>ff", builtin.find_files, { desc = "Dosya bul" })
    keymap("n", "<leader>fg", builtin.live_grep, { desc = "Grep (içerik ara)" })
    keymap("n", "<leader>fw", builtin.grep_string, { desc = "Kelime ara" })
    keymap("n", "<leader>fb", builtin.buffers, { desc = "Buffer'lar" })
    keymap("n", "<leader>fr", builtin.oldfiles, { desc = "Son dosyalar" })
    keymap("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
    keymap("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
    keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
    keymap("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
    keymap("n", "<leader><leader>", builtin.resume, { desc = "Resume search" })
  end,
}
