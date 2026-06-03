-- NOTE: Persistent Breakpoints (Save/Restore Breakpoints)
return {
	"Weissle/persistent-breakpoints.nvim",
	event = "BufReadPost",
	opts = {
		load_breakpoints_event = { "BufReadPost" },
	},
	config = function(_, opts)
		require("persistent-breakpoints").setup(opts)
	end,
}