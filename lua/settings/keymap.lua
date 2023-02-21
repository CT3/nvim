local map = vim.api.nvim_set_keymap

------------
-- Remaps --
------------
--
-- LSP
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- Debuging things
map("n", "<F5>", ":!just debug<CR>", { noremap = true, silent = true })

-- LSP saga
map("n", "<leader>cf", ":Lspsaga lsp_finder<CR>", { silent = true })
map("n", "<leader>ca", ":Lspsaga code_action<CR>", { silent = true })
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", { silent = true })
map("n", "K", ":Lspsaga hover_doc<CR>", { silent = true })
map("n", "<leader>gs", ":Lspsaga signature_help<CR>", { silent = true })
map("n", "<leader>d", ":Lspsaga show_line_diagnostics<CR>", { noremap = true, silent = true })
map("n", "]d", ":Lspsaga diagnostic_jump_next<CR>zz", { silent = true })
map("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>zz", { silent = true })
map("n", "<leader>rn", ":Lspsaga rename<CR>", { silent = true })
map("n", "<leader>pd", ":Lspsaga preview_definition<CR>", { silent = true })

-- Spell check

map("n", "<F12>", ":set spell!<CR>", { silent = true })
map("n", "<leader>sp", "w[s1z=", { silent = true })

-- Telescope
-- map("n", "<leader>fn", ":Telescope file_browser<CR>", { noremap = true })
-- map("n", "<leader>fr", ":Telescope neoclip<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fp", require('telescope').extensions.projects.projects, { noremap = true })


vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- ultilties
map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true })
map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })
map("n", "J", "mzJ'z", { noremap = true })
map("n", "<C-s>", ":Format <CR>:w <CR>", { noremap = true, silent = true }) -- ctrl + s to save file
map("n", "<leader><up>", ":m .-2<CR>==", { noremap = true })
map("n", "<leader><down>", ":m .+1<CR>==", { noremap = true })
map("v", "<leader><down>", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "<leader><up>", ":m '<-2<CR>gv=gv", { noremap = true })
map("n", "<leader>gh", ":ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })

-- Bufferline
map("n", "]b", ":TablineBufferNext<CR>", { noremap = true })
map("n", "[b", ":TablineBufferPrevious<CR>", { noremap = true })
map("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })

-- Formatter

-- Trouble
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
map("n", "<leader>gr", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })

--utilities
map("n", "<Esc>", ":noh<CR><esc>", { silent = true, noremap = true })
map("v", "p", '"_dP', { noremap = true })

-- harpoon son
map("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", { silent = true, noremap = true })
map("n", "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { silent = true, noremap = true })
map("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { silent = true, noremap = true })
map("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { silent = true, noremap = true })
map("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { silent = true, noremap = true })

-- Terminal
map("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { silent = true, noremap = true })
map("t", "<leader>tt", "<cmd>ToggleTerm<cr>", { silent = true, noremap = true })

require("leap").add_default_mappings()

local Terminal = require("toggleterm.terminal").Terminal
local gitui = Terminal:new({ cmd = "gitui", hidden = true, direction = "float", shell = "pwsh" })
function _gitui_toggle()
	gitui:toggle()
end

map("n", "<leader>tg", "<cmd>lua _gitui_toggle()<CR>", { noremap = true, silent = true })

local glow = Terminal:new({ cmd = "glow", hidden = true, direction = "tab", shell = "pwsh" })
function _glow_toggle()
	glow:toggle()
end

map("n", "<leader>tm", "<cmd>lua _glow_toggle()<CR>", { noremap = true, silent = true })
