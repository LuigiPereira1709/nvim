-- NOTE: Show Better Diagnostic Inline
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  enabled = true,
  event = "LspAttach",
  init = function()
    require('tiny-inline-diagnostic').setup()
  end
}
