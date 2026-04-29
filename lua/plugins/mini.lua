return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.notify').setup()
      require('mini.statusline').setup()
      require('mini.comment').setup()
      require('mini.starter').setup()
      require('mini.files').setup()
      require('mini.icons').setup()
      require('mini.indentscope').setup()
      require('mini.pairs').setup()
      require('mini.ai').setup()
      require('mini.base16').setup {
        scheme = 'gruvbox-dark-medium',
        palette = {
          base00 = '#32302f',
          base01 = '#32302f',
          base02 = '#504945',
          base03 = '#665c54',
          base04 = '#bdae93',
          base05 = '#ddc7a1',
          base06 = '#ebdbb2',
          base07 = '#fbf1c7',
          base08 = '#ea6962',
          base09 = '#e78a4e',
          base0A = '#d8a657',
          base0B = '#a9b665',
          base0C = '#89b482',
          base0D = '#7daea3',
          base0E = '#d3869b',
          base0F = '#bd6f3e',
        },
      }
      local hipatterns = require 'mini.hipatterns'
      hipatterns.setup {
        highlighters = {
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    opts = {},
  },

  -- {
  --   'frankroeder/parrot.nvim',
  --   dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
  --   -- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
  --   config = function()
  --     require('parrot').setup {
  --       -- Providers must be explicitly added to make them available.
  --       providers = {
  --         gemini = {
  --           name = 'gemini',
  --           endpoint = function(self)
  --             return 'https://generativelanguage.googleapis.com/v1beta/models/' .. self._model .. ':streamGenerateContent?alt=sse'
  --           end,
  --           model_endpoint = function(self)
  --             return { 'https://generativelanguage.googleapis.com/v1beta/models?key=' .. self.api_key }
  --           end,
  --           api_key = os.getenv 'GEMINI_API_KEY',
  --           params = {
  --             chat = { temperature = 1.1, topP = 1, topK = 10, maxOutputTokens = 8192 },
  --             command = { temperature = 0.8, topP = 1, topK = 10, maxOutputTokens = 8192 },
  --           },
  --           topic = {
  --             model = 'gemini-1.5-flash',
  --             params = { maxOutputTokens = 64 },
  --           },
  --           headers = function(self)
  --             return {
  --               ['Content-Type'] = 'application/json',
  --               ['x-goog-api-key'] = self.api_key,
  --             }
  --           end,
  --           models = {
  --             'gemini-2.5-flash-preview-05-20',
  --             'gemini-2.5-pro-preview-05-06',
  --             'gemini-1.5-pro-latest',
  --             'gemini-1.5-flash-latest',
  --             'gemini-2.5-pro-exp-03-25',
  --             'gemini-2.0-flash-lite',
  --             'gemini-2.0-flash-thinking-exp',
  --             'gemma-3-27b-it',
  --           },
  --           preprocess_payload = function(payload)
  --             local contents = {}
  --             local system_instruction = nil
  --             for _, message in ipairs(payload.messages) do
  --               if message.role == 'system' then
  --                 system_instruction = { parts = { { text = message.content } } }
  --               else
  --                 local role = message.role == 'assistant' and 'model' or 'user'
  --                 table.insert(contents, { role = role, parts = { { text = message.content:gsub('^%s*(.-)%s*$', '%1') } } })
  --               end
  --             end
  --             local gemini_payload = {
  --               contents = contents,
  --               generationConfig = {
  --                 temperature = payload.temperature,
  --                 topP = payload.topP or payload.top_p,
  --                 maxOutputTokens = payload.max_tokens or payload.maxOutputTokens,
  --               },
  --             }
  --             if system_instruction then
  --               gemini_payload.systemInstruction = system_instruction
  --             end
  --             return gemini_payload
  --           end,
  --           process_stdout = function(response)
  --             if not response or response == '' then
  --               return nil
  --             end
  --             local success, decoded = pcall(vim.json.decode, response)
  --             if
  --               success
  --               and decoded.candidates
  --               and decoded.candidates[1]
  --               and decoded.candidates[1].content
  --               and decoded.candidates[1].content.parts
  --               and decoded.candidates[1].content.parts[1]
  --             then
  --               return decoded.candidates[1].content.parts[1].text
  --             end
  --             return nil
  --           end,
  --         },
  --       },
  --     }
  --   end,
  -- },
}
