
require('lspconfig').pyright.setup{
}

 require('lspconfig').clangd.setup {
}require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
