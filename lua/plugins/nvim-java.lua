return {
	{
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
			vim.keymap.set("n", "<leader>rmj", ":JavaRunnerRunMain", { desc = "[R]un [M]ain [J]ava" })

			vim.keymap.set("n", "<leader>smj", ":JavaRunnerStopMain", { desc = "[S]top [M]ain [J]ava" })

			vim.keymap.set(
				"n",
				"<leader>tcj",
				":JavaTestRunCurrentClass",
				{ desc = "[T]est Run Current [C]lass [J]ava" }
			)

			vim.keymap.set("n", "<leader>trj", ":JavaTestViewLastReport", { desc = "[T]est [R]eport [J]ava" })
		end,
	},
}
