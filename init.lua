--require("impatient")
-- Package management
require("plugins")
--require("compile_on_save")
-- Sets and lets (settings)
require("settings.config")
require("settings.color")
require("settings.keymap")

-- Package settings
require("plugins/treesitter")
require("plugins/lspconfig")
require("plugins/lspsaga")
require("plugins/telescope")
require("plugins/lualine")
require("plugins/compe")
require("plugins/neoscroll")
--require("plugins/bufferline")
require("plugins/autocomplete")
require("plugins/comment")

lua = require("compile_on_save")

require("leap").add_default_mappings()
