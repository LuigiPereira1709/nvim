return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    
    -- Keymaps
    vim.keymap.set("n", "<space>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit", noremap = true, silent = true })
}
