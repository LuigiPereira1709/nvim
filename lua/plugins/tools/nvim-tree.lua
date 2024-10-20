return {
	"nvim-tree/nvim-tree.lua",
    dependencies = { "echasnovski/mini.icons" },
	config = function()
		vim.keymap.set("n", "<space>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle [E]xplorer" })

		local icons = require("config.icons")

        local HEIGHT_RATIO = 0.8
        local WIDTH_RATIO = 0.5

		require("nvim-tree").setup({
			hijack_netrw = false,
			auto_reload_on_write = true,
			sync_root_with_cwd = true,

            view = {
				relativenumber = false,
                float = {
                    enable = true,
                    open_win_config = function()
                        local screen_w = vim.opt.columns:get()
                        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                        local window_w = screen_w * WIDTH_RATIO
                        local window_h = screen_h * HEIGHT_RATIO
                        local window_w_int = math.floor(window_w)
                        local window_h_int = math.floor(window_h)
                        local center_x = (screen_w - window_w) / 2
                        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                        - vim.opt.cmdheight:get()
                        return {
                            border = "rounded",
                            relative = "editor",
                            row = center_y,
                            col = center_x,
                            width = window_w_int,
                            height = window_h_int,
                        }
                    end,
                },
                width = function()
                    return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
                end,
            },

			renderer = {
				add_trailing = false,
				group_empty = false,
				highlight_git = false,
				full_name = false,
				highlight_opened_files = "none",
				root_folder_label = ":t",
				indent_width = 2,
				indent_markers = {
					enable = false,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						none = " ",
					},
				},
				icons = {
					git_placement = "before",
					padding = " ",
					symlink_arrow = " ➛ ",
					glyphs = {
						default = icons.ui.Text,
						symlink = icons.ui.FileSymlink,
						bookmark = icons.ui.BookMark,
						folder = {
							arrow_closed = icons.ui.ChevronRight,
							arrow_open = icons.ui.ChevronShortDown,
							default = icons.ui.Folder,
							open = icons.ui.FolderOpen,
							empty = icons.ui.EmptyFolder,
							empty_open = icons.ui.EmptyFolderOpen,
							symlink = icons.ui.FolderSymlink,
							symlink_open = icons.ui.FolderOpen,
						},
						git = {
							unstaged = icons.git.FileUnstaged,
							staged = icons.git.FileStaged,
							unmerged = icons.git.FileUnmerged,
							renamed = icons.git.FileRenamed,
							untracked = icons.git.FileUntracked,
							deleted = icons.git.FileDeleted,
							ignored = icons.git.FileIgnored,
						},
					},
				},
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
				symlink_destination = true,
			},
			update_focused_file = {
				enable = true,
				debounce_delay = 15,
				update_root = true,
				ignore_list = {},
			},

			diagnostics = {
				enable = true,
				show_on_dirs = false,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = icons.diagnostics.BoldHint,
					info = icons.diagnostics.BoldInformation,
					warning = icons.diagnostics.BoldWarning,
					error = icons.diagnostics.BoldError,
				},
			},
		})
	end,
}
