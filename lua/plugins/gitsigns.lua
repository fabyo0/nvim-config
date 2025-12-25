return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = { add = { text = "│" }, change = { text = "│" }, delete = { text = "_" }, topdelete = { text = "‾" }, changedelete = { text = "~" } },
    current_line_blame = true,
    current_line_blame_opts = { virt_text = true, virt_text_pos = "eol", delay = 500 },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local keymap = vim.keymap.set
      keymap("n", "]g", function() gs.next_hunk() end, { buffer = bufnr, desc = "Next hunk" })
      keymap("n", "[g", function() gs.prev_hunk() end, { buffer = bufnr, desc = "Prev hunk" })
      keymap("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
      keymap("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
      keymap("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
      keymap("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { buffer = bufnr, desc = "Blame line" })
      keymap("n", "<leader>hd", gs.diffthis, { buffer = bufnr, desc = "Diff this" })
    end,
  },
}
