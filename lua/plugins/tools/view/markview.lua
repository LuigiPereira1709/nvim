-- NOTE: Better Markdown
return {
	"OXY2DEV/markview.nvim",
	event = "VeryLazy",
	lazy = false, -- Recommended
	-- ft = "markdown" -- If you decide to lazy-load anyway
	dependencies = {
		-- You will not need this if you installed the
		-- parsers manually
		-- Or if the parsers are in your $RUNTIMEPATH
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
