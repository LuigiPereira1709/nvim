local headers = require("core.headers")

local randomHeader = function()
	local keys = {}
	for key in pairs(headers) do
		table.insert(keys, key)
	end
	local randomKey = keys[math.random(#keys)]
	return headers[randomKey]
end

local center = {
	{
		desc = " Find File ",
		key = "f",
		icon = " ",
		key_format = " %s",
		action = "Telescope find_files",
	},
	{
		desc = " Find Project ",
		icon = " ",
		key = "p",
		key_format = " %s",
		action = "Telescope projects",
	},
	{
		desc = " Find Sessions ",
		icon = " ",
		key = "s",
		key_format = " %s",
		action = "FindSessions",
	},
	{
		desc = " Leet's Code ",
		key = "l",
		icon = " ",
		key_format = " %s",
		action = "Leet",
	},
	-- {
	-- 	desc = " New Spring Project",
	-- 	key = "b",
	-- 	icon = " ",
	-- 	key_format = " %s",
	-- 	action = "Springtime",
	-- },
	{
		desc = " Exit                                                      ",
		key = "q",
		icon = " ",
		key_format = " %s",
		action = "exit",
	},
}
local message = function()
	math.randomseed(os.time())
	local messages = require("core.messages")
	local randomIndex = math.random(#messages)
	return messages[randomIndex]
end

local footer = { message() }

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = {
		theme = "doom",
		config = {
			header = randomHeader(),
			center = center,
			footer = footer,
		},
	},
}
