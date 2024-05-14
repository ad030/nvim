return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		vim.keymap.set("n", "<leader>jtc", require("jdtls").test_class(), { desc = "Java Test Class" })
		vim.keymap.set(
			"n",
			"<leader>jtm",
			require("jdtls").test_nearest_method(),
			{ desc = "Java Test Nearest Method" }
		)
	end,
}
