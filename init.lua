require("core.globals")

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.runtimepath:prepend(lazypath)

-- NOTE: lazy.nvim options
local lazy_config = require("core.lazy")

-- NOTE: Load plugins
require("lazy").setup({
	{ import = "plugins" },
}, lazy_config)

require("options")

vim.schedule(function()
	require("mappings")
end)

require("myinit")
