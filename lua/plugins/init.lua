return {
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },

  -- { 'rcarriga/nvim-notify' },
    --
    {
      'ggandor/leap.nvim',
      config = function()
        require('leap').add_default_mappings()
      end,
    },
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
  -- {
  --   'numToStr/Comment.nvim',
  --   config = function()
  --     require('Comment').setup()
  --   end,

  -- Lua
  {
    'folke/zen-mode.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
