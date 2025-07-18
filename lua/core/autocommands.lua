-- NOTE: Autocommands
local fn = vim.fn

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General", { clear = true })

autocmd("VimEnter", {
	callback = function(data)
		-- buffer is a directory
		local directory = vim.fn.isdirectory(data.file) == 1

		-- change to the directory
		if directory then
			vim.cmd.cd(data.file)
			vim.cmd("Telescope find_files")
			-- require("nvim-tree.api").tree.open()
		end
	end,
	group = general,
	desc = "Open Telescope when it's a Directory",
})

-- Enable Line Number in Telescope Preview
autocmd("User", {
	pattern = "TelescopePreviewerLoaded",
	callback = function()
		vim.opt_local.number = false
	end,
	group = general,
	desc = "Enable Line Number in Telescope Preview",
})

-- Hide folds and Disable statuscolumn in these filetypes
autocmd("FileType", {
	pattern = { "sagaoutline" },
	callback = function()
		vim.opt_local.foldcolumn = "0"
		vim.opt_local.stc = "" -- not really important
	end,
	group = general,
	desc = "Disable Fold & StatusColumn",
})

autocmd("TermOpen", {
	callback = function()
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
		vim.cmd("startinsert!")
	end,
	group = general,
	desc = "Terminal Options",
})

autocmd("BufReadPost", {
	callback = function()
		if fn.line("'\"") > 1 and fn.line("'\"") <= fn.line("$") then
			vim.cmd('normal! g`"')
		end
	end,
	group = general,
	desc = "Go To The Last Cursor Position",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

autocmd({ "BufEnter", "BufNewFile" }, {
	callback = function()
		vim.o.showtabline = 0
	end,
	group = general,
	desc = "Disable Tabline",
})

autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	group = general,
	desc = "Disable New Line Comment",
})

autocmd("FileType", {
	pattern = { "c", "cpp", "py", "java", "cs" },
	callback = function()
		vim.bo.shiftwidth = 4
	end,
	group = general,
	desc = "Set shiftwidth to 4 in these filetypes",
})

autocmd({ "FocusLost", "BufLeave", "BufWinLeave", "InsertLeave" }, {
	-- nested = true, -- for format on save
	callback = function()
		if vim.bo.filetype ~= "" and vim.bo.buftype == "" then
			vim.cmd("silent! w!")
		end
	end,
	group = general,
	desc = "Auto Save",
})

autocmd("FocusGained", {
	callback = function()
		vim.cmd("checktime")
	end,
	group = general,
	desc = "Update file when there are changes",
})

autocmd("VimResized", {
	callback = function()
		vim.cmd("wincmd =")
	end,
	group = general,
	desc = "Equalize Splits",
})

autocmd("ModeChanged", {
	callback = function()
		if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
			vim.opt.hlsearch = true
		else
			vim.opt.hlsearch = false
		end
	end,
	group = general,
	desc = "Highlighting matched words when searching",
})

autocmd("FileType", {
	pattern = { "gitcommit", "markdown", "text", "log" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
	group = general,
	desc = "Enable Wrap in these filetypes",
})

local overseer = augroup("Overseer", { clear = true })

autocmd("FileType", {
	pattern = "OverseerList",
	callback = function()
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
		vim.cmd("startinsert!")
	end,
	group = overseer,
	desc = "Enter Normal Mode In OverseerList",
})

-- Set Colorscheme and save details
autocmd("Colorscheme", {
	callback = function()
		vim.cmd("SaveColorscheme")
	end,
})

-- Load Colorscheme and highlight settings
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("LoadColorscheme")
	end,
})
