return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- ui plugins to make debugging simplier
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
    },
    
    debug = function()
        -- ensure the java debug adapter is installed
        require("mason-nvim-dap").setup({
            ensure_installed = { "java-debug-adapter", "java-test" },
        })
    end,

    config = function()
        -- gain access to the dap plugin and its functions
        local dap = require("dap")
        -- gain access to the dap ui plugin and its functions
        local dapui = require("dapui")

        -- Setup the dap ui with default configuration
        dapui.setup({
          layouts = {
            {
              elements = {
                { id = 'scopes', size = 0.25 },
                { id = 'breakpoints', size = 0.25 },
                { id = 'stacks', size = 0.25 },
                { id = 'watches', size = 0.25 },
              },
              size = 40,
              position = 'left',
            },
            {
              elements = {
                { id = 'repl', size = 0.5 },
                { id = 'console', size = 0.5 },
              },
              size = 10,
              position = 'bottom',
            },
          },
          floating = {
            max_height = nil,  -- These can be integers or a float between 0 and 1.
            max_width = nil,   -- Floats will be treated as percentage of your screen.
          },
          windows = { indent = 1 },
          render = {
            max_type_length = nil, -- Can be integer or nil.
          }
        })

         -- setup an event listener for when the debugger is launched
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end

        -- set a vim motion for <Space> + d + t to toggle a breakpoint at the line where the cursor is currently on
        vim.keymap.set("n", "<space>dt", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })
        -- set a vim motion for <Space> + d + s to start the debugger and launch the debugging ui
        vim.keymap.set("n", "<space>dd", dap.continue, { desc = "[D]ebug [S]tart" })
        -- set a vim motion to close the debugging ui
        vim.keymap.set("n", "<space>dq", dapui.close, {desc = "[D]ebug [Q]uit"})
        vim.api.nvim_set_keymap('n', '<space>du', '<cmd>lua require("dapui").toggle()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>de', '<cmd>lua require("dapui").float_element("scopes")<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>db', '<cmd>lua require("dapui").float_element("breakpoints")<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>ds', '<cmd>lua require("dapui").float_element("stacks")<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>dw', '<cmd>lua require("dapui").float_element("watches")<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>dr', '<cmd>lua require("dapui").float_element("repl")<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>dc', '<cmd>lua require("dapui").float_element("console")<CR>', { noremap = true, silent = true })
    end
}
