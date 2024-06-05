return {
  {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    config = function()
      -- Set lualine as statusline
      -- See `:help lualine.txt`
      local function search_count()
        if vim.api.nvim_get_vvar 'hlsearch' == 1 then
          local res = vim.fn.searchcount { maxcount = 100, timeout = 500 }

          if res.total > 0 then
            return string.format('%d/%d', res.current, res.total)
          end
        end

        return ''
      end

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'gruvbox-flat',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_y = { 'progress', { search_count, type = 'lua_expr' } },
        },
      }
    end
  }
}
