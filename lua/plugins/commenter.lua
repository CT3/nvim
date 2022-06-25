
require('bufferline').setup {}
require('Comment').setup{
    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    ---@type table
    toggler = {
        ---Line-comment toggle keymap
        line = '<leader>/',
        ---Block-comment toggle keymap
    },
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },

  }

