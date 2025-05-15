vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
------------
-- Remaps --
------------
--spell check
vim.keymap.set('n', '<F9>', ':set spell!<CR>', { silent = true }, { desc = 'Run spell check' })
vim.keymap.set('n', '<leader>sp', 'w[s1z=', { silent = true }, { desc = 'Spell check' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').spell_suggest, { desc = 'Find Spell Suggestions' })

-- Telescope
vim.keymap.set('n', '<leader>fp', require('telescope').extensions.projects.projects, { noremap = true })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Find Help' })
vim.keymap.set('n', '<leader>fy', require('telescope.builtin').registers, { desc = 'Find Registers' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').lsp_definitions, { desc = 'Find Definitions' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Find Word' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Find with Grep' })
vim.keymap.set('n', '<leader>xx', require('telescope.builtin').diagnostics, { desc = 'Find Diagnostics' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').lsp_references, { desc = 'Find References' })
vim.keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = 'Find Keymaps' })
vim.keymap.set('n', '<leader>fo', ':lua MiniFiles.open()<CR>', { desc = 'File Open' })



vim.keymap.set('n', '<leader>ai', ':PiecesCopilot<CR>', { desc = 'File Open' })



vim.keymap.set('n', '<leader>xc', require('telescope.builtin').colorscheme, { desc = 'Find Definitions' })
-- Diagnostic key ma
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Next diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Prev diagnostic' })

-- Misc
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true }, { desc = 'center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true }, { desc = 'center' })
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true }, { desc = 'center' })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true }, { desc = 'center' })
vim.keymap.set('n', 'J', "mzJ'z", { noremap = true }, { desc = 'center' })
vim.keymap.set('n', '<leader>ww', ':w <CR>', { noremap = true, silent = true }, { desc = 'Save File' })
vim.keymap.set('n', '<leader><up>', ':m .-2<CR>==', { noremap = true }, { desc = 'Move line' })
vim.keymap.set('n', '<leader><down>', ':m .+1<CR>==', { noremap = true }, { desc = 'Move line' })
vim.keymap.set('v', '<leader><down>', ":m '>+1<CR>gv=gv", { noremap = true }, { desc = 'Move line' })
vim.keymap.set('v', '<leader><up>', ":m '<-2<CR>gv=gv", { noremap = true }, { desc = 'Move line' })
vim.keymap.set('n', '<leader>gh', ':LspClangdSwitchSourceHeader<CR>', { noremap = true, silent = true }, { desc = 'Switch C/C++ header' })

vim.keymap.set('n', '<leader>y', '"+y', { noremap = true }, { desc = 'Yank' })

-- Bufferlinke
vim.keymap.set('n', ']b', ':bnext<CR>', { noremap = true }, { desc = 'Next Buffer' })
vim.keymap.set('n', '[b', ':bnext<CR>', { noremap = true }, { desc = 'Prev Buffer' })
vim.keymap.set('n', '<leader>q', ':bd<CR>', { noremap = true, silent = true }, { desc = 'Quit Buffer' })

--utilities
vim.keymap.set('n', '<Esc>', ':noh<CR><esc>', { silent = true, noremap = true }, { desc = 'Escape' })
vim.keymap.set('v', 'p', '"_dP', { noremap = true }, { desc = 'Paste' })
vim.keymap.set('n', '<leader>rp', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { noremap = true }, { desc = 'Replace' })

-- Terminal

vim.keymap.set('n', '<F4>', '<cmd>!zellij run -- just<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F3>', '<cmd>!zellij run -- just debug<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>di', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config { virtual_lines = new_config }
end, { desc = 'Toggle diagnostic virtual_lines' })
