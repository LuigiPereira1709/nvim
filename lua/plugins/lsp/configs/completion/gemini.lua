return {
	"kiddos/gemini.nvim",
	enabled = false,
	event = {
		"BufReadPost",
		"BufNewFile",
	},
	-- build = {
	-- 	"pip install -r requirements.txt",
	-- 	":UpdateRemotePlugins",
	-- },
	opts = {
		model_config = {
			completion_delay = 60,
		},
		completion = {
			enabled = false,
			completion_delay = 60,
		},
	},
}
