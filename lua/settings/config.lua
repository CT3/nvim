---------------------------
-- Lua config for neovim --
---------------------------
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

---------------------------------------
-- Global Look and feel (and colour) --
---------------------------------------
g.mapleader = " "

opt.relativenumber = true
opt.number = true
opt.signcolumn = 'yes:2'
opt.scrolloff=10
opt.mouse = 'nv'
opt.termguicolors = true
opt.hlsearch = false
opt.hidden = true
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.wrap = true
opt.swapfile = false
opt.undofile = true
opt.tabstop=2
opt.shiftwidth=2
opt.softtabstop=2
opt.autowrite = true
opt.history=700                     -- keep 700 lines of command line history
opt.undolevels=700                  -- keep 700 lines of undo
opt.signcolumn='yes'
opt.colorcolumn='120'
opt.foldmethod='expr'
--opt.foldexpr='nvim_treesitter#foldexpr()'
vim.opt.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect"
