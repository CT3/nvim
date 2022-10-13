local map = vim.api.nvim_set_keymap

------------
-- Remaps --
------------
--
-- LSP
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- Debuging things
map("n", "<F5>", ":Debugit<CR>", { noremap = true, silent = true })

-- LSP saga
map("n", "<leader>cf", ":Lspsaga lsp_finder<CR>", { silent = true })
map("n", "<leader>ca", ":Lspsaga code_action<CR>", { silent = true })
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", { silent = true })
map("n", "K", ":Lspsaga hover_doc<CR>", { silent = true })
map("n", "<leader>b", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', { silent = true })
map("n", "<leader>f", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', { silent = true })
map("n", "<leader>gs", ":Lspsaga signature_help<CR>", { silent = true })
map("n", "<leader>d", ":Lspsaga show_line_diagnostics<CR>", { noremap = true, silent = true })
map("n", "]d", ":Lspsaga diagnostic_jump_next<CR>zz", { silent = true })
map("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>zz", { silent = true })
map("n", "<leader>rn", ":Lspsaga rename<CR>", { silent = true })
map("n", "<leader>pd", ":Lspsaga preview_definition<CR>", { silent = true })

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
map("n", "<leader>fw", ":Telescope live_grep<CR>", { noremap = true })
map("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true })
map("n", "<leader>fn", ":Telescope file_browser<CR>", { noremap = true })
map("n", "<leader>fr", ":Telescope neoclip<CR>", { noremap = true })
map("n", "<leader>fp", ":Telescope projects<CR>", { noremap = true })

-- ultilties
map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })
map("n", "J", "mzJ'z", { noremap = true })
map("n", "<C-s>", ":Neoformat <CR>:w <CR>", { noremap = true, silent = true }) -- ctrl + s to save file
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
map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
map("n", "<leader>gr", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })
map("n", "<Esc>", ":noh<CR><esc>", { silent = true, noremap = true })
map("v", "p", '"_dP', { noremap = true })

-- harpoon son
map("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", { silent = true, noremap = true })
map("n", "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { silent = true, noremap = true })
map("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { silent = true, noremap = true })
map("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { silent = true, noremap = true })
map("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { silent = true, noremap = true })

-- Terminal

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

map("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { silent = true, noremap = true })
