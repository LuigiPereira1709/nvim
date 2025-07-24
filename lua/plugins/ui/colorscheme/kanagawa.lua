local TelescopePromptTitle_fg = "#b8b39b"
local TelescopePromptTitle_bg = "#1f3548"
local TelescopeResultsTitle_fg = "#b8b39b"
local TelescopeResultsTitle_bg = "#5c5336"
local TelescopePreviewTitle_fg = "#b8b39b"
local TelescopePreviewTitle_bg = "#7d2628"
local HlChunk1 = "#8d794d"
local HlChunk2 = "#8f3f49"

return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	init = function()
		require("kanagawa").setup({
			transparent = true,
			style = "night",
			terminalColors = true,
			colors = {
				palette = {
					-- Bg Shades
					sumiInk0 = "NONE",
					sumiInk1 = "#111117",
					sumiInk2 = "#121218",
					sumiInk3 = "NONE",
					sumiInk4 = "NONE",
					sumiInk5 = "#242432",
					sumiInk6 = "#393949", --fg

					-- Popup and Floats
					waveBlue1 = "#17202f",
					waveBlue2 = "#1f3548",

					-- Diff and Git
					winterGreen = "#1b201b",
					winterYellow = "#302d27",
					winterRed = "#2c1d21",
					winterBlue = "#161620",
					autumnGreen = "#4b604a",
					autumnRed = "#7d2628",
					autumnYellow = "#91753b",

					-- Diag
					samuraiRed = "#8c1818",
					roninYellow = "#a56529",
					waveAqua1 = "#435b52",
					dragonBlue = "#41535b",

					-- Fg and Comments
					oldWhite = "#847a61",
					fujiWhite = "#989483",
					fujiGray = "#47463d",

					oniViolet = "#5d4e75",
					oniViolet2 = "#746a93",
					crystalBlue = "#4f5d87",
					springViolet1 = "#5b5470",
					springViolet2 = "#637792",
					springBlue = "#4c707a",
					lightBlue = "#678d8e", -- unused yet
					waveAqua2 = "#507066", -- improve lightness: desaturated greenish Aqua

					-- waveAqua2  = "#426f62",
					-- waveAqua4  = "#507663",
					-- waveAqua5  = "#446e64",
					-- waveAqua3  = "#426f62",

					springGreen = "#607747",
					boatYellow1 = "#5c5336",
					boatYellow2 = "#7a6a45",
					carpYellow = "#8d794d",

					sakuraPink = "#855d69",
					waveRed = "#8f3f49",
					peachRed = "#a33b3e",
					surimiOrange = "#a36542",
					katanaGray = "#484f4f",
				},
			},
			overrides = function(colors)
				local palette = colors.palette
				return {
					MiniIndentscopeSymbol = { fg = palette.fujiGray },
					SmoothCursor = { fg = palette.carpYellow },
					SmoothCursorGreen = { fg = palette.springBlue },
				}
			end,
		})
	end,
}
