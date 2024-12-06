return {
	"brianhuster/live-preview.nvim",
  enabled = false,
  cmd = "LivePreview",
	dependencies = {
		"brianhuster/autosave.nvim", -- Not required, but recomended for autosaving and sync scrolling

		-- You can choose one of the following pickers
		"nvim-telescope/telescope.nvim",
	},
	-- config = function()
	-- 	require("livepreview").setup({})
	-- end,
	-- opts = {},
}
