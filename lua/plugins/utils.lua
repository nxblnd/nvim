return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            indent = {
                char = '▏',
            },
            scope = {
                show_start = false,
                show_end = false,
            },
            exclude = {
                filetypes = {
                    'help',
                    'dashboard',
                    'lazy',
                },
            },
        },
    },
    {
        'uga-rosa/ccc.nvim',
        opts = {
            highlighter = {
                auto_enable = true,
            }
        },
    },
}
