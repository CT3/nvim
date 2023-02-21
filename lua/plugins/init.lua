return {

	{ -- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			'j-hui/fidget.nvim',

			-- Additional lua configuration, makes nvim stuff amazing
			'folke/neodev.nvim',
		},
	},

	{ -- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	},

	{ -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		build = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
		dependecies = {
			'nvim-treesitter/nvim-treesitter-textobjects', }
	},
	"akinsho/toggleterm.nvim",
	-- Git related plugins
	'tpope/vim-fugitive',
	"eddyekofo94/gruvbox-flat.nvim",
	'tpope/vim-rhubarb',
	'lewis6991/gitsigns.nvim',
	'navarasu/onedark.nvim', -- Theme inspired by Atom
	'nvim-lualine/lualine.nvim', -- Fancier statusline
	'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
	'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
	'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
	("ggandor/leap.nvim"),
	-- Fuzzy Finder (files, lsp, etc)
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' },
	},
	"nvim-telescope/telescope-file-browser.nvim",

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

}
