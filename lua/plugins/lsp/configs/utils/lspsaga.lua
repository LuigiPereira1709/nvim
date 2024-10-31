-- NOTE: Improve Other LSP Functionalities
return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  event = "LspAttach",
  init = function()
    vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "Lspsaga | Code Action", silent = true })
    vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "Lspsaga | Code Outline", silent = true })
    vim.keymap.set(
      "n",
      "<leader>lI",
      "<cmd>Lspsaga incoming_calls<cr>",
      { desc = "Lspsaga | Incoming Calls", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>lO",
      "<cmd>Lspsaga outgoing_calls<cr>",
      { desc = "Lspsaga | Outgoing Calls", silent = true }
    )
    vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", { desc = "Lspsaga | Rename", silent = true })
    vim.keymap.set(
      "n",
      "<leader>lj",
      "<cmd>Lspsaga diagnostic_jump_next<cr>",
      { desc = "Lspsaga | Next Diagnostic", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>lk",
      "<cmd>Lspsaga diagnostic_jump_prev<cr>",
      { desc = "Lspsaga | Prev Diagnostic", silent = true }
    )
  end,
}
