return {
      'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = { default_file_explorer = false },
  -- Optional dependencies
  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },

  vim.keymap.set("n", "<space>o", "<cmd>Oil<cr>", { desc = "Toggle Oil", noremap = true, silent = true })
}
