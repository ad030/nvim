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
			vim.keymap.set("n", "<leader>jrm", ":JavaRunnerRunMain<CR>", { desc = "[J]ava [R]un [M]ain" })

			vim.keymap.set("n", "<leader>jsm", ":JavaRunnerStopMain<CR>", { desc = "[J]ava [S]top [M]ain" })

			vim.keymap.set("n", "<leader>jrt", ":JavaTestRunCurrentClass<CR>", { desc = "[J]ava [T]est [R]un" })

			vim.keymap.set("n", "<leader>jvtr", ":JavaTestViewLastReport<CR>", { desc = "[J]ava [T]est [R]eport" })
		end,
	},
}
