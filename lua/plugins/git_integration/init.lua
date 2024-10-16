plugins = {}

plugin_loader = require("utils.load_plugins")

plugin_loader.load_plugins(plugins, "/plugins/git")

return plugins

