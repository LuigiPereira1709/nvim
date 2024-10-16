return{
    "folke/twilight.nvim",
    {
        "folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
            window = { backdrop = 0.7 },
            plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<s-z>", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},
}
