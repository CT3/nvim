vim.g.mapleader = ' ' -- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup 'plugins'
require 'settings.config'
require 'settings.keymap'

require('mini.notify').setup()
-- Mini plugins
require('mini.statusline').setup()
require('mini.comment').setup()
require('mini.starter').setup()
require('mini.files').setup()
require('mini.icons').setup()
require('mini.indentscope').setup()
require('mini.pairs').setup()
require('mini.ai').setup()
require('mini.base16').setup {
  scheme = 'gruvbox-dark-medium',
  palette = {
    base00 = '#32302f',
    base01 = '#32302f',
    base02 = '#504945',
    base03 = '#665c54',
    base04 = '#bdae93',
    base05 = '#ddc7a1',
    base06 = '#ebdbb2',
    base07 = '#fbf1c7',
    base08 = '#ea6962',
    base09 = '#e78a4e',
    base0A = '#d8a657',
    base0B = '#a9b665',
    base0C = '#89b482',
    base0D = '#7daea3',
    base0E = '#d3869b',
    base0F = '#bd6f3e',
  },
}

--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

require('mini.hipatterns').setup()
local hipatterns = require 'mini.hipatterns'
hipatterns.setup {
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
}

vim.cmd [[highlight Comment cterm=italic gui=italic]]

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'arduino',
  callback = function()
    local root_dir = vim.fs.dirname(vim.fs.find({ 'sketch.yaml', 'libraries', '*.ino' }, { upward = true })[1]) or vim.fn.getcwd()
    vim.lsp.start {
      name = 'arduino-language-server',
      cmd = {
        'arduino-language-server',
        '-cli-config',
        vim.fn.expand '~/.arduino15/arduino-cli.yaml',
        '-cli',
        'arduino-cli',
        '-fqbn',
        'arduino:avr:uno',
        '-clangd',
        'clangd',
      },
      root_dir = root_dir,
      on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      end,
    }
  end,
})
