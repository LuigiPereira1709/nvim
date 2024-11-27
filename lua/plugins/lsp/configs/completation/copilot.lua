return {
    "github/copilot.vim",
    event = "InsertEnter",

    -- Keymaps 
    vim.keymap.set("n", "<space>cd", "<cmd> Copilot disable<CR>", { desc = "[C]opilot [D]isable",noremap = true, silent = true }),
    vim.keymap.set("n", "<space>ce", "<cmd> Copilot enable<CR>", { desc = "[C]opilot [E]nable",noremap = true, silent = true }),
    vim.keymap.set("n", "<space>cr", "<cmd> Copilot restart<CR>", { desc = "[C]opilot [R]estart",noremap = true, silent = true }),
    vim.keymap.set("n", "<space>cl", "<cmd> Copilot log<CR>", { desc = "[C]opilot [L]og",noremap = true, silent = true }),
    vim.keymap.set("n", "<space>cs", "<cmd> Copilot status<CR>", { desc = "[C]opilot [S]tatus",noremap = true, silent = true }),
    vim.keymap.set("n", "<space>cp", "<cmd> Copilot panel<CR>", { desc = "[C]opilot [P]anel",noremap = true, silent = true }),
}
