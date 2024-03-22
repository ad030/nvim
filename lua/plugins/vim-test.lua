return {
	"vim-test/vim-test",
	keys = {
		{ "<leader>T", ":TestFile<CR>", "n" },
	},
	config = function()
		require("vim-test").setup()
	end,
}
