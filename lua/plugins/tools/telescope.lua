return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "kkharji/sqlite.lua",
  },

  -- require("utils.find_sessions").find_sessions(),
  keys = {
      {
      "fb", function() require("telescope.builtin").buffers({
          sort_lastused = true,
          attach_mappings = function(_, map)
            -- Delete buffer
            map("i", "<C-d>", function(prompt_bufnr)
              local selection = require("telescope.actions.state").get_selected_entry()
              require("telescope.actions").close(prompt_bufnr)
              if selection then
                vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                buf_name = selection.path:gsub(".*/", ""):gsub("%.%.?%w+$", "")
                print("Deleted buffer: " .. buf_name)
              end
            end)
            return true
          end,
          -- ignore_current_buffer = true,
      })
  end, desc = "Buffers",
  },

  {
      "ff", function()
        require("telescope.builtin").find_files({
          prompt_title = "Find Files",
          hidden = false,
          previewer = true,
        })
      end, desc = "Find File (CWD)",
  },
    {
      "fg", function()
        require("telescope.builtin").git_files({
          prompt_title = "Git Files",
          hidden = true,
          previewer = true,
        })
      end, desc = "Search Git Files",
    },
    {
      "f?", function()
        require("telescope.builtin").help_tags({
          prompt_title = "Help Tags",
        })
      end, desc = "Find Help",
    },
    {
      "fo", function()
        require("telescope.builtin").oldfiles({
          prompt_title = "Recent Files",
          previewer = true,
        })
      end, desc = "Open Recent File",
    },
    {
      "ft", function()
        require("telescope.builtin").live_grep({
          prompt_title = "Live Grep",
          hidden = true,
          previewer = true,
        })
      end, desc = "Live Grep",
    },
    {
      "fc", function()
        require("telescope.builtin").git_commits({
          prompt_title = "Git Commits",
        })
      end, desc = "Git commits",
    },
    {   -- Find Sessions
        "fs", function()
          vim.cmd("FindSessions")
        end, desc = "Find Sessions",
      }
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local icons = require("config.icons")

    -- Autocomando para personalizar o buffer do Telescope
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "TelescopeResults",
      callback = function(ctx)
        vim.api.nvim_buf_call(ctx.buf, function()
          vim.fn.matchadd("TelescopeParent", "\t\t.*$")
          vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
        end)
      end,
    })

    -- Cores para os títulos
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = '#111111', bg = '#739393' }) -- Azul claro
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#111111", bg = "#548b40" }) -- Verde
    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#111111", bg = "#5E698E" }) -- Laranja

    telescope.setup({
      defaults = {
          -- layout_strategy = "center",
          sorting_strategy = "ascending",
          mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
        previewer = true,
        prompt_prefix = " " .. icons.ui.Telescope .. " ",
        selection_caret = icons.ui.BoldArrowRight .. " ",
        file_ignore_patterns = { "node_modules", ".git/" },
        layout_config = {
            prompt_position = "top",
            preview_cutoff = 120,
            horizontal = {
                width = 0.7,
                height = 0.7,
                preview_width = 0.6,
                mirror = false,
            },
        },
        color_devicons = true,
      },
      -- pickers = {
      --   find_files = {
      --     hidden = true,
      --     previewer = true,
      --     prompt_title = "Find Files",
      --   },
      --   git_files = {
      --     hidden = true,
      --     previewer = true,
      --     prompt_title = "Git Files",
      --   },
      --   live_grep = {
      --     previewer = true,
      --     prompt_title = "Live Grep",
      --   },
      --   buffers = {
      --     mappings = {
      --       i = {
      --         ["<c-d>"] = actions.delete_buffer,
      --       },
      --       n = {
      --         ["<c-d>"] = actions.delete_buffer,
      --       },
      --     },
      --     previewer = true,
      --   },
      -- },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({
            previewer = true,
            initial_mode = "normal",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
              horizontal = {
                width = 0.5,
                height = 0.4,
                preview_width = 0.6,
              },
            },
          }),
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
}
