return {
  -- hlchunk
  {
    "shellRaining/hlchunk.nvim",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },

    config = function()
      local mods_path = "hlchunk.mods."
      require("hlchunk").setup {}

      -- Chunk Setup
      local function setup_chunk(hlchunk1, hlchunk2)
        local chunk = require(mods_path .. "chunk")
        chunk({
          priority = 15,
          use_treesitter = true,
          style = {
            { fg = hlchunk1 or 'NONE' },
            { fg = hlchunk2 or 'NONE' },
          },
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
          duration = 200,
          delay = 300,
        }):enable()
      end

      setup_chunk()

      -- Disable line_num
      local line_num = require(mods_path .. "line_num")
      line_num({
        priority = 10,
        use_treesitter = false,
      }):disable()

      _G.setup_chunk = setup_chunk
    end,
  },

  { -- mini-indentscope
    "echasnovski/mini.indentscope",
    lazy = false,
    init = function()
      require("mini.indentscope").setup {
        enable = false,
        draw = {
          delay = 200,
          -- animation = require("mini.indentscope").gen_animation.exponential({ easing = 'in', duration = 1000, unit = 'total' }),
          animation = require("mini.indentscope").gen_animation.linear { easing = "in", duration = 150, unit = "total" },
          -- animation = require("mini.indentscope").undraw(),
          priority = 2,
        },
        -- mappings = {
        --   goto_top = "[g",
        --   goto_bottom = "]g",
        -- },
        options = {
          border = "both",
          indent_at_cursor = false,
          try_as_border = false,
        },
        symbol = "│",
      }
    end,
  },
}
