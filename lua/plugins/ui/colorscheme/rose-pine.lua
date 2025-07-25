local TelescopePromptTitle_fg = "#111111"
local TelescopePromptTitle_bg = "#5e838f"
local TelescopeResultsTitle_fg = "#111111"
local TelescopeResultsTitle_bg = "#676385"
local TelescopePreviewTitle_fg = "#111111"
local TelescopePreviewTitle_bg = "#b34f6d"
local HlChunk1 = "#5e838f"
local HlChunk2 = "#b34f6d"

return {
	"rose-pine/neovim",
	lazy = false,
	init = function()
		require("rose-pine").setup({
			variante = "main",
			disable_background = true,

			enable = {
				terminal = true,
			},

			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},

			groups = {
				panel = "NONE",

				note = "pine",
				error = "love",
				warn = "#e0d184",
			},

			palette = {
				main = {
					base = "NONE",
					overlay = "NONE",
				},
			},
			highlight_groups = {
				-- Dashboard
				DashboardFooter = { fg = "iris" },
				DashboardHeader = { fg = "love" },

				-- Diagnostic
				DiagnosticError = { fg = "love" },

				-- MiniIndentscope
				MiniIndentscopeSymbol = { fg = "muted" },

				-- Smooth Cursor matrix
				SmoothCursor = { fg = "love" },
				SmoothCursorGreen = { fg = "pine" },

				-- Java
				-- ["@lsp.typemod.class.declaration.java"] = { fg = "rose" },
				-- ["@lsp.type.class.java"] = { fg = "#bbb5c7" },
				-- ["@lsp.type.interface.java"] = { fg = "gold" },
				-- ["@lsp.type.method.java"] = { fg = "love" },
				-- ["@lsp.type.variable.java"] = { fg = "text" },
				-- ["@lsp.type.property.java"] = { fg = "text" },
				-- -- ['@lsp.typemod.property.static.java'] = { fg = '#9779d1' },
				-- ["@lsp.type.parameter.java"] = { fg = "text" },
				-- ["@lsp.mod.readonly.java"] = { fg = "iris" },
				-- ["@lsp.mod.static.java"] = { fg = "iris" },
				-- -- ['@lsp.type.annotation.java'] = { fg = 'leaf' },
				-- javaNumber = { fg = "leaf" },
				-- javaOperator = { fg = "pine" },
			},
		})
	end,
}
