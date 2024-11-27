local headers = require "config.headers"

local randomHeader = function()
  local keys = {}
  for key in pairs(headers) do
    table.insert(keys, key)
  end
  local randomKey = keys[math.random(#keys)]
  return headers[randomKey]
end

local center = {
  {
    desc = "Find File ",
    key = "f",
    icon = " ",
    key_format = " %s",
    action = "Telescope find_files",
    group = "@markup.heading.1.markdown",
  },
  {
    desc = "Find Project ",
    key = "p",
    icon = " ",
    key_format = " %s",
    action = "Telescope projects",
    group = "@markup.heading.1.markdown",
  },
  {
    desc = "Find Sessions ",
    key = "s",
    icon = " ",
    key_format = " %s",
    action = "FindSessions",
    group = "@markup.heading.2.markdown",
  },
  {
    desc = "New Spring Project",
    key = "b",
    icon = " ",
    key_format = " %s",
    action = "Springtime",
    group = "@markup.heading.3.markdown",
  },
  {
    desc = "Exit                                                      ",
    key = "q",
    icon = " ",
    key_format = " %s",
    action = "exit",
    group = "@markup.heading.4.markdown",
  },
}
local message = function()
  math.randomseed(os.time())
  local messages = require "config.messages"
  local randomIndex = math.random(#messages)
  return messages[randomIndex]
end

local footer = { message() }

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = {
    theme = "doom",
    -- hide = {
    --   statusline = fa,
    --   tabline = true,
    --   winbar = true,
    -- },
    config = {
      -- header = headers.zero_zero_seven,
      header = randomHeader(),
      center = center,
      footer = footer,
      -- packages = { enable = false },
      -- mru = { limit = 5, icon = ' ', label = 'Recent Files', cwd_only = false },
    },
  },
}
