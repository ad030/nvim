-- NOTE: Here is where you install your plugins.
local plugins = {
	-- colorscheme
	require("colors.kanagawa"),

	-- adjusts shift and tab length based on file
	require("plugins/vim-sleuth"),

	-- toggle commenting a line
	require("plugins.comment"),

	-- highlight syntax
	require("plugins.treesitter"),

	-- git decorations within a file
	require("plugins.gitsigns"),

	-- displays possible commands based on what keys have been pressed
	require("plugins.which-key"),

	-- plugin to search files
	require("plugins.telescope"),

	-- set up lsps
	require("plugins.nvim-lspconfig"),

	-- config jdtls lsp
	require("plugins.nvim-jdtls"),

	-- code debugger protocol
	require("plugins.dap"),

	-- code formatter
	require("plugins.conform"),

	-- autocompletion for code
	require("plugins.nvim-cmp"),

	-- highlight todo comments
	require("plugins.todo-comments"),

	-- various plugins
	require("plugins.mini"),

	-- preview markdown files
	require("plugins.markdown-preview"),

	-- automatically close brackets
	require("plugins.autoclose"),

	-- terminal in neovim plugin
	require("plugins.toggleterm"),

	-- latex filetype plugin
	require("plugins.vimtex"),

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    This is the easiest way to modularize your config.
	--
	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	--    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
	-- { import = 'custom.plugins' },
}

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--

local opts = {
	ui = {
		-- If you have a Nerd Font, set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
}

require("lazy").setup(plugins, opts)
