return {
    "neovim/nvim-lspconfig",
    dependencies = { "Shougo/ddc-source-lsp" },
    config = function()
        local lspconfig = require("lspconfig")
        local default_cap = vim.lsp.protocol.make_client_capabilities()
        local cmp_cap = require('ddc_source_lsp').make_client_capabilities()
        local capabilities = vim.tbl_deep_extend('force', default_cap, cmp_cap)

        -- Pyright configuration
        lspconfig.pyright.setup({
            capabilities = capabilities,
            settings = {
                pyright = {
                    plugins = {
                        pyflakes = { enabled = true },
                        pylint = { enabled = true },
                        autopep8 = { enabled = true },
                        mypy = { enabled = true },
                    },
                },
            },
            on_attach = function(client)
                -- Disable pyright hover

                client.server_capabilities.hoverProvider = false

            end,
        })

        -- Pylsp configuration
        lspconfig.pylsp.setup({
            capabilities = capabilities,
        })
    end,
}
