return {
  "mfussenegger/nvim-dap",
  dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text", "leoluz/nvim-dap-go" },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      layouts = {
        { elements = { { id = "scopes", size = 0.25 }, { id = "breakpoints", size = 0.25 }, { id = "stacks", size = 0.25 }, { id = "watches", size = 0.25 } }, size = 40, position = "left" },
        { elements = { { id = "repl", size = 0.5 }, { id = "console", size = 0.5 } }, size = 10, position = "bottom" },
      },
    })

    require("nvim-dap-virtual-text").setup({ enabled = true, highlight_changed_variables = true })
    require("dap-go").setup()

    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

    vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "DapStoppedLine", numhl = "" })

    local keymap = vim.keymap.set
    keymap("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
    keymap("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
    keymap("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
    keymap("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
    keymap("n", "<F9>", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
    keymap("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    keymap("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Conditional Breakpoint" })
    keymap("n", "<leader>du", dapui.toggle, { desc = "Toggle Debug UI" })
    keymap("n", "<leader>dt", function() require("dap-go").debug_test() end, { desc = "Debug Go Test" })
  end,
}
