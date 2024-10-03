vim.g.mapleader = ' ' -- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
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

-- Mini plugins
require('mini.notify').setup()
require('mini.statusline').setup()
require('mini.comment').setup()
require('mini.starter').setup()
require('mini.files').setup()
require('mini.icons').setup()
require('mini.indentscope').setup()
require('mini.pairs').setup()
require('mini.ai').setup()
require('mini.base16').setup {
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
-- require('mini.completion').setup()
require('mini.hipatterns').setup()
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

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

local lspconfig = require 'lspconfig'
lspconfig.arduino_language_server.setup {
  cmd = {
    'arduino-language-server',
    '-cli-config',
    '~/.arduino15/arduino-cli.yaml',
    '-fqbn',
    'esp32:esp32:XIAO_ESP32C3',
    '-clangd',
    'clangd',
  },
  filetypes = { 'arduino' },
  root_dir = function(fname)
    return lspconfig.util.root_pattern 'sketch.ino'(fname) or lspconfig.util.root_pattern '.git'(fname) or lspconfig.util.path.dirname(fname)
  end,
  on_attach = function(client, bufnr)
    -- You can customize key mappings and more here
  end,
}
