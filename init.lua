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
require 'settings.cmp'
require 'settings.config'
require 'settings.keymap'

--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

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
