return {
  "eandrju/cellular-automaton.nvim",
  cmd = "CellularAutomaton",

  vim.keymap.set("v", "<space>cg", "<CMD>CellularAutomaton game_of_life<CR>", { desc = "Animation: game_of_life", noremap = true, silent = true }),
  vim.keymap.set("v", "<space>cs", "<CMD>CellularAutomaton scramble<CR>", { desc = "Animation: scramble", noremap = true, silent = true }),
  vim.keymap.set("v", "<space>cr", "<CMD>CellularAutomaton make_it_rain<CR>", { desc = "Animation: make_it_rain", noremap = true, silent = true }),
}
