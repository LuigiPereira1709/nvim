return {
	settings = {
		gopls = {
			staticcheck = true,
			analyses = {
				unusedparams = true,
				unusedvariables = true,
			},
			semanticTokens = true,
			semanticTokenTypes = {
				number = true,
				string = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
}
