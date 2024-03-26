return {
	"nvim-java/nvim-java",
	dependencies = {
		"nvim-java/lua-async-await",
		"nvim-java/nvim-java-core",
		"nvim-java/nvim-java-test",
		"nvim-java/nvim-java-dap",
		"MunifTanjim/nui.nvim",
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		{
			"williamboman/mason.nvim",
			opts = {
				registries = {
					"github:nvim-java/mason-registry",
					"github:mason-org/mason-registry",
				},
			},
		},
	},

	config = function()
		vim.keymap.set("n", "<leader>jrm", ":JavaRunnerRunMain", { desc = "[J]ava [R]un [M]ain" })

		vim.keymap.set("n", "<leader>jsf", ":JavaRunnerStopMain", { desc = "[J]ava [S]top [M]ain" })

		vim.keymap.set("n", "<leader>jtc", ":JavaTestRunCurrentClass", { desc = "[J]ava [T]est Run Current [C]lass " })

		vim.keymap.set("n", "<leader>jtr", ":JavaTestViewLastReport", { desc = "[J]ava [T]est [R]eport" })
	end,
}
