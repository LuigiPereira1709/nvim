return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local icons = require("config.icons")

        -- setup gitsigns
        require("gitsigns").setup({
            signs = {
                add = { text = icons.ui.BoldLineMiddle },
                change = {text = icons.ui.BoldLineDashedMiddle },
                delete = {text = icons.ui.TriangleShortArrowRight },
                topdelete = { text = icons.ui.TriangleShortArrowRight },
                changedelete = { text = icons.ui.BoldLineMiddle},
            },
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            update_debounce = 200,
            max_file_length = 40000,
            preview_config = {
                border = "rounded",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
        })

        -- Set a vim motion to <Space> + g + h to preview changes to the file under the cursor in visual mode
        vim.keymap.set("v", "gh", ":Gitsigns preview_hunk<CR>", { desc = "[G]it Preview [H]unk", noremap = true, silent = true })
        vim.keymap.set("v", "gl", ":Gitsigns toggle_linehl<CR>", { desc = "[G]it Toggle [L]inehl", noremap = true, silent = true })
        vim.keymap.set("v", "gd", ":Gitsigns toggle_word_diff<CR>", { desc = "[G]it Toggle [W]ord", noremap = true, silent = true })

    end,
}
