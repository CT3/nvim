local map = vim.api.nvim_set_keymap

------------
-- Remaps --
------------
--
-- Spell check

map('n', '<F12>', ':set spell!<CR>', { silent = true })
map('n', '<leader>sp', 'w[s1z=', { silent = true })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Telescope
vim.keymap.set('n', '<leader>fp', require('telescope').extensions.projects.projects, { noremap = true })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>xx', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- for codeium
vim.keymap.set('i', '<C-y>', function()
  return vim.fn['codeium#Accept']()
end, { expr = true })
vim.keymap.set('i', '<c-x>', function()
  return vim.fn['codeium#Clear']()
end, { expr = true })

-- Misc
map('n', '<C-d>', '<C-d>zz', { noremap = true })
map('n', '<C-u>', '<C-u>zz', { noremap = true })
map('n', 'n', 'nzzzv', { noremap = true })
map('n', 'N', 'Nzzzv', { noremap = true })
map('n', 'J', "mzJ'z", { noremap = true })
map('n', '<leader>ww', ':w <CR>', { noremap = true, silent = true }) -- ctrl + s to save file
map('n', '<leader><up>', ':m .-2<CR>==', { noremap = true })
map('n', '<leader><down>', ':m .+1<CR>==', { noremap = true })
map('v', '<leader><down>', ":m '>+1<CR>gv=gv", { noremap = true })
map('v', '<leader><up>', ":m '<-2<CR>gv=gv", { noremap = true })
map('n', '<leader>gh', ':ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })

-- Bufferlinke
map('n', ']b', ':bnext<CR>', { noremap = true })
map('n', '[b', ':bnext<CR>', { noremap = true })

map('n', '<leader>q', ':bd<CR>', { noremap = true, silent = true })

--utilities
map('n', '<Esc>', ':noh<CR><esc>', { silent = true, noremap = true })
map('v', 'p', '"_dP', { noremap = true })

-- harpoon son
map('n', '<leader>ha', "<cmd>lua require('harpoon.mark').add_file()<cr>", { silent = true, noremap = true })
map('n', '<leader>hm', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { silent = true, noremap = true })
map('n', '<leader>1', "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { silent = true, noremap = true })
map('n', '<leader>2', "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { silent = true, noremap = true })
map('n', '<leader>3', "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { silent = true, noremap = true })

-- Terminal
require('leap').add_default_mappings()

map('n', '<F4>', '<cmd>!zellij run -- just<CR>', { noremap = true, silent = true })
map('n', '<F3>', '<cmd>!just debug<CR>', { noremap = true, silent = true })
