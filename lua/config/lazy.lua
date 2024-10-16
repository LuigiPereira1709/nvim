local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
        -- add LazyVim and import its plugins
		-- { 
		--	"LazyVim/LazyVim",
		--	import = "lazyvim.plugins",
		--	opts = {
		--		colorscheme = "solarized-osaka",
		--		news = {
		--			lazyvim = true,
		--			neovim = true,
		--		},
		--	},
		-- },
        { import = "plugins.git_integration"},
        { import = "plugins.ui"},
        { import = "plugins.dap"},
        { import = "plugins.tools"},
        { import = "plugins.lsp"},
        { import = "plugins"},
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
--	dev = {
--		path = "~/.ghq/github.com",
--	},
	checker = { enabled = true }, -- automatically check for plugin updates
	install = { colorschme = "cold" },
	performance = {
		cache = {
			enabled = true,
			-- disable_events = {},
		},
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
		custom_keys = {
			["<localleader>d"] = function(plugin)
---@diagnostic disable-next-line: undefined-global
				dd(plugin)
			end,
		},
	},
	debug = false,
})

--Keymaps
local keymap = vim.keymap
keymap.set("n", "<space>lz", ":Lazy<cr>", { desc = "Open Lazy UI", noremap = true, silent = true })
keymap.set("n", "<space>li", ":Lazy install ", { desc = "Lazy Install", noremap = true })
keymap.set("n", "<space>lc", ":Lazy check<CR>", { desc = " Lazy Check", noremap = true, silent = true })
keymap.set("n", "<space>lx", ":Lazy clean<CR>", { desc = " Lazy Clean", noremap = true, silent = true })
keymap.set("n", "<space>lu", ":Lazy update<CR>", { desc = "󰚰 Lazy Update", noremap = true, silent = true })
keymap.set("n", "<space>ls", ":Lazy sync<CR>", { desc = "󰓦 Lazy Sync", noremap = true, silent = true })
keymap.set("n", "<space>ll", ":Lazy log<cr>", { desc = "󱂅 Lazy Log", noremap = true, silent = true })
keymap.set("n", "<space>lr", ":Lazy reload<cr>", { desc = "󰑓 Lazy Reload", noremap = true, silent = true })
keymap.set("n", "<space>ld", ":Lazy debug<cr>", { desc = "Lazy Debug", noremap = true, silent = true })
keymap.set("n", "<space>lh", ":Lazy health<cr>", { desc = "💊 Lazy Health", noremap = true, silent = true })
keymap.set("n", "<space>l?", ":Lazy help<cr>", { desc = "󰋖 Lazy Help", noremap = true, silent = true })

