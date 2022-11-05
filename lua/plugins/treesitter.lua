require("nvim-treesitter.configs").setup({
	-- Modules and its options go here
	--ensure_installed = 'maintained',
	ensure_installed = { "c", "lua", "rust", "markdown" },
	highlight = { enable = true },
	auto_install = true,
	incremental_selection = { enable = true },
	textobjects = { enable = true },
})
