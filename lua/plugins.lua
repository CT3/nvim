

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- vimscript
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  -- snippets
  use 'sirver/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

-- Buffer Line
use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- LSP and related
  use 'nvim-treesitter/nvim-treesitter'
  use 'glepnir/lspsaga.nvim'
  use 'folke/trouble.nvim'
use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
}
  -- Code formatting
  use 'mhartington/formatter.nvim'

  -- Autocomplete
  -- use 'hrsh7th/nvim-compe'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
	use {'tzachar/cmp-tabnine', after = "nvim-cmp", run='powershell ./install.ps1', requires = 'hrsh7th/nvim-cmp'}
  use 'hrsh7th/nvim-cmp'
 


  -- Colourscheme
  use 'eddyekofo94/gruvbox-flat.nvim'

  -- Utilities
  use 'karb94/neoscroll.nvim'
  use { 'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
      }
use { "nvim-telescope/telescope-file-browser.nvim" }


  use { "folke/todo-comments.nvim" ,
      requires = "nvim-lua/plenary.nvim",
      config = function()
         require("todo-comments").setup {}
      end,
   }

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

end)
