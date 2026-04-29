return {
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },

  {
    url = 'https://codeberg.org/andyg/leap.nvim',
    config = function()
      require('leap').setup {}
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
        additions = {
          { 'Foo', 'Bar' },
          { 'tic', 'tac', 'toe' },
          { 'HIGH', 'LOW' },
        },
        allow_caps_additions = {
          { 'enable', 'disable' },
        },
      }
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
  },

  {
    'ThePrimeagen/99',
    config = function()
      local _99 = require("99")
      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)
      _99.setup({
        logger = {
          level = _99.DEBUG,
          path = "/tmp/" .. basename .. ".99.debug",
          print_on_error = true,
        },
        completion = {
          custom_rules = {},
          files = {},
          source = "cmp",
        },
        md_files = {
          "AGENT.md",
        },
      })

      vim.keymap.set("v", "<leader>9v", function()
        _99.visual()
      end)

      vim.keymap.set("v", "<leader>9s", function()
        _99.stop_all_requests()
      end)
    end,
  },

  {
    'kyazdani42/nvim-web-devicons',
  },
}