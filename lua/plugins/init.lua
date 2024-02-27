return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', branch = 'legacy' },
      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
      'onsails/lspkind.nvim',
    },
  },
  'rcarriga/nvim-notify',
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'saadparwaiz1/cmp_luasnip' },
  },

  {
    -- Autocompletion
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter', 'nvim-treesitter/nvim-treesitter' },
  },

  { 'mhartington/formatter.nvim' },

  -- {
  --   'Exafunction/codeium.vim',
  --
  --   event = 'BufEnter',
  --
  -- },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependecies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },
  'akinsho/toggleterm.nvim',
  -- Git related pluginsplu
  'eddyekofo94/gruvbox-flat.nvim',
  'lewis6991/gitsigns.nvim',
  'nvim-lualine/lualine.nvim', -- Fancier statusline
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'ggandor/leap.nvim',
  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  'nvim-telescope/telescope-file-browser.nvim',
  'ahmedkhalf/project.nvim',
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
}
