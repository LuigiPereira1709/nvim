local TelescopePromptTitle_fg = "#b8b39b"
local TelescopePromptTitle_bg = "#1f3548"
local TelescopeResultsTitle_fg = "#b8b39b"
local TelescopeResultsTitle_bg = "#5c5336"
local TelescopePreviewTitle_fg = "#b8b39b"
local TelescopePreviewTitle_bg = "#7d2628"
local HlChunk1 = "#b35b79"
local HlChunk2 = "#FF5D62"

return {
	"thesimonho/kanagawa-paper.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		require("kanagawa-paper").setup({
			transparent = true,
			style = "ink",
			terminalColors = true,
			colors = {
				palette = {
					sumiInk0 = "NONE",
					sumiInk3 = "NONE",
					sumiInk4 = "NONE",
					sumiInk5 = "None",
				},
			},
			overrides = function(colors)
				local palette = colors.palette
				return {
					MiniIndentscopeSymbol = { fg = palette.lotusInk0 },
					SmoothCursor = { fg = palette.carpYellow },
					SmoothCursorGreen = { fg = palette.springBlue },
				}
			end,
		})
	end,
}
