-- NOTE: Syntax Highlighting
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	dependencies = {
		-- ts-autotag utilizes treesitter to understand the code structure to automatically close tsx tags
		{
			"windwp/nvim-ts-autotag",
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		},
	},
	-- when the plugin builds run the TSUpdate command to ensure all our servers are installed and updated
	build = ":TSUpdate",
	config = function()
		-- Setup treesitter
		local ts = require("nvim-treesitter")
		ts.setup()

		-- list of parsers to ensure installed
		local ensure_installed = {
			"vim",
			"vimdoc",
			"hurl",
			"bash",
			"lua",
			"python",
			"java",
			"go",
			"gotmpl",
			"javascript",
			"typescript",
			"html",
			"css",
			"json",
			"tsx",
			"markdown",
			"markdown_inline",
			"gitignore",
		}

		-- Modern way to install parsers on main branch
		ts.install(ensure_installed)

		-- Modern way to enable syntax highlighting for all filetypes using Neovim's native API
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
