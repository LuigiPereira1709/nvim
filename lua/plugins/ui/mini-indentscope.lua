return{
    'echasnovski/mini.indentscope',
    config = function()
        require('mini.indentscope').setup({
            draw = {
                delay = 200,
                -- animation = require("mini.indentscope").gen_animation.exponential({ easing = 'in', duration = 1000, unit = 'total' }),
                animation = require("mini.indentscope").gen_animation.linear({ easing = 'in', duration = 150, unit = 'total' }),
                -- animation = require("mini.indentscope").undraw(),
                priority = 2,
            },
            mappings = {
                goto_top = '[g',
                goto_bottom = ']g',
            },
            options = {
                border = 'both',
                indent_at_cursor = false,
                try_as_border = true,
            },
            symbol = '│'
        })
        vim.cmd('highlight MiniIndentscopeSymbol guifg=#585858')
    end,
}
