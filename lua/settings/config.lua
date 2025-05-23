---------------------------
-- Lua config for neovim --
---------------------------
local opt = vim.opt -- to set options
---------------------------------------
-- Global Look and feel (and colour) --
---------------------------------------
opt.relativenumber = true
opt.number = true
opt.signcolumn = "yes:2"
opt.scrolloff = 10
opt.mouse = "a"
opt.termguicolors = true
opt.hlsearch = true
opt.hidden = true
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.wrap = true
opt.swapfile = false
opt.undofile = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.autowrite = true
opt.history = 700 -- keep 700 lines of command line history
opt.undolevels = 700 -- keep 700 lines of undo
opt.signcolumn = "yes"
opt.colorcolumn = "120"
opt.foldmethod = "manual"
opt.updatetime = 50
opt.colorcolumn = "120"
-- opt.setcolumn = "120"
-- vim.notify = require("notify")
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect"


