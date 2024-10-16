return {
    "akinsho/toggleterm.nvim",

    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                end
                -- For vertical terminals
                return vim.o.columns * 0.4
            end,
            open_mapping = [[<c-\>]],
            -- hide_numbers = true,
            autochdir = false,
            shade_terminals = true,  -- This option takes priority over highlights
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            persist_mode = true,
            direction = 'vertical',  -- Set this to 'horizontal', 'tab', or 'float' as needed
            close_on_exit = true,
            clear_env = false,
            shell = vim.o.shell,
            auto_scroll = true,
            float_opts = {
                border = 'curved',  -- Options: 'single', 'double', 'shadow', 'curved'
                -- background = 'Normal',
                -- winblend = 3,
                -- title_pos = 'left',  -- Options: 'left', 'center', 'right'
            },
            -- winbar = {
            --     enable = false,
            --     name_formatter = function(term)
            --         return term.name
            --     end
            -- },
        })
    end,
    -- Keymaps
    vim.keymap.set("n", "tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Vertical terminal", noremap = true, silent = true }),
    vim.keymap.set("n", "tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float terminal", noremap = true, silent = true }),
    vim.keymap.set("n", "th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Horizontal terminal", noremap = true, silent = true }),
    vim.keymap.set("n", "tt", "<cmd>ToggleTerm direction=tab<cr>", { desc = "Tab terminal", noremap = true, silent = true }),
}
