local map = vim.api.nvim_set_keymap

------------
-- Remaps --
------------
--
-- LSP
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})

-- LSP saga
map("n", "<leader>cf", ":Lspsaga lsp_finder<CR>", { silent = true })
map("n", "<leader>ca", ":Lspsaga code_action<CR>", { silent = true })
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", { silent = true })
map("n", "K", ":Lspsaga hover_doc<CR>", { silent = true })
map("n", "<leader>b", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', { silent = true })
map("n", "<leader>f", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', { silent = true })
map("n", "<leader>gs", ":Lspsaga signature_help<CR>", { silent = true })
map("n", "<leader>d", ":Lspsaga show_line_diagnostics<CR>", { noremap=true, silent = true })
map("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", { silent = true })
map("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", { silent = true })
map("n", "<leader>rn", ":Lspsaga rename<CR>", { silent = true })
map("n", "<leader>pd", ":Lspsaga preview_definition<CR>", { silent = true })

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true})
map('n', '<leader>fw', ':Telescope live_grep<CR>', {noremap = true})
map('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true})
map('n', '<leader>fh', ':Telescope help_tags<CR>', {noremap = true})
map('n', '<leader>fb', ':Telescope file_browser<CR>', {noremap = true})
map('n', '<leader>fr', ':Telescope neoclip<CR>', {noremap = true})
map('n', '<leader>fp', ':Telescope projects<CR>', {noremap = true})

-- ultilties
map("n", "n", "nzzzv", {noremap = true})
map("n", "N", "Nzzzv", {noremap = true})
map("n", "J", "mzJ'z", {noremap = true})
map("n","<C-s>", "<cmd>lua vim.lsp.buf.formatting()<CR>:w <CR>", {noremap = true, silent = true}) -- ctrl + s to save file

map("n", "<leader><up>", ":m .-2<CR>==", {noremap = true})
map("n", "<leader><down>", ":m .+1<CR>==", {noremap = true})
map("v", "<leader><down>", ":m '>+1<CR>gv=gv", {noremap = true})
map("v", "<leader><up>", ":m '<-2<CR>gv=gv", {noremap = true})

--map("n", "<leader>xx", ":make<CR>:copen<CR>", {noremap = true})

-- Bufferline

map("n", "]b", ":BufferLineCycleNext<CR>", {noremap = true})
map("n", "[b", ":BufferLineCyclePrev<CR>", {noremap = true})


-- Formatter
map('n', '<leader>f', ':Format <CR>', {noremap = true})

-- NvimTree
vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<CR>", { noremap = true })

-- Trouble
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
map("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})


map("n","<Esc>", ":noh<CR><esc>", {silent = true, noremap = true})
map("v", "p", '"_dp', { noremap = true })
