return {
  {
    "gen740/SmoothCursor.nvim",
    init = function()
      require("smoothcursor").setup {
        type = "matrix",
      }
    end,
  },
  -- {
  --   "echasnovski/mini.animate",
  --   event = 'VeryLazy',
  --   config = function()
  --     local animate = require "mini.animate"
  --     animate.setup {
  --       -- enable = true,
  --       cursor = {
  --         -- Animate for 200 milliseconds with linear easing
  --         timing = animate.gen_timing.linear { duration = 200, unit = "total" },

  --         -- Animate with shortest line for any cursor move
  --         path = animate.gen_path.line {
  --           predicate = function()
  --             return true
  --           end,
  --         },
  --       },
  --     }
  --   end,
  -- },
}
