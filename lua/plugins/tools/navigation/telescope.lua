return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		"kkharji/sqlite.lua",
	},

	keys = {
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers({
					sort_lastused = true,
					ignore_curernt_buffer = true,
					attach_mappings = function(_, map)
						-- Delete buffer
						map("i", "<C-d>", function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							require("telescope.actions").close(prompt_bufnr)
							if selection then
								vim.api.nvim_buf_delete(selection.bufnr, { force = true })
								local buf_name = selection.path:gsub(".*/", ""):gsub("%.%.?%w+$", "")
								print("Deleted buffer: " .. buf_name, vim.log.levels.INFO)
							end
						end)
						return true
					end,
				})
			end,
			desc = "Find Buffers",
		},

		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({
					-- prompt_title = "Find Files",
					hidden = false,
					previewer = true,
				})
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").git_files({
					-- prompt_title = "Git Files",
					hidden = true,
					previewer = true,
				})
			end,
			desc = "Git Files",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags({
					-- prompt_title = "Help Tags",
				})
			end,
			desc = "Help Tags",
		},
		{
			"<leader>fr",
			function()
				require("telescope.builtin").oldfiles({
					prompt_title = "Recent Files",
					previewer = true,
					sort_lastused = true,
					only_cwd = true,
					cwd_only = true,
				})
			end,
			desc = "Recent Files",
		},
		{
			"<leader>fw",
			function()
				require("telescope.builtin").live_grep({
					-- prompt_title = "Live Grep",
					hidden = true,
					previewer = true,
				})
			end,
			desc = "Live Grep",
		},
		{
			"<leader>fc",
			function()
				require("telescope.builtin").git_commits({})
			end,
			desc = "Git commits",
		},
		{
			"<leader>fn",
			function()
				require("telescope").extensions.notify.notify({})
			end,
			desc = "Notify",
		},
		{
			"<leader>fm",
			function()
				require("telescope.builtin").marks({})
			end,
			desc = "Marks",
		},
		{
			"<leader>fp",
			function()
				require("telescope").extensions.projects.projects({})
			end,
			desc = "Projects",
		},
		{ -- NOTE: Colorschemes selection
			"<leader>ft",
			function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.stdpath("config") .. "/lua/plugins/ui/colorscheme/",
					prompt_title = "Change Colorschemes",
					attach_mappings = function(_, map)
						-- Pick Colorscheme
						map("i", "<CR>", function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							require("telescope.actions").close(prompt_bufnr)
							if selection then
								local selection_name = selection.path:gsub(".*/", ""):gsub("%.%.?%w+$", "")
								vim.cmd.colorscheme(selection_name)
								vim.cmd("LoadColorscheme")
								vim.notify("Colorscheme: " .. selection_name)
							end
						end)

						-- Delete Colorscheme
						map("i", "<C-d>", function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							require("telescope.actions").close(prompt_bufnr)
							if selection then
								local selection_path = selection.path
								os.remove(selection_path)
								local selection_name = selection.path:gsub(".*/", ""):gsub("%.%.?%w+$", "")
								vim.notify("Deleted: " .. selection_name)
							end
						end)
						return true
					end,
				})
			end,
			desc = "Colorschemes",
		},
		{ -- Find Sessions
			"<leader>fs",
			function()
				vim.cmd("FindSessions")
			end,
			desc = "Find Sessions",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		local function smart_close(prompt_bufnr)
			actions.close(prompt_bufnr)
			vim.schedule(function()
				collectgarbage("collect")
			end)
		end

		-- Autocomando para personalizar o buffer do Telescope
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "TelescopeResults",
			callback = function(ctx)
				vim.api.nvim_buf_call(ctx.buf, function()
					vim.fn.matchadd("TelescopeParent", "\t\t.*$")
					vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
				end)
			end,
		})

		telescope.setup({
			defaults = {
				-- layout_strategy = "center",
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<esc>"] = smart_close,
						["<C-c>"] = smart_close,
						["<C-u>"] = false,
					},
				},
				previewer = true,
				file_ignore_patterns = { ".git/" },
				layout_config = {
					prompt_position = "top",
					preview_cutoff = 120,
					horizontal = {
						width = 0.7,
						height = 0.7,
						preview_width = 0.6,
						mirror = false,
					},
				},
				color_devicons = true,
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						previewer = true,
						initial_mode = "normal",
						sorting_strategy = "ascending",
						layout_strategy = "horizontal",
						layout_config = {
							horizontal = {
								width = 0.5,
								height = 0.4,
								preview_width = 0.6,
							},
						},
					}),
				},
			},
		})
		telescope.load_extension("projects")
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,
}
