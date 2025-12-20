return {
	"folke/twilight.nvim",
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			window = { backdrop = 0.7, height = 1, width = 110 },
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},
}
