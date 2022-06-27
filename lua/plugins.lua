

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- vimscript
  use 'tpope/vim-repeat'


  --ALL the lines
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }


  -- LSP and related
  use 'nvim-treesitter/nvim-treesitter'
  use 'glepnir/lspsaga.nvim'
  use 'folke/trouble.nvim'
  use 'onsails/lspkind.nvim'
  use { "williamboman/nvim-lsp-installer", "neovim/nvim-lspconfig", }

  -- Code formatting



  -- Autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
	use {'tzachar/cmp-tabnine', after = "nvim-cmp", run='powershell ./install.ps1', requires = 'hrsh7th/nvim-cmp'}
 
  -- snippets

  use 'L3MON4D3/LuaSnip'

  -- Colourscheme
  use 'eddyekofo94/gruvbox-flat.nvim'

  -- Utilities
  use 'karb94/neoscroll.nvim'


  -- telescope
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- Comments and Todo 
  use { "folke/todo-comments.nvim" ,
      requires = "nvim-lua/plenary.nvim",
      config = function()
         require("todo-comments").setup {}
      end,
   }
  use { 'numToStr/Comment.nvim' }

end)
