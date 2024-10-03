return {
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },

  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  {
    'dustinblackman/oatmeal.nvim',
    cmd = { 'Oatmeal' },
    keys = {
      { '<leader>om', mode = 'n', desc = 'Start Oatmeal session' },
    },
    opts = {
      backend = 'ollama',
      model = 'codellama:latest',
    },
  },
  -- {
  --   'eddyekofo94/gruvbox-flat.nvim',
  --   priority = 1000,
  --   enabled = true,
  --   config = function()
  --     vim.cmd [[colorscheme gruvbox-flat]]
  --     vim.g.gruvbox_flat_style = 'dark'
  --   end,
  -- },
  -- -- {
  --   'numToStr/Comment.nvim',
  --   config = function()
  --     require('Comment').setup()
  --   end,

  -- Lua
}
