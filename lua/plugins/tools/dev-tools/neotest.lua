-- NOTE: Neotest (Visual Testing Experience)
return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
	},
	init = function()
		vim.keymap.set("n", "<leader>tn", function()
			require("neotest").run.run()
		end, { desc = "Test | Nearest", silent = true })

		vim.keymap.set("n", "<leader>tf", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end, { desc = "Test | File", silent = true })

		vim.keymap.set("n", "<leader>td", function()
			require("neotest").run.run({ strategy = "dap" })
		end, { desc = "Test | Debug Nearest", silent = true })

		vim.keymap.set("n", "<leader>ts", function()
			require("neotest").summary.toggle()
		end, { desc = "Test | Summary", silent = true })

		vim.keymap.set("n", "<leader>to", function()
			require("neotest").output_panel.toggle()
		end, { desc = "Test | Output Panel", silent = true })

		vim.keymap.set("n", "<leader>tq", function()
			require("neotest").run.stop()
		end, { desc = "Test | Stop", silent = true })
	end,
	opts = function()
		return {
			adapters = {
				require("neotest-go"),
			},
			status = { virtual_text = true },
			output = { open_on_run = true },
		}
	end,
	config = function(_, opts)
		require("neotest").setup(opts)
	end,
}
