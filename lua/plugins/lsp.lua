return {
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'saadparwaiz1/cmp_luasnip' },
    config = function()
      vim.diagnostic.config {
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '󰰂',
          },
        },
      }

      -- LSP settings.
      --  This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(_, bufnr)
        -- NOTE: Remember that lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself
        -- many times.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- See `:help K` for why this keymap
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
      end

      -- Setup neovim lua configuration
      require('neodev').setup()
      --
      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      ---
      -- Autocomplete
      ---
      -- require('luasnip.loaders.from_vscode').lazy_load()
      local function border(hl_name)
        return {
          { '╭', hl_name },
          { '─', hl_name },
          { '╮', hl_name },
          { '│', hl_name },
          { '╯', hl_name },
          { '─', hl_name },
          { '╰', hl_name },
          { '│', hl_name },
        }
      end
      local cmp = require 'cmp'
      local source_mapping = {
        luasnip = '',
        cmp_tabnine = '',
        nvim_lsp = '',
        buffer = '﬘',
        path = '',
      }
      local lspkind = require 'lspkind'
      local select_opts = { behavior = cmp.SelectBehavior.Select }
      -- local luasnip = require 'luasnip'
      cmp.setup {
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp', keyword_length = 1 },
          { name = 'buffer', keyword_length = 3 },
          -- { name = "vsnip" }, -- For vsnip users.
          { name = 'luasnip', keyword_length = 2 },
        },
        window = {
          completion = {
            border = border 'CmpBorder',
            winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None',
          },
          documentation = {
            border = border 'CmpDocBorder',
          },
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == 'cmp_tabnine' then
              if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                menu = entry.completion_item.data.detail .. ' ' .. menu
              end
              vim_item.kind = ''
            end
            vim_item.menu = menu
            return vim_item
          end,
        },
        mapping = {
          ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
          ['<Down>'] = cmp.mapping.select_next_item(select_opts),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm { select = false },
          ['<C-n>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-p>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col '.' - 1

            if cmp.visible() then
              cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
              fallback()
            else
              cmp.complete()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item(select_opts)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
      }
    end,
  },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',

    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'L3MON4D3/LuaSnip',
      {
        'williamboman/mason.nvim',
        config = function()
          local servers = {
            clangd = {},
            -- gopls = {},
            -- pyright = {},
            rust_analyzer = {},
            -- tsserver = {},
            lua_ls = {},
          }
          -- Setup mason so it can manage external tooling
          require('mason').setup()

          -- Ensure the servers above are installed
          local mason_lspconfig = require 'mason-lspconfig'

          mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
          }

          mason_lspconfig.setup_handlers {
            function(server_name)
              require('lspconfig')[server_name].setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name],
              }
            end,
          }
        end,
      },
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      {
        'j-hui/fidget.nvim',
        config = function()
          require('fidget').setup()
        end,
      },
      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
      'onsails/lspkind.nvim',
    },
  },
}
