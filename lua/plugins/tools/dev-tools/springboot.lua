return {
        "javiorfo/nvim-springtime",
        lazy = true,
        cmd = { "Springtime", "SpringtimeUpdate"},
        dependencies = { "javiorfo/nvim-popcorn", "javiorfo/nvim-spinetta", "hrsh7th/nvim-cmp" }, 
        build = function()
            require("springtime.core").update()
        end,
        opts = {
            -- spring = {
            --     spring_boot = {
            --         selected = 3,
            --         values = {
            --             -- VERSION HERE
            --         }
            --     },
            --     java_version = {
            --         selected = 2,
            --         values = {
            --             -- VERSION HERE
            --         }
            --     }
            -- }
        }
}
