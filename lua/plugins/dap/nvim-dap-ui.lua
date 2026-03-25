-- NOTE: Debugging
return {
  "rcarriga/nvim-dap-ui",
  init = function()
    -- Navigation
    vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "DAP | Continue", silent = true })
    vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", { desc = "DAP | Step Over", silent = true })
    vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "DAP | Step Into", silent = true })
    vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.step_out()<cr>", { desc = "DAP | Step Out", silent = true })
    
    -- Breakpoints
    vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "DAP | Breakpoint", silent = true })
    vim.keymap.set("n", "<leader>dx", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", { desc = "DAP | Breakpoint Condition", silent = true })

    -- Debugging Control 
    vim.keymap.set("n", "<leader>dq", "<cmd>lua require'dap'.terminate()<cr>", { desc = "DAP | Stop Debugging", silent = true })
    vim.keymap.set("n", "<leader>de", "<cmd>lua require'dap'.restart()<cr>", { desc = "DAP | Reload Debugging", silent = true })

    -- UI Layouts
    vim.keymap.set("n", "<leader>dd", function()
      require("dapui").toggle(1)
      require("dapui").toggle(3)
    end, { desc = "DAP | UI Main (REPL)", silent = true })

    -- Specific Panels
    vim.keymap.set("n", "<leader>dr", function() require("dapui").toggle(1) end, { desc = "DAP | UI (Scopes/Breakpoints)", silent = true })
    vim.keymap.set("n", "<leader>du", function() require("dapui").toggle(2) end, { desc = "DAP | UI (Stacks/Watches)", silent = true })
    vim.keymap.set("n", "<leader>dg", function() require("dapui").toggle(3) end, { desc = "DAP | UI (REPL/Logs)", silent = true })
    vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "DAP | Run Last", silent = true })
  end,
  dependencies = {
    { "nvim-neotest/nvim-nio" },
    { "theHamsta/nvim-dap-virtual-text", opts = {} },
    { "mfussenegger/nvim-dap" },
  },
  opts = {
    layouts = {
      -- 1: Main Panel (automatic)
      {
        elements = {
          { id = "scopes", size = 0.5 },
          { id = "breakpoints", size = 0.5 },
        },
        size = 40,
        position = "right",
      },
      {
        elements = {
          { id = "stacks", size = 0.5 },
          { id = "watches", size = 0.5 },
        },
        size = 40,
        position = "left",
      },
      {
        elements = {
          { id = "repl", size = 1.0 },
        },
        size = 10,
        position = "bottom",
      },
    },
  },
}
