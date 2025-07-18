local formatters_by_ft = {
	bash = { "shfmt" },
	lua = { "stylua" },
	python = { "black" },
	java = { "google_java_format" },
	cpp = { "clang_format" },
	c = { "clang_format" },
	go = { "gofumpt" },
	cs = { "csharpier" },
	yaml = { "yamlfmt" },
	css = { "prettier" },
	ruby = { "erb_formatter" },
	flow = { "prettier" },
	graphql = { "prettier" },
	html = { "prettier" },
	json = { "prettier" },
	javascriptreact = { "eslint_d" },
	javascript = { "prettier" },
	less = { "prettier" },
	markdown = { "prettier" },
	scss = { "prettier" },
	typescript = { "prettier" },
	typescriptreact = { "prettier" },
	vue = { "prettier" },
}

return {
	-- NOTE: Formatting
	"stevearc/conform.nvim",
	event = "BufReadPost",
	opts = {
		format_after_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			-- Disable autoformat for files in a certain path
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if bufname:match("/node_modules/") then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		formatters_by_ft = formatters_by_ft,
	},
}
