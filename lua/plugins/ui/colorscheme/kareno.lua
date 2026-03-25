local TelescopePromptTitle_fg = "#1f1f1f"
local TelescopePromptTitle_bg = "#8aa8a8"
local TelescopeResultsTitle_fg = "#1f1f1f"
local TelescopeResultsTitle_bg = "#c29abb"
local TelescopePreviewTitle_fg = "#1f1f1f"
local TelescopePreviewTitle_bg = "#ffb3c3"
local HlChunk1 = "#8aa8a8"
local HlChunk2 = "#ffb3c3"
return {
	"LuigiPereira1709/kareno",
	lazy = false,
	config = function()
		require("kareno").setup({
			variant = "yoru",
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

				note = "teal",
				error = "red",
				warn = "yellow",
			},

			palette = {
				yoru = {
					base = "NONE",
					overlay = "NONE",
				},
				yami = {
					base = "NONE",
					overlay = "NONE",
				},
			},
			highlight_groups = {
				-- Dashboard
				DashboardFooter = { fg = "purple" },
				DashboardHeader = { fg = "red" },

				-- Diagnostic
				DiagnosticError = { fg = "red" },
				-- MiniIndentscope
				MiniIndentscopeSymbol = { fg = "muted" },

				-- Smooth Cursor matrix
				SmoothCursor = { fg = "red" },
				SmoothCursorGreen = { fg = "teal" },

				-- Java
				-- ["@lsp.typemod.class.declaration.java"] = { fg = "pink" },
				-- ["@lsp.type.class.java"] = { fg = "purple" },
				-- ["@lsp.type.interface.java"] = { fg = "yellow" },
				-- ["@lsp.type.method.java"] = { fg = "red" },
				-- ["@lsp.type.variable.java"] = { fg = "text" },
				-- ["@lsp.type.property.java"] = { fg = "text" },
				-- -- ['@lsp.typemod.property.static.java'] = { fg = 'purple' },
				-- ["@lsp.type.parameter.java"] = { fg = "text" },
				-- ["@lsp.mod.readonly.java"] = { fg = "purple" },
				-- ["@lsp.mod.static.java"] = { fg = "purple" },
				-- -- ['@lsp.type.annotation.java'] = { fg = 'green' },
				-- javaNumber = { fg = "green" },
				-- javaOperator = { fg = "teal" },
			},
		})
	end,
}
