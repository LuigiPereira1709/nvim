-- NOTE: Treesitter Context (Sticky Context Headers)
return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "BufReadPre",
	opts = {
		enable = true, 
		max_lines = 3, 
		trim_scope = "outer", 
		mode = "cursor", 
	},
	config = function(_, opts)
		require("treesitter-context").setup(opts)
	end,
}
