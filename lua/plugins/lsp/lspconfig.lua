return {
   {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            -- ensure that we have lua language server, typescript launguage server, java language server, and java test language server are installed
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "jdtls", 'lua_ls' },
            })
        end,
    },

   {
        "neovim/nvim-lspconfig",
        config = function()
            local icons = require("config.icons")

            -- get access to the lspconfig plugins functions
            local lspconfig = require("lspconfig")

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- setup the lua language server
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.gradle_ls.setup({
                capabilities = capabilities,
            })

            -- setup the typescript language server
            local default_diagnostic_config = {
                signs = {
                    active = true,
                    values = {
                        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
                        { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
                        { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
                        { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
                    },
                },
                virtual_text = false,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            }

            vim.diagnostic.config(default_diagnostic_config)

            for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
            end

           -- -- Set vim motion for <Space> + c + h to show code documentation about the code the cursor is currently over if available
            -- vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
            -- -- Set vim motion for <Space> + c + d to go where the code/variable under the cursor was defined
            -- vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
            -- -- Set vim motion for <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
            -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            -- -- Set vim motion for <Space> + c + r to display references to the code under the cursor
            -- vim.keymap.set(
            --     "n",
            --     "<leader>cr",
            --     require("telescope.builtin").lsp_references,
            --     { desc = "[C]ode Goto [R]eferences" }
            -- )
            -- -- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
            -- vim.keymap.set(
            --     "n",
            --     "<leader>ci",
            --     require("telescope.builtin").lsp_implementations,
            --     { desc = "[C]ode Goto [I]mplementations" }
            -- )
            -- -- Set a vim motion for <Space> + c + <Shift>R to smartly rename the code under the cursor
            -- vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
            -- -- Set a vim motion for <Space> + c + <Shift>D to go to where the code/object was declared in the project (class file)
            -- vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
        end,
    },
    -- Keymaps 
    vim.keymap.set("n", "<space>ms", ":Mason<cr>", { desc = "Open Mason", noremap = true, silent = true }),
    vim.keymap.set("n", "<space>mi", ":MasonInstall ", { desc = "Mason Install", noremap = true }),
    vim.keymap.set("n", "<space>ml", ":MasonLog<cr>", { desc = "Mason Log", noremap = true, silent = true }),
    vim.keymap.set("n", "<space>mu", ":MasonUpdate ", { desc = "Mason Update", noremap = true }),
    vim.keymap.set("n", "<space>mx", ":MasonUninstall ", { desc = "Mason Uninstall", noremap = true }),

    vim.keymap.set("n", "<space>Li", ":LspInfo<cr>", { desc = "Lsp Info", noremap = true, silent = true }),
    vim.keymap.set("n", "<space>Lr", ":LspRestart<cr>", { desc = "Lsp Restart", noremap = true, silent = true }),
    vim.keymap.set("n", "<space>Ls", ":LspStart<cr>", { desc = "Lsp Start", noremap = true, silent = true }),
    vim.keymap.set("n", "<space>Lx", ":LspStop<cr>", { desc = "Lsp Stop", noremap = true, silent = true }),
}
