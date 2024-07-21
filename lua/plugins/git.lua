return {
    {
        'NeogitOrg/neogit',
        opts = {
            graph_style = 'unicode',
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
            'nvim-telescope/telescope.nvim'
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {},
    },
    {
        'f-person/git-blame.nvim',
        opts = {
            date_format = '%r (%x)'
        },
    },
}
