vim.g.mapleader = ' '

-- Load autocmds
require("config.utils")
require("config.autocommands")

-- Load keymaps 
require("config.mappings")

-- Load options
require("config.options")

-- Load lazy
require("config.lazy")
