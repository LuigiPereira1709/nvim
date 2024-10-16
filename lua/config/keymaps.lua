local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x', { desc = "Delete character without affecting registers" })
keymap.set("n", "<Leader>p", '"0p', { desc = "Paste from unnamed register" })
keymap.set("n", "<Leader>P", '"0P', { desc = "Paste before cursor from unnamed register" })
keymap.set("v", "<Leader>p", '"0p', { desc = "Paste from unnamed register in visual mode" })
keymap.set("n", "<Leader>c", '"_c', { desc = "Change (delete and insert) without affecting registers" })
keymap.set("n", "<Leader>C", '"_C', { desc = "Change before cursor without affecting registers" })
keymap.set("v", "<Leader>c", '"_c', { desc = "Change selection without affecting registers" })
keymap.set("v", "<Leader>C", '"_C', { desc = "Change selection before cursor without affecting registers" })
keymap.set("n", "<Leader>d", '"_d', { desc = "Delete without affecting registers" })
keymap.set("n", "<Leader>D", '"_D', { desc = "Delete line without affecting registers" })
keymap.set("v", "<Leader>d", '"_d', { desc = "Delete selection without affecting registers" })
keymap.set("v", "<Leader>D", '"_D', { desc = "Delete selection without affecting registers" })

-- Increment/decrement
keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', { desc = "Delete word backwards" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
-- keymap.set("n", "<space>o", "o<Esc>^Da", opts)
-- keymap.set("n", "<space>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Remove search highlights after searching
keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Vim's terminal mode
-- keymap.set("n", "<space>t", ":terminal<cr>", opts) -- Open terminal 
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", opts) -- Exit terminal

-- Save file changes
keymap.set("n", "wk", ":w!<cr>", opts)
keymap.set("n", "wq", ":wq!<cr>", opts)

-- New tab
keymap.set("n", "te", ":tabnew<cr>", opts) -- 0pen new tab
keymap.set("n", "<tab>", ":tabnext<cr>", opts)
keymap.set("n", "<s-tab>", ":tabprev<cr>", opts)

-- Split window
keymap.set("n", "sh", ":split<cr>", opts)
keymap.set("n", "sv", ":vsplit<cr>", opts)

-- Move window
keymap.set("n", "<s-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<s-k>", "<C-w>k", { desc = "Move to upper window" })
keymap.set("n", "<s-j>", "<C-w>j", { desc = "Move to lower window" })
keymap.set("n", "<s-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize window
keymap.set("n", "<C-h>", "<C-w><", { desc = "Decrease window width" })
keymap.set("n", "<C-l>", "<C-w>>", { desc = "Increase window width" })
keymap.set("n", "<C-j>", "<C-w>+", { desc = "Increase window height" })
keymap.set("n", "<C-k>", "<C-w>-", { desc = "Decrease window height" })

-- Close window
keymap.set("n", "<C-q>", ":tabclose<cr>", opts)

-- Close buffer
keymap.set("n", "qq", ":quit<cr>", opts)
keymap.set("n", "q!", ":q!<cr>", opts)
