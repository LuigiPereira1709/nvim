return {
	settings = {
		-- pyright = {},
		python = {
			vendorPath = "./venv",
			-- venvPath = "./venv",
			analysis = {
				autoImportCompletions = true,
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				typeCheckingMode = "on",
				useLibraryCodeForTypeshedBinaries = true,
			},
		},
	},
}
