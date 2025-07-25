return {
	{
		"elmcgill/springboot-nvim",
		dependencies = {
			-- "neovim/nvim-lspconfig",
			-- "mfussenegger/nvim-jdtls",
		},
		config = function()
			-- gain acces to the springboot nvim plugin and its functions
			local springboot_nvim = require("springboot-nvim")

			-- set a vim motion to <Space> + <Shift>J + r to run the spring boot project in a vim terminal
			vim.keymap.set("v", "<leader>jr", springboot_nvim.boot_run, { desc = "[J]ava [R]un Spring Boot" })
			-- set a vim motion to <Space> + <Shift>J + c to open the generate class ui to create a class
			vim.keymap.set("v", "<leader>jc", springboot_nvim.generate_class, { desc = "[J]ava Create [C]lass" })
			-- set a vim motion to <Space> + <Shift>J + i to open the generate interface ui to create an interface
			vim.keymap.set(
				"v",
				"<leader>ji",
				springboot_nvim.generate_interface,
				{ desc = "[J]ava Create [I]nterface" }
			)
			-- set a vim motion to <Space> + <Shift>J + e to open the generate enum ui to create an enum
			vim.keymap.set("v", "<leader>je", springboot_nvim.generate_enum, { desc = "[J]ava Create [E]num" })

			vim.cmd("command! SpringBootNewProject echo 'Command Disabled' | return")

			-- run the setup function with default configuration
			springboot_nvim.setup()
		end,
	},
	-- {
	-- 	"javiorfo/nvim-springtime",
	--    event = "VeryLazy",
	-- 	lazy = true,
	-- 	cmd = { "Springtime", "SpringtimeUpdate" },
	-- 	dependencies = { "javiorfo/nvim-popcorn", "javiorfo/nvim-spinetta", "hrsh7th/nvim-cmp" },
	-- 	build = function()
	-- 		require("springtime.core").update()
	-- 	end,
	-- 	opts = {
	-- 		-- spring = {
	-- 		--     spring_boot = {
	-- 		--         selected = 3,
	-- 		--         values = {
	-- 		--             -- VERSION HERE
	-- 		--         }
	-- 		--     },
	-- 		--     java_version = {
	-- 		--         selected = 2,
	-- 		--         values = {
	-- 		--             -- VERSION HERE
	-- 		--         }
	-- 		--     }
	-- 		-- }
	-- 	},
	-- },
}
