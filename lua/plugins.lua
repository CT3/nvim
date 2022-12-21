-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")
return require("packer").startup({
	function(use)
		-- Packer can manage itself
		use("wbthomason/packer.nvim")
		--use("lewis6991/impatient.nvim")
		-- vimscript
		use("tpope/vim-repeat")
		use("kyazdani42/nvim-web-devicons")

		--ALL the lines
		-- use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
		use({
			"kdheepak/tabline.nvim",
			config = function()
				require("tabline").setup({ enable = false })
			end,
			requires = { " nvim-lualine/lualine.nvim", "kyazdani42/nvim-web-devicons" },
		})
		-- LSP and related
		use("nvim-treesitter/nvim-treesitter")
		use("glepnir/lspsaga.nvim")
		use("folke/trouble.nvim")
		use("onsails/lspkind.nvim")
		use({ "williamboman/nvim-lsp-installer", "neovim/nvim-lspconfig" })

		-- Code formatting
		use("sbdchd/neoformat")
		use("rcarriga/nvim-notify")
		-- Autocomplete
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use({
			"tzachar/cmp-tabnine",
			after = "nvim-cmp",
			run = "powershell ./install.ps1",
			requires = "hrsh7th/nvim-cmp",
		})
		-- terminal
		use({
			"akinsho/toggleterm.nvim",
			tag = "v1.*",
			config = function()
				require("toggleterm").setup({ direction = "float", shell = "pwsh" })
			end,
		})
		-- snippets"
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")
		use("rafamadriz/friendly-snippets")

		-- Colourscheme
		use("eddyekofo94/gruvbox-flat.nvim")

		-- Utilities
		use("karb94/neoscroll.nvim")
		use("ggandor/leap.nvim")

		-- telescope
		--
		use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } })
		use("nvim-telescope/telescope-packer.nvim")
		use("nvim-telescope/telescope-file-browser.nvim")
		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup({})
			end,
		})
		use({
			"AckslD/nvim-neoclip.lua",
			requires = "nvim-telescope/telescope.nvim",
			config = function()
				require("neoclip").setup({})
			end,
		})
		use({
			"ThePrimeagen/harpoon",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("harpoon").setup({})
			end,
		})

		-- Comments and Todo
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup({})
			end,
		})
		use({ "numToStr/Comment.nvim" })
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
