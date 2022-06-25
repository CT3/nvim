-- Package management
require('plugins')

-- Sets and lets (settings)
require('settings.config')
require('settings.color')
require('settings.keymap')

-- Package settings
require('plugins/treesitter')
require('plugins/lspconfig')
--require('plugins/lspsaga')
require('plugins/telescope')
require('plugins/lualine')
require('plugins/compe')
require('plugins/neoscroll')
require('plugins/ultisnips')
require('plugins/formatter')
require('plugins/commenter')


vim.api.nvim_exec(
 [[
  augroup YankHighlight
    autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup="IncSearch", timeout=200 }
  augroup end
]],
  false
)


