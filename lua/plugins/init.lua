return {
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },

  { 'rcarriga/nvim-notify' },
  { 'ggandor/leap.nvim' },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  {
    'eddyekofo94/gruvbox-flat.nvim',
    priority = 1000,
    enabled = true,
    config = function()
      vim.cmd [[colorscheme gruvbox-flat]]
      vim.g.gruvbox_flat_style = 'dark'
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }, -- "gc" to comment visual regions/lines
}
