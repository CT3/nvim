local attach_to_buffer = function(pattern, command)
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = vim.api.nvim_create_augroup("cool stuff", { clear = true }),
		pattern = pattern,
		callback = function()
			vim.fn.jobstart(command, {
				stdout_buffered = true,
				on_stderr = function(_, data)
					if data then
						vim.notify(data, "error")
					end
				end,
			})
		end,
	})
end
-- vim.api.nvim_create_user_command("Autorunn", function()
attach_to_buffer("*.c", { "make", "-j" })
-- end, {})
