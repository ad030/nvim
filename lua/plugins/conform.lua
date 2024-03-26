return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")

			conform.setup({

				notify_on_error = false,
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
					async = false,
				},
				formatters_by_ft = {
					lua = { "stylua" },

					java = { "google-java-format" },

					-- Conform can also run multiple formatters sequentially
					python = { "isort", "black" },
					--
					-- You can use a sub-list to tell conform to run *until* a formatter
					-- is found.
					javascript = { "prettier" },

					typescript = { "prettier" },

					javascriptreact = { "prettier" },

					typescriptreact = { "prettier" },

					css = { "prettier" },

					html = { "prettier" },

					json = { "prettier" },

					yaml = { "prettier" },

					markdown = { "prettier" },

					graphql = { "prettier" },

					svelte = { "prettier" },

					xml = { "xmllint" },

					csharp = { "astyle" },
				},
			})
		end,
	},
}
