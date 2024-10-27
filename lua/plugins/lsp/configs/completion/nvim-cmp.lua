-- NOTE: Completion Engine
return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    init = function()
      vim.keymap.set("n", "<leader>oa", function()
        vim.g.toggle_cmp = not vim.g.toggle_cmp
        if vim.g.toggle_cmp then
          vim.notify("Toggled On", vim.log.levels.INFO, { title = "Autocomplete" })
        else
          vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Autocomplete" })
        end
      end, { desc = "Options | Toggle Autocomplete" })
    end,
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      -- Lazily load the vscode like snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup {
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<s-Tab>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm { select = false },
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        -- Condition for Autocomplete
        enabled = function()
          return (vim.g.toggle_cmp and vim.bo.buftype == "")
        end,
      }

      -- Extensions for File Type with Luasnip
      require("luasnip").filetype_extend("javascriptreact", { "html" })
      require("luasnip").filetype_extend("typescriptreact", { "html" })
      require("luasnip").filetype_extend("svelte", { "html" })
      require("luasnip").filetype_extend("vue", { "html" })
      require("luasnip").filetype_extend("php", { "html" })
      require("luasnip").filetype_extend("javascript", { "javascriptreact" })
      require("luasnip").filetype_extend("typescript", { "typescriptreact" })

      -- Add Border
      if vim.g.border_enabled then
        opts.window = {
          completion = require("cmp").config.window.bordered(),
          documentation = require("cmp").config.window.bordered(),
        }
      end

      -- local cmdline_mappings = vim.tbl_extend("force", {}, require("cmp").mapping.preset.cmdline(), {
      --   -- Custom mappings para cmdline, se necessário
      -- })

      -- cmp.setup.cmdline(":", {
      --   mapping = cmdline_mappings,
      --   sources = {
      --     { name = "cmdline" },
      --   },
      -- })
    end,
  },
  -- Dependências adicionais
  {
    "saecki/crates.nvim",
    tag = "v0.4.0",
    opts = {},
  },
}
-- {
--     "Exafunction/codeium.nvim",
--     enabled = false,
--     opts = {
--         enable_chat = true,
--     },
-- },
