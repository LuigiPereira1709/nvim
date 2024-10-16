return {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },

    config = function ()
        local mods_path = "hlchunk.mods."
        -- Configuração do hlchunk
        require("hlchunk").setup({})

        -- Chunk Configuration
        local chunk = require(mods_path .. "chunk")
        chunk({
            priority = 15,
            style = {
                { fg = "#346969" },
                { fg = "#4C1919" },
            },
            use_treesitter = true,
            chars = {
                horizontal_line = "─",
                vertical_line = "│",
                left_top = "╭",
                left_bottom = "╰",
                right_arrow = ">",
            },
            textobject = "[h",
            max_file_size = 1024 * 1024,
            error_sign = true,
            -- animation time
            duration = 200,
            delay = 300,
        }):enable()

        local line_num = require(mods_path .. "line_num")
        line_num({
            style = "#346969",
            priority = 10,
            use_treesitter = false,
        }):enable()
    end
}
