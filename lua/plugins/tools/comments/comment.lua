 
-- NOTE: Commenter
return {
  "numToStr/Comment.nvim",
  event = {"BufReadPre", "BufNewFile"},
  enabled = true,
  config = function()
    vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment Line" })
    vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment Selected" })
    require("Comment").setup {
      -- ignores empty lines
      ignore = "^$",
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    }
  end,
  dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
}
