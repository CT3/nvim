vim.o.shortmess = vim.o.shortmess .. "S"

local function search_count()
	if vim.api.nvim_get_vvar("hlsearch") == 1 then
		local res = vim.fn.searchcount({ maxcount = 100, timeout = 500 })

		if res.total > 0 then
			return string.format("%d/%d", res.current, res.total)
		end
	end

	return ""
end


-- Status line
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox-material",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {{ 'filename', file_status = true,  path = 3 
    }},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress", { search_count, type = "lua_expr" } },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = { "os.date('%a')", "data", "require'lsp-status'.status()" },
		lualine_z = {},
	},
	tabline = {
		lualine_a = {},
		lualine_b = {vim.loop.cwd()},
		lualine_c = { require("tabline").tabline_buffers },
		lualine_x = { require("tabline").tabline_tabs },
		lualine_y = {},
		lualine_z = {},
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
