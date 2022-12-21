---------------------------
-- Lua config for neovim --
---------------------------
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

---------------------------------------
-- Global Look and feel (and colour) --
---------------------------------------
g.mapleader = " "
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
opt.foldmethod = "expr"
opt.updatetime = 50
vim.notify = require("notify")
--opt.foldexpr='nvim_treesitter#foldexpr()'
vim.opt.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect"

vim.api.nvim_create_augroup("MYAUCMDS", { clear = true })
vim.api.nvim_create_autocmd(
	"TextYankPost",
	{ group = "MYAUCMDS", pattern = "*", command = [[silent! lua require'vim.highlight'.on_yank({timeout = 100})]] }
)
-- vim.api.nvim_create_autocmd("BufWritePre", { group = "MYAUCMDS", pattern = "*", command = [[:%s/\s\+$//e]] }) -- remove trailing spaces
