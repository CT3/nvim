-- local bufnr, command = 36, { "go", "run", "run.go" }

local attach_to_buffer = function(command)
	-- vim.api.nvim_create_autocmd("BufWritePost", {
	-- group = vim.api.nvim_create_augroup("cool stuff", { clear = true }),
	-- pattern = pattern,
	-- callback = function()
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_win_set_buf(win, buf)
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "flash_debug" })
	vim.fn.jobstart(command, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			if data then
				vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
				vim.notify("flash_debug done")
			end
		end,
	})
end
-- })
-- end

-- attach_to_buffer({ "make", "flash_debug" })

vim.api.nvim_create_user_command("Debugit", function()
	-- local bufnr = vim.fn.input("bufnr: ")
	-- local pattern = vim.fn.input("pattern: ")
	-- local command = vim.split(vim.fn.input("command: "), "")
	-- attach_to_buffer(tonumber(bufnr), pattern, command)
	attach_to_buffer({ "make", "flash_debug" })
end, {})
