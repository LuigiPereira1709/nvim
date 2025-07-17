-- NOTE: Utilities and Commands
local command = vim.api.nvim_create_user_command

command("SaveColorscheme", function()
	local colorscheme = vim.g.colors_name
	local colors = {}

	-- Function for extract colors value using regex
	local function extract_colors()
		local file = io.open(vim.fn.stdpath("config") .. "/lua/plugins/ui/colorscheme/" .. colorscheme .. ".lua", "r")
		if file then
			local content = file:read("*all")
			file:close()

			colors.TelescopePromptTitle_fg = content:match('TelescopePromptTitle_fg%s*=%s*"(#%x%x%x%x%x%x)"')
			colors.TelescopePromptTitle_bg = content:match('TelescopePromptTitle_bg%s*=%s*"(#%x%x%x%x%x%x)"')
			colors.TelescopeResultsTitle_fg = content:match('TelescopeResultsTitle_fg%s*=%s*"(#%x%x%x%x%x%x)"')
			colors.TelescopeResultsTitle_bg = content:match('TelescopeResultsTitle_bg%s*=%s*"(#%x%x%x%x%x%x)"')
			colors.TelescopePreviewTitle_fg = content:match('TelescopePreviewTitle_fg%s*=%s*"(#%x%x%x%x%x%x)"')
			colors.TelescopePreviewTitle_bg = content:match('TelescopePreviewTitle_bg%s*=%s*"(#%x%x%x%x%x%x)"')
			colors.HlChunk1 = content:match('HlChunk1%s*=%s*"(#%x%x%x%x%x%x)"')
			colors.HlChunk2 = content:match('HlChunk2%s*=%s*"(#%x%x%x%x%x%x)"')
		end
	end

	extract_colors()

	-- Save data on colorscheme.txt
	local file = io.open(vim.fn.stdpath("config") .. "/lua/core/.colorscheme.txt", "w")
	if file then
		file:write("colorscheme=" .. colorscheme .. "\n")
		file:write("TelescopePromptTitle_fg=" .. (colors.TelescopePromptTitle_fg or "NONE") .. "\n")
		file:write("TelescopePromptTitle_bg=" .. (colors.TelescopePromptTitle_bg or "NONE") .. "\n")
		file:write("TelescopeResultsTitle_fg=" .. (colors.TelescopeResultsTitle_fg or "NONE") .. "\n")
		file:write("TelescopeResultsTitle_bg=" .. (colors.TelescopeResultsTitle_bg or "NONE") .. "\n")
		file:write("TelescopePreviewTitle_fg=" .. (colors.TelescopePreviewTitle_fg or "NONE") .. "\n")
		file:write("TelescopePreviewTitle_bg=" .. (colors.TelescopePreviewTitle_bg or "NONE") .. "\n")
		file:write("HlChunk1=" .. (colors.HlChunk1 or "NONE") .. "\n")
		file:write("HlChunk2=" .. (colors.HlChunk2 or "NONE") .. "\n")
		file:close()
	else
		vim.notify("Failed to open colorscheme.txt for writing.")
	end
end, { desc = "Save actual colorscheme" })

command("LoadColorscheme", function()
	local file = io.open(vim.fn.stdpath("config") .. "/lua/core/.colorscheme.txt", "r")
	if file then
		local config = {}
		for line in file:lines() do
			local key, value = line:match("([^=]+)=([^=]+)")
			if key and value then
				config[key] = value
			end
		end
		file:close()

		-- Apply colorscheme
		if config["colorscheme"] then
			vim.cmd.colorscheme(config["colorscheme"])
		end

		-- Telescope
		vim.api.nvim_set_hl(
			0,
			"TelescopePromptTitle",
			{ fg = config["TelescopePromptTitle_fg"] or "NONE", bg = config["TelescopePromptTitle_bg"] or "NONE" }
		)
		vim.api.nvim_set_hl(
			0,
			"TelescopeResultsTitle",
			{ fg = config["TelescopeResultsTitle_fg"] or "NONE", bg = config["TelescopeResultsTitle_bg"] or "NONE" }
		)
		vim.api.nvim_set_hl(
			0,
			"TelescopePreviewTitle",
			{ fg = config["TelescopePreviewTitle_fg"] or "NONE", bg = config["TelescopePreviewTitle_bg"] or "NONE" }
		)
		-- hlchunk
		_G.setup_chunk(config["HlChunk1"] or "NONE", config["HlChunk2"] or "NONE")
	else
		return vim.notify("Failed to open colorscheme.txt")
	end
end, { desc = "Load Colorscheme" })

-- NOTE: Create integration with telescope for plugin sessions
command("FindSessions", function()
	require("telescope.builtin").find_files({
		prompt_title = "Sessions",
		cwd = ".sessions/",
		previewer = true,
		attach_mappings = function(_, map)
			-- Pick session
			map("i", "<CR>", function(prompt_bufnr)
				local selection = require("telescope.actions.state").get_selected_entry()
				require("telescope.actions").close(prompt_bufnr)
				if selection then
					vim.cmd("SessionsLoad " .. selection.path)
					local selection_name = selection.path:gsub(".*/", ""):gsub("%.%.?%w+$", "")
					vim.notify("Load Session: " .. selection_name)
				end
			end)
			-- Delete session
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
end, { desc = "Find Sessions" })

command("Format", function(args)
	local status_ok, conform = pcall(require, "conform")
	if not status_ok then
		return vim.notify("conform.nvim isn't installed!!!")
	end

	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	conform.format({ async = true, lsp_format = "fallback", range = range })
	vim.notify("Format Done", vim.log.levels.INFO, { title = "Format" })
end, { nargs = "*", desc = "Code Format", range = true })

command("FormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
		vim.notify("Disable Autoformat (Local)", vim.log.levels.INFO, { title = "Format" })
	else
		vim.g.disable_autoformat = true
		vim.notify("Disable Autoformat", vim.log.levels.INFO, { title = "Format" })
	end
end, { desc = "Disable Autoformat", bang = true })

command("FormatEnable", function(args)
	if args.bang then
		vim.b.disable_autoformat = false
		vim.notify("Enable Autoformat (Local)", vim.log.levels.INFO, { title = "Format" })
	else
		vim.g.disable_autoformat = false
		vim.notify("Enable Autoformat", vim.log.levels.INFO, { title = "Format" })
	end
end, { desc = "Enable Autoformat", bang = true })

command("FormatToggle", function(args)
	if args.bang then
		if vim.b.disable_autoformat then
			vim.cmd("FormatEnable!")
		else
			vim.cmd("FormatDisable!")
		end
	else
		if vim.g.disable_autoformat then
			vim.cmd("FormatEnable")
		else
			vim.cmd("FormatDisable")
		end
	end
end, { desc = "Toggle Autoformat", bang = true })

command("LuaSnipEdit", function()
	require("luasnip.loaders").edit_snippet_files()
end, { nargs = "*", desc = "Edit the available snippets in the filetype" })

command("RemoveEmptyLines", function()
	vim.cmd(":g/^$/d")
	-- :v/./d
	--
	-- :g/^\s*$/d
	-- :v/\S/d
end, { nargs = "*", desc = "Remove all empty lines" })
command("RemoveTrailingSpaces", function()
	vim.cmd(":%s/s+$//e")
end, { nargs = "*", desc = "Remove all trailing spaces " })

function ClickGit()
	local status_ok, _ = pcall(require, "toggleterm")
	if not status_ok then
		return vim.notify("toggleterm.nvim isn't installed!!!")
	end

	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
	lazygit:toggle()
end

function ClickSplit()
	vim.cmd("vsp")
end
