return {
	cmd = { "bash-language-server", "start" }, -- Command to start the bash language server
	filetypes = { "sh", "bash" }, -- File types that this server will handle
	rootPatterns = { ".git" }, -- Patterns to identify the root of the project
	bashIde = {
		enabled = false, -- Disable bashIde as it is not needed
	},
	shfmt = {
		args = { "-i", "2", "-ci" }, -- Arguments for shfmt to format shell scripts
		cmd = { "shfmt", "-i", "2", "-ci" }, -- Indent with 2 spaces and use compact mode
		stdin = true,
		filetypes = { "sh", "bash" },
		rootPatterns = { ".git" },
	},
}
