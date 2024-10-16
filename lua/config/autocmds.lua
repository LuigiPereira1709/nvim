local utils = require("utils")

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    if vim.w.auto_cursorline then
      vim.wo.cursorline = true
      vim.w.auto_cursorline = nil
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    if vim.wo.cursorline then
      vim.w.auto_cursorline = true
      vim.wo.cursorline = false
    end
  end,
})
-- Disable line numbers when entering terminal
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})
-- Enable line numbers when exiting terminal
vim.api.nvim_create_autocmd({ "TermClose" }, {
  callback = function()
    vim.wo.number = true
    vim.wo.relativenumber = true
  end,
})

-- Run file with <Shift> + f11
vim.keymap.set("n", "<s-F10>", function() utils.compile_file.compile_current_file() end, { desc = "Run Current Buf", noremap = true })

-- setup_jdtls
vim.cmd [[
    augroup jdtls_lsp
        autocmd!
        autocmd FileType java lua require'config.jdtls'.setup_jdtls()
    augroup end
]]
