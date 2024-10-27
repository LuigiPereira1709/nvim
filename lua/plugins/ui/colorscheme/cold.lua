local TelescopePromptTitle_fg = "#111111"
local TelescopePromptTitle_bg = "#739393"
local TelescopeResultsTitle_fg = "#111111"
local TelescopeResultsTitle_bg = "#548b40"
local TelescopePreviewTitle_fg = "#111111"
local TelescopePreviewTitle_bg = "#6E698E"
local HlChunk1 = "#739393"
local HlChunk2 = "#8f3949"

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
    }
  end,
}
