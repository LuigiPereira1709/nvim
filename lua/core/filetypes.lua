-- -- NOTE: Additional Filetypes
vim.filetype.add({
	extension = {
		["templ"] = "templ",
	},
	pattern = {
		[".*%.github/workflows/.*%.yml"] = "yaml.ghaction",
		[".*%.github/workflows/.*%.yaml"] = "yaml.ghaction",
		[".*/docker%-compose%.yml"] = "yaml.docker-compose",
		[".*/docker%-compose%.yaml"] = "yaml.docker-compose",
		[".*/compose%.yml"] = "yaml.docker-compose",
		[".*/compose%.yaml"] = "yaml.docker-compose",
	},
})
