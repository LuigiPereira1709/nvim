return {
   -- utility plugin for configuring the java language server for us
     "mfussenegger/nvim-jdtls",
      dependencies = {
          "mfussenegger/nvim-dap",
          "ray-x/lsp_signature.nvim"
      },
      ft = 'java',
      -- config = function()
      --     require "lsp_signature".setup()
      -- end,
}
