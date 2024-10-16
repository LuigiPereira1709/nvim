return{
    "nvimdev/lspsaga.nvim",
    config = function ()
        require("lspsaga").setup({})
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },

    -- Keymaps
    vim.keymap.set("n", "gh", ":Lspsaga hover_doc<cr>", { desc = "Hover Doc", noremap = true, silent = true }),
    vim.keymap.set("n", "gd", ":Lspsaga peek_definition<cr>", { desc = "Peek Definition", noremap = true, silent = true }),
    -- vim.keymap.set("n", "<space>gd", ":Lspsaga goto_definition<cr>", { desc = "Goto Definition", noremap = true, silent = true }),
    vim.keymap.set("n", "gr", ":Lspsaga rename<cr>", { desc = "Rename", noremap = true, silent = true }),
    vim.keymap.set("n", "<space>ga", ":Lspsaga code_action<cr>", { desc = "Code Action", noremap = true, silent = true }),
    vim.keymap.set("n", "g!", ":Lspsaga show_buf_diagnostics<cr>", { desc = "Buff Diagnostics", noremap = true, silent = true }),
    vim.keymap.set("n", "gl!", ":Lspsaga show_line_diagnostics<cr>", { desc = "Line Diagnostics", noremap = true, silent = true }),
}
