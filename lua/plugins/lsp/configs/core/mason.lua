-- NOTE: Package installer
return {
	"mason-org/mason.nvim",
	event = {
		"BufReadPost",
		"BufNewFile",
	},
	init = function()
		vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Mason | Installer", silent = true })
	end,
	cmd = {
		"Mason",
		"MasonInstall",
		"MasonInstallAll",
		"MasonUpdate",
		"MasonUninstall",
		"MasonUninstallAll",
		"MasonLog",
	},
	opts = {
		ui = {
			border = vim.g.border_enabled and "rounded" or "none",
			-- Whether to automatically check for new versions when opening the :Mason window.
			check_outdated_packages_on_open = false,
			icons = {
				package_pending = " ",
				package_installed = " ",
				package_uninstalled = " ",
			},
		},
		-- install_root_dir = path.concat { vim.fn.stdpath "config", "/lua/custom/mason" },
		registries = {
			"github:mason-org/mason-registry",
		},
	},
	dependencies = {
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					-- Go
					"gopls",
					"delve",
					"staticcheck",
					"gofumpt",
					"revive",

					-- JSON
					"json-lsp",
					"fixjson",

					-- Lua (Já que a config é em Lua)
					"lua-language-server",
					"stylua",

					-- Web & General
					"prettier",
				},
				auto_update = true,
				run_on_start = true,
			},
		},
		{
			"mason-org/mason-lspconfig.nvim",
			dependencies = {
				"mason-org/mason.nvim",
				"neovim/nvim-lspconfig",
			},
			config = function()
				-- NOTE: Load LSP Installed
				vim.schedule(function()
					local ok_mason, mason_lspconfig = pcall(require, "mason-lspconfig")
					local ok_opts, opts = pcall(require, "plugins.lsp.opts")
					if not (ok_mason and ok_opts) then
						return
					end

					vim.lsp.config("*", {
						capabilities = opts.capabilities,
						on_attach = opts.on_attach,
						on_init = opts.on_init,
					})

					local servers = mason_lspconfig.get_installed_servers()
					local excluded = { "ts_ls" }

					for _, server in ipairs(servers) do
						if not vim.tbl_contains(excluded, server) then
							-- Load LSP Settings(If Exists)
							local ok_settings, settings = pcall(require, "plugins.lsp.settings." .. server)
							if ok_settings then
								vim.lsp.config(string.lower(server), settings)
							end

							-- Enable LSP
							vim.lsp.enable(server)
						end
					end
				end)
			end,
		},
	},
}

