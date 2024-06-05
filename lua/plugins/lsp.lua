return {

  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'saadparwaiz1/cmp_luasnip' },
  },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',

    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'L3MON4D3/LuaSnip',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', branch = 'legacy' },
      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
      'onsails/lspkind.nvim',
    },
  },

}
