-- NOTE: Global Variables
-- local sysname = vim.uv.os_uname().sysname
-- local os = sysname:match "Windows" and "Windows" or sysname:match "Linux" and "Linux" or sysname -- Windows, Linux, Darwin, NetBSD,...
local os = "Linux"

local global = {
	mkdp_auto_close = false, -- Don't Exit Preview When Switching Buffers
	-- snipmate_snippets_path = vim.fn.stdpath("config") .. "/snippets/snipmate", -- path to snipmate snippets
	skip_ts_context_commentstring_module = false, -- disable treesitter context commentstring
	toggle_cmp = true, -- enable nvim-cmp
	["loaded_node_provider"] = 0, -- disable node provider
	["loaded_python3_provider"] = 0, -- disable python3 provider
	["loaded_perl_provider"] = 0, -- disable perl provider
	["loaded_ruby_provider"] = 0, -- disable ruby provider
	border_enabled = false, -- NOTE: Toggle border for LSP Windows, nvim-cmp, lazy, which-key, mason
	mapleader = " ",
	maplocalleader = "\\",
	disable_autoformat = true,
	os = os,
	-- path_delimiter = os == "Windows" and ";" or ":",
	-- path_separator = os == "Windows" and "\\" or "/",
}

for name, value in pairs(global) do
	vim.g[name] = value
end
