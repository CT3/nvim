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
    'nat-418/boole.nvim',
    config = function()
      require('boole').setup {
        mappings = {
          increment = '<C-a>',
          decrement = '<C-x>',
        },
        -- User defined loops
        additions = {
          { 'Foo', 'Bar' },
          { 'tic', 'tac', 'toe' },
          { 'HIGH', 'LOW' },
        },
        allow_caps_additions = {
          { 'enable', 'disable' },
          -- enable → disable
          -- Enable → Disable
          -- ENABLE → DISABLE
        },
      }
    end,
  },
  {

    'kyazdani42/nvim-web-devicons',
  },


  {
    'meinside/gmn.nvim', config = function()
      require'gmn'.setup {
        -- (default values)
        configFilepath = '~/.config/gmn.nvim/config.json',
        timeout = 30 * 1000,
        model = 'gemini-2.5-flash-preview-04-17',
        safetyThreshold = 'BLOCK_ONLY_HIGH',
        stripOutermostCodeblock = function()
          return vim.bo.filetype ~= 'markdown'
        end,
        verbose = false,
      }
    end,
    dependencies = { { 'nvim-lua/plenary.nvim' } },
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
