local headers = require("core.headers")
local messages = require("core.messages")

local center = {
	{ desc = " Find File ", icon = " ", key = "f", action = "Telescope find_files" },
	{ desc = " Find Project ", icon = " ", key = "p", action = "Telescope projects" },
	{ desc = " Find Sessions ", icon = " ", key = "s", action = "FindSessions" },
	{ desc = " Leet's Code ", icon = " ", key = "l", action = "Leet" },
	{ desc = " Exit ", icon = " ", key = "q", action = "exit" },
}

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = {
		theme = "doom",
		config = {
			header = headers[next(headers)], -- Pega o primeiro cabeçalho disponível
			center = center,
			footer = { messages[math.random(#messages)] }, -- Pega uma mensagem aleatória
		},
	},
}
