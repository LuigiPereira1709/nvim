local M = {}
local keymap = vim.keymap.set
local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities()

local function lsp_keymaps(bufnr)
	local buf_opts = { buffer = bufnr, silent = true }
	-- keymap("n", "gD", vim.lsp.buf.declaration, buf_opts)
	keymap("n", "gD", "<cmd>Lspsaga finder<cr>", buf_opts)
	keymap("n", "gd", "<cmd>Lspsaga goto_definition<cr>", buf_opts)
	-- keymap("n", "gd", vim.lsp.buf.definition, buf_opts)
	keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", buf_opts)
	keymap("n", "gp", "<cmd>Lspsaga peek_definition<cr>", buf_opts)
	-- keymap("n", "K", vim.lsp.buf.hover, buf_opts)
	keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", buf_opts)
	keymap("n", "gI", "<cmd>Telescope lsp_implementations<cr>", buf_opts)
end

-- Highlight symbol under cursor
local function lsp_highlight(client, bufnr)
	if client.supports_method("textDocument/documentHighlight") then
		vim.api.nvim_create_augroup("lsp_document_highlight", {
			clear = false,
		})
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = "lsp_document_highlight",
		})
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlight(client, bufnr)
end

M.on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

return M

-- local M = {}
-- local keymap = vim.keymap.set
-- local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- M.capabilities = cmp_nvim_lsp.default_capabilities()

-- M.lsp_keymaps = function(bufnr)
-- 	-- keymap("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, silent = true })
-- 	keymap("n", "gD", "<cmd>Lspsaga finder<cr>", { buffer = bufnr, silent = true })
-- 	keymap("n", "gd", "<cmd>Lspsaga goto_definition<cr>", { buffer = bufnr, silent = true })
-- 	keymap("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP | Code Action", silent = true })
-- 	-- keymap("n", "gd", vim.lsp.buf.definition, {buffer = bufnr, silent = true})
-- 	keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", { buffer = bufnr, silent = true })
-- 	keymap("n", "gp", "<cmd>Lspsaga peek_definition<cr>", { buffer = bufnr, silent = true })
-- 	-- keymap("n", "K", vim.lsp.buf.hover, {buffer = bufnr, silent = true})
-- 	keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", { buffer = bufnr, silent = true })
-- 	keymap("n", "gI", "<cmd>Telescope lsp_implementations<cr>", { buffer = bufnr, silent = true })
-- 	keymap("v", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP | Code Action", silent = true })
-- end

-- -- Highlight symbol under cursor
-- M.lsp_highlight = function(client, bufnr)
-- 	if client:supports_method("textDocument/documentHighlight") then
-- 		vim.api.nvim_create_augroup("lsp_document_highlight", {
-- 			clear = false,
-- 		})
-- 		vim.api.nvim_clear_autocmds({
-- 			buffer = bufnr,
-- 			group = "lsp_document_highlight",
-- 		})
-- 		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
-- 			group = "lsp_document_highlight",
-- 			buffer = bufnr,
-- 			callback = vim.lsp.buf.document_highlight,
-- 		})
-- 		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
-- 			group = "lsp_document_highlight",
-- 			buffer = bufnr,
-- 			callback = vim.lsp.buf.clear_references,
-- 		})
-- 	end
-- end

-- M.on_attach = function(client, bufnr)
-- 	M.lsp_keymaps(bufnr)
-- 	M.lsp_highlight(client, bufnr)
-- end

-- M.on_init = function(client, _)
-- 	if client:supports_method("textDocument/semanticTokens") then
-- 		client.server_capabilities.semanticTokensProvider = nil
-- 	end
-- end

-- return M

-- local M = {}
-- local keymap = vim.keymap.set
-- local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- M.capabilities = cmp_nvim_lsp.default_capabilities()

-- M.lsp_keymaps = function(bufnr)
-- 	keymap("n", "gD", "<cmd>Lspsaga finder<cr>", { buffer = bufnr, silent = true })
-- 	keymap("n", "gd", "<cmd>Lspsaga goto_definition<cr>", { buffer = bufnr, silent = true })
-- 	keymap("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP | Code Action", silent = true })
-- 	keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", { buffer = bufnr, silent = true })
-- 	keymap("n", "gp", "<cmd>Lspsaga peek_definition<cr>", { buffer = bufnr, silent = true })
-- 	keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", { buffer = bufnr, silent = true })
-- 	keymap("n", "gI", "<cmd>Telescope lsp_implementations<cr>", { buffer = bufnr, silent = true })
-- 	keymap("v", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP | Code Action", silent = true })
-- end

-- M.lsp_highlight = function(client, bufnr)
-- 	if client.supports_method("textDocument/documentHighlight") then
-- 		local group = "lsp_document_highlight_" .. bufnr
-- 		vim.api.nvim_create_augroup(group, { clear = true })

-- 		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
-- 			group = group,
-- 			buffer = bufnr,
-- 			callback = vim.lsp.buf.document_highlight,
-- 		})
-- 		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
-- 			group = group,
-- 			buffer = bufnr,
-- 			callback = vim.lsp.buf.clear_references,
-- 		})
-- 	end
-- end

-- M.on_attach = function(client, bufnr)
-- 	M.lsp_keymaps(bufnr)
-- 	M.lsp_highlight(client, bufnr)
-- end

-- M.on_init = function(client, _)
-- 	if client.name == "lua_ls" then
-- 		if client.supports_method("textDocument/semanticTokens") then
-- 			client.server_capabilities.semanticTokensProvider = nil
-- 		end
-- 	end
-- end

-- return M
