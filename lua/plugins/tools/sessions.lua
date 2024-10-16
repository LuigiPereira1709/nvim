return {
    'natecraddock/sessions.nvim',
    config = function()
        require("sessions").setup({
            auto_save_enabled = true,
            auto_restore_enabled = true,
            auto_session_enabled = true,
            auto_session_enable_last_session = true,
            session_filepath = ".sessions/",
            auto_session_enabled_filetypes = {
                "markdown",
                "java",
                "python",
                "sh",
                "lua",
            }
        })
    end,

    -- Keymaps
    vim.keymap.set("n", "<space>ss", ":SessionsSave .sessions/", { desc = "Save Session: 'session name'", noremap = true }),
    -- vim.keymap.set("n", "<space>sl", ":SessionsLoad .sessions/", { desc = "Load Session: 'session name'", noremap = true }),
    -- vim.keymap.set("n", "<space>sd", ":SessionsDelete .sessions/", { desc = "Delete Session: 'session name'", noremap = true }),
}
