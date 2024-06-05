return {


    'rcarriga/nvim-notify',
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
    },
    -- Git related pluginsplu
    {
        'eddyekofo94/gruvbox-flat.nvim',
        config = function()
            vim.cmd [[colorscheme gruvbox-flat]]
            vim.g.gruvbox_flat_style = 'dark'
        end
    },
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }, -- "gc" to comment visual regions/lines
    { 'ggandor/leap.nvim' },
}
