
require('formatter').setup({
  logging = true,
  filetype = {
    python = {},
    lua = {},
    }
})

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py FormatWrite
augroup END
]],
  true
)
