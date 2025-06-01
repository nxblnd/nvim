return {
    'NeogitOrg/neogit',
    opts = {
        graph_style = 'unicode',
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',
        'nvim-telescope/telescope.nvim'
    },
    keys = {
        { '<Leader>g', ':Neogit<cr>', desc = 'Open Neogit' },
        { '<Leader>Gl', ':Neogit log<cr>b<cr>', desc = 'Open Neogit log' },
    },
}
