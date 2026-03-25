-- NOTE: DAP Go (Handles everything for Go Debugging)
return {
	"leoluz/nvim-dap-go",
	ft = "go",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require("dap-go").setup()
	end,
}
