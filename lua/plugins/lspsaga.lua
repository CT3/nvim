require('lspsaga').init_lsp_saga({
  code_action_icon = " ",
  definition_preview_icon = "  ",
  dianostic_header_icon = "   ",
  error_sign = " ",
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  hint_sign = "⚡",
  infor_sign = "",
  warn_sign = "",
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
	finder_action_keys = { open = 'o', vsplit = 's',split = 'i',
												 quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>'}
})
