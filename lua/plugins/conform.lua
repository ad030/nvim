return {
	{
		-- Autoformat
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},

			formatters = {
				clang_format = {
					args = {
						"--style=llvm",
					},
				},
			},

			formatters_by_ft = {
				lua = { "stylua" },

				java = { "google-java-format" },

				-- Conform can also run multiple formatters sequentially
				python = {},
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				javascript = { { "prettierd", "prettier" } },

				typescript = { { "prettierd", "prettier" } },

				javascriptreact = { { "prettierd", "prettier" } },

				typescriptreact = { { "prettierd", "prettier" } },

				css = { { "prettierd", "prettier" } },

				html = { { "prettierd", "prettier" } },

				json = { { "prettierd", "prettier" } },

				yaml = { { "prettierd", "prettier" } },

				markdown = { { "prettierd", "prettier" } },

				graphql = { { "prettierd", "prettier" } },

				xml = { "xmllint" },

				csharp = { "astyle" },

				c = { "clang-format" },
			},
		},
	},
}
