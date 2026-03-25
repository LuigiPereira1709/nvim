-- NOTE: Debug Adapter Protocol
return {
  "mfussenegger/nvim-dap",
  config = function()
    -- NOTE: Check out this for guide
    -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    local dap = require "dap"
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "󰁕", texthl = "DiagnosticSignInfo", linehl = "Visual", numhl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DapLogPoint", { text = "󰛨", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })

    local dapui = require "dapui"
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open(1) -- Panel (Scopes/Breakpoints)
      dapui.open(3) -- Panel (REPL/Logs)
    end

    -- dap.listeners.before.event_terminated["dapui_config"] = function()
    --   dapui.close()
    -- end

    -- dap.listeners.before.event_exited["dapui_config"] = function()
    --   dapui.close()
    -- end

    dap.listeners.before.event_output["dap_output_handler"] = function(_, body)
      if body.output then
        vim.schedule(function()
        end)
      end
    end

    -- NOTE: Make sure to install the needed files/exectubles through mason
    require "plugins.dap.settings.bash-debug-adapter"
    require "plugins.dap.settings.chrome-debug-adapter"
    require "plugins.dap.settings.firefox-debug-adapter"
    -- require "plugins.dap.settings.go-debug-adapter" -- NOTE: now the nvim-dap-go take care of this
    require "plugins.dap.settings.js-debug"
  end,
}
