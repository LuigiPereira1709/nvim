local dap = require("dap")
dap.adapters.go = {
	type = "executable",
	command = "node",
	-- args = { "~/.local/share/nvim/mason/bin/go-debug-adapter" },
	-- args = { vim.fn.stdpath("data") .. "/mason/bin/go-debug-adapter" },
    vim.fn.stdpath("data") .. "/mason/packages/go-debug-adapter/extension/dist/debugAdapter.js" 
}
dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		showLog = false,
		program = "${file}",
		dlvToolPath = vim.fn.exepath("dlv"),
	},
}
