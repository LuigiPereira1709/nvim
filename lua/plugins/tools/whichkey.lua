local icons = require("config.icons")

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "", -- symbol prepended to a group
    },
    preset = "modern",
    win = {
      border = vim.g.border_enabled and "rounded" or "none",
    },
    delay = function()
      return 0
    end,
  },
  config = function(_, opts)
    local prefix = {
        space = "<space>"
    }
    require("which-key").setup(opts)
    require("which-key").add {
      {
          -- Normal
        { prefix.space .. "e",  group = "Explorer", icon = icons.kind.Folder },

        -- Telescope
        { prefix.space .. "f", group = "Telescope", icon = icons.telescope.f },
        { prefix.space .. "ff", group = "Find File", icon = icons.telescope.ff },
        { prefix.space .. "ft", group = "Live Grep", icon = icons.telescope.ft },
        { prefix.space .. "fb", group = "Buffers", icon = icons.telescope.fb },
        { prefix.space .. "fc", group = "Git Commit", icon = icons.telescope.fc },
        { prefix.space .. "fg", group = "Search Git File", icon = icons.telescope.fg },
        { prefix.space .. "fo", group = "Open Recent Files", icon = icons.telescope.fo },
        { prefix.space .. "f?", group = "Help", icon = icons.help },

        { prefix.space .. "h", group = "Harpoon", icon = icons.harpoon },
        { prefix.space .. "t", group = "Terminal", icon = icons.terminal },
        { prefix.space .. "a", group = "Cellular Animations", icon = "󰐱 " },
        { prefix.space .. "c", group = "Copilot Options", icon = icons.git.Copilot },

        -- Write commands
        { prefix.space .. "w", group = "Write Commands", icon = "✏ " },
        { prefix.space .. "wk", group = "Write|Continue", icon = "󰜎 " },
        { prefix.space .. "wq", group = "Write|Exit", icon = "󰩈 "},

        -- Close commands
        { prefix.space .. "q", group = "Close Commands", icon = icons.close },
        { prefix.space .. "qq", group = "Close", icon = icons.ui.Close },
        { prefix.space .. "q!", group = "Force Close", icon = icons.ui.BoldClose },

        -- Lazy
        { prefix.space .. "l", group = "Lazy Options", icon = icons.lz.lz },
        { prefix.space .. "lz", group = "Open" },
        { prefix.space .. "li", group = "Install", icon = icons.lz.li },
        { prefix.space .. "lc", group = "Check", icon = icons.lz.lc },
        { prefix.space .. "lx", group = "Clean", icon = icons.lz.lx },
        { prefix.space .. "lu", group = "Update", icon = icons.lz.lu },
        { prefix.space .. "ls", group = "Sync", icon = icons.lz.ls },
        { prefix.space .. "ll", group = "Log", icon = icons.lz.ll },
        { prefix.space .. "lr", group = "Reload", icon = icons.lz.lr },
        { prefix.space .. "ld", group = "Debug" },
        { prefix.space .. "lh", group = "Health", icon = icons.lz.lh },
        { prefix.space .. "l?", group = "Help", icon = icons.help },
        { prefix.space .. "lg", group = "Git", icon = "󰊢 " },

        -- Mason
        { prefix.space .. "m", group = "Mason Options", icon = icons.ms.ms },
        { prefix.space .. "ms", group = "Open" },
        { prefix.space .. "mr", group = "Restart", icon = icons.ms.mr },
        { prefix.space .. "mi", group = "Install", icon = icons.ms.mi },
        { prefix.space .. "ml", group = "Log", icon = icons.ms.ml },
        { prefix.space .. "mu", group = "Update", icon = icons.ms.mu },
        { prefix.space .. "mx", group = "Uninstall", icon = icons.ms.mx },

        -- Lsp
        { prefix.space .. "L", group = "Lsp Options", icon = icons.lsp.l },
        { prefix.space .. "Li", group = "Info", icon = icons.lsp.i },
        { prefix.space .. "Lr", group = "Restart", icon = icons.lsp.r },
        { prefix.space .. "Ls", group = "Start", icon = icons.lsp.s },
        { prefix.space .. "Lx", group = "Stop", icon = icons.lsp.x },

        -- Saga
        { prefix.space .. "g", group = "Saga" },
        -- { prefix.space .. "gd", group = "Diagnostics" },
        -- { prefix.space .. "gp", group = "Peek" },

        -- Java Options
        { prefix.space .. "j", group = "Java Options", icon = " "},

        -- Debug
        { prefix.space .. "d", group = "Debug Options", icon = icons.diagnostics.Debug },

        { prefix.space .. "s", group = "Sessions Save", icon = "󰔚 " },

        -- { "<space>T", group = "Tests", icon = "󰙨" },
      --   { "<space>d", group = "Debugging", icon = "" },
      --   { "<space>g", group = "Git", icon = "󰊢" },
      --   { "<leader>l", group = "LSP", icon = "" },
      --   { "<leader>n", group = "Neovim", icon = "" },
      --   { "<leader>o", group = "Options", icon = "" },
      --   { "<leader>p", group = "Plugins", icon = "" },
      --   { "<leader>r", group = "Runner", icon = "" },
      --
      --   { "<leader>v", group = "Venv", icon = "" },
      },
    }
  end,
}
