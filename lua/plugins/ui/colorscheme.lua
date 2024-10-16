return {
    -- Shortened Github Url
    "gmr458/cold.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
        return {
            -- nvimtree = {enabled = true, show_root = true, transparent_panel = true},
            transparent = true,
            -- show the '~' characters after the end of buffers
            show_end_of_buffer = true, -- default false
            -- set italic comment
            italic_comment = true, -- default false
            -- Make sure to set the color scheme when neovim loads and configures the dracula plugin
            vim.cmd.colorscheme("cold")
    }
    end,
}
